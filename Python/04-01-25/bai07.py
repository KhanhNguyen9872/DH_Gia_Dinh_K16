ones = {
    0: "không",
    1: "một",
    2: "hai", 
    3: "ba", 
    4: "bốn", 
    5: "năm", 
    6: "sáu", 
    7: "bảy", 
    8: "tám", 
    9: "chín"
}

try:
    n = int(input("Nhập n: "))

    if n < -99 or n > 99:
        print("Tối đa 2 chữ số")
    else:
        if n < 0:
            print("Âm", end=" ")
            n = abs(n)
        
        n = str(n)
        if len(n) == 1:
            print(ones[int(n)], end=" ")
        elif (len(n) == 2):
            if n[0] == '1':
                print("mười", end=" ")
            elif n[0] != '0':
                print(ones[int(n[0])] + " mươi", end=" ")

            if n[1] == '0':
                pass
            else:
                if n[1] == '1' and n[0] != '1':
                    print("mốt", end=" ")
                elif n[1] == '5':
                    print("lăm", end=" ")
                else:
                    print(ones[int(n[1])], end=" ")

        print()
except ValueError as e:
    print("Lỗi nhập:", e)
