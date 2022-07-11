def capitalize(word):
    return f'{word[0].upper()}{word[1:]}'

text = input().split()
res = ''
for i in text:
    res += f'{capitalize(i)} '
#print(res[:-1])
print(res.strip())