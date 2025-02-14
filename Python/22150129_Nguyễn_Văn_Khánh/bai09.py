luong = 0
try:
    so_gio = int(input("Số giờ làm việc: "))
    luong_theo_gio = int(input("Lương theo giờ: "))

    if (so_gio <= 40):
        luong = luong_theo_gio * so_gio
        print("Tiền lương: {} VND ({} VND cho {} giờ)".format(luong, luong, so_gio))
    else:
        luong_one = luong_theo_gio * 40
        luong_two = (luong_theo_gio * (so_gio - 40)) * 2
        luong = luong_one + luong_two
        print("Tiền lượng: {} VND ({} VND cho {} giờ và {} VND cho {} giờ làm thêm)".format(
            luong,
            luong_one,
            40,
            luong_two,
            so_gio - 40
        ))
except ValueError:
    print("Lỗi nhập số")