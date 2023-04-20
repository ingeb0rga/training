#
# Example file for working with functions
# LinkedIn Learning Python course by Joe Marini
#


# TODO: define a basic function

# TODO: function that takes arguments
def func1(a, b):
    print(a)
    print(b)

# func1(2,4)
# print("--------------------")

# TODO: function that returns a value
def func2(a, b):
    print(a)
    print(b)
    return a, b

# print(func2(2,4))
# print("--------------------")

# TODO: function with default value for an argument
def func3(a = "default"):
    if len(a) == 0:
        a = "default"
        print(a)
    else:
        print(a)

# var = input(str())
# func3(var)
# func3()
# print("--------------------")

# TODO: function with variable number of arguments
def func4(val):
    sum = 0
    for i in val:
        sum += int(i)
    return sum

print("Enter arguments list, delimited by ','")
val = (input().split(','))
print(func4(val))