list_a = [
    ['Good','To','See','You'],\
    [1,2,3,4],\
    [3*2,1+3,6-9,8/4]\
]
print(list_a)

#获取值
print(list_a[0][1])
list_a[0][1] = 0.045
print(list_a[0][1])

list_b = [ [None]*4 for i in range(3)]
x = 0
for i in range(3):
    for j in range(4):
        list_b[i][j] = x
        x += 1
print(list_b)

for i in range(3):
    for j in range(4):
        list_b[i][j] *= 2
print(list_b)

#遍历列表
#第一种方法
for i in range(3):
    for j in range(4):
        print(list_b[i][j])
print("---------------------------------------------")
for j in range(4):
    for i in range(3):
        print(list_b[i][j])
print("---------------------------------------------")
#第二种方法
for i in range(3):
    for j in range(4):
        print(list_b[i][j])
print("---------------------------------------------")
for i in range(4):
    for j in range(3):
        print(list_b[j][i])