-- 221402 - KhanhNguyen9872

use master;
ALTER DATABASE QLSV SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE QLSV SET ONLINE;

DROP DATABASE QLSV;


CREATE DATABASE QLSV;
GO
use QLSV;
GO

create table hocphan (
	-- mahp,tenhp,stc,hocky
	mahp nvarchar(255) primary key,
	tenhp nvarchar(255) not null,
	stc int,
	hocky int
)

CREATE TABLE lop (
	malop varchar(255) primary key,
	tenlop nvarchar(255),
	khoa int,
	nam int,
	hedt varchar(255),
	manganh int,
	siso varchar(255)
);

CREATE TABLE sinhvien (
	masv int primary key,
	hodem nvarchar(255),
	ten nvarchar(255),
	ngaysinh date,
	gioitinh BIT,
	noisinh nvarchar(255),
	malop varchar(255),
	FOREIGN KEY (malop) REFERENCES lop(malop)
);

create table ketqua (
	-- masv,mahp,diem
	masv int,
	mahp nvarchar(255),
	diem float,
	foreign key (masv) REFERENCES sinhvien(masv),
	foreign key (mahp) REFERENCES hocphan(mahp)
)


create table khoa (
	-- makhoa,tenkhoa,dienthoai
	makhoa nvarchar(255) primary key,
	tenkhoa nvarchar(255),
	dienthoai nvarchar(255)
)

create table nganh (
	-- manganh,tennganh,makhoa
	manganh int,
	tennganh nvarchar(255),
	makhoa nvarchar(255),
	foreign key (makhoa) references khoa(makhoa)
)

bulk insert khoa
from 'E:\CSV\dbms\CSV\DATA Quan Ly Sinh Vien\khoa.csv'
with (
	format = 'CSV',
	firstrow = 2,
	rowterminator = '0x0a'
);

bulk insert nganh
from 'E:\CSV\dbms\CSV\DATA Quan Ly Sinh Vien\nganh.csv'
with (
	format = 'CSV',
	firstrow = 2,
	rowterminator = '0x0a'
);


bulk insert hocphan
from 'E:\CSV\dbms\CSV\DATA Quan Ly Sinh Vien\hocphan.csv'
with (
	format = 'CSV',
	firstrow = 2,
	rowterminator = '0x0a'
);

bulk insert sinhvien
from 'E:\CSV\dbms\CSV\DATA Quan Ly Sinh Vien\sinhvien.csv'
with (
	format = 'CSV',
	firstrow = 2,
	rowterminator = '0x0a'
);

bulk insert lop
from 'E:\CSV\dbms\CSV\DATA Quan Ly Sinh Vien\lop.csv'
with (
	format = 'CSV',
	firstrow = 2,
	rowterminator = '0x0a'
);

bulk insert ketqua
from 'E:\CSV\dbms\CSV\DATA Quan Ly Sinh Vien\ketqua.csv'
with (
	format = 'CSV',
	firstrow = 2,
	rowterminator = '0x0a'
);

update lop 
set siso = NULL
where siso = 'null';

alter table lop alter column siso int;


--		 Dạng 1: Câu lệnh truy vấn có điều kiện			--

-- bai 01
/*
		Hiển thị danh sách gồm: mã sinh viên, họ tên,
 mã lớp, ngày sinh (dd/mm/yyyy), năm sinh,
 giới tính (Nam, Nữ) của những sinh viên có họ
 không bắt đầu bằng chữ N,L,T.
*/

select masv, hodem + ' ' + ten as hoten, malop, ngaysinh, YEAR(ngaysinh) as namsinh, 
	CASE gioitinh
        WHEN 0 THEN N'Nu' 
		WHEN 1 THEN N'Nam'
    END AS gioitinh
from sinhvien
where (
	LEFT(hodem, 1) IN ('N', 'L', 'T')
);

-- BAI 02
/*
		Hiển thị danh sách gồm: mã sinh viên, họ tên,
 mã lớp, ngày sinh (dd/mm/yyyy), năm sinh,
 giới tính (Nam, Nữ) của những sinh viên nam
 học lớp PM23 và PM24.
*/

