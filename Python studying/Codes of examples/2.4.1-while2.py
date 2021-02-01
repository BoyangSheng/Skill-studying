x = 1
y = 1
j = 1
while j<100000:
    y = y * (x + 1)
    x += 1
    j += 1
    if y >= 10000: break
print(x)