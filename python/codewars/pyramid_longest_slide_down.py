import numpy

a = [[3], [7, 4], [2, 4, 6], [8, 5, 9, 3]]
# a = [[3], [7, 4]]

# def longest_slide_down(pyramid):
#     # print(pyramid[0][0])
#     if len(pyramid) == 1:
#         return pyramid[0][0]
    
#     pyramid = numpy.array(pyramid, dtype=object)
#     pyramid[-2] += numpy.maximum(pyramid[-1][:-1], pyramid[-1][1:])
#     return longest_slide_down(pyramid[:-1])

# def longest_slide_down(pyramid):
#     if len(pyramid) == 1:
#         return pyramid[0][0]

#     last_layer = pyramid[-1]
#     add_layer = []
#     for i in range(1, len(last_layer)):
#         add_layer.append(max(last_layer[i], last_layer[i-1]))
    
#     pyramid[-2] = [a+b for a, b in zip(pyramid[-2], add_layer)]
    
#     return longest_slide_down(pyramid[:-1])

# def longest_slide_down(p):
#     res = p.pop()
#     while p:
#         tmp = p.pop()
#         res = [tmp[i] + max(res[i],res[i+1])  for i in range(len(tmp))] 
#     return res.pop()

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
def longest_slide_down(pyr):
    for row in range(len(pyr)-1, 0, -1):
        for col in range(0, row):
            pyr[row-1][col] += max(pyr[row][col], pyr[row][col+1])
    return pyr[0][0]

print(longest_slide_down(a))