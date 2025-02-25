class HinhChuNhat:
    def __init__(self, chieu_dai: float = 1.0, chieu_rong: float = 1.0):
        self.chieu_dai = chieu_dai
        self.chieu_rong = chieu_rong

    def dien_tich(self) -> float:
        return self.chieu_dai * self.chieu_rong

    def chu_vi(self) -> float:
        return 2 * (self.chieu_dai + self.chieu_rong)

    def thong_tin(self) -> str:
        return (f"Hình chữ nhật có chiều dài: {self.chieu_dai}, "
                f"chiều rộng: {self.chieu_rong}, "
                f"diện tích: {self.dien_tich()}, "
                f"chu vi: {self.chu_vi()}")

# Chạy thử chương trình
if __name__ == "__main__":
    while True:
        try:
            chieu_dai = float(input("Nhập chiều dài: "))
            chieu_rong = float(input("Nhập chiều rộng: "))
            if chieu_dai > 0 and chieu_rong > 0:
                break
            else:
                print("Chiều dài và chiều rộng phải là số dương. Vui lòng nhập lại!")
        except ValueError:
            print("Vui lòng nhập số hợp lệ!")
    
    hcn = HinhChuNhat(chieu_dai, chieu_rong)
    print(hcn.thong_tin())

