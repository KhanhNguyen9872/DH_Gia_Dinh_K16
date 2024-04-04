-- 221402 - KhanhNguyen9872

use master;
ALTER DATABASE QLBH SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE QLBH SET ONLINE;

DROP DATABASE QLBH;


CREATE DATABASE QLBH;
GO
use QLBH;
GO

create table mathang (
	-- mamh,tenmh,dvt,gia
	-- MH01,Sữa tươi VinaMilk,lốc,35000
	mamh nvarchar(255) primary key,
	tenmh nvarchar(255) not null,
	dvt nvarchar(255) not null,
	gia int not null
);

create table khachhang (
	-- makh,tenkh,diachi,sdt,loaikh
	-- KH01,Nguyễn Mai Chi,HCM,0164652182,VIP
	makh nvarchar(255) primary key,
	tenkh nvarchar(255) not null,
	diachi nvarchar(255) not null,
	sdt nvarchar(255) not null,
	loaikh nvarchar(255) not null,
	check (loaikh in ('VIP', 'TV')),
);

create table hoadon (
	-- mahd,makh,ngaylap
	-- HD01,KH01,2024-01-20
	mahd nvarchar(255) primary key,
	makh nvarchar(255) not null,
	ngaylap date not null,
	foreign key (makh) references khachhang(makh)
)

create table cthd (
	-- mahd,mamh,soluong
	-- HD01,MH01,30
	mahd nvarchar(255) not null,
	mamh nvarchar(255) not null,
	soluong int not null,
	foreign key (mahd) references hoadon(mahd),
	foreign key (mamh) references mathang(mamh)
)

bulk insert cthd
from 'E:\CSV\dbms\CSV\DATA Quan Ly Ban Hang\cthd.csv'
with (
	format = 'CSV',
	firstrow = 2,
	rowterminator = '0x0a'
);

bulk insert hoadon
from 'E:\CSV\dbms\CSV\DATA Quan Ly Ban Hang\hoadon.csv'
with (
	format = 'CSV',
	firstrow = 2,
	rowterminator = '0x0a'
);


bulk insert khachhang
from 'E:\CSV\dbms\CSV\DATA Quan Ly Ban Hang\khachhang.csv'
with (
	format = 'CSV',
	firstrow = 2,
	rowterminator = '0x0a'
);

bulk insert mathang
from 'E:\CSV\dbms\CSV\DATA Quan Ly Ban Hang\mathang.csv'
with (
	format = 'CSV',
	firstrow = 2,
	rowterminator = '0x0a'
);

--		 Dạng 1: Câu lệnh truy vấn có điều kiện			--


-- bai 01
/*
	Cho biết danh sách gồm mã khách hàng, họ tên, số điện thoại của khách hàng thành viên.
*/

select makh, tenkh, sdt
from khachhang
where (
	loaikh = 'TV'
);

-- BAI 02
/*
	Cho biết danh sách gồm mã khách hàng, họ tên, số điện thoại của những khách hành VIP ở Long An và HCM.
*/

select makh, tenkh, sdt
from khachhang
where (
	(loaikh = 'VIP') 
	AND
	(
		(diachi = 'HCM')
		OR
		(diachi = 'Long An')
	)
);

-- bai 03
/*
	Cho biết số lượng hóa đơn xuất vào tháng 1.
*/

select sum(soluong) as [Số lượng hóa đơn]
from cthd
join hoadon on hoadon.mahd = cthd.mahd
where (
	month(hoadon.ngaylap) = '1'
);

-- bai 04
/* 
	Cho biết danh sách các mặt hàng có giá bán từ 20 nghìn đến 50 nghìn.
*/

select * 
from mathang
where (
	gia between 20000 and 50000
);

-- bai 05
/*
	Cho biết danh sách các hóa đơn có số lượng bán trên 50.
*/

select hoadon.*
from cthd
join hoadon on hoadon.mahd = cthd.mahd
where (
	cthd.soluong > 50
);

-- bai 06
/*
	Cho biết mã hóa đơn, mã mặt hàng, tên mặt
hàng, giá, số lượng và tổng tiền mỗi mặt hàng
 của hóa đơn HD01.
*/

select cthd.mahd, mathang.mamh, mathang.tenmh, mathang.gia, cthd.soluong,
	(gia * soluong) as [Tổng tiền]
from mathang
join cthd on cthd.mamh = mathang.mamh 
where (
	cthd.mahd = 'HD01'
);

-- bai 07
/*
	Cho biết mã hóa đơn, mã mặt hàng, tên mặt
 hàng, giá, số lượng và tổng tiền mỗi mặt hàng
 của hóa đơn từ 300000 đến 500000.
*/

select *
from 
	(
		select cthd.mahd, cthd.mamh, mathang.tenmh, mathang.gia, cthd.soluong,
			(gia * soluong) as tongtien
		from cthd
		join mathang on mathang.mamh = cthd.mamh
	) ds
where (
	ds.tongtien between 300000 and 500000
)


