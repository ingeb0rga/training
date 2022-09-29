import random

start = int(input("Enter min number: "))
stop = int(input("Enter max number: "))
limit = int(input("Enter the length of the list (should be less, then max number): "))

my_list = random.sample(range(start, stop), limit)
my_list.sort()

number = int(input("Enter number: "))

def binary_search(list, number, min, max):
    if min > max:
        return False
    else:
        mid = (min + max) // 2
        if list[mid] == number:
            return mid
        elif list[mid] > number:
            return binary_search(my_list, number, min, (mid - 1))
        else:
            return binary_search(my_list, number, (mid + 1), max)

result = binary_search(my_list, number, 0, len(my_list))

if result == False:
    print(str(number), "not found")
else:
    print("Found ", str(number), "at index ", str(result))

# ============================================================================
# Simpliest soulution without any methods

# if number in my_list:
#     print(f'{str(number)} Found at index {str(my_list.index(number))}')
# else:
#     print("Not Found")