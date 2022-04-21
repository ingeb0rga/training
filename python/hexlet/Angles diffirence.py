def diff(ang1, ang2):
    
    x1 = abs(ang1) % 360
    x2 = abs(ang2) % 360
    
    def count(y1, y2):
        global result
        if (y2 - y1) > 180:
            result = (y1 + 360) - y2
        else:
            result = y2 - y1
        
    if x1 > x2:
        x1, x2 = x2, x1
    count(x1, x2)

    return result


print(diff(0, 190))