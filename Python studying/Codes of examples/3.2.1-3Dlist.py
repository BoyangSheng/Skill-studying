a = [ [[None]*4 for i in range(3)] for j in range(2)]
x = 1
for i in range(2):
    for j in range(3):
        for k in range(4):
            a[i][j][k] = x
            x += 1
print(a)