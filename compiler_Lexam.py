from ast import *
from cProfile import label
from typing import Optional
from register_allocation import build_interference, color_graph
from register_allocation import color_to_register, all_argument_passing_registers, callee_saved_registers
from utils import *
from x86_ast import *
from dataclasses import dataclass, field
from pprint import pprint

from compiler import Compiler, Binding, Temporaries

@dataclass
class CompilerLexam(Compiler):

    ############################################################################
    # Shrink
    ############################################################################

    def shrink_stmt(self, s: stmt) -> stmt:
        match s:
            # L_exam (L_while)
            case While(test, body, []):
                return While(self.shrink_exp(test), [self.shrink_stmt(s) for s in body], [])

            case _:
                return super().shrink_stmt(s)

    ############################################################################
    # Reveal Functions
    ############################################################################

    def reveal_stmt(self, s: stmt, funs) -> stmt:
        match s:
            # L_exam (L_while)
            case While(test, body, []):
                return While(self.reveal_exp(test, funs), [self.reveal_stmt(s, funs) for s in body], [])

            case _:
                return super().reveal_stmt(s, funs)

    ############################################################################
    # Limit functions
    ############################################################################

    def limit_stmt(self, s: stmt, repl: dict[str, expr]) -> stmt:
        match s:
            # L_exam (L_while)
            case While(test, body, []):
                return While(self.limit_exp(test, repl), [self.limit_stmt(s, repl) for s in body], [])

            case _:
                return super().limit_stmt(s, repl)

    ############################################################################
    # Expose Allocation
    ############################################################################

    def expose_stmt(self, s: stmt) -> stmt:
        match s:
            # L_exam (L_while)
            case While(test, body, []):
                return While(self.expose_exp(test), [self.expose_stmt(s) for s in body], [])

            case _:
                return super().expose_stmt(s)

    ############################################################################
    # Remove Complex Operands
    ############################################################################

    def rco_stmt(self, s: stmt) -> list[stmt]:
        match s:
            # L_exam (L_while)
            case While(test, body, []):
                atm, tmps = self.rco_exp(test, False)
                astmts = []
                for s in body:
                    astmts += self.rco_stmt(s)

                # Update in While-Loop
                astmts += make_assigns(tmps)

                return make_assigns(tmps) + [While(atm, astmts, [])]

            case _:
                return super().rco_stmt(s)

    ############################################################################
    # Explicate Control
    ############################################################################

    def explicate_stmt(self, s, cont, basic_blocks) -> list[stmt]:
        match s:
            # L_exam (L_while)
            case While(test, body, []):

                # Create a new block in which the actual test of the while-loop is performed
                goto_test = create_block([], basic_blocks)

                # Because body are complex statements, those need to be further refactored
                explicate_body = [goto_test]
                for s in reversed(body):
                    explicate_body = self.explicate_stmt(s, explicate_body, basic_blocks)

                res = self.explicate_pred(test, explicate_body, cont, basic_blocks)

                # Exchange the created test with the previous generated empty block
                basic_blocks[goto_test.label] = res

                # Just return the Goto call, so it will jump to the while-loop start
                return [goto_test]

            case _:
                return super().explicate_stmt(s, cont, basic_blocks)




    # Number 1: adding Multiplication, Division and Modulo Operations
    def select_stmt(self, s: stmt, name: str) -> list[instr]:
        match s:
            # Case for Multiplication
            case Assign([Name(var)], BinOp(atm1, Mult(), atm2)):

                arg1 = self.select_arg(atm1)
                arg2 = self.select_arg(atm2)

                match (arg1, arg2):
                    case (Variable(var2), _) if var == var2:
                        return [Instr("imulq", [arg2, Variable(var)])]
                    case (_, Variable(var2)) if var == var2:
                        return [Instr("imulq", [arg1, Variable(var)])]

                return [Instr("movq", [arg1, Variable(var)]), Instr("imulq", [arg2, Variable(var)])]

            # Case for Division
            case Assign([Name(var)], BinOp(atm1, FloorDiv(), atm2)):

                arg1 = self.select_arg(atm1)
                arg2 = self.select_arg(atm2)

                match(arg1, arg2):
                    case (_, Variable(var2)):
                        return [Instr("movq", [arg1, Reg("rax")]),
                                Instr("cqto", []),
                                Instr("idivq", [arg2]),
                                Instr("movq", [Reg("rax"), Variable(var)])] # in %rax is the result of arg1 // arg2


                return [Instr("movq", [arg1, Reg("rax")]),
                        Instr("cqto", []),
                        Instr("movq", [arg2, Variable(var)]),
                        Instr("idivq", [Variable(var)]),
                        Instr("movq", [Reg("rax"), Variable(var)])] # in %rax is the result of arg1 // arg2

            # Case for Modulo
            case Assign([Name(var)], BinOp(atm1, Mod(), atm2)):

                arg1 = self.select_arg(atm1)
                arg2 = self.select_arg(atm2)

                match(arg1, arg2):
                    # If the second argument is a variable, divide directly
                    case (_, Variable(var2)):
                        return [Instr("movq", [arg1, Reg("rax")]),
                                Instr("cqto", []),
                                Instr("idivq", [arg2]),
                                Instr("movq", [Reg("rdx"), Variable(var)])] # in %rdx is the result of arg1 % arg2

                # If the second argument is a constant, we need to move the constant into the variable
                return [Instr("movq", [arg1, Reg("rax")]),
                        Instr("cqto", []),
                        Instr("movq", [arg2, Variable(var)]),
                        Instr("idivq", [Variable(var)]),
                        Instr("movq", [Reg("rdx"), Variable(var)])] # in %rdx is the result of arg1 % arg2

            case _:
                return super().select_stmt(s, name)
