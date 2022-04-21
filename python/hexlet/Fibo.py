def fib(x):
    a = 0
    b = 1
    for n in range(x):
        a, b = b, a + b
    return a

print(fib(45))