def s_power_of_three(x):
    while x != 1:
        if x % 3 != 0:
            return False
        else:
            x = x / 3
        return True

print(s_power_of_three(27))