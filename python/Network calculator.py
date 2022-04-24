def net_calc(ip, prefix):
    ip_in = [int(x) for x in ip.split('.')]
    ip_in_bin = [bin(x) for x in ip_in]

    mask = ''
    for i in range(prefix):
        mask += '1'
    for j in range(32 - prefix):
        mask += '0'

    mask_bin = [f'0b{int(mask[i:i + 8])}' for i in range(0, len(mask), 8)]
    mask_int = [int(mask_bin[x], 2) for x in range(len(mask_bin))]
    net_id_bin = [bin(int(ip_in_bin[x], 2) & int(mask_bin[x], 2)) for x in range(len(ip_in))]
    net_id_int = [int(net_id_bin[x], 2) for x in range(len(net_id_bin))]
    
    #print(ip_in)
    #print(ip_in_bin)
    #print(prefix)
    #print(mask_bin)
    #print(net_id_bin)
    print(mask_int)
    print("Network_ID:", *net_id_int, sep='.', end='\n')
    print("Mask:", *mask_int, sep='.', end='\n')
net_calc(input(), int(input()))