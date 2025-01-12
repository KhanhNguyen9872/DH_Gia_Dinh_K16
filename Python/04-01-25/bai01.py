import math

try:
    bankinh = float(input("Nhập bán kính hình tròn: "))
    cv=2*math.pi*bankinh
    dt=math.pi*bankinh*bankinh
    print("Hình tròn bán kính {0} có chu vi là {1} và diện tích {2}".format(bankinh, cv, dt))
except ValueError: 
    print("Lỗi nhập bán kính hình tròn")