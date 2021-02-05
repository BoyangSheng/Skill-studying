list_a = [None]*3
list_a[0] = ['Good','To','See','You']
list_a[1] = [1,2,3,4]
list_a[2] = [3*2,1+3,6-9,8/4]
print(list_a)
del(list_a)
list_a = []
list_a.append(['Good','To','See','You'])
list_a.append([1,2,3,4])
list_a.append([3*2,1+3,6-9,8/4])
print(list_a)
del(list_a)

list_a = [
    ['Good','To','See','You'],\
    [1,2,3,4],\
    [3*2,1+3,6-9,8/4]\
]
print(list_a)
del(list_a)

list_a = [ [None]*4 for i in range(3)]
list_a[0][0] = 'Good'
list_a[0][1] = 'To'
list_a[0][2] = 'See'
list_a[0][3] = 'You'
list_a[1][0] = 1
list_a[1][1] = 2
list_a[1][2] = 3
list_a[1][3] = 4
list_a[2][0] = 3*2
list_a[2][1] = 1+3
list_a[2][2] = 6-9
list_a[2][3] = 8/4
print(list_a)