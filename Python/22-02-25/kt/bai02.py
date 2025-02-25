"""
Bài 2: Quản lý Sách trong Thư viện
Yêu cầu:
1.	Xây dựng lớp Sach với các thuộc tính:
o	ten_sach, tac_gia, nam_xuat_ban, gia_ban.
2.	Các phương thức:
o	thong_tin(): Trả về thông tin sách dưới dạng chuỗi.
Chương trình chính:
-	Nhập thông tin sách từ bàn phím và hiển thị thông tin sách.
"""


class Sach:
    def __init__(self, ten_sach: str, tac_gia: str, nam_xuat_ban: int, gia_ban: int = 10000) -> None:
        nam_hien_tai = 2025

        if (not ten_sach):
            raise ValueError("Tên sách không được để trống")
        
        if not tac_gia:
            raise ValueError("Tác giả không được để trống")

        if not nam_xuat_ban:
            raise ValueError("Năm xuất bản không được để trống")
        
        try:
            nam_xuat_ban = int(nam_xuat_ban)
        except ValueError:
            raise ValueError("Năm xuất bản phải là số")
        
        try:
            gia_ban = int(gia_ban)
        except ValueError:
            raise ValueError("Giá bán phải là số")

        if (nam_xuat_ban < 1000):
            raise ValueError("Năm xuất bản không được nhỏ hơn năm 1000")
        elif (nam_xuat_ban > nam_hien_tai):
            raise ValueError("Năm xuất bản không được lớn hơn năm hiện tại ({})".format(nam_hien_tai))
        
        if (gia_ban < 0):
            raise ValueError("Giá bán không phải là số âm")
        
        self.ten_sach = ten_sach
        self.tac_gia = tac_gia
        self.nam_xuat_ban = nam_xuat_ban
        self.gia_ban = gia_ban
        return

    def thong_tin(self) -> str:
        return (
            "> Tên sách: {}\n".format(self.ten_sach) +
            "> Tác giả: {}\n".format(self.tac_gia) +
            "> Năm xuất bản: {}\n".format(self.nam_xuat_ban) +
            "> Giá bán: {}\n".format(self.gia_ban)
        )

if __name__ == '__main__':
    while True:
        ten_sach = input("Nhập tên sách: ")
        tac_gia = input("Nhập tác giả: ")
        nam_xuat_ban = input("Năm xuất bản: ")
        gia_ban = input("Giá bán: ")

        try:
            sach = Sach(ten_sach, tac_gia, nam_xuat_ban, gia_ban)
            print(sach.thong_tin())
            break
        except Exception as e:
            print("Lỗi: {}\n".format(str(e)))