select masv, hodem + ' ' + ten as hoten, malop, ngaysinh, YEAR(ngaysinh) as namsinh, 
	CASE gioitinh
        WHEN 0 THEN N'Nu' 
		WHEN 1 THEN N'Nam'
    END AS gioitinh
from sinhvien
where (
	malop = 'PM23'
);

-- bai 03
/*
		Hiển thị danh sách gồm: mã sinh viên, họ tên,
 mãlớp, ngày sinh (dd/mm/yyyy), giới tính (Nam,
 Nữ), tuổi của những sinh viên có tuổi từ 19 đến
 20 tuổi.
*/

select masv, hodem + ' ' + ten as hoten, malop, ngaysinh, 
	CASE gioitinh
        WHEN 0 THEN N'Nu' 
		WHEN 1 THEN N'Nam'
    END AS gioitinh
from sinhvien
where (
	(YEAR(CURRENT_TIMESTAMP) - YEAR(ngaysinh)) BETWEEN 19 and 20
);

-- bai 04
/*
		Hiển thị danh sách mã sinh viên, họ tên, mã
 lớp, mã học phần, điểm được sắp xếp theo ưu
 tiên mã lớp, họ tên tăng dần.
*/

select distinct sinhvien.masv, hodem + ' ' + ten as hoten, malop, ketqua.mahp, ketqua.diem
from sinhvien
join ketqua on ketqua.masv = sinhvien.masv
order by malop, hoten;

-- bai 05
/*
		Hiển thị danh sách gồm mã sinh viên, họ tên,
 mãlớp, mã học phần, điểm của những sinh viên
 có điểm học phần từ 5 đến 7 ở học kỳ I.
*/

select distinct sinhvien.masv, hodem + ' ' + ten as hoten, malop, hocphan.mahp, diem
from sinhvien
join ketqua on ketqua.masv = sinhvien.masv
join hocphan on hocphan.mahp = ketqua.mahp
where (
	diem between 5 and 7
	and
	hocky = 1
);


--			Dạng 2: Câu lệnh truy vấn có phân nhóm			--

-- bai 01
/*
		Cho biết mã lớp, tên lớp, tổng số sinh viên mỗi lớp.
*/

select
	lop.malop, lop.tenlop, ds.tongsinhvien
from (
		select sinhvien.malop, count(sinhvien.malop) as tongsinhvien
		from sinhvien
		group by sinhvien.malop
	) ds
join lop on lop.malop = ds.malop


-- bai 02
/*
		Cho biết mã lớp, tên lớp, số lượng sinh viên
 nam nữ theo từng lớp.
*/

SELECT sinhvien.malop, lop.tenlop, 
	CASE sinhvien.gioitinh
		WHEN 0 THEN N'Nu' 
		WHEN 1 THEN N'Nam'
	END AS gioitinh,
	COUNT(sinhvien.masv) AS soluong
 FROM lop 
 JOIN sinhvien ON lop.malop = sinhvien.malop
 GROUP BY sinhvien.malop, lop.tenlop, gioitinh
 ORDER BY sinhvien.malop


-- bai 03
/*
		Cho biết điểm trung bình của sinh viên. Biết
 rằng DTB = tổng điểm học phần * số tín chỉ
 chia tổng số tín chỉ.
*/

SELECT masv, SUM(diem*stc)/SUM(stc) AS DTB
FROM HocPhan 
JOIN KetQua
ON HocPhan.mahp = KetQua.mahp
GROUP BY masv


-- bai 04
/*
		Cho biết DTB của sinh viên ở học kỳ 1.
*/

SELECT masv, SUM(diem*stc)/SUM(stc) AS DTB
FROM HocPhan 
JOIN KetQua ON HocPhan.mahp = KetQua.mahp
WHERE HocKy = '1'
GROUP BY masv

-- bai 05
/*
		 Cho biết mã sinh viên, họ tên, số các học phần
 điểm dưới 8 của mỗi sinh viên.
*/

SELECT SinhVien.masv,hodem,ten, COUNT(ketqua.mahp) AS sl
FROM KetQua 
JOIN SinhVien ON KetQua.masv = SinhVien.masv
JOIN HocPhan ON KetQua.mahp = HocPhan.mahp
WHERE diem < 8
group by SinhVien.masv,hodem,ten

