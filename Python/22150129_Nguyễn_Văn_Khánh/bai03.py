import random

number = random.randint(1, 100)

while True:
    try:
        n = int(input("Nhập từ 1 -> 100: "))
        if (n > 0 and n < 101):
            if n == number:
                print("Đúng")
                break
            elif (n < number):
                print("Quá thấp")
            elif (n > number):
                print("Quá cao")
        else:
            print("Vui lòng nhập trong khoảng 1 - 100")
    except ValueError:
        print("Lỗi nhập")