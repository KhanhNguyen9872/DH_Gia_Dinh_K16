-- 221402 - KhanhNguyen9872

use master;
ALTER DATABASE QLGH SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE QLGH SET ONLINE;

DROP DATABASE QLGH;


CREATE DATABASE QLGH;
GO
use QLGH;
GO

create table khachhang (
	makhachhang nvarchar(255) primary key,
	tencongty nvarchar(255),
	tengiaodich nvarchar(255),
	diachi nvarchar(255),
	email nvarchar(255),
	dienthoai nvarchar(255),
	fax nvarchar(255)
);

create table dondathang (
	sohoadon nvarchar(255) primary key,
	makhachhang nvarchar(255),
	manhanvien nvarchar(255),
	ngaydathang nvarchar(255),
	ngaygiaohang nvarchar(255),
	ngaychuyenhang nvarchar(255),
	noigiaohang nvarchar(255),
	foreign key (makhachhang) references khachhang(makhachhang)
);

create table nhanvien (
	manhanvien nvarchar(255) primary key,
	ho nvarchar(255),
	ten nvarchar(255),
	ngaysinh date,
	ngaylamviec date,
	diachi nvarchar(255),
	dienthoai nvarchar(255),
	luongcoban int,
	phucap int
)

create table nhacungcap (
	macongty nvarchar(255) primary key,
	tencongty nvarchar(255),
	tengiaodich nvarchar(255),
	diachi nvarchar(255),
	dienthoai nvarchar(255),
	fax nvarchar(255),
	email nvarchar(255)
)

create table loaihang (
	maloaihang nvarchar(255) primary key,
	tenloaihang nvarchar(255)
)

create table mathang (
	mahang nvarchar(255) primary key,
	tenhang nvarchar(255),
	macongty nvarchar(255),
	maloaihang nvarchar(255),
	soluong int,
	donvitinh nvarchar(255),
	giahang int,
	foreign key (macongty) references nhacungcap(macongty),
	foreign key (maloaihang) references loaihang(maloaihang)
)

create table chitietdathang (
	sohoadon nvarchar(255),
	mahang nvarchar(255),
	giaban int,
	soluong int, 
	mucgiamgia int,
	foreign key (sohoadon) references dondathang(sohoadon),
	foreign key (mahang) references mathang(mahang)
)

delete from nhacungcap
insert into nhacungcap 
	(macongty, tencongty, tengiaodich, diachi, dienthoai, fax, email)
values
	('CT001', N'Công ty Vinamilk', N'VINAMILK', N'Quan Go Vap', '0123456789', 'fax011', 'CT001@gmail.com'),
	('CT002', N'Công ty Samsung', N'Nguyễn Văn Khánh', N'Quan 3', '0123456789', 'fax012', 'CT002@gmail.com'),
	('CT003', N'Công ty Viettel', N'VIETTEL', N'Quan 1', '0121212121', 'fax013', 'CT003@gmail.com'),
	('CT004', N'Công ty Mobifone', N'MOBIFONE', N'Quan 7', '03132523114', 'fax014', 'CT004@gmail.com'),
	('CT005', N'Công ty Oppo', N'OPPO', N'Quan 11', '0933473854', 'fax015', 'CT005@gmail.com'),
	('CT006', N'Công ty Việt Tiến', N'Việt Tiến', N'Quan 4', '0933473654', 'fax016', 'CT006@gmail.com'),
	('CT007', N'Công ty Anh Khánh', N'Nguyễn Văn Khánh', N'Quan 9', '0112233445', 'fax017', 'CT007@gmail.com')

delete from loaihang
insert into loaihang
	(maloaihang, tenloaihang)
values
	('LH001', N'Thực phẩm'),
	('LH002', N'Điện tử'),
	('LH003', N'Gia dụng'),
	('LH004', N'Hóa chất')

delete from mathang
insert into mathang
	(mahang, tenhang, macongty, maloaihang, soluong, donvitinh, giahang)
