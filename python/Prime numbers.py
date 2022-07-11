def simple(x):

    x = int(input('Введите число: '))

    if x == 0 or x == 1:
        print('Не простое')
    elif x == 2 or x == 3:
        print('Простое')
    elif x < 0 or x > 1000:
        print('Вне диапазона')
    else:
        i = 2
        while i <= x - 1:
            if x % i == 0:
                return print('Не простое')
            return print('Простое')


simple(1)