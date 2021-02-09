import random
subject = 5
student = 4
grade = [ [None]*subject for i in range(student)]

for i in range(student):
    for j in range(subject):
        grade[i][j] = random.randint(60,100)

#1
average = [None]*student
for i in range(student):
    average[i] = 0
    for j in range(subject):
        average[i] += grade[i][j]
    average[i] /= subject

print(average)
del(average)

#2 使用Python自带的方法遍历
import math
average = []
for row in grade:
    average.append(math.fsum(row)/subject)
print(average)
del(average)