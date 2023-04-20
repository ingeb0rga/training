import calendar

while True:
    try:
        print("Which day of the week do you want to count?")

        i = 0
        days = {}
        for day in calendar.day_name:
            days[i] = day
            print(f'{i}: {day}')
            i += 1

        print("Or 'exit' to quit")
        choice = input("? ")
        if (choice.lower() == "exit"):
            quit()
        choice = int(choice)
        year = int(input("Enter year: "))
        month = int(input("Enter month: "))
        day = days[int(choice)].upper()

        result = 0
        for week in calendar.monthcalendar(year, month):
            if (week[getattr(calendar, day)] != 0):
                result += 1

        print("There are", result, "of those days in the month and year specified\n")
        
    # except ValueError as e:
    #     print(e)
    #     print("Sorry, that's not valid input\n")
    # except KeyError:
    #     print(e)
    #     print("Sorry, that's not valid input\n")
    except Exception as e:
        print(e)
        print("Sorry, that's not valid input\n")