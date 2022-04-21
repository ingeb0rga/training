def diff(x, y):

    ang1 = abs(x) %360
    ang2 = abs(y) %360
    
    if ang1 > ang2:
        (ang1, ang2) = (ang2, ang1)
        return ang1, ang2
    else:
        return ang1, ang2
    

def count(diff):
    if ang2 - ang1 > 180:
        result = (ang1 + 360) - ang2
        return result
    else:
        result = ang2 -ang1
        return result
        

print(diff(0, 190))
