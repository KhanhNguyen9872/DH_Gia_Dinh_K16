total_money = 0

while 1:
    print("\n\n")
    print("1. Chọn món")
    print("2. Thanh toán")
    print()
    
    choose = input("Chọn: ")

    if (choose == "1"):
        print("\n")
        print("Món 1: Phở - 50.000 VND")
        print("Món 2: Bún Chả - 60.000 VND")
        print("> Chọn món để mua hoặc để trống để thoát ra ngoài")
        choose = input("Chọn: ")
        if (choose.lower() == "món 1"):
            try:
                number = int(input("Nhập số lượng: "))
                total_money += 50000 * number
            except ValueError:
                print("Lỗi nhập số")
        elif (choose.lower() == "món 2"):
            try:
                number = int(input("Nhập số lượng: "))
                total_money += 60000 * number
            except ValueError:
                print("Lỗi nhập số")
    elif (choose == "2"):
        print("Tổng tiền thanh toán: {} VND".format(total_money))
        break