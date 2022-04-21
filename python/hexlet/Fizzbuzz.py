def fizz_buzz(begin, end):
    if begin > end:
        print('Wrong range')
    else:
        string = ''
        for i in range(begin, (end + 1)):
            if i % 3 == 0 and i % 5 == 0:
                string = f"{string}FizzBuzz "
            elif i % 3 == 0:
                string = f"{string}Fizz "
            elif i % 5 == 0:
                string = f"{string}Buzz "
            else:
                string = f"{string}{i} "
        return string.strip()

print(fizz_buzz(11, 20))