values
	('H001', N'Sữa hộp XYZ', 'CT001', 'LH001', 150, N'Hũ', 10000),
	('H002', N'Sữa đóng hộp', 'CT001', 'LH001', 140, N'Hộp', 12000),
	('H003', N'Sữa chua', 'CT001', 'LH001', 100, N'Lon', 22000),
	('H004', N'Samsung Galaxy S22 Ultra', 'CT002', 'LH002', 10, N'Cái', 25000000),
	('H005', N'OPPO Reno 11 5G', 'CT005', 'LH002', 5, N'Cái', 9000000),
	('H006', N'Phân hóa học', 'CT006', 'LH004', 35, N'Lon', 50000),
	('H007', N'Sim Viettel', 'CT003', 'LH002', 0, N'Cái', 50000)

delete from khachhang
insert into khachhang
	(makhachhang, tencongty, tengiaodich, diachi, email, dienthoai, fax)
values
	('KH001', N'Công ty Anh Khánh', N'Nguyễn Văn Khánh', N'Bình Thuận', 'email@gmail.com', '012345678', 'fax0x0'),
	('KH002', N'Công ty THHH Một Thành Viên Ba Cảng', N'Ba Cảng', N'TPHCM', 'email1@gmail.com', '012345679', 'fax0x1'),
	('KH003', N'Công ty Cổ phần Dược phẩm Imex', N'Imex', N'Đà Nẵng', 'email3@gmail.com', '012345643', 'fax0x2'),
	('KH004', N'Công ty VNPT', N'VNPT', N'Hà Nội', 'email4@gmail.com', '012345672', 'fax0x3'),
	('KH005', N'Công ty Cổ phần Xây dựng', N'CTCPXD', N'Sóc Trăng', 'email5@gmail.com', '012345671', 'fax0x4')

delete from nhanvien
insert into nhanvien
	(manhanvien, ho, ten, ngaysinh, ngaylamviec, diachi, dienthoai, luongcoban, phucap)
values
	('NV001', N'Nguyễn', N'Khánh', '02/07/2004', '02/07/2015', N'Bình Thuận', '0937927513', 50000000, 0),
	('NV002', N'Trần Lam', N'Khánh', '11/03/2001', '02/05/2020', N'Cao Bằng', '0121212121', 30000000, 0),
	('NV003', N'Nguyễn Thị', N'Chi', '01/01/2002', '02/13/2020', N'Long An', '0932313123', 40000000, 0),
	('NV004', N'Trần Đình', N'Văn', '12/31/2003', '02/11/2020', N'TPHCM', '0954384243', 20000000, 0),
	('NV005', N'Trần Thanh', N'Hoa', '02/07/1965', '03/11/1982', N'TPHCM', '0954381243', 20000000, 0)

delete from dondathang
insert into dondathang
	(sohoadon, makhachhang, manhanvien, ngaydathang, ngaygiaohang, ngaychuyenhang, noigiaohang)
values
	('HD001', 'KH001', 'NV001', '03/03/2022', '03/07/2022', '03/04/2022', N'Bình Thuận'),
	('HD002', 'KH002', 'NV002', '02/04/2022', '02/09/2022', '02/04/2022', N'Hà Nội'),
	('HD003', 'KH002', 'NV003', '02/11/2022', '02/15/2022', '02/12/2022', N'Cà Mau'),
	('HD004', 'KH001', 'NV004', '01/01/2022', '01/04/2022', '01/02/2022', N'Sóc Trăng'),
	('HD005', 'KH003', 'NV001', '12/02/2021', '12/07/2021', '12/03/2021', N'Ninh Thuận'),
	('HD006', 'KH001', 'NV001', '05/02/2022', '05/07/2022', '05/03/2022', N'Bình Thuận'),
	('HD007', 'KH005', 'NV002', '07/03/2022', '07/12/2022', '07/03/2022', N'TPHCM'),
	('HD008', 'KH001', 'NV002', '07/15/2022', '12/20/2022', '12/16/2022', N'Tây Ninh'),
	('HD009', 'KH003', 'NV004', '12/02/2022', '12/07/2022', '12/03/2022', N'Long An'),
	('HD010', 'KH001', 'NV004', '09/11/2022', '09/14/2022', '09/11/2022', N'Đà Nẵng'),
	('HD011', 'KH002', 'NV001', '09/11/2019', '09/14/2019', NULL, NULL),
	('HD012', 'KH005', 'NV001', '09/11/2017', '09/14/2017', NULL, NULL)

