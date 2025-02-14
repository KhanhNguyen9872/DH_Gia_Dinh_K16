so_du = 5000000
password = "1234"

try:
    mat_khau = input("Nhập mật khẩu: ")
    if (password == mat_khau):
        so_tien = int(input("Nhập số tiền cần rút: "))
        if (so_du >= so_tien):
            so_du = so_du - so_tien
            print("Thực hiện giao dịch thành công, số dư tài khoản: {} VND".format(so_du))
    else:
        print("Mật khẩu sai")
except ValueError:
    print("Lỗi nhập số")