from datetime import datetime
from datetime import date
from datetime import time
# import datetime

# print(datetime.now())
today = date.today()
print("%s.%s.%s" % (today.day, today.month, today.year))