delete from chitietdathang
insert into chitietdathang
	(sohoadon, mahang, giaban, soluong, mucgiamgia)
values
	('HD001', 'H001', 12000, 50, 0),
	('HD002', 'H001', 13000, 9, 0),
	('HD003', 'H001', 11000, 8, 0),
	('HD004', 'H001', 15000, 7, 0),
	('HD005', 'H001', 20000, 11, 0),
	('HD001', 'H002', 15000, 40, 0),
	('HD001', 'H003', 25000, 20, 0),
	('HD006', 'H004', 28000000, 1, 5),
	('HD007', 'H005', 12000000, 1, 10),
	('HD008', 'H003', 25000, 15, 0),
	('HD009', 'H005', 12000000, 2, 10),
	('HD010', 'H004', 28000000, 1, 5),
	('HD011', 'H001', 15000, 3, 0),
	('HD012', 'H001', 15000, 4, 0)

go
CREATE TRIGGER trigger_dondathang
ON dondathang
INSTEAD OF DELETE
AS
begin
     delete from chitietdathang
	 where (
		chitietdathang.sohoadon IN (
			select sohoadon
			from DELETED
		)
	 )
end
go

--				Dạng 6: Bài tập tổng hợp				--

------		Sử dụng câu lệnh SELECT để viết các yêu cầu truy vấn dữ liệu sau đây			------

-- bai 01
/*
	Cho biết danh sách các đối tác cung cấp hàng.
*/

select *
from nhacungcap


-- BAI 02
/*
	Mã hàng, tên hàng và số lượng của các mặt
 hàng hiện có trong công ty.
*/

select macongty, mahang, tenhang, soluong
from mathang
order by macongty


-- bai 03
/*
	Họ tên và địa chỉ và năm bắt đầu làm việc của
 các nhân viên trong công ty.
*/

select ho + ' ' + ten as hoten, diachi, year(ngaylamviec) as nam
from nhanvien


-- bai 04
/* 
	Địa chỉ và điện thoại của nhà cung cấp có tên
 giao dịch VINAMILK là gì?
*/

select diachi, dienthoai
from nhacungcap
where (
	tengiaodich = N'VINAMILK'
)

-- bai 05
/*
	Cho biết mã và tên của các mặt hàng có giá lớn
 hơn 100000 và số lượng hiện có ít hơn 50.
*/

select mahang, tenhang 
from mathang
where (
	soluong < 50
	and
	giahang > 100000
)


-- bai 06
/*
	Mỗi mặt hàng trong công ty do ai cung cấp.
*/

select mathang.mahang, mathang.tenhang, nhacungcap.tencongty
from mathang
join nhacungcap on nhacungcap.macongty = mathang.macongty


-- bai 07
/*
	Công ty Việt Tiến đã cung cấp mặt hàng nào?
*/

select mathang.*
from mathang
join nhacungcap on nhacungcap.macongty = mathang.macongty
where (
	nhacungcap.tencongty = N'Công ty Việt Tiến'
)

-- bai 08
/*
	 Loại hàng thực phẩm do những công ty nào
 cung cấp và địa chỉ của các công ty đó là gì?
*/

select distinct nhacungcap.macongty, nhacungcap.tencongty, nhacungcap.diachi
from nhacungcap
join mathang on mathang.macongty = nhacungcap.macongty
join loaihang on loaihang.maloaihang = mathang.maloaihang
where (
	loaihang.tenloaihang = N'Thực phẩm'
)


-- bai 09
/*
	 Những khách hàng nào (tên giao dịch) đã đặt
 mua mặt hàng Sữa hộp XYZ của công ty?
*/

select distinct khachhang.tengiaodich
from chitietdathang
join mathang on mathang.mahang = chitietdathang.mahang
join dondathang on dondathang.sohoadon = chitietdathang.sohoadon
join khachhang on khachhang.makhachhang = dondathang.makhachhang
where (
	mathang.tenhang = N'Sữa hộp XYZ'
)

