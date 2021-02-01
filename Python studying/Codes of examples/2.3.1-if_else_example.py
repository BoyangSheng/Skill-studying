print("请输入你的成绩")
x = int(input())

if x <= 60:
    print("你的成绩不及格")
elif 60 < x <= 80:
    print("你的成绩还凑合")
elif 80 < x <= 100:
    print("你的成绩不错嘛")
    if x == 100:
        print("学霸你太厉害啦")
else:
    print("你成绩是假的吧")