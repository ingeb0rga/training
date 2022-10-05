# import re

sentence = "is2 Thi1s T4est 3a"

def order(sentence):
    return ' '.join(sorted(sentence.split(), key=min))

# def order(sentence):
#     dict = {}
#     result = ""
#     for i in sentence.split():
#         dict[i] = re.findall('\d+', i)
#     dict = sorted(dict.items(), key=lambda x: x[1])
#     print(dict)
#     for x in range(len(dict)):
#         result += dict[x][0] + " "
#     return result.strip()

print(order(sentence))