-- bai 06
/*
		Đếm số sinh viên có điểm dưới 8 của mỗi học
 phần.
*/

SELECT mahp, COUNT(masv) AS soluong
FROM KetQua 
WHERE diem < 8
GROUP BY mahp

-- bai 07
/*
		 Tính tổng số tín chỉ có điểm dưới 8 của mỗi
 sinh viên.
*/

SELECT SinhVien.masv,hodem,ten,SUM(stc) AS tongSTC
FROM KetQua 
JOIN SinhVien ON KetQua.masv = SinhVien.masv
JOIN HocPhan ON HocPhan.mahp = KetQua.mahp
WHERE diem < 8
GROUP BY SinhVien.masv, hodem, ten


-- bai 08
/*
		 Cho biết mã lớp, tên lớp có tổng số sinh viên
 trên 10.
*/

SELECT SinhVien.malop, tenlop, COUNT(masv) AS siso
FROM Lop 
JOIN SinhVien ON Lop.malop = SinhVien.malop
GROUP BY SinhVien.malop, tenlop
HAVING COUNT(masv) > 10

-- bai 09
/*
		 Cho biết sinh viên nào có số học phần điểm
 trên 8 nhiều nhất.
*/

SELECT TOP 1 SinhVien.masv, hodem, ten, COUNT(KetQua.mahp) AS 'So Hoc phan'
FROM KetQua 
JOIN SinhVien ON SinhVien.masv = KetQua.masv
WHERE diem > 8
GROUP BY SinhVien.masv, hodem, ten
ORDER BY COUNT(KetQua.mahp) DESC

-- bai 10
/*
		Cho biết sinh viên nào có DTB các học phần
 trên 8.
*/

SELECT sinhvien.masv, hodem, ten, SUM(diem*stc)/SUM(stc) AS DTB
FROM HocPhan 
JOIN KetQua ON HocPhan.mahp = KetQua.mahp
JOIN SinhVien ON SinhVien.masv = KetQua.masv
GROUP BY sinhvien.masv, hodem, ten
HAVING SUM(diem*stc)/SUM(stc) > 8


-- bai 11
/*
		Sinh viên có trên 2 học phần có điểm trên 8
*/

select sinhvien.masv as 'MSSV', hodem + ' ' + ten as 'Họ và tên', malop as 'Mã lớp', mahp as 'Mã học phần', round(diem, 2) as 'Điểm', tonghp
from (
	select sinhvien.masv, count(*) as tonghp
	from sinhvien 
		join ketqua on ketqua.masv = sinhvien.masv
	where ketqua.diem > 8
	group by sinhvien.masv
) ds
join sinhvien on sinhvien.masv = ds.masv
join ketqua on ketqua.masv = sinhvien.masv

-- bai 12
/*
		Sinh viên học ít nhất 2 học phần mã ’010’, ’011’
*/

select sinhvien.*
from (
		select ketqua.masv, count(ketqua.mahp) as tonghp
		from ketqua
		where (
			ketqua.mahp = '010'
			or
			ketqua.mahp = '011'
		)
		group by ketqua.masv
	) ds
join sinhvien on sinhvien.masv = ds.masv
where (
	ds.tonghp >= 2
)


-- bai 13
/*
		 Sinh viên có điểm TBC cao nhất ở học kỳ 1.
*/

select sinhvien.*
from (
		select top 1 sinhvien.masv, round(avg(ketqua.diem), 2) as diemtbc
		from sinhvien
		join ketqua on ketqua.masv = sinhvien.masv
		join hocphan on hocphan.mahp = ketqua.mahp
		where (
			hocphan.hocky = 1
		)
		group by sinhvien.masv
		order by diemtbc desc
	) ds
join sinhvien on sinhvien.masv = ds.masv


-- bai 14
/*
		 Sinh viên có tổng số điểm các học phần thấp nhất.
*/

select sinhvien.*
from (
		select top 1 sinhvien.masv, sum(ketqua.diem) as diem
		from sinhvien
		join ketqua on ketqua.masv = sinhvien.masv
		join hocphan on hocphan.mahp = ketqua.mahp
		group by sinhvien.masv
		order by diem
	) ds