-- bai 10
/*
	 Đơn đặt hàng số 1 do ai đặt, do nhân viên nào
 lập, thời gian, địa điểm giao hàng là ở đâu?
*/

select khachhang.makhachhang, 
	khachhang.tengiaodich, 
	nhanvien.manhanvien, 
	nhanvien.ho + ' ' + nhanvien.ten as hoten_nhanvien, 
	dondathang.ngaygiaohang, 
	dondathang.noigiaohang
from dondathang
join khachhang on khachhang.makhachhang = dondathang.makhachhang
join nhanvien on nhanvien.manhanvien = dondathang.manhanvien
where (
	dondathang.sohoadon = 'HD001'
)

-- bai 11
/*
	 Số tiền lương phải trả cho mỗi nhân viên là bao
 nhiêu (lương = lương cơ bản + phụ cấp).
*/

select nhanvien.manhanvien, 
	nhanvien.ho + ' ' + nhanvien.ten as hoten,
	(nhanvien.luongcoban + nhanvien.phucap) as luong
from nhanvien


-- bai 12
/*
	 Trong đơn đặt hàng số 3 đặt mua những mặt
 hàng nào và số tiền mà khách hàng phải trả
 cho mỗi mặt hàng là bao nhiêu (số tiền phải trả
 được tính theo công thức: soluong*giaban*(1 - mucgiamgia/100).
*/

select mathang.mahang, 
	mathang.tenhang, 
	(chitietdathang.soluong * chitietdathang.giaban) * (1 - chitietdathang.mucgiamgia / 100) as sotien
from dondathang
join chitietdathang on chitietdathang.sohoadon = dondathang.sohoadon
left join mathang on mathang.mahang = chitietdathang.mahang
where (
	dondathang.sohoadon = 'HD003'
)

-- bai 13
/*
	Khách hàng nào lại chính là đối tác cung cấp
 hàng của công ty (tức là có cùng tên giao dịch).
*/

select khachhang.*
from khachhang
where (
	khachhang.tengiaodich = any(
		select nhacungcap.tengiaodich
		from nhacungcap
	)
)

-- bai 14
/*
	 Những nhân viên nào có cùng ngày sinh?
*/

select nhanvien.manhanvien, nhanvien.ho + ' ' + nhanvien.ten as hoten, nhanvien.ngaysinh
from nhanvien
where (
	nhanvien.ngaysinh in (
		select nv.ngaysinh
		from nhanvien as nv
		where (
			nv.manhanvien != nhanvien.manhanvien
		)
	)
)

-- bai 15
/*
	 Những đơn đặt hàng nào yêu cầu giao hàng
 ngay tại công ty đặt hàng và những đơn đó là
 của công ty nào?
*/

select dondathang.*
from dondathang
join khachhang on khachhang.makhachhang = dondathang.makhachhang
where (
	dondathang.noigiaohang = khachhang.diachi
)

-- bai 16
/*
	 Cho biết tên công ty, tên giao dịch, địa chỉ và
 điện thoại của các khách hàng và các nhà cung
 cấp hàng.
*/

select khachhang.tencongty, 
	khachhang.tengiaodich, 
	khachhang.diachi, 
	khachhang.dienthoai
from khachhang
UNION ALL
select nhacungcap.tencongty, 
	nhacungcap.tengiaodich, 
	nhacungcap.diachi, 
	nhacungcap.dienthoai
from nhacungcap

-- bai 17
/*
	 Những mặt hàng nào chưa từng được đặt mua?
*/

select mathang.*
from mathang
where (
	mathang.mahang not in (
		select distinct chitietdathang.mahang
		from chitietdathang
	)
)

-- bai 18
/*
	 Những nhân viên nào của công ty chưa từng
 lập bất kỳ một hóa đơn đặt hàng nào?
*/

select nhanvien.*
from nhanvien
where (
	nhanvien.manhanvien not in (
		select distinct dondathang.manhanvien
		from dondathang
	)
)

