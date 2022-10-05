def order_weight(strng):
    # return ' '.join(sorted(strng.split(), key=count_weight))
    return ' '.join(sorted(strng.split(), key=lambda x: (sum(int(c) for c in x), x)))

# def count_weight(s):
#     return (sum(int(c) for c in s), s)

print(order_weight("2000 10003 1234000 44444444 9999 11 11 22 123"))