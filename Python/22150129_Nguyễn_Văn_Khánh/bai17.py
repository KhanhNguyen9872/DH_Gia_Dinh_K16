try:
    chi_so = int(input("Chỉ số tín dụng: "))
    if (chi_so <= 300):
        print("Nhóm Mới")
    elif (301 <= chi_so <= 600):
        print("Nhóm Xấu")
    elif (chi_so > 600):
        print("Nhóm Tốt")
    else:
        print("Không hợp lệ")
except ValueError:
    print("Lỗi nhập số")