join sinhvien on sinhvien.masv = ds.masv


-- bai 15
/*
		  Cho biết các học phần có số sinh viên điểm trên 8 nhiều nhất.
*/

select hocphan.*
from (
		select top 1 ketqua.mahp, COUNT(ketqua.mahp) AS soluongsv
		from ketqua
		where ketqua.diem > 8.0
		group by ketqua.mahp
		order by soluongsv
	) ds
join hocphan on hocphan.mahp = ds.mahp

--			Dạng 3: Câu truy vấn lồng nhau				--

-- bai 01
/*
		  Tìm sinh viên không học học phần nào
*/

select sinhvien.*
from sinhvien
where (
	sinhvien.masv not in (
		select distinct ketqua.masv
		from ketqua
	)
)

-- bai 02
/*
		   Tìm sinh viên chưa học học phần có mã ’020’.
*/
SELECT masv,hodem, ten 
FROM SinhVien
WHERE masv NOT IN (
	SELECT masv 
	FROM KetQua
	WHERE mahp = '020'
)

-- bai 03
/*
		  Học phần không có sinh viên nào có điểm >8
*/
SELECT mahp,TenHP 
FROM HocPhan
WHERE mahp NOT IN (
	SELECT mahp 
	FROM KetQua
	WHERE diem > 8
)

-- bai 04
/*
		  Tìm sinh viên không có học phần nào điểm <8
*/
SELECT DISTINCT SinhVien.masv, hodem, ten
FROM SinhVien
WHERE masv NOT IN (
	SELECT DISTINCT masv
	FROM KetQua 
	WHERE diem < 8
)

-- bai 05
/*
		  Cho biết học phần nào không có sinh viên học.
*/
SELECT mahp, tenhp FROM HocPhan
 WHERE mahp NOT IN (SELECT mahp FROM KetQua)

-- bai 06
/*
		  Cho biết tên lớp có sinh viên tên Long.
*/

select lop.tenlop
from lop
where (
	lop.malop in (
		select sinhvien.malop
		from sinhvien
		where (
			sinhvien.ten = 'Long'
		)
	)
)


-- bai 07
/*
		  Tìm sinh viên có điểm học phần ’010’ là <8.
*/

select sinhvien.*
from sinhvien
where (
	sinhvien.masv in (
		select ketqua.masv
		from ketqua
		where (
			ketqua.mahp = '010'
			and
			ketqua.diem < 8
		)
	)
)


-- bai 08
/*
		  Tìm sinh viên có học học phần Toán cao cấp.
*/

select sinhvien.*
from sinhvien
where (
	sinhvien.masv in (
		select distinct ketqua.masv
		from ketqua
		where (
			ketqua.mahp in (
				select hocphan.mahp 
				from hocphan
				where (
					hocphan.tenhp = N'To├ín cao cß║Ñp'  -- Toán cao cấp
				)
			)
		)
	)
)


-- bai 09
/*
		  Tìm sinh viên bằng điểm học phần ’011’ với
 sinh viên có mã là 2401.
*/

select distinct sinhvien.*
from sinhvien
join ketqua on ketqua.masv = sinhvien.masv
where (
	ketqua.diem =
	(
		select ketqua.diem
		from ketqua
		where (
			ketqua.mahp = '011'
			and
			ketqua.masv = '2401'
		)
	)
	and
	(
		sinhvien.masv != '2401'
	)
)


-- bai 10
/*
		  Cho biết danh sách các học phần có số tín chỉ
 lớn hơn hoặc bằng số tín chỉ của học phần ’001’.
*/

select hocphan.*
from hocphan
where (
	hocphan.stc >= 
	(
		select hocphan.stc
		from hocphan
		where (
			hocphan.mahp = '001'
		)
	)
)


--			Dạng 4: ALL, ANY, EXISTS			--

-- bai 01
/*
		  Cho biết sinh viên có điểm cao nhất.
*/

 SELECT SinhVien.masv, hodem, ten, mahp, diem
 FROM KetQua 
 JOIN SinhVien
 ON SinhVien.masv = KetQua.masv
 WHERE diem >= ALL(
	SELECT diem FROM KetQua
)


