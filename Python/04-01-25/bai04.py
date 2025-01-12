try:
    month = int(input("Nhập tháng: "))

    if month < 1 or month > 12:
        print("Tháng không hợp lệ.")
    elif month == 2:
        year = int(input("Nhập năm: "))
        if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0):
            print("Tháng {} có 29 ngày".format(month))
        else:
            print("Tháng {} có 28 ngày".format(month))
    elif month in [1, 3, 5, 7, 8, 10, 12]:
        print("Tháng {} có 31 ngày".format(month))
    elif month in [4, 6, 9, 11]:
        print("Tháng {} có 30 ngày".format(month))
except ValueError as e:
    print("Lỗi nhập: ", e)
