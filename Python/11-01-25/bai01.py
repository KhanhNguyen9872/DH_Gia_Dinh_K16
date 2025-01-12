n = int(input("Mời nhập số: "))
s = 0
if n % 2 == 0:
    for x in range(2, n + 1, 2):
        s = s + x
elif n % 2 != 0:
    for x in range(1, n + 1, 2):
        s = s + x

print("Tổng s =", s)