-- bai 02
/*
		  Cho biết sinh viên có tuổi lớn nhất.
*/

 SELECT hodem, ten, YEAR(GETDATE())- YEAR(ngaysinh)
 FROM SinhVien
 WHERE YEAR(GETDATE())- YEAR(ngaysinh) >= ALL (
	SELECT YEAR(GETDATE())- YEAR(ngaysinh)
	FROM SinhVien
 )

-- bai 03
/*
		  Sinh viên có điểm học phần ’001’ cao nhất.
*/

 SELECT SinhVien.masv, hodem, ten
 FROM KetQua JOIN SinhVien
 ON KetQua.masv = SinhVien.masv
 WHERE mahp = '001' AND diem >= ALL(
	SELECT diem FROM KetQua WHERE mahp = '001'
)

-- bai 04
/*
		  Khoa nào có số lượng sinh viên nhiều nhất.
*/

select top 1 khoa.makhoa, count(sinhvien.masv) as tongsv
from khoa
join nganh on nganh.makhoa = khoa.makhoa
join lop on lop.manganh = nganh.manganh
join sinhvien on sinhvien.malop = lop.malop
group by khoa.makhoa
order by tongsv desc


-- bai 05
/*
		  Cho biết mã sinh viên, mã học phần có điểm lớn
 hơn bất kỳ các điểm của sinh viên mã ’2401’.
*/

select ketqua.masv, ketqua.mahp
from ketqua
where (
	ketqua.diem > any(
		select ketqua.diem
		from ketqua
		where (
			ketqua.masv = '2401'
		)
	)
)

-- bai 06
/*
		  Cho biết sinh viên có điểm học phần nào đó lớn
 hơn gấp rưỡi điểm trung bình của sinh viên đó.
*/

select sinhvien.masv, ketqua.mahp, ketqua.diem
from sinhvien
join ketqua on ketqua.masv = sinhvien.masv
where (
	ketqua.diem > (
		select avg(kq.diem) * 1.5
		from ketqua as kq
		where (
			ketqua.masv = kq.masv
		)
	)
)


-- bai 07
/*
		  Cho biết lớp nào không có sinh viên học.
*/

select lop.*
from lop
where (
	lop.malop != all(
		select distinct sinhvien.malop
		from sinhvien
	)
)


-- bai 08
/*
		  Cho biết sinh viên nào chưa học học phần nào.
*/

select sinhvien.*
from sinhvien
where (
	sinhvien.masv != all(
		select distinct ketqua.masv
		from ketqua
	)
)


-- bai 09
/*
		  Sinh viên nào học cả hai học phần ’001’ và ’002’.
*/

select sinhvien.*
from (
		select ketqua.masv
		from ketqua
		where ketqua.mahp in ('001', '002')
		group by ketqua.masv
		having count(distinct ketqua.mahp) = 2
	) ds
join sinhvien on sinhvien.masv = ds.masv

-- bai 10
/*
		  Sinh viên nào học một trong hai học phần trên.
*/

select sinhvien.*
from (
		select distinct ketqua.masv
		from ketqua
		where (
			ketqua.mahp in ('001', '002')
		)
	) ds
join sinhvien on sinhvien.masv = ds.masv



--			 Dạng 5: Cập nhật, xóa, bổ sung dữ liệu			--


-- bai 01
/*
		  Bổ sung một dòng dữ liệu cho bảng Khoa bộ
 giá trị sau: (’KT’, ’Kế toán’,’0961669078’).
*/

insert into
	khoa (makhoa, tenkhoa, dienthoai) 
values
	(N'KTOAN',N'Kế toán', '0961669078') -- KT bị trùng với Kinh tế thầy ơi =))))

-- bai 02
/*
		  Thêm một sinh viên bất kỳ vào bảng SinhVien.
*/

insert into sinhvien
	(masv, hodem, ten, ngaysinh, gioitinh, noisinh, malop)
values
	(2400, N'Nguyễn Văn', N'Khánh', '2004/02/07', 1, N'Bình Thuận', 'NA24')

-- bai 03
/*
		  Thêm điểm học phần bất kỳ vào bảng KetQua.
*/
insert into ketqua	
	(masv, mahp, diem)
values
	(2400, '001', 10.0)


