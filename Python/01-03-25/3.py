import numpy as np

class HeThong:
    def __init__(self, ngay_giao_dich, gia_co_phieu):
        self.ngay_giao_dich = np.array(ngay_giao_dich)
        self.gia_co_phieu = np.array(gia_co_phieu)
        self.ngay_tiep_theo = 0
        self.gia_co_phieu_tuong_lai = 0
        self.a = 0
        self.b = 0
        return

    def tinh_toan(self):
        so_ngay = len(self.ngay_giao_dich)

        # [ ngày giao dịch ] * [ giá cổ phiếu ] = t_i * P_i
        self.a = (so_ngay * np.sum(self.ngay_giao_dich * self.gia_co_phieu) - np.sum(self.ngay_giao_dich) * np.sum(self.gia_co_phieu)) / \
                (so_ngay * np.sum(self.ngay_giao_dich ** 2) - (np.sum(self.ngay_giao_dich)) ** 2)
        
        self.b = (np.sum(self.gia_co_phieu) - self.a * np.sum(self.ngay_giao_dich)) / so_ngay

        self.ngay_tiep_theo = self.ngay_giao_dich[-1] + 1
        self.gia_co_phieu_ngay_tiep_theo = self.a * self.ngay_tiep_theo + self.b
        return "[a: {}, b: {}]\nGiá cổ phiếu cho ngày {} là: {}".format(self.a, self.b, self.ngay_tiep_theo, self.gia_co_phieu_ngay_tiep_theo)

    def du_doan(self):
        if (self.a == 0 and self.b == 0):
            return "Vui lòng tính toán trước khi thực hiện"

        if self.a > 0:
            return "Xu hướng tăng -> Có thể mua vào"
        elif self.a < 0:
            return "Xu hướng giảm -> Cân nhắc bán ra"
        
        return "Giá ít biến động -> Cần theo dõi thêm"

if __name__ == '__main__':
    ngay_giao_dich = [] # t
    gia_co_phieu = [] # P

    while 1:
        try:
            ngay = input("\nNhập ngày giao dịch: ")
            if (not ngay):
                break
            
            ngay = int(ngay)
            if (ngay < 1 or ngay > 31):
                print("Ngày không hợp lệ")
                continue
            
            gia = input("Nhập giá cổ phiếu cho ngày {}: ".format(ngay))
            if (not gia):
                print("Giá cổ phiếu không hợp lệ")
                continue

            gia = int(gia)

            ngay_giao_dich.append(ngay)
            gia_co_phieu.append(gia)
        except ValueError as e:
            print("Lỗi nhập:", str(e))

    he_thong = HeThong(ngay_giao_dich, gia_co_phieu)
    print("\n>>Kết quả: ", end = '')
    print(he_thong.tinh_toan())
    print(he_thong.du_doan())
