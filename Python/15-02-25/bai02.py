def calc_bmi(can_nang, chieu_cao):
    return can_nang / (chieu_cao * chieu_cao)

def phan_loai(bmi):
    pl = "Gầy"
    b = "Thấp"
    if (bmi >= 18.5 and bmi <= 24.9):
        pl = "Bình thường"
        b = "Trung bình"
    elif (bmi >= 25.0 and bmi <= 29.0):
        pl = "Hơi béo"
        b = "Cao"
    

    print("Phân loại: {}".format(pl))
    print("Nguy cơ phất triển bệnh: {}".format(b))

try:
    can_nang = float(input("Nhập cân nặng (kg): "))
    chieu_cao = float(input("Chiều cao (m): "))

    bmi = calc_bmi(can_nang, chieu_cao)
    print(bmi)
    phan_loai(bmi)
except ValueError as e:
    print("Lỗi nhập:", e)