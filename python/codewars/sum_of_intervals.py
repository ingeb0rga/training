a = [(-100000000, 100000000)]

def sum_of_intervals(intervals):
    result = set()
    for interval in intervals:
        result.update(range(interval[0], interval[1]))
        # print(result)
    return len(result)

print(sum_of_intervals(a))