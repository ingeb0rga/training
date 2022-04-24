a = '0b11000000'
b = '0b11111111'
integer_sum = int(a, 2) + int(b, 2)
binary_sum = bin(integer_sum)
binary_and = bin(int(a, 2) & int(b, 2))
print(integer_sum)
print(binary_sum)
print(binary_and)