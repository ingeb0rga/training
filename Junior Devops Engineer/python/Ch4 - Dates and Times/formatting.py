#
# Example file for formatting time and date output
# LinkedIn Learning Python course by Joe Marini
#

from datetime import datetime

def main():
    # Times and dates can be formatted using a set of predefined string
    # control codes 
    now = datetime.now()
        
    #### Date Formatting ####
    
    # %y/%Y - Year, %a/%A - weekday, %b/%B - month, %d - day of month
    print(now.strftime("The current year is: %Y"))
    print(now.strftime("The current month is: %B"))
    print(now.strftime("The current day is: %d"))
    print(now.strftime("The current weekday is: %A"))
    print(now.strftime("%a, %d/%b/%y"))

    # %c - locale's date and time, %x - locale's date, %X - locale's time
    print(now.strftime("%X, %x, %c"))

    #### Time Formatting ####
    
    # %I/%H - 12/24 Hour, %M - minute, %S - second, %p - locale's AM/PM
    print(now.strftime("The current time is: %H:%M:%S"))

if __name__ == "__main__":
    main()
