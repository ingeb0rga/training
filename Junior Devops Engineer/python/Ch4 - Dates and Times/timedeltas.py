#
# Example file for working with timedelta objects
# LinkedIn Learning Python course by Joe Marini
#

from datetime import date
from datetime import time
from datetime import datetime
from datetime import timedelta

# TODO: construct a basic timedelta and print it
# print(timedelta(days = 365, hours = 5, minutes = 1, seconds = 44))

# # TODO: print today's date
# now = datetime.now()
# print("Today is:", now)

# # TODO: print today's date one year from now
# print("One year from now it will be:", now + timedelta(days=365))

# # TODO: create a timedelta that uses more than one argument
# print("In two weeks and three days, it will be:", now + timedelta(days=3, weeks=2))

# # TODO: calculate the date 1 week ago, formatted as a string
# print("One week ago, it was:", now + timedelta(weeks=-1))
# print("One week ago, it was:", now - timedelta(weeks=1))
# print("One week ago, it was:", (now - timedelta(weeks=1)).strftime("%A, %d %B %Y"))

### How many days until April Fools' Day?
today = date.today()
afd = date(today.year, 4, 1)

# TODO: use date comparison to see if April Fool's has already gone for this year
# if it has, use the replace() function to get the date for next year
if (afd < today):
    print("AFD already went by %d days ago" % ((today - afd).days))
    afd = afd.replace(year = today.year + 1)
    
# TODO: Now calculate the amount of time until April Fool's Day  
print("%d days until the next AFD" % ((afd - today).days))
print("Days until the next AFD:", ((afd - today).days))