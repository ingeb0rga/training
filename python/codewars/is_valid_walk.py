def is_valid_walk(walk):
    # if walk.count("s") != walk.count("n") or walk.count("e") != walk.count("w"):
    #     return False
    # elif len(walk) == 10:
    #     return True
    # # elif len(walk) <10 or len(walk) > 10:
    # else:
    #     return False

    return len(walk) == 10 and walk.count("s") == walk.count("n") and walk.count("e") == walk.count("w")

print(is_valid_walk(['n', 's', 'w', 'e', 'n', 's', 'w', 'e', 'w', 'e']))