import random

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

my_list = random.sample(range(  int(input("Enter min number: ")),
                                int(input("Enter max number: "))),
                                int(input("Enter the length of the list (should be less, then max number): ")))
my_list.sort()
number = int(input("Enter number: "))

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