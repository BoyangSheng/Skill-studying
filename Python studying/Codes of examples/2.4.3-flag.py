string1 = "I have a dream"
letter = input("输入一个需要寻找的字母：")

found = False
i = 0
while i <= len(string1) - 1 and found == False :
    if string1[i] == letter:		
        found = True				
    i += 1

if found == True:
    print("Letter", letter, "has been found!")
else:
    print("Letter", letter, "doesn't exist in this sentence.")