-- bai 19
/*
	  Những nhân viên nào của công ty có lương cơ
 bản cao nhất?
*/

select top 1 nhanvien.*
from nhanvien
order by nhanvien.luongcoban desc

-- bai 20
/*
	 Tổng số tiền mà khách hàng phải trả cho mỗi
 đơn đặt hàng là bao nhiêu?
*/

select dondathang.makhachhang, dondathang.sohoadon,
	sum((chitietdathang.soluong * chitietdathang.giaban) * (1 - chitietdathang.mucgiamgia / 100)) as sotien
from dondathang
join chitietdathang on chitietdathang.sohoadon = dondathang.sohoadon
group by dondathang.makhachhang, dondathang.sohoadon

-- bai 21
/*
	 Trong năm 2022, những mặt hàng nào chỉ được
 đặt mua đúng một lần.
*/

select mathang.mahang, mathang.tenhang, count(chitietdathang.mahang) as solan
from dondathang
join chitietdathang on chitietdathang.sohoadon = dondathang.sohoadon
join mathang on mathang.mahang = chitietdathang.mahang
where (
	YEAR(dondathang.ngaydathang) = 2022
)
group by mathang.mahang, mathang.tenhang
having count(chitietdathang.mahang) = 1

-- bai 22
/*
	 Hãy cho biết mỗi một khách hàng đã phải bỏ
 ra bao nhiêu tiền để đặt mua hàng của công ty?
*/

select khachhang.makhachhang, khachhang.tengiaodich, sum(chitietdathang.soluong * chitietdathang.giaban) as tongtien
from khachhang
join dondathang on dondathang.makhachhang = khachhang.makhachhang
join chitietdathang on chitietdathang.sohoadon = dondathang.sohoadon
group by khachhang.makhachhang, khachhang.tengiaodich

-- bai 23
/*
	 Mỗi một nhân viên của công ty đã lập bao nhiêu
 đơn đặt hàng (nếu nhân viên chưa hề lập một
 hóa đơn nào thì cho kết quả là 0).
*/

select nhanvien.manhanvien, nhanvien.ho + ' ' + nhanvien.ten as hoten,
	count(dondathang.manhanvien) as sodondathang
from nhanvien
left join dondathang on dondathang.manhanvien = nhanvien.manhanvien
group by nhanvien.manhanvien, nhanvien.ho, nhanvien.ten

-- bai 24
/*
	 Số tiền nhiều nhất mà mỗi khách hàng đã từng
 bỏ ra để đặt hàng trong các đơn đặt hàng là
 bao nhiêu?
*/

select dondathang.makhachhang, max((chitietdathang.soluong * chitietdathang.giaban) * (1 - chitietdathang.mucgiamgia / 100)) as sotien
from khachhang
join dondathang on dondathang.makhachhang = khachhang.makhachhang
join chitietdathang on chitietdathang.sohoadon = dondathang.sohoadon
group by dondathang.makhachhang

-- bai 25
/*
	 Cho biết tổng số tiền hàng mà cửa hàng thu
 được trong mỗi tháng của năm 2022 (thời được
 gian tính theo ngày đặt hàng).
*/

select MONTH(dondathang.ngaydathang) as thang, sum((chitietdathang.soluong * chitietdathang.giaban) * (1 - chitietdathang.mucgiamgia / 100)) as tongsotien
from dondathang
join chitietdathang on chitietdathang.sohoadon = dondathang.sohoadon
where (
	YEAR(dondathang.ngaydathang) = 2022
)
group by MONTH(dondathang.ngaydathang)

-- bai 26
/*
	 Hãy cho biết dơn đặt hàng nào có số lượng hàng
 được đặt mua ít nhất?
*/

select top 1 dondathang.sohoadon, sum(chitietdathang.soluong) as soluonghang
from dondathang
join chitietdathang on chitietdathang.sohoadon = dondathang.sohoadon
group by dondathang.sohoadon, chitietdathang.soluong
order by chitietdathang.soluong


-- bai 27
/*
	  Hãy cho biết tổng số tiền lời mà công ty thu
 được từ mỗi mặt hàng trong năm 2022.
*/