-- bai 8
/*
	 Cho biết thông tin những khách hàng nào không
 mua hàng vào tháng 1.
*/
select khachhang.*
from khachhang
join hoadon on hoadon.makh = khachhang.makh
where (
	month(ngaylap) != 1
)

-- bai 9
/*
	 Cho biết mã hóa đơn, ngày lập hóa đơn, mã
 khách hàng và tổng tiền của những hóa đơn
 bán vào tháng 2.
*/

select hoadon.mahd, hoadon.ngaylap, hoadon.makh,
	(mathang.gia * cthd.soluong) as tongtien
from hoadon
join cthd on cthd.mahd = hoadon.mahd
join mathang on mathang.mamh = cthd.mamh
where (
	month(ngaylap) = 2
)

-- bai 10
/*
	 Cho biết danh sách các mặt hàng đã bán được.
*/

select distinct mathang.*
from mathang, cthd
where (
	cthd.mamh = mathang.mamh	
)


--		Dạng 2: Câu lệnh truy vấn có phân nhóm		--


-- bai 01
/*	
	Đếm số hóa đơn của mỗi khách hàng.
*/

select hoadon.makh, count(hoadon.mahd) as sohoadon
from hoadon
group by hoadon.makh

-- bai 02
/*	
	 Cho biết mã mặt hàng, tên mặt hàng, Tổng số
 lượng đã bán của từng mặt hàng.
*/

select mathang.mamh, mathang.tenmh, sum(cthd.soluong) as tongsoluongdaban
from mathang
left join cthd on cthd.mamh = mathang.mamh
group by mathang.mamh, mathang.tenmh


-- bai 03
/*
	Chobiết mãhóađơn,tổngthànhtiềncủa những
 hóa đơn có tổng thành tiền lớn hơn 10 triệu.
*/

select cthd.mahd, sum(cthd.soluong * mathang.gia) as tongtien
from cthd
left join mathang on mathang.mamh = cthd.mamh
group by cthd.mahd
having sum(cthd.soluong * mathang.gia) > 10000000

-- bai 04
/*
	Cho biết hóa đơn bán ít nhất hai mặt hàng
 MH01 và MH02.
*/

select cthd.mahd
from cthd
where (cthd.mamh in ('MH01', 'MH02'))
group by cthd.mahd
having count(cthd.mahd) = 2

-- bai 05
/*
	Cho biết mã khách hàng, tên khách hàng, mã hóa đơn, tổng
 thành tiền của từng hóa đơn.
*/

select khachhang.makh, khachhang.tenkh, cthd.mahd, sum(cthd.soluong * mathang.gia) as tongtien
from khachhang
join hoadon on hoadon.makh = khachhang.makh
join cthd on cthd.mahd = hoadon.mahd
join mathang on mathang.mamh = cthd.mamh
group by khachhang.makh, khachhang.tenkh, cthd.mahd
order by khachhang.makh

-- bai 06
/*
	Cho biết mã khách hàng, tên khách hàng, tổng
 thành tiền của khách hàng VIP.
*/

select khachhang.makh, khachhang.tenkh, sum(cthd.soluong * mathang.gia) as tongtien
from khachhang
join hoadon on hoadon.makh = khachhang.makh
join cthd on cthd.mahd = hoadon.mahd
join mathang on mathang.mamh = cthd.mamh
where (khachhang.loaikh = 'VIP')
group by khachhang.makh, khachhang.tenkh

-- bai 07
/*
	 Cho biết mã khách hàng, tên khách hàng, tổng
 thành tiền của từng khách hàng có tổng thành
 tiền mua được >=10 triệu.
*/

select khachhang.makh, khachhang.tenkh, sum(cthd.soluong * mathang.gia) as tongtien
from khachhang
join hoadon on hoadon.makh = khachhang.makh
join cthd on cthd.mahd = hoadon.mahd
join mathang on mathang.mamh = cthd.mamh
group by khachhang.makh, khachhang.tenkh
having sum(cthd.soluong * mathang.gia) >= 10000000

-- bai 08
/*
	Cho biết thông tin khách hàng VIP có tổng
 thành tiền trong năm 2024 nhỏ hơn 10 triệu.
*/

select khachhang.makh, khachhang.tenkh, khachhang.sdt, sum(cthd.soluong * mathang.gia) as tongtien
from khachhang
join hoadon on hoadon.makh = khachhang.makh
join cthd on cthd.mahd = hoadon.mahd
join mathang on mathang.mamh = cthd.mamh
group by khachhang.makh, khachhang.tenkh, khachhang.sdt
having sum(cthd.soluong * mathang.gia) < 10000000

-- bai 09
/*
	Cho biết hóa đơn có tổng trị giá lớn nhất gồm
 các thông tin: Mã hoá đơn, tổng trị giá của hóa
 đơn.
*/

select top 1 cthd.mahd, sum(cthd.soluong * mathang.gia) as tongtrigia
from cthd
join mathang on mathang.mamh = cthd.mamh
group by cthd.mahd
order by tongtrigia desc

-- bai 10
/*
	Cho biết hóa đơn có tổng trị giá lớn nhất trong
 tháng 2/2024 gồm các thông tin: Mã hóa đơn,
 ngày lập, tên khách hàng, số điện thoại khách
 hàng, tổng trị giá của hóa đơn.
*/

select top 1 hoadon.mahd, hoadon.ngaylap, khachhang.tenkh, khachhang.sdt, sum(cthd.soluong * mathang.gia) as tongtrigia
from hoadon
join khachhang on khachhang.makh = hoadon.makh
join cthd on cthd.mahd = hoadon.mahd
join mathang on mathang.mamh = cthd.mamh
where (month(ngaylap) = 2 and year(ngaylap) = 2024)
group by hoadon.mahd, hoadon.ngaylap, khachhang.tenkh, khachhang.sdt
order by tongtrigia desc

-- bai 11
/*
	Cho biết hóa đơn có tổng trị giá nhỏ nhất gồm
 các thông tin: Mã hoá đơn, ngày lập, tên khách
 hàng, số điện thoại khách hàng, tổng trị giá của
 hóa đơn.
*/

select top 1 hoadon.mahd, hoadon.ngaylap, khachhang.tenkh, khachhang.sdt, sum(cthd.soluong * mathang.gia) as tongtrigia
from hoadon
join khachhang on khachhang.makh = hoadon.makh
join cthd on cthd.mahd = hoadon.mahd
join mathang on mathang.mamh = cthd.mamh
group by hoadon.mahd, hoadon.ngaylap, khachhang.tenkh, khachhang.sdt
order by tongtrigia

-- bai 12
/*
	Cho biết thông tin của khách hàng có số lượng
 hóa đơn mua hàng nhiều nhất
*/

select top 1 khachhang.makh, khachhang.tenkh, count(cthd.mahd) as tonghoadon
from cthd
join hoadon on hoadon.mahd = cthd.mahd
join khachhang on khachhang.makh = hoadon.makh
group by khachhang.makh, khachhang.tenkh
order by tonghoadon desc

-- bai 13
/*
	Cho biết thông tin của khách hàng có số lượng
 hàng mua nhiều nhất.
*/	

select top 1 khachhang.makh, khachhang.tenkh, sum(cthd.soluong) as tongsoluong
from cthd
join hoadon on hoadon.mahd = cthd.mahd
join khachhang on khachhang.makh = hoadon.makh
group by khachhang.makh, khachhang.tenkh
order by tongsoluong desc

-- bai 14
/*
	 Cho biết thông tin về các mặt hàng được bán
 trong nhiều hoá đơn nhất
*/

select top 1 mathang.mamh, mathang.tenmh, count(cthd.mamh) as soluong
from cthd
join mathang on mathang.mamh = cthd.mamh
group by mathang.mamh, mathang.tenmh
order by soluong desc

-- bai 15
/*
	Cho biết thông tin 3 mặt hàng được bán nhiều
 nhất.
*/

select top 3 mathang.mamh, mathang.tenmh, sum(cthd.soluong) as soluong
from cthd
join mathang on mathang.mamh = cthd.mamh
group by mathang.mamh, mathang.tenmh
order by soluong desc


--			Dạng 3: Câu truy vấn lồng nhau			--

-- bai 01
/*	
	   Cho biết mã, tên mặt hàng chưa được bán.
*/

select mathang.mamh, mathang.tenmh
from mathang
where (
	mathang.mamh not in (
		select cthd.mamh 
		from cthd
	)
)


-- bai 02
/*	
	   Khách hàng nào không mua hàng vào tháng 1.
*/

select khachhang.*
from khachhang
where (
	khachhang.makh not in (
		select hoadon.makh
		from hoadon
		where (
			month(hoadon.ngaylap) != 1
		)
	)
)


-- bai 03
/*
		 Mặt hàng nào không bán được vào ngày 25/01/2024
*/

select mathang.*
from mathang
where (
	mathang.mamh not in (
		select distinct cthd.mamh
		from cthd
		left join hoadon on hoadon.mahd = cthd.mahd
		where (
			day(hoadon.ngaylap) != 25
			and
			month(hoadon.ngaylap) != 1
			and
			year(hoadon.ngaylap) != 2024
		)
	)
)


-- bai 04
/*
		Khách hàng nào có mua các mặt hàng sữa.
*/

select khachhang.*
from khachhang
where (
	khachhang.makh in (
		select distinct hoadon.makh
		from hoadon
		join cthd on cthd.mahd = hoadon.mahd
		join mathang on mathang.mamh = cthd.mamh
		where (
			mathang.tenmh LIKE N'[Sữa]%'
		)
	)
)


-- bai 05
/*
		Tìm những đơn hàng do khách hàng VIP mua.
*/

select
	hoadon.*
from hoadon
where (
	hoadon.makh in (
		select khachhang.makh
		from khachhang
		where (
			khachhang.loaikh = 'VIP'
		)
	)
)
