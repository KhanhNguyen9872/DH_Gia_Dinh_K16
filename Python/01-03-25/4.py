from datetime import datetime
import math

class ThucPham:
    def __init__(self, ten, ngay_sx, han_sd, P, F, C_f, E, nhiet_do_luu_tru):
        self.ten = ten
        self.ngay_sx = datetime.strptime(ngay_sx, "%Y-%m-%d")
        self.han_sd = datetime.strptime(han_sd, "%Y-%m-%d")
        self.P = P  # Hàm lượng protein (g)
        self.F = F  # Hàm lượng chất xơ (g)
        self.C_f = C_f  # Hàm lượng vitamin C hoặc vi chất quan trọng (mg)
        self.E = E  # Tổng năng lượng (calo)
        self.nhiet_do_luu_tru = nhiet_do_luu_tru  # °C
    
    def tinh_SAF(self):
        """Tính chỉ số an toàn thực phẩm (SAF)"""
        S_d = (self.han_sd - self.ngay_sx).days
        T_d = (datetime.now() - self.ngay_sx).days
        SAF = ((S_d - T_d) / S_d) * 100 if S_d > 0 else 0
        
        if SAF >= 50:
            trang_thai = "An toàn"
        elif 20 <= SAF < 50:
            trang_thai = "Cần sử dụng sớm"
        else:
            trang_thai = "Nguy hiểm hoặc hết hạn"
        
        return SAF, trang_thai
    
    def tinh_NQI(self):
        """Tính chỉ số giá trị dinh dưỡng (NQI)"""
        NQI = (self.P + self.F + self.C_f) / self.E if self.E > 0 else 0
        
        if NQI >= 0.5:
            chat_luong = "Giá trị dinh dưỡng cao"
        elif 0.3 <= NQI < 0.5:
            chat_luong = "Giá trị dinh dưỡng trung bình"
        else:
            chat_luong = "Giá trị dinh dưỡng thấp"
        
        return NQI, chat_luong
    
    def tinh_T_b(self, T_n=30, T_ref=5, k=0.1):
        """Tính thời gian bảo quản tối ưu dựa trên nhiệt độ lưu trữ"""
        T_b = T_n * math.exp(-k * (self.nhiet_do_luu_tru - T_ref))
        return round(T_b, 2)
    
    def hien_thi_thong_tin(self):
        SAF, trang_thai_SAF = self.tinh_SAF()
        NQI, chat_luong_NQI = self.tinh_NQI()
        T_b = self.tinh_T_b()
        
        print(f"Tên sản phẩm: {self.ten}")
        print(f"Ngày sản xuất: {self.ngay_sx.strftime('%Y-%m-%d')}")
        print(f"Hạn sử dụng: {self.han_sd.strftime('%Y-%m-%d')}")
        print(f"Chỉ số an toàn thực phẩm (SAF): {SAF:.2f}% - {trang_thai_SAF}")
        print(f"Chỉ số giá trị dinh dưỡng (NQI): {NQI:.2f} - {chat_luong_NQI}")
        print(f"Thời gian bảo quản tối ưu: {T_b} ngày")

# Nhập thông tin thực phẩm
def main():
    ten = input("Nhập tên thực phẩm: ")
    ngay_sx = input("Nhập ngày sản xuất (YYYY-MM-DD): ")
    han_sd = input("Nhập hạn sử dụng (YYYY-MM-DD): ")
    P = float(input("Nhập hàm lượng protein (g): "))
    F = float(input("Nhập hàm lượng chất xơ (g): "))
    C_f = float(input("Nhập hàm lượng vitamin C (mg): "))
    E = float(input("Nhập tổng năng lượng (calo): "))
    nhiet_do_luu_tru = float(input("Nhập nhiệt độ lưu trữ (°C): "))
    
    thuc_pham = ThucPham(ten, ngay_sx, han_sd, P, F, C_f, E, nhiet_do_luu_tru)
    thuc_pham.hien_thi_thong_tin()

if __name__ == "__main__":
    main()
