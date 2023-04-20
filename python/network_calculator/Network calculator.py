# Network Calculator
def net_calc(ip, prefix):
    octets = 4
    bits_per_octet = 10  # Prefix '0b' plus 8bit

    # Convert decimal IP address to binary format
    ip_in = [int(x) for x in ip.split(".")]
    ip_in_bin = [bin(x) for x in ip_in]

    # Mask
    mask = ""
    for i in range(prefix):
        mask += "1"
    for j in range(32 - prefix):
        mask += "0"
    # Binary mask
    mask_bin = [f"0b{int(mask[i:i + 8])}" for i in range(0, len(mask), 8)]
    # Decimal mask
    mask_int = [int(mask_bin[x], 2) for x in range(octets)]
    # Wildcard mask
    wildcard_mask = ""
    for i in range(len(mask)):
        if int(mask[i]) == 0:
            wildcard_mask += "1"
        else:
            wildcard_mask += "0"
    # Binary wildcard mask
    wildcard_mask_bin = [
        f"0b{int(wildcard_mask[i:i + 8])}" for i in range(0, len(wildcard_mask), 8)
    ]
    # Decimal wildcard mask
    wildcard_mask_int = [int(wildcard_mask_bin[x], 2) for x in range(octets)]
    # Binary subnet addrerss
    net_id_bin = [bin(int(ip_in_bin[x], 2) & int(mask_bin[x], 2)) for x in range(octets)]
    # Decimal subnet address
    net_id_int = [int(net_id_bin[x], 2) for x in range(octets)]
    # Next subnet binary IP
    next_net_id_bin = [bin(int(ip_in_bin[x], 2) & int(mask_bin[x], 2)) for x in range(octets)]

    index = ""
    for i in range(octets - 1, -1, -1):
        empty_term = [0, "b", 0, 0, 0, 0, 0, 0, 0, 0]
        if int(mask_bin[i], 2) != 0:
            index = i
            for j in range(bits_per_octet - 1, 1, -1):
                if int(mask_bin[i][j]) == 1:
                    empty_term[j] = 1
                    break
            break
    next_net_id_bin[index] = bin(
        int(next_net_id_bin[i], 2) + int(str("".join(list(map(str, empty_term)))), 2)
    )
    # Next subnet decimal IP
    next_net_id_int = [int(next_net_id_bin[x], 2) for x in range(octets)]
    # Binary broacast address
    broadcast_bin = [
        bin(int(net_id_bin[x], 2) | int(wildcard_mask_bin[x], 2)) for x in range(octets)
    ]
    # Decimal broacast address
    broadcast_int = [int(broadcast_bin[x], 2) for x in range(octets)]
    # Last host binary IP
    last_host_ip_bin = [broadcast_bin[x] for x in range(octets)]
    last_host_ip_bin[octets - 1] = bin(int(last_host_ip_bin[octets - 1], 2) - 1)
    # Last host decimal IP
    last_host_ip_int = [int(last_host_ip_bin[x], 2) for x in range(octets)]
    # First host binary IP
    first_host_ip_bin = [x for x in net_id_bin]
    first_host_ip_bin[octets - 1] = bin(int(first_host_ip_bin[octets - 1], 2) + 1)
    # First host decimal IP
    first_host_ip_int = [int(first_host_ip_bin[x], 2) for x in range(octets)]

    print("---------------------------------------------")
    print("Network_ID:\t\t", end="")
    print(*net_id_int, sep=".", end="/")
    print(prefix)
    print("Mask:\t\t\t", end="")
    print(*mask_int, sep=".", end="\n")
    print("Wildcart:\t\t", end="")
    print(*wildcard_mask_int, sep=".", end="\n")
    print("Next Network_ID:\t", end="")
    print(*next_net_id_int, sep=".", end="/")
    print(prefix)
    print("Broadcast IP:\t\t", end="")
    print(*broadcast_int, sep=".", end="\n")
    print("First Host IP:\t\t", end="")
    print(*first_host_ip_int, sep=".", end="\n")
    print("Last Host IP:\t\t", end="")
    print(*last_host_ip_int, sep=".", end="\n")
    print("IP addresses #:\t\t", end="")
    print(2 ** (32 - prefix) - 2)
    print("---------------------------------------------")


if __name__ == "__main__":
    net_calc(input("Enter IP: "), int(input("Enter network prefix: ")))
