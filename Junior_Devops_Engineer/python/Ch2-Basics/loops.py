#
# Example file for working with loops
# LinkedIn Learning Python course by Joe Marini
#


def main():
    x = 10

    # TODO: define a while loop
    # while (x < 15):
    #     print(x)
    #     x += 1

    # TODO: define a for loop
    # for i in range (x):
    #     print(i)

    # TODO: use a for loop over a collection
    # days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
    # for day in days:
    #     print(day)

    # TODO: use the break and continue statements
    # for i in range (x):
    #     if (i == 8):
    #         break
    #     if (i % 2 == 0):
    #         continue
    #     print(i)

    # TODO: using the enumerate() function to get index 
    days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
    for i,day in enumerate(days):
        print(i + 1, day)  
  
if __name__ == "__main__":
    main()
