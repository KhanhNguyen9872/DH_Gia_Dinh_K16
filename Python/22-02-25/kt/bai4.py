class TaiKhoanNganHang:
    def __init__(self, so_tai_khoan: str, chu_tai_khoan: str, so_du: float) -> None:
        self.so_tai_khoan = so_tai_khoan
        self.chu_tai_khoan = chu_tai_khoan
        self.so_du = so_du
        return
    
    def nap_tien(self, so_tien: float) -> None:

        return

    def rut_tien(self, so_tien: float) -> None:
        if (so_tien <= self.so_du):
            self.so_du -= so_tien
            print("Đã rút {} VNĐ (Số dư còn lại: {} VNĐ)".format(so_tien, self.so_du))
        else:
            print("Số dư không đủ để rút {} VNĐ (Số dư hiện tại: {} VNĐ)".format(so_tien, self.so_du))
        return

    def kiem_tra_so_du(self) -> str:

        return


if __name__ == '__main__':
    tk = TaiKhoanNganHang()