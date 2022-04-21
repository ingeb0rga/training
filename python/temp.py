n = 8
x = []
y = []
res = True
for i in range(n):
    a, b = [int(i) for i in input().split()]
    x.append(a)
    y.append(b)
for i in range(n):
    for j in range(i + 1, n):
        if x[i] == x[j] or y[i] == y[j] or abs(x[i] - x[j]) == abs(y[i] - y[j]):
            res = False
if res:
    print('NO')
else:
    print('YES')