from sympy import *

g = 2
m = 2
n = 50

def gap(g, m, n):
    for i in range(m, n - g + 1):
        if isprime(i) and isprime(i + g):
            return (i, i + g)

print(gap(g, m, n))