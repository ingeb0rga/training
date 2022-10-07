a = {"flour": 500, "sugar": 200, "eggs": 1}
b = {"flour": 1200, "sugar": 1200, "eggs": 5, "milk": 200}

def cakes(recipe, available):
    result = []
    for i in recipe:
        if i in available:
            result.append(available[i] // recipe[i])
        else:
            return False
    return min(result)

print(cakes(a, b))