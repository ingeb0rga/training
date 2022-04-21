eng_lat = {}
lat_eng = {}
for n in range(int(input())):
    eng, *lat = input().split(' - ', 1)
    eng_lat[eng] = lat
    for val in eng_lat[eng]:
        j = (val.replace(',', '').split())
        for i in j:
            if i in lat_eng:
                lat_eng[i] += ', ' + eng
            else:
                lat_eng[i] = eng

print(len(lat_eng))
for key, val in sorted(lat_eng.items()):
    print(f'{key} - {val}')