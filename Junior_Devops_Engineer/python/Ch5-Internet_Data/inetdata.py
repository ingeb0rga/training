# 
# Example file for retrieving data from the internet
# LinkedIn Learning Python course by Joe Marini
#

import urllib.request

def main():
    # pass # this is a placeholder, do-nothing statement
    url = urllib.request.urlopen("http://www.google.com")
    print("result code:", url.getcode())
    print(url.read())

if __name__ == "__main__":
    main()
