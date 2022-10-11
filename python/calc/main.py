from calc import Calculator
import sys

if __name__ == "__main__":
    calc = Calculator()
    arg1 = int(sys.argv[2])
    arg2 = int(sys.argv[3])
    match sys.argv[1]:
        case "add":
            result = calc.add(arg1, arg2)
        case "sub":
            result = calc.sub(arg1, arg2)
        case "mul":
            result = calc.mul(arg1, arg2)
        case "div":
            result = calc.div(arg1, arg2)
        case _:
            print("Wrong command passed")
            result = None
        
    print(f"Result: {result}")