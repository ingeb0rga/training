def binary_sum(num1, num2):
    result = int(num1, 2) + int(num2, 2)
    return bin(result)[2:]

print(binary_sum('1101', '101'))