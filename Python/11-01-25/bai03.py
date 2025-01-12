n = int(input("Moi nhap so: "))
s = 0
if n % 2 == 0:
    for x in range(2, n + 1, 2):
        if x == 10:  # Bỏ qua 10 khi là số chẳn
            continue
        s = s + x
elif n % 2 != 0:
    for x in range(1, n + 1, 2):
        if x == 11:  # Bỏ qua 11 khi là số lẻ
            continue
        s = s + x
print("Tong s =", s)
