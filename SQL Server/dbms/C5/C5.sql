-- 221402 - KhanhNguyen9872

----- DẠNG 1: CẤP PHÁT QUYỀN -----

-- bai 1
/*
	Cấp quyền SELECT cho tất cả các cột trong bảng
 khachhang cho người dùng user1.
*/

GRANT SELECT ON khachhang TO user1

-- bai 2
/*
	Cấp quyền INSERT và UPDATE cho bảng hoadon
 cho nhóm người dùng sales_team.
*/

GRANT INSERT, UPDATE ON hoadon TO sales_team

-- bai 3
/*
	Cấp quyền EXECUTE cho thủ tục lưu trữ tinh doanh thu
 cho người dùng manager.
*/

GRANT EXECUTE ON tinh_doanh_thu TO manager

-- bai 4
/*
	Cấp quyền tạo bảng cho người dùng developer1.
*/

GRANT ALTER TO developer1

-- bai 5
/*
	Cấp quyền truy cập vào toàn bộ cơ sở dữ liệu
 QLBH cho người dùng admin_user.
*/

GRANT CONNECT TO admin_user
GRANT CONTROL ON QLBH TO admin_user

-- bai 6
/*
	Cấp quyền SELECT cho các cột makh, tenkh,
 diachi, sdt trong bảng khachhang cho người
 dùng report_viewer.
*/

GRANT SELECT (makh, tenkh, diachi, sdt) ON khachhang TO report_viewer

-- bai 7
/*
	Cấp quyền SELECT và UPDATE cho tất cả các cột
 trong bảng mathang cho người dùng inventory_manager.
*/

GRANT SELECT, UPDATE ON mathang TO inventory_manager

-- bai 8
/*
	Cấp quyền REFERENCES cho cột mahd trong bảng
 hoadon cho nhóm người dùng order_management.
*/

GRANT REFERENCES (mahd) ON hoadon TO order_management
