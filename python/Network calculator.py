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
    next_net_id_bin = [bin(int(ip_in_bin[x], 2) & int(mask_bin[x], 2)) for x in range(len(ip_in))]
    first_host_ip_bin = net_id_bin
    
    wildcard_mask = ''
    for i in range(len(mask)):
        if int(mask[i]) == 0:
            wildcard_mask += '1'
        else:
            wildcard_mask += '0'
    wildcard_mask_bin = [f'0b{int(wildcard_mask[i:i + 8])}' for i in range(0, len(wildcard_mask), 8)]

    broadcast_bin = [bin(int(net_id_bin[x], 2) | int(wildcard_mask_bin[x], 2)) for x in range(len(ip_in))]
    broadcast_int = [int(broadcast_bin[x], 2) for x in range(len(broadcast_bin))]
    last_host_ip_bin = broadcast_bin
    last_host_ip_bin[len(last_host_ip_bin) - 1] = bin(int(last_host_ip_bin[len(last_host_ip_bin) - 1], 2) - 1)
    last_host_ip_int = [int(last_host_ip_bin[x], 2) for x in range(len(last_host_ip_bin))]

    for i in range(len(mask_bin)):
        empty_term = [0, 'b', 0, 0, 0, 0, 0, 0, 0, 0]
        if int(mask_bin[i], 2) == 0:
            for j in range(len(net_id_bin[i - 1]) - 1, 1, -1):
                if int(mask_bin[i - 1][j]) == 1:
                    empty_term[j] = 1
                    break
    next_net = bin(int(next_net_id_bin[i - 1], 2) + int(str(''.join(list(map(str, empty_term)))), 2))
    next_net_id_bin[i - 1] = next_net
    first_host_ip_bin[i] = bin(int(first_host_ip_bin[i], 2) + 1)
        
    next_net_id_int = [int(next_net_id_bin[x], 2) for x in range(len(next_net_id_bin))]
    first_host_ip_int = [int(first_host_ip_bin[x], 2) for x in range(len(first_host_ip_bin))]

    print("---------------------------------------------")
    print('Network_ID: ', end='' )
    print(*net_id_int, sep='.', end='/')
    print(prefix)
    print('Mask: ', end='' )
    print(*mask_int, sep='.', end='\n')
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