import os

total_size = 0
files_list = ""

for file in os.listdir():
    if os.path.isfile(file):
        files_list += (file + "\n")
        total_size += int(os.stat(file).st_size)

if not os.path.isdir("results"):
    os.mkdir("results")    

result = open("results/results.txt", "w+")
if result.mode == "w+":
    result.write("Total bytecount: " + str(total_size) + "\n")
    result.write("Files list:\n")
    result.write("------------\n")
    result.write(files_list)
    result.close()