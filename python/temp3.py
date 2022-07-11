a = '0b10011100'
a = str(a)
b = [0, 'b', 0, 0, 0, 0, 0, 0, 0, 0]
for i in range(len(a) - 1, 1, -1):
    if int(a[i]) == 1:
        b[i] = 1
        break

print(a)
print(b)
c = str(''.join(list(map(str, b))))
#print(c)
sum = bin(int(a, 2) + int(c, 2))
print(sum)
print(int(sum, 2))
#print(bin(int(a, 2)))
#print(bin(int(c, 2)))


#integer_sum = int(a, 2) + int(b, 2)
#binary_sum = bin(integer_sum)
#binary_and = bin(int(a, 2) & int(b, 2))
#print(integer_sum)
#print(binary_sum)
#print(binary_and)