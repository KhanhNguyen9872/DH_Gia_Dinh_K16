giave = 100000
name = input("Nhập tên khách hàng: ")

try:
    age = int(input("Nhập tuổi khách hàng: "))
    if (age < 18 or age > 60):
        giave = giave * 0.8
    print("Giá vé: {} VND".format(int(giave)))
except ValueError:
    print("Lỗi nhập số")