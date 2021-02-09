def factorial(x):
    y = int(x)
    print(y)
    j = 1
    for i in range(y):
        z = (i+1)*j
        j = z
    return z

x = int(input('请输入一个数字，以计算其阶乘'))
print("它的阶乘是：",factorial(x))