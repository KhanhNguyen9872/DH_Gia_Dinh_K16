def doi_xung(string):
    return string == string[::-1]

while 1:
    chuoi = input("Nhập chuỗi: ")
    if not chuoi:
        print("Cảm ơn")
        break

    if (doi_xung(chuoi)):
        print("Chuỗi đối xứng")
    else:
        print("Chuỗi không đối xứng")
    
