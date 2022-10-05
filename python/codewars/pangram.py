import string

def is_pangram(sentence):
    # a = set(string.ascii_lowercase)
    # s = set([x.lower() for x in sentence if x.isalpha()])
    # print(sorted(s))
    # if a.difference(s):
    #     return False
    # else:
    #     return True

    print(sorted(set(sentence.lower())))
    return set(string.ascii_lowercase).issubset(set(sentence.lower()))
 

print(is_pangram("Pack my box with five--,,. dozen liquor jugs."))
