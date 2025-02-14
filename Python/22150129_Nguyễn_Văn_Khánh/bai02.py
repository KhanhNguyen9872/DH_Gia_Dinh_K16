import re

password = input("Nhập mật khẩu: ")

if (len(password) < 8) :
    print("Mật khẩu yếu")
elif not re.search(r'[a-z]', password):
    print("Mật khẩu yếu")
elif not re.search(r'[A-Z]', password):
    print("Mật khẩu yếu")
elif not re.search(r'\d', password):
    print("Mật khẩu yếu")
elif not re.search(r'[!@#$%^&*(),.?":{}|<>]', password):
    print("Mật khẩu yếu")
else:
    print("Mật khẩu mạnh")