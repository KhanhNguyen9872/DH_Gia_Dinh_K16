def getDay(month, year):
    if month < 1 or month > 12:
        return -1
    elif month == 2:
        if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0):
            return 29
        else:
            return 28
    elif month in [1, 3, 5, 7, 8, 10, 12]:
        return 31
    elif month in [4, 6, 9, 11]:
        return 30

try:
    day, month, year = map(int, input("Nhập ngày/tháng/năm (dd/mm/yyyy): ").split("/"))

    if day < 1 or day > getDay(month, year):
        print("Ngày không hợp lệ.")
    else:
        dayOnMonth = getDay(month, year)
        if day == dayOnMonth:
            if month == 12:
                newDay = 1
                newMonth = 1
                newYear = year + 1
            else:
                newDay = 1
                newMonth = month + 1
                newYear = year
        else:
            newDay = day + 1
            newMonth = month
            newYear = year

        print("Ngày kế tiếp là: {}/{}/{}".format(newDay, newMonth, newYear))
except ValueError:
    print("Lỗi nhập.")