from urllib import request
import sys
import os

my_url = "http://adv400.tripod.com/kartinka.jpg"
# my_dir = os.path.dirname('/home/spirt/Downloads/')
# my_file = os.path.join(my_dir, 'adv400.jpg')
my_file = ("/home/spirt/Downloads/adv400.jpg")

try:
    request.urlretrieve(my_url, my_file)
except Exception:
    print(sys.exc_info()[1])
    exit

print("success")