select mathang.mahang, mathang.tenhang, (sum((chitietdathang.soluong * chitietdathang.giaban) * (1 - chitietdathang.mucgiamgia / 100)) - sum(chitietdathang.soluong * mathang.giahang)) as tongsotienloi
from mathang
join chitietdathang on chitietdathang.mahang = mathang.mahang
join dondathang on dondathang.sohoadon = chitietdathang.sohoadon
where (
	YEAR(dondathang.ngaydathang) = 2022
)
group by mathang.mahang, mathang.tenhang


-- bai 28
/*
	 Cho biết tổng số lượng hàng của mỗi mặt hàng
 mà công ty đã có (tổng số lượng hàng hiện có
 và đã bán).
*/

select ds.mahang, mathang.tenhang, (mathang.soluong - ds.daban) as hienco, ds.daban
from (
		select mathang.mahang, 
			sum(chitietdathang.soluong) as daban
		from mathang
		join chitietdathang on chitietdathang.mahang = mathang.mahang
		group by mathang.mahang
	) ds
join mathang on mathang.mahang = ds.mahang

-- bai 29
/*
	 Nhân viên nào của công ty bán được số lượng
 hàng nhiều nhất và số lượng hàng bán được của
 những nhân viên này là bao nhiêu?
*/

select top 1 nhanvien.manhanvien, 
	nhanvien.ho + ' ' + nhanvien.ten as hoten, 
	sum(chitietdathang.soluong) as soluonghang
from nhanvien
join dondathang on dondathang.manhanvien = nhanvien.manhanvien
join chitietdathang on chitietdathang.sohoadon = dondathang.sohoadon
group by nhanvien.manhanvien, nhanvien.ho, nhanvien.ten
order by soluonghang desc

-- bai 30
/*
	 Mỗi một đơn đặt hàng đặt mua những mặt
 hàng nào và tổng số tiền mà mỗi đơn đặt hàng
 phải trả là bao nhiêu?
*/

select dondathang.sohoadon, 
	mathang.mahang, 
	mathang.tenhang, 
	sum((chitietdathang.soluong * chitietdathang.giaban) * (1 - chitietdathang.mucgiamgia / 100)) as tongsotien
from dondathang
join chitietdathang on chitietdathang.sohoadon = dondathang.sohoadon
join mathang on mathang.mahang = chitietdathang.mahang
group by dondathang.sohoadon, mathang.mahang, mathang.tenhang
order by dondathang.sohoadon

-- bai 31
/*
	 Hãy cho biết mỗi một loại hàng bao gồm những
 mặt hàng nào, tổng số lượng hàng của mỗi loại
 và tổng số lượng của tất cả các mặt hàng hiện
 có trong công ty là bao nhiêu?
*/

select loaihang.maloaihang, loaihang.tenloaihang, ds1.soluonghang, ds2.hienco
from (
		select loaihang.maloaihang, sum(mathang.soluong) as soluonghang
		from loaihang
		join mathang on mathang.maloaihang = loaihang.maloaihang
		group by loaihang.maloaihang, loaihang.tenloaihang
	) ds1,
	(
		select mathang.maloaihang, sum(mathang.soluong) - ds.daban as hienco
		from (
				select loaihang.maloaihang, 
					sum(chitietdathang.soluong) as daban
				from loaihang
				join mathang on loaihang.maloaihang = mathang.maloaihang
				join chitietdathang on chitietdathang.mahang = mathang.mahang
				group by loaihang.maloaihang
			) ds
		join loaihang on loaihang.maloaihang = ds.maloaihang
		join mathang on mathang.maloaihang = loaihang.maloaihang
		group by mathang.maloaihang, ds.daban
	) ds2
join loaihang on loaihang.maloaihang = ds2.maloaihang

-- bai 32
/*
	 Thống kê xem trong năm 2022, mỗi một mặt
 hàng trong mỗi tháng và trong cả năm bán được
 với số lượng bao nhiêu.
	Yêu cầu: Kết quả được hiển thị dưới dạng bảng,
 hai cột đầu là mã hàng và tên hàng, các cột còn
 lại tương ứng với các tháng từ 1 đến 12 và cả
 năm. Như vậy mỗi dòng trong kết quả cho biết
 số lượng hàng bán được mỗi tháng và trong cả
 năm của mỗi mặt hàng.
*/

