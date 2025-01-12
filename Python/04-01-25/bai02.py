try:
    toan = float(input("Nhập điểm toán: "))
    ly = float(input("Nhập điểm lý: "))
    hoa = float(input("Nhập điểm hóa: "))

    trungbinh = (toan + ly + hoa) / 3
    print("Điểm trung bình 3 môn là:", round(trungbinh, 2))
except ValueError as e:
    print("Lỗi nhập điểm: ", e)