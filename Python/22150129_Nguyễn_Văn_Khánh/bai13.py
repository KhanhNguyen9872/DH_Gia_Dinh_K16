sanpham = {}

while True:
    print("\n")
    print("1. Nhập sản phẩm")
    print("2. Xếp hạng sản phẩm")
    print()
    choose = input("Chọn: ")

    if (choose == "1"):
        name = input("Nhập tên sản phẩm: ")
        try:
            so_luong = int(input("Nhập số lượng sản phẩm: "))
            gia = int(input("Nhập giá sản phẩm: "))
            total = gia * so_luong
            sanpham[name] = total
        except ValueError:
            print("Lỗi nhập số")
    elif (choose == "2"):
        xephang = dict(sorted(sanpham.items(), key=lambda item: item[1]))

        print("- Kết quả: ")
        count = 1
        for i in xephang:
            print("{}. Sản phẩm {}: {} VND".format(count, i, xephang[i]))
            count += 1
        break