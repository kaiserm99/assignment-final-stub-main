from x86_ast import *
from typing import Callable
from graph import *
from priority_queue import *
import pprint
from utils import TupleType
from functools import reduce

pprint = pprint.PrettyPrinter(indent=4).pprint
caller_saved_registers : set[location] = set([Reg("rax"), Reg("rcx"), Reg("rdx"), Reg("rsi"), Reg("rdi"), Reg("r8"), Reg("r9"), Reg("r10"), Reg("r11")])
callee_saved_registers : set[location] = set([Reg("rsp"), Reg("rbp"), Reg("rbx"), Reg("r12"), Reg("r13"), Reg("r14"), Reg("r15")])
all_argument_passing_registers : list[location] = [Reg("rdi"), Reg("rsi"), Reg("rdx"), Reg("rcx"), Reg("r8"), Reg("r9")]
def argument_passing_registers(arity: int) -> set[location]:
    return set(all_argument_passing_registers[:arity])
registers_for_coloring = [Reg("rbp"), Reg("rsp"), Reg("rax"), Reg("rcx"), Reg("rdx"), Reg("rsi"), Reg("rdi"), Reg("r8"), Reg("r9"), Reg("r10"), Reg("r11"),
                          Reg("rbx"), Reg("r12"), Reg("r13"), Reg("r14"), Reg("r15")]
register_to_color = { registers_for_coloring[i]: i - 3 for i in range(0, len(registers_for_coloring)) }
color_to_register = { v: k for k, v in register_to_color.items() }

registers_excluded = [Reg("r11"), Reg("r15")]
registers_excluded_colors = [register_to_color[i] for i in registers_excluded]

def get_arg_locations(arg1 : arg) -> set[location]:
    match arg1:
        case Reg(_):
            return {arg1}
        case Variable(_):
            return {arg1}
        case ByteReg(_):
            return {arg1}
        case _:
            return set()

def get_read_write_locations(istr : Instr) -> tuple[set[location], set[location]]:
    match istr:
        case Instr(op, [arg1, arg2]):
            # L_exam extension mult reads both variables and writes the right one
            if op == "addq" or op == "subq" or op == "xorq" or op == "imulq":
                return (get_arg_locations(arg1) | get_arg_locations(arg2), get_arg_locations(arg2))
            elif op == "cmpq":
                return (get_arg_locations(arg1) | get_arg_locations(arg2), set())
            else:
                return (get_arg_locations(arg1), get_arg_locations(arg2))

        case Instr("negq", [arg]):
            locs = get_arg_locations(arg)
            return (locs, locs)
        case Instr("pushq", [arg]):
            return (get_arg_locations(arg), set())
        case Instr("popq", [arg]):
            return (set(), get_arg_locations(arg))
        case Instr(op, [arg]) if op.find("set") == 0:
            return (set(), get_arg_locations(arg))
        case Callq(l, i):
            return (argument_passing_registers(i), caller_saved_registers)

        # L_fun
        case IndirectCallq(l, i):
            return (argument_passing_registers(i) | {l}, caller_saved_registers)
        case TailJump(l, i):
            return (argument_passing_registers(i) | {l}, caller_saved_registers)

        # L_exam
        case Instr("cqto", []):
            return (get_arg_locations(Reg("rax")), get_arg_locations(Reg("rax")) | get_arg_locations(Reg("rdx")))
        case Instr("idivq", [arg]):
            return (get_arg_locations(arg), get_arg_locations(Reg("rax")) | get_arg_locations(Reg("rdx")))

        case _:
            return (set(), set())

def get_successors(instrs: list[instr]):
    successors = []
    for istr in instrs:
        match istr:
            case Jump(label):
                successors.append(label)
            case JumpIf(_, label):
                successors.append(label)
    return successors

def cfg(basic_blocks: dict[str, list[instr]]) -> DirectedAdjList:
    g = DirectedAdjList()
    for name, content in basic_blocks.items():
        successors = get_successors(content)
        for suc in successors:
            g.add_edge(name, suc)
    return g

def get_cfg(basic_blocks: dict[str, list[instr]]) -> DirectedAdjList:
    g = cfg(basic_blocks)
    return g
    
def get_liveness_order(cfg_graph: DirectedAdjList) -> list:
    t_cfg_graph = transpose(cfg_graph)
    return topological_sort(t_cfg_graph)