-- bai 04
/*
		  Xóa các sinh viên có DTB < 3 (buộc thôi học).
*/
delete from sinhvien
where (
	sinhvien.masv in (
		select ketqua.masv
		from ketqua
		join hocphan on hocphan.mahp = ketqua.mahp
		group by ketqua.masv
		having (SUM(ketqua.diem * hocphan.stc) / SUM(hocphan.stc)) < 3.0
	)
)


-- bai 05
/*
		  Xóa các sinh viên không học học phần nào.
*/
delete from sinhvien
where (
	sinhvien.masv not in (
		select distinct ketqua.masv
		from ketqua
	)
)


-- bai 06
/*
		  Xóa khỏi bảng Lop những lớp không có sinh
 viên nào.
*/
delete from lop
where (
	lop.malop not in (
		select distinct sinhvien.malop
		from sinhvien
	)
)


-- bai 07
/*
		  Thêm cột XepLoai vào bảng SinhVien, cập
 nhật dữ liệu cột XepLoai theo yêu cầu sau:
 • Nếu DTB >=8 thì xếp loại Giỏi
 • Nếu DTB >=7 thì xếp loại Khá
 • Nếu DTB >=5 thì xếp loại Trung bình
 • Ngược lại là Yếu
*/
alter table sinhvien add xeploai nvarchar(255)

update sinhvien 
set sinhvien.xeploai = (
	select 	
		CASE
			WHEN ds.dtb >= 8 THEN N'Giỏi' 
			WHEN ds.dtb >= 7 THEN N'Khá' 
			WHEN ds.dtb >= 5 THEN N'Trung bình'
			ELSE N'Yếu'
		END AS dtb_
	from (
		select (SUM(ketqua.diem * hocphan.stc) / SUM(hocphan.stc)) as dtb
		from ketqua
		join hocphan on hocphan.mahp = ketqua.mahp
		where (
			ketqua.masv = sinhvien.masv
		)
	) ds
)


-- bai 08
/*
		  Thêm cột XetLenLop vào bảng SinhVien, cập
 nhật dữ liệu cột XetLenLop theo yêu cầu sau:
 • Nếu DTB >=5 thì được lên lớp, ngược lại
 • Nếu DTB >=3 tạm ngừng tiến độ học tập
 • Ngược lại buộc thôi học
*/

alter table sinhvien add xetlenlop nvarchar(255)

update sinhvien 
set sinhvien.xetlenlop = (
	select 	
		CASE
			WHEN ds.dtb >= 5 THEN N'được lên lớp' 
			WHEN ds.dtb >= 3 THEN N'tạm ngừng tiến độ học tập' 
			ELSE N'buộc thôi học'
		END AS dtb_
	from (
		select (SUM(ketqua.diem * hocphan.stc) / SUM(hocphan.stc)) as dtb
		from ketqua
		join hocphan on hocphan.mahp = ketqua.mahp
		where (
			ketqua.masv = sinhvien.masv
		)
	) ds
)



------
go
drop proc sp_timSV
go


go
create proc sp_timSV (@masv int)
as
	begin
		if not exists (
			select * from sinhvien where masv = @masv
		) 
			print(N'Sinh viên này không tồn tại!')
		 else (
			select * from sinhvien where masv = @masv
		)
	end
go

sp_timSV 2400


go
drop proc sp_sosanhSV
go
go
-- so sánh 2 sinh viên có học cùng lớp hay không
create proc sp_sosanhSV(@masv1 int, @masv2 int)
as
	begin
		if not exists (
			select * from sinhvien where masv = @masv1
		) 
			print(N'Sinh viên 1 không tồn tại!')
		 else if not exists (
			select * from sinhvien where masv = @masv2
		)
			print(N'Sinh viên 2 không tồn tại!')
		else if (@masv1 != @masv2)
			print(N'Cả hai sinh viên không được cùng mã sinh viên')
		else if (
			(select malop from sinhvien where masv = @masv1)
			=
			(select malop from sinhvien where masv = @masv2)
		)
		print(N'Cả hai sinh viên có cùng lớp với nhau!')
		else
		print(N'Cả hai sinh viên không cùng lớp với nhau!')

	end
go

sp_sosanhSV 2400, 2401



