import math

HANG_SO_HAP_DAN = 6.674e-11  # m³/kg/s²

class HanhTinh:
    def __init__(self, ten, khoi_luong, ban_kinh, khoang_cach_quy_dao):
        self.ten = ten
        self.khoi_luong = khoi_luong
        self.ban_kinh = ban_kinh
        self.khoang_cach_quy_dao = khoang_cach_quy_dao

    def luc_hap_dan(self, hanh_tinh_khac):
        r = abs(self.khoang_cach_quy_dao - hanh_tinh_khac.khoang_cach_quy_dao) 
        if r == 0:
            return 0  
        return (HANG_SO_HAP_DAN * self.khoi_luong * hanh_tinh_khac.khoi_luong) / (r ** 2) 

    def van_toc_quy_dao(self, khoi_luong_ngoi_sao):
        return math.sqrt((HANG_SO_HAP_DAN * khoi_luong_ngoi_sao) / self.khoang_cach_quy_dao)

    def hien_thi_thong_tin(self, khoi_luong_ngoi_sao):
        van_toc = self.van_toc_quy_dao(khoi_luong_ngoi_sao)
        print(f"\n - Hành tinh: {self.ten}")
        print(f"+ Khối lượng: {self.khoi_luong:.2e} kg")
        print(f"+ Bán kính: {self.ban_kinh} m")
        print(f"+ Khoảng cách đến Mặt Trời: {self.khoang_cach_quy_dao:.1f} m")
        print(f"+ Vận tốc quỹ đạo: {van_toc:.2f} m/s")

if __name__ == '__main__':
    khoi_luong_mat_troi = 1.989e+30 
    trai_dat = HanhTinh("Trái Đất", 5.972e+24, 6371000, 149600000000.0)
    sao_hoa = HanhTinh("Sao Hỏa", 6.39e+23, 3389000, 227900000000.0)

    trai_dat.hien_thi_thong_tin(khoi_luong_mat_troi)
    sao_hoa.hien_thi_thong_tin(khoi_luong_mat_troi)

    luc_hap_dan = trai_dat.luc_hap_dan(sao_hoa)
    print(f"\n> Lực hấp dẫn giữa 2 hành tinh: {luc_hap_dan:.2e} N")