# Hier wird b in rdx geschrieben, wodurch dann das cqto ein foalting point exception gibt
a = 10
b = 5
a = a // b
print(a)


# Hier wird der Aufruf von "idivq d" zu einem None für das d ausgewertet
d = 5
c = 10
c = c // d
print(c)