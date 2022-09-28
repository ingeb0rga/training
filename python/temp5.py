import sys
import os
import re
from unittest import result

# print(sys.argv[1::2])

text = "jetprice@gmail.com spirt.devops@gmail.com devops.spirt@gmail.com jetprice@mail.ru test@test.co.uk"

lookfor = r"\S+@(?!mail\.ru)\w+\.[\w.]+"
result = re.findall(lookfor, text)
print(result)

