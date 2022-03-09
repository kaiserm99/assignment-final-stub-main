# Beide Konstanten b und a werden in das gleiche Register geschoben, wodurch dann a % a == 0
b = 5
a = 13
a = a % b
print(a)
