#
# Example file for working with conditional statements
# LinkedIn Learning Python course by Joe Marini
#



def main():
    x, y = 10, 100

    # conditional flow uses if, elif, else
    # if (x > y):
    #     print("x is greater than y")
    # elif (x < y):
    #     print("y is greater than x")
    # else:
    #     print("x and y are equal")
    # conditional statements let you use "a if C else b"
    # res = "x is less than y" if (x < y) else "x is greater or equlas to y"
    # print(res)
    # match-case makes it easy to compare multiple values
    value = "five"
    match value:
        case "one":
            result = 1
        case "two":
            result = 2
        case "tree" | "four":
            result = (3,4)
        case _:
            result = -1
    print(result)

if __name__ == "__main__":
    main()
