# def privet(num):
#     if num == 0:
#         return
#     else:
#         print("hello")
#         privet(num - 1)

# privet(5)

def sum(x):
    if x == 0:
        return 0
    elif x == 1:
        return 1
    else:
        return (x + sum(x - 1))

print(sum(990))

# def factorial(n):
#     if n < 0:
#         return "Number should be positive"
#     elif n == 0:
#         return 1
#     else:
#         return (n * factorial(n - 1))

# print(factorial(int(input("Enter number: "))))

# def fibbo(i):
#     if i == 0:
#         return 0
#     elif i == 1:
#         return 1
#     else:
#         return (fibbo(i - 1) + fibbo(i - 2))

# print(fibbo(int(input("Enter number: "))))

# def fibbo(n):
#     a, b = 0, 1
#     if n == 0:
#         return 0
#     else:
#         for i in range (1, n):
#             a, b = b, a + b
#     return b

# def fibbo(x):
#     a, b = 0, 1
#     for n in range(x):
#         a, b = b, a + b
#     return a, b


# print(fibbo(int(input("Enter number: "))))
