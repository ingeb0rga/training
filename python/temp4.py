# names = ['Bob', 'Dan', 'Ann', 'Ron', 'Max', 'Dan']
# for i in range(len(names) - 1):
#     if names[i] == 'Dan':
#         del names[i]
# names.sort()
# print(names)
# x = ""
# while x != "stop":
#     print("Enter number:")
#     x = input()
#     if x == "3":
#         print("YES")
#     else:
#         print("NO")

from encodings import utf_8
import sys


input_file = "./myfile.txt"
output_file = "./outfile.txt"

# myfile1 = open(inputs_file, mode='r', encoding='utf_8')
# myfile2 = open(output_file, mode='a', encoding='utf_8')
# myfile2.write("\n__________________\n")

while True:
    try:
        myfile1 = open(input_file, mode='r', encoding='utf_8')
        myfile2 = open(output_file, mode='a', encoding='utf_8')
        myfile2.write("\n__________________\n")
    except Exception:
        print("Error found")
        print(sys.exc_info()[1])
        input_file = input("Please enter correct filename:")
    else:
        for num, line in enumerate(myfile1, 1):
            # print(str(num) + "\t Hello " + line.strip())
            if len(line.strip()) <= 3:
                print(f'{num}\tHello, {line.strip()}')
                myfile2.write(f'{num}\tHello, {line.strip()}\n')

        myfile1.close()
        myfile2.close()
        sys.exit()