select mathang.mahang, 
	mathang.tenhang,
	sum(case when month(dondathang.ngaydathang) = 1 then chitietdathang.soluong else 0 end) as t1,
	sum(case when month(dondathang.ngaydathang) = 2 then chitietdathang.soluong else 0 end) as t2,
	sum(case when month(dondathang.ngaydathang) = 3 then chitietdathang.soluong else 0 end) as t3,
	sum(case when month(dondathang.ngaydathang) = 4 then chitietdathang.soluong else 0 end) as t4,
	sum(case when month(dondathang.ngaydathang) = 5 then chitietdathang.soluong else 0 end) as t5,
	sum(case when month(dondathang.ngaydathang) = 6 then chitietdathang.soluong else 0 end) as t6,
	sum(case when month(dondathang.ngaydathang) = 7 then chitietdathang.soluong else 0 end) as t7,
	sum(case when month(dondathang.ngaydathang) = 8 then chitietdathang.soluong else 0 end) as t8,
	sum(case when month(dondathang.ngaydathang) = 9 then chitietdathang.soluong else 0 end) as t9,
	sum(case when month(dondathang.ngaydathang) = 10 then chitietdathang.soluong else 0 end) as t10,
	sum(case when month(dondathang.ngaydathang) = 11 then chitietdathang.soluong else 0 end) as t11,
	sum(case when month(dondathang.ngaydathang) = 12 then chitietdathang.soluong else 0 end) as t12,
	sum(chitietdathang.soluong) as canam
from mathang
join chitietdathang on chitietdathang.mahang = mathang.mahang
join dondathang on dondathang.sohoadon = chitietdathang.sohoadon
group by mathang.mahang, mathang.tenhang


------			Sử dụng lệnh UPDATE thực hiện các yêu cầu sau			------

-- bai 33
/*
	 Cập nhật lại giá trị trường NGAYCHUYENHANG
 của những bản ghi có NGAYCHUYENHANG chưa
 xác định (NULL) trong bảng DONDATHANG bằng
 với giá trị của trường NGAYDATHANG.
*/

update dondathang
set ngaychuyenhang = (
	select ddh.ngaydathang
	from dondathang ddh
	where (
		ddh.sohoadon = dondathang.sohoadon
	)
)
where (
	dondathang.ngaychuyenhang IS NULL
)

-- bai 34
/*
	 Tăng số lượng hàng của những mặt hàng do
 công ty VINAMILK cung cấp lên gấp đôi.
*/

update mathang 
set mathang.soluong = mathang.soluong * 2
where (
	mathang.macongty in (
		select nhacungcap.macongty
		from nhacungcap
		where (
			nhacungcap.tencongty = N'Công ty Vinamilk'
		)
	)
)


-- bai 35
/*
	 Cập nhật giá trị của trường NOIGIAOHANG bằng
 địa chỉ của khách hàng đối với những đơn đặt
 hàng chưa xác định được nơi giao hàng (giá trị
 trường NOIGIAOHANG bằng NULL).
*/

update dondathang 
set noigiaohang = (
	select khachhang.diachi
	from khachhang
	where (
		dondathang.makhachhang = khachhang.makhachhang
	)
)
where (
	dondathang.noigiaohang IS NULL
)


-- bai 36
/*
	  Cập nhật lại bảng KHACHHANG sao cho nếu tên
 công ty và tên giao dịch của khách hàng trùng
 với tên công ty và tên giao dịch của một nhà
 cung cấp nào đó thì địa chỉ, điện thoại, fax và
 e-mail phải giống nhau.
*/

update khachhang
set khachhang.diachi = nhacungcap.diachi,
	khachhang.dienthoai = nhacungcap.dienthoai,
	khachhang.fax = nhacungcap.fax,
	khachhang.email = nhacungcap.email
from khachhang
join nhacungcap on (nhacungcap.tencongty = khachhang.tencongty) 
	and 
	(nhacungcap.tengiaodich = khachhang.tengiaodich)


