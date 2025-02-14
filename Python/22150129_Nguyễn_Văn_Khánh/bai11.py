
try:
    diem = float(input("Điểm sinh viên: "))
    if (diem >= 8.0 and diem <= 10.0):
        print("Loại Giỏi")
    elif (diem >= 6.5 and diem < 8.0):
        print("Loại Khá")
    elif (diem >= 5.0 and diem < 6.5):
        print("Loại Trung bình")
    elif (diem >= 0.0 and diem < 5.0):
        print("Loại Yếu")
    else:
        print("Điểm không hợp lệ")
except ValueError:
    print("Lỗi nhập số")