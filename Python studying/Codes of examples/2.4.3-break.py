string1 = "I have a dream"
letter = input("输入一个需要寻找的字母：")

found = False
for a in string1:
    if a == letter:
        found = True
        break

if found == True:
    print("Letter", letter, "has been found!")
else:
    print("Letter", letter, "doesn't exist in this sentence.")