# 
# Example file for variables
# LinkedIn Learning Python course by Joe Marini
#

# Basic data types in Python: Numbers, Strings, Booleans, Sequences, Dictionaries
myint = 5
myfloat = 13.2
mystr = "This is a string"
mybool = True
mylist = [0, 1, "two", 3.2, False]
mytuple = (0, 1, 2)
mydict = {"one" : 1, "two" : 2}

print(myint)
print(myfloat)
print(mystr)
print(mybool)
print(mylist)
print(mytuple)
print(mydict.values)

# re-declaring a variable works
myint = 6
print(myint)
# to access a member of a sequence type, use []
print(mystr[5])
# use slices to get parts of a sequence
print(mystr[0:4])
# you can use slices to reverse a sequence
print(mystr[::-1])
# dictionaries are accessed via keys
for key in mydict:
    print(f'{key} = {mydict[key]}')
# ERROR: variables of different types cannot be combined
print(list(str(myint)) + mylist)
# Global vs. local variables in functions
def func():
    global mystr
    mystr = "test"
    print(mystr)

func()
print(mystr)