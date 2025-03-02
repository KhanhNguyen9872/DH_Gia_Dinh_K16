w1 = 0.8  # tuổi
w2 = 1.5  # hút thuốc
w3 = 1.2  # môi trường sống
w4 = 1.8  # tiền sử bệnh
w5 = 2.0  # triệu chứng

class HeThong:
    def __init__(self, A, S, E, H, F):
        self.R = 0
        self.A = A
        self.S = S 
        self.E = E 
        self.H = H
        self.F = F
    
    def tinh_nguy_co(self):
        self.R = (w1 * self.A) + (w2 * self.S) + (w3 * self.E) + (w4 * self.H) + (w5 * self.F)  # Tổng điểm nguy cơ mắc bệnh phổi
        return self.R

    def danh_gia_nguy_co(self):
        if self.R < 10:
            return "Nguy cơ thấp"
        elif 10 <= self.R < 20:
            return "Nguy cơ trung bình"
        else:
            return "Nguy cơ cao"

    def khuyen_nghi(self):
        if self.R < 10:
            return "Duy trì lối sống lành mạnh và theo dõi sức khỏe định kỳ!"
        elif self.R < 20:
            return "Cần cải thiện lối sống và theo dõi sức khỏe định kỳ!"
        return "Nguy cơ cao, cần kiểm tra y tế ngay lập tức!"

try:
    tuoi = int(input("Nhập tuổi của bạn: "))
    if (tuoi < 1 or tuoi > 100):
        print("Số tuổi không hợp lệ!")
        exit()
    A = min(tuoi / 10, 10)
    
    print("Chọn mức độ hút thuốc:")
    print("0: Không hút")
    print("1: Hút ít")
    print("2: Hút nhiều")
    lua_chon = input("Nhập lựa chọn (0, 1, 2): ")
    if lua_chon == "0":
        S = 0
    elif lua_chon == "1":
        S = 5
    elif lua_chon == "2":
        S = 10
    else:
        print("Lựa chọn không hợp lệ")
        exit()

    E = float(input("Nhập điểm môi trường sống (0-10): "))
    if (E < 0 or E > 10):
        print("Số điểm môi trường sống không hợp lệ!")
        exit()

    tien_su = input("Bạn có tiền sử bệnh hô hấp không? (y/n): ")
    if tien_su.lower() == 'y':
        H = 10
    else:
        H = 0

    F = float(input("Nhập điểm triệu chứng hiện tại (0-10): "))
    if (F < 0 or F > 10):
        print("Số điểm triệu chứng hiện tại không hợp lệ!")
        exit()

except Exception as e:
    print("Lỗi nhập:", e)

he_thong = HeThong(A, S, E, H, F)
print("Điểm nguy cơ (R):", round(he_thong.tinh_nguy_co(), 2))
print("Đánh giá:", he_thong.danh_gia_nguy_co())
print("Khuyến nghị:", he_thong.khuyen_nghi())
