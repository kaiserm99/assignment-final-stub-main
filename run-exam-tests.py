from type_check_Lexam import TypeCheckLexam
from interp_Lexam import InterpLexam
from type_check_Cexam import TypeCheckCexam
from interp_Cexam import InterpCexam
from utils import enable_tracing, run_tests, validate_tests
from compiler_Lexam import CompilerLexam
import sys


sys.setrecursionlimit(10000)

compiler = CompilerLexam()

if False:
    enable_tracing()

# test_suites = ['bug_tests']
test_suites = ['exam', 'mytests', 'bug_tests']

if all(validate_tests(t, InterpLexam().interp) for t in test_suites):
    print("Congratulations, the interpreter verifies all tests!")
else:
    print("The interpreter failed on one or more tests.")

for test_suite in test_suites:
    run_tests(test_suite, compiler, "exam",
        TypeCheckLexam().type_check,
        InterpLexam().interp,
        TypeCheckCexam().type_check,
        InterpCexam().interp)
