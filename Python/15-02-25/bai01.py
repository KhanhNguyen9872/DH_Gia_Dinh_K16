def calc_roi(doanh_thu, chi_phi):
    return (doanh_thu - chi_phi) / chi_phi

def du_doan(roi):
    if roi >= 0.75:
        print("Đầu tư")
    else:
        print("Không đầu tư")

try:
    du_doan(calc_roi(int(input("Nhập doanh thu: ")), int(input("Nhập chi phí: "))))
except ValueError as e: 
    print("Lỗi nhập")
