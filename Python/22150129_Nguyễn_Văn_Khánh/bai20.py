total_money = 0

while 1:
    print("\n")
    print("1. Chọn vé máy bay")
    print("2. Thanh toán")
    print()
    
    choose = input("Chọn: ")

    if (choose == "1"):
        print("\n")
        print("1. Vé máy bay thường: 1000000 VND")
        print("2. Vé may bay cao cấp: 2000000 VND")
        print("3. Vé may bay Premium: 3000000 VND")
        print()
        choose = input("Chọn: ")
        if (choose == "1"):
            total_money = 1000000
        elif (choose == "2"):
            total_money = 2000000
        elif (choose == "3"):
            total_money = 3000000

    elif (choose == "2"):
        print("Tổng tiền vé: {} VND".format(total_money + 100000))
        break