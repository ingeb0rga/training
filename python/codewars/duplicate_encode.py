def duplicate_encode(word):
    # result = ""
    # print(word.lower())
    # for char in word.lower():
    #     if word.lower().count(char) == 1:
    #         result += "("
    #     else:
    #         result += ")"
    # return result

    return "".join(["(" if word.lower().count(char) == 1 else ")" for char in word.lower()])

print(duplicate_encode("X@JGYC"))