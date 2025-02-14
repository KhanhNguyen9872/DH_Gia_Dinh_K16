money = 0
try:
    n = int(input("Nhập số tiền: "))
    if (n > 1000000):
        money = n * 0.9
    else:
        money = n
    print("Số tiền thanh toán: " + str(round(money, 0)) + " VND " + ("(Giảm 10%)" if n > 1000000 else ""))
except ValueError:
    print("Lỗi nhập số")