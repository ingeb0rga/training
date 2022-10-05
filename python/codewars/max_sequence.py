def max_sequence(arr):
    if len(arr) < 1:
        return 0
    max_sum = temp_sum = 0
    for item in arr:
        temp_sum += item
        if item > temp_sum:
            temp_sum = item
        if temp_sum > max_sum:
            max_sum = temp_sum
    return max_sum

print(max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]))