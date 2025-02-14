khach_hang = {}

while True:
    print("\n")
    print("1. Nhập khách hàng")
    print("2. Xếp hạng khách hàng")
    print()
    choose = input("Chọn: ")

    if (choose == "1"):
        name = input("Nhập tên khách hàng: ")
        try:
            sotien = int(input("Nhập tiền đã chi tiêu: "))
            khach_hang[name] = sotien
        except ValueError:
            print("Lỗi nhập số")
    elif (choose == "2"):
        xephang = dict(sorted(khach_hang.items(), key=lambda item: item[1], reverse=True))

        print("- Kết quả: ")
        count = 1
        for i in xephang:
            print("{}. Khách hàng {}: {} VND".format(count, i, xephang[i]))
            count += 1
        break