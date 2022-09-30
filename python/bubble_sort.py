import random

start = int(input("Enter min number: "))
stop = int(input("Enter max number: "))
limit = int(input("Enter the length of the list: "))

my_list = [random.randrange(start, stop) for i in range(limit)]
print(my_list)

def bubble_sort(list):
    for k in range(len(my_list) - 1):
        for i in range(len(my_list) - 1 - k):
            if my_list[i] > my_list[i + 1]:
                my_list[i], my_list[i + 1] = my_list[i + 1], my_list[i]
    print(my_list)
        
bubble_sort(my_list)