def analyze_dataflow(cfg_graph: DirectedAdjList, basic_blocks: dict[str, list[instr]]) -> dict[str, list[set[location]]]: 
    # Achutung: anders wie im Algorithmus darf nicht der transpoierte graph genommen werden!
    mapping = dict((v, [set()]) for v in cfg_graph.vertices())
    worklist = [v for v in cfg_graph.vertices()]

    while len(worklist) > 0:
        node = worklist.pop(0)
        adj_nodes = cfg_graph.adjacent(node)

        input_set: set[location] = set()
        for a_v in adj_nodes:
            input_set |= mapping[a_v][0]

        output = uncover_live(basic_blocks[node], input_set)

        if output != mapping[node]:
            worklist.extend(adj_nodes)
            mapping[node] = output

    return mapping

def uncover_live(istrs : list[Instr], inital: set[location]) -> list[set[location]]:
    output = [inital]
    for istr in istrs[::-1]:
        L_after = output[0]
        R, W = get_read_write_locations(istr)
        output.insert(0, (L_after - W) | R)
    return output

def build_interference(basic_blocks: dict[str, list[instr]], var_types) -> UndirectedAdjList:
    graph = UndirectedAdjList()
    # Get the CFG graph, which is needed to compute the dataflow
    cfg_graph = get_cfg(basic_blocks)

    liveblocks = analyze_dataflow(cfg_graph, basic_blocks)
    
    for block_name in liveblocks:
        istrs = basic_blocks[block_name]
        live = liveblocks[block_name]
        for s in live:
            for v in s:
                graph.add_vertex(v)
        for i in range(len(istrs)):
            istr = istrs[i]
            L_after = live[i + 1]
            match istr:
                case Instr("movq", [s, d]):
                    for v in L_after:
                        if v != s and v != d and not graph.has_edge(v, d):
                            graph.add_edge(v, d)
                case Instr("movzbq", [s, d]):
                    for v in L_after:
                        if v != s and v != d and not graph.has_edge(v, d):
                            graph.add_edge(v, d)
                case _:
                    _, W = get_read_write_locations(istr)
                    match istr:
                        # L_fun
                        case IndirectCallq(l, arity) | TailJump(l, arity):
                            for v in live[i]:
                                match v:
                                    case Variable(var):
                                        match var_types[var]:
                                            case TupleType(ts):
                                                for d in callee_saved_registers:
                                                    graph.add_edge(v, d)
                        # L_tup:
                        case Callq("collect", args):
                            for v in live[i]:
                                match v:
                                    case Variable(var):
                                        match var_types[var]:
                                            case TupleType(ts):
                                                # Interferes with all registers!
                                                for d in callee_saved_registers:
                                                    graph.add_edge(v, d)
                    for v in L_after:
                        for d in W:
                            if v != d and not graph.has_edge(v, d):
                                graph.add_edge(v, d)
    return graph

def saturation(vertex, graph, coloring : dict[location, int]) -> set[int]:
    out = set()
    for adj in set(graph.adjacent(vertex)):
        if adj in coloring:
            out.add(coloring[adj])
    return out

def newcolor(vertex, graph, coloring) -> int:
    sat = saturation(vertex, graph, coloring)
    out = 0
    while out in sat or out in registers_excluded_colors:
        out += 1
    return out

def pre_color(graph: UndirectedAdjList) -> tuple[dict[location, int], dict[location, int]]:
    coloring: dict[location, int] = dict()
    vertices: list[location] = list(graph.vertices())
    saturations: dict[location, int] = {v:0 for v in vertices}
    for v in vertices:
        match v:
            case Reg(r):
                coloring[v] = register_to_color[v]
                for u in set(graph.adjacent(v)):
                    saturations[u] += 1
            case _:
                continue
    return (coloring, saturations)

def color_graph(graph : UndirectedAdjList) -> dict[Variable, int]:
    coloring, saturations = pre_color(graph)
    vertices = list(filter(lambda x: isinstance(x, Variable), graph.vertices()))
    pq = PriorityQueue(lambda x, y: saturations[x.key] < saturations[y.key])
    for v in vertices:
        pq.push(v)
    while not pq.empty():
        v = pq.pop()
        coloring[v] = newcolor(v, graph, coloring)
        for u in set(filter(lambda x: isinstance(x, Variable), graph.adjacent(v))):
            saturations[u] += 1
            pq.increase_key(u)
    # Filter out registers
    output: dict[Variable, int] = dict()
    for key, val in coloring.items():
        match key:
            case Variable(v):
                output[key] = val
            case _:
                continue
    return output

if __name__ == "__main__":
    import doctest
    doctest.testmod()
