"""
Bài 4: Quản lý Tài Khoản Ngân Hàng
Yêu cầu:
1.	Xây dựng lớp TaiKhoan với các thuộc tính:
-	so_tai_khoan, chu_tai_khoan, so_du.
2.	Các phương thức:
-	nap_tien(so_tien): Nạp tiền vào tài khoản.
-	rut_tien(so_tien): Rút tiền nếu đủ số dư.
-	hien_thi_so_du(): Hiển thị số dư tài khoản.
Chương trình chính:
-	Tạo tài khoản, thực hiện nạp/rút tiền và hiển thị số dư.
"""


class TaiKhoan:
    def __init__(self, stk, ctk, sd):
        self.stk = stk
        self.ctk = ctk
        self.sd = sd
    def nap_tien(self, st):
        print("Nạp tiền vào tk: {}".format())
        self.sd += st
    def rut_tien(self, st):
        self.sd -= st
    def hien_thi_so_du(self):
        print("Số dư của tài khoản [{} - {}]: {} VNĐ".format(self.stk, self.ctk, self.sd))

if __name__ == '__main__':
    tk = TaiKhoan("12345678", "Nguyen Van Khanh", 0)
    tk.nap_tien(500)
    tk.rut_tien(300)
    tk.hien_thi_so_du()