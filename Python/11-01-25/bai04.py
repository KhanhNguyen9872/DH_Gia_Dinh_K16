n = int(input("Nhập trọng lượng của bạn: "))

for year in range(1, 16, 1):
    weight = (n + (year - 1)) * 0.125
    print("year: {year} => {weight} kg".format(year=year, weight=weight))
