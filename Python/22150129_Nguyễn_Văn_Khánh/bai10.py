try:
    muc_tieu = int(input("Mục tiêu: "))
    tiet_kiem = int(input("Tiết kiệm mỗi ngày: "))

    ngay = muc_tieu / tiet_kiem

    if (ngay % 1 != 0):
        ngay = ngay + 1
    
    print("Số ngày cần tiết kiệm: {} ngày".format(int(ngay)))
except ValueError:
    print("Lỗi nhập số")