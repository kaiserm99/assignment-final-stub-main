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
