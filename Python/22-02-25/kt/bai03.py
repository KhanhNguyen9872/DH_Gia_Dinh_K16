class SinhVien:
    def __init__(self, ho_ten: str, ma_sv: str, diem_toan: float, diem_ly: float, diem_hoa: float):
        self.ho_ten = ho_ten
        self.ma_sv = ma_sv
        self.diem_toan = diem_toan
        self.diem_ly = diem_ly
        self.diem_hoa = diem_hoa

    def diem_trung_binh(self) -> float:
        return round((self.diem_toan + self.diem_ly + self.diem_hoa) / 3, 2)

    def xep_loai(self) -> str:
        dtb = self.diem_trung_binh()
        if dtb >= 8.5:
            return "Giỏi"
        elif dtb >= 7.0:
            return "Khá"
        elif dtb >= 5.0:
            return "Trung bình"
        else:
            return "Yếu"

    def thong_tin(self) -> str:
        return (f"Sinh viên: {self.ho_ten} (Mã SV: {self.ma_sv})\n"
                f"Điểm trung bình: {self.diem_trung_binh()} - Xếp loại: {self.xep_loai()}")

# Chạy thử chương trình
if __name__ == "__main__":
    while True:
        try:
            ho_ten = input("Nhập họ tên sinh viên: ")
            ma_sv = input("Nhập mã sinh viên: ")
            diem_toan = float(input("Nhập điểm Toán: "))
            diem_ly = float(input("Nhập điểm Lý: "))
            diem_hoa = float(input("Nhập điểm Hóa: "))
            if 0 <= diem_toan <= 10 and 0 <= diem_ly <= 10 and 0 <= diem_hoa <= 10:
                break
            else:
                print("Điểm phải nằm trong khoảng 0-10. Vui lòng nhập lại!")
        except ValueError:
            print("Vui lòng nhập số hợp lệ!")
    sv = SinhVien(ho_ten, ma_sv, diem_toan, diem_ly, diem_hoa)
    print(sv.thong_tin())
