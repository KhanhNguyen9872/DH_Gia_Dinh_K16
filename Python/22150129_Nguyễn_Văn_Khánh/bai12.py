try:
    money = 0
    tieu_thu = int(input("Tiêu thụ điện: "))
    if (tieu_thu < 0):
        print("Tiêu thụ không hợp lệ")
        exit()

    if (tieu_thu >= 0 and tieu_thu <= 50):
        money = tieu_thu * 1500
    elif (tieu_thu >= 51 and tieu_thu <= 100):
        money = tieu_thu * 2000
    elif (tieu_thu > 100):
        money = tieu_thu * 2500
    print("Số tiền thanh toán: {} VND".format(money))
except ValueError:
    print("Lỗi nhập số")