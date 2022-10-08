# permutations('a'); # ['a']
# permutations('ab'); # ['ab', 'ba']
text = 'aabb' # ['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa']

# for i, j in enumerate(text):
#     print(i, j)

def permutations(string):
    result = set([string])
    if len(string) == 2:
        result.add(string[1] + string[0])

    elif len(string) > 2:
        for i, c in enumerate(string):
            print(i, c)
            # print("-------------")
            for s in permutations(string[:i] + string[i + 1:]):
                print(c + s)
                result.add(c + s)
                print("-------------")
    
    return list(result)

# print(permutations(text))
permutations(text)