# def strip_comments(strng, markers):
#     lines = strng.split('\n')
#     # print(lines)
#     for i, line in enumerate(lines):
#         for marker in markers:
#             line = line.split(marker)[0].rstrip()
#         print(line)
#         lines[i] = line
        
#     return '\n'.join(lines)

def strip_comments(strng, markers):
    lines = strng.split('\n')
    for marker in markers:
        lines = [line.split(marker)[0].rstrip() for line in lines]
    return '\n'.join(lines)

# print(strip_comments('\t. apples pears\navocados ^ lemons lemons bananas\navocados lemons oranges oranges\n- ?', ["'", ',', '-', '.', '=', '?', '!', '#']))
print(strip_comments("apples, pears # and bananas\ngrapes\nbananas !apples", ["#", "!"]))
