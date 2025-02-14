count = 0

real_pin = "2345"
while count < 3:
    count = count + 1
    try:
        pin = input("Nhập mã PIN: ")
        if (pin == real_pin):
            print("Mã PIN đúng")
            break
        elif (count == 3):
            print("Thẻ bị khóa")
        else:
            print("Mã PIN sai")
    except ValueError:
        print("Mã PIN không hợp lệ")
    
    

