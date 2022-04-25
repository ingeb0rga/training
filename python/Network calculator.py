def net_calc(ip, prefix):
    octets = 4
    bits_per_octet = 10
    
    ip_in = [int(x) for x in ip.split('.')]
    ip_in_bin = [bin(x) for x in ip_in]

    mask = ''
    for i in range(prefix):
        mask += '1'
    for j in range(32 - prefix):
        mask += '0'

    mask_bin = [f'0b{int(mask[i:i + 8])}' for i in range(0, len(mask), 8)]
    mask_int = [int(mask_bin[x], 2) for x in range(octets)]
    net_id_bin = [bin(int(ip_in_bin[x], 2) & int(mask_bin[x], 2)) for x in range(octets)]
    net_id_int = [int(net_id_bin[x], 2) for x in range(octets)]
    next_net_id_bin = [bin(int(ip_in_bin[x], 2) & int(mask_bin[x], 2)) for x in range(octets)]

    index = -1
    for i in range(octets - 1, -1, -1):
        empty_term = [0, 'b', 0, 0, 0, 0, 0, 0, 0, 0]
        if int(mask_bin[i], 2) != 0:
            index = i
            for j in range(bits_per_octet - 1, 1, -1):
                if int(mask_bin[i][j]) == 1:
                    empty_term[j] = 1
                    break
            break
    next_net_id_bin[index] = bin(int(next_net_id_bin[i], 2) + int(str(''.join(list(map(str, empty_term)))), 2))
    next_net_id_int = [int(next_net_id_bin[x], 2) for x in range(octets)]

    wildcard_mask = ''        
    for i in range(len(mask)):
        if int(mask[i]) == 0:
            wildcard_mask += '1'
        else:
            wildcard_mask += '0'
    wildcard_mask_bin = [f'0b{int(wildcard_mask[i:i + 8])}' for i in range(0, len(wildcard_mask), 8)]
    wildcard_mask_int = [int(wildcard_mask_bin[x], 2) for x in range(octets)]

    broadcast_bin = [bin(int(net_id_bin[x], 2) | int(wildcard_mask_bin[x], 2)) for x in range(octets)]
    broadcast_int = [int(broadcast_bin[x], 2) for x in range(octets)]
    last_host_ip_bin = [broadcast_bin[x] for x in range(octets)]
    last_host_ip_bin[octets - 1] = bin(int(last_host_ip_bin[octets - 1], 2) - 1)
    last_host_ip_int = [int(last_host_ip_bin[x], 2) for x in range(octets)]

    for k in range(octets -1, -1, -1):
        first_host_ip_bin = [x for x in net_id_bin]
        if int(first_host_ip_bin[k], 2) == 0:
            first_host_ip_bin[k] = bin(int(first_host_ip_bin[k], 2) + 1)
            break
    first_host_ip_int = [int(first_host_ip_bin[x], 2) for x in range(octets)]

    print("---------------------------------------------")
    print('Network_ID: ', end='' )
    print(*net_id_int, sep='.', end='/')
    print(prefix)
    print('Mask: ', end='' )
    print(*mask_int, sep='.', end='\n')
    print('Wildcart: ', end='' )
    print(*wildcard_mask_int, sep='.', end='\n')
    print('Next Network_ID: ', end='' )
    print(*next_net_id_int, sep='.', end='/')
    print(prefix)
    print('Broadcast IP: ', end='' )
    print(*broadcast_int, sep='.', end='\n')
    print('First Host IP: ', end='' )
    print(*first_host_ip_int, sep='.', end='\n')
    print('Last Host IP: ', end='' )
    print(*last_host_ip_int, sep='.', end='\n')
    print("IP addresses #:", (2 ** (32 - prefix)) - 2)
    print("---------------------------------------------")
        
net_calc(input("Enter IP: "), int(input("Enter network prefix: ")))