n = 0

try:
    n = int(input("Số giờ làm việc: "))
except ValueError:
    print("Lỗi nhập")

luong_theo_gio = 100000
money = 0

if (n <= 40):
    money = n * luong_theo_gio
    s = "({} VND cho {} giờ)".format(money, n)
else:
    gio_them = n - 40
    money_one = (40 * luong_theo_gio)
    money_two = (gio_them * luong_theo_gio * 2)
    money = money_one + money_two
    s = "({} VND cho {} giờ và {} VND cho {} giờ làm thêm)".format(money_one, 40, money_two, n - 40)

print("Tiền lương là: " + str(money) + " VND " + s)