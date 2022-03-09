# Beide Konstanten b und a werden in das gleiche Register geschoben, wodurch dann a % a == 0
b = 5
a = 13
a = a % b
print(a)

# Result should be: 3


# Hier wird b in rdx geschrieben, wodurch dann das cqto ein foalting point exception gibt
a = 10
b = 5
a = a // b
print(a)

# Result should be: 2

# Hier wird der Aufruf von "idivq d" zu einem None für das d ausgewertet
d = 5
c = 10
c = c // d
print(c)

# Result should be: 2
