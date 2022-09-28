from urllib import request, parse
import sys

my_url = "http://www.google.com/search?"
value = {'q':'Metallica'}
my_header = {}
my_header['user-agent'] = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36'

try:
    mydata = parse.urlencode(value)
    my_url = my_url + mydata
    req = request.Request(my_url, headers=my_header)
    result = request.urlopen(req).read()
except Exception:
    print("Error during web request")
    print(sys.exc_info()[1])

print(result)