-- bai 37
/*
	 Tăng lương lên gấp rưỡi cho nhân viên bán được
 số lượng hàng nhiều hơn 100 trong năm 2022.
*/

update nhanvien
set nhanvien.luongcoban = nhanvien.luongcoban * 1.5
where (
	nhanvien.manhanvien in (
		select dondathang.manhanvien
		from dondathang
		join chitietdathang on chitietdathang.sohoadon = dondathang.sohoadon
		group by dondathang.manhanvien
		having sum(chitietdathang.soluong) > 100
	)
)

-- bai 38
/*
	 Tăng phụ cấp lên bằng 50% lương cho những
 nhân viên bán được hàng nhiều nhất.
*/

update nhanvien
set nhanvien.phucap = nhanvien.phucap + (nhanvien.luongcoban / 2)
where (
	nhanvien.manhanvien in (
		select top 1 dondathang.manhanvien
		from dondathang
		join chitietdathang on chitietdathang.sohoadon = dondathang.sohoadon
		group by dondathang.manhanvien
		order by sum(chitietdathang.soluong) desc
	)
)

-- bai 39
/*
	 Giảm 25% lương của nhân viên trong năm 2022
 không lập được bất kỳ đơn đặt hàng nào.
*/

update nhanvien
set nhanvien.luongcoban = nhanvien.luongcoban / 100 * 25
where (
	nhanvien.manhanvien not in (
		select distinct dondathang.manhanvien
		from dondathang
	)
)

-- bai 40
/*
	  Giả sử trong bảng DONDATHANG có thêm trường
 SOTIEN cho biết số tiền mà khách hàng phải trả
 trong mỗi đơn đặt hàng. Hãy tính giá trị cho
 trường này
*/

alter table dondathang add sotien int

update dondathang
set dondathang.sotien = (
	select ds.sotien
	from (
			select ddh.sohoadon,
				sum((chitietdathang.soluong * chitietdathang.giaban) * (1 - chitietdathang.mucgiamgia / 100)) as sotien
			from dondathang as ddh
			join chitietdathang on chitietdathang.sohoadon = ddh.sohoadon
			group by ddh.sohoadon
		) ds
	where (
		dondathang.sohoadon = ds.sohoadon
	)
)

---------			 Thực hiện các yêu cầu dưới đây bằng câu lệnh DELETE.			--------


-- bai 41
/*
	 Xóa khỏi bảng NHANVIEN những nhân viên đã
 làm việc trong công ty quá 40 năm.
*/

delete from nhanvien
where (
	(year(CURRENT_TIMESTAMP) - year(nhanvien.ngaylamviec)) > 40
)

-- bai 42
/*
	 Xóa những đơn đặt hàng trước năm 2020.
*/


delete from dondathang
where (
	year(dondathang.ngaydathang) < 2020	
)

-- bai 43
/*
	 Xóa khỏi bảng LOAIHANG những loại hàng hiện
 không có mặt hàng.
*/

delete from loaihang
where (
	loaihang.maloaihang in (
		select loaihang.maloaihang
		from loaihang
		left join mathang on mathang.maloaihang = loaihang.maloaihang
		group by loaihang.maloaihang
		having count(mathang.mahang) = 0
	)
)

-- bai 44

/*
	 Xóa khỏi bảng KHACHHANG những khách hàng
 hiện không có bất kỳ đơn đặt hàng nào cho
 công ty.
*/

delete from khachhang
where (
	khachhang.makhachhang not in (
		select distinct dondathang.makhachhang
		from dondathang
	)
)


-- bai 45
/*
	 Xóa khỏi bảng MATHANG những mặt hàng có số
 lượng bằng 0 và không được đặt mua trong bất
 kỳ đơn đặt hàng nào.
*/

delete from mathang
where (
	mathang.soluong = 0
	and
	mathang.mahang not in (
		select distinct chitietdathang.mahang
		from chitietdathang
	)
)

------  (Lưu ý: Sinh viên tự tạo database cho phần kiểm nghiệm.)  -------
