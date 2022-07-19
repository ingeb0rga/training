while True:
    string = input(str("Enter string to test fot palindrome or 'exit': ")).lower()
    text = ""
    for i in string:
        if i.isalnum():
            text += i

    if (len(text) < 2):
        print("The string should be at least 2 alpha-numerics")
        continue
    elif (string == "exit"):
        quit()
    else:
        inv_text = text[::-1]

    if (text == inv_text):
        print("Palindrome test: True")
    else:
        print("Palindrome test: False")