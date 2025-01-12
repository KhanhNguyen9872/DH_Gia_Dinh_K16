try:
    twinkies = int(input("Nhập số Twinkies: "))
    if (twinkies < 100 or twinkies > 500):
        print("tin nhắn Quá ít hoặc quá nhiều")
except ValueError:
    print("Lỗi nhập")