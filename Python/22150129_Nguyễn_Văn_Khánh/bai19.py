try:
    arr = []
    n = int(input("Nhập kích thước nhiệt độ cần nhập: "))
    for i in range(n):
        arr.append(int(input("Nhập arr[{}]: ".format(i))))
    
    trung_binh = sum(arr) / len(arr)
    cao_nhat = max(arr)
    thap_nhat = min(arr)
    vuot_qua_30 = len([x for x in arr if x > 30])

    print("Nhiệt độ trung bình: {}*C, Ngày cao nhất: {}*C, Ngày thấp nhất: {}*C, Thời gian vượt quá 30*C: {} ngày".format(
        trung_binh,
        cao_nhat, 
        thap_nhat, 
        vuot_qua_30
    ))
except ValueError:
    print("Lỗi nhập số")