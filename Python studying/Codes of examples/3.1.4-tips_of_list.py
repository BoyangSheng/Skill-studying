import math
a = [ [None]*5 for i in range(3)]
x = 1
for i in range(3):
    for j in range(5):
        a[i][j] = x
        x += 1
for row in a:
    total = math.fsum(row)
    print(total)