-- 221402 - KhanhNguyen9872

use master;
ALTER DATABASE QLNV SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE QLNV SET ONLINE;

DROP DATABASE QLNV;


CREATE DATABASE QLNV;
GO
use QLNV;
GO

create table Phong (
	maph char(3),
	tenph nvarchar(40),
	diachi nvarchar(50),
	tel char(10)
)

CREATE TABLE DMNN (
	mann char(2),
	tennn nvarchar(20)
);

CREATE TABLE NhanVien (
	manv char(5),
	hoten nvarchar(40),
	gioitinh nchar(3),
	ngaysinh date,
	luong int,
	maph char(3),
	sdt char(10),
	ngaybc date
);

create table TDNN (
	manv char(5),
	mann char(2),
	tdo char(1)
)

-- 1. Nhập dữ liệu cho các bảng trong cơ sở dữ liệu QLNV

delete from Phong
insert into Phong
	(maph, tenph, diachi, tel)
values 
	('HCA', N'Hành chính', N'371 Nguyễn Kiệm', '0362588541'),
	('KDA', N'Kinh Doanh', N'371 Nguyễn Kiệm', '0362517395'),
	('KTA', N'Kỹ thuật', N'371 Nguyễn Kiệm', '0362567401'),
	('QTA', N'Quản trị', N'371 Nguyễn Kiệm', '0362565788')

delete from DMNN
insert into DMNN
	(mann, tennn)
values
	('01', N'Anh'),
	('02', N'Nga'),
	('03', N'Pháp'),
	('04', N'Nhật'),
	('05', N'Trung Quốc'),
	('06', N'Hàn Quốc')

delete from NhanVien
insert into NhanVien
	(manv, hoten, gioitinh, ngaysinh, luong, maph, sdt, ngaybc)
values
	('HC001', N'Nguyễn Thị Hà', N'Nữ', '08/27/1966', 7500000, 'HCA', '', '08/02/1995'),
	('HC002', N'Trần Văn Nam', N'Nam', '12/06/1995', 8000000, 'HCA', '', '08/06/2017'),
	('HC003', N'Nguyễn Thanh Huyền', N'Nữ', '03/07/1998', 6500000, 'HCA', '', '09/24/2019'),
	('KD001', N'Lê Tuyết Anh', N'Nữ', '03/02/1992', 7500000, 'KDA', '', '02/10/2021'),
	('KD002', N'Nguyễn Anh Tú', N'Nam', '04/07/1962', 7600000, 'KDA', '', '07/14/2000'),
	('KD003', N'Phạm An Thái', N'Nam', '09/05/1977', 6600000, 'KDA', '', '10/13/2019'),
	('KD004', N'Lê Văn Hải', N'Nam', '02/01/1976', 7900000, 'KDA', '', '08/06/2017'),
	('KD005', N'Nguyễn Phương Minh', N'Nam', '02/01/1980', 7000000, 'KDA', '', '02/10/2021'),
	('KT001', N'Trần Đình Khâm', N'Nam', '02/12/1971', 7700000, 'KTA', '', '01/01/2022'),
	('KT003', N'Phạm Thanh Sơn', N'Nam', '08/20/1994', 7100000, 'KTA', '', '01/01/2022'),
	('KT004', N'Vũ Thị Hoài', N'Nữ', '05/12/1995', 7500000, 'KTA', '', '02/10/2021'),
	('KT005', N'Nguyễn Thu Lan', N'Nữ', '05/10/1994', 8000000, 'KTA', '', '02/10/2021'),
	('KT006', N'Trần Hoài Nam', N'Nam', '02/07/1978', 7800000, 'KTA', '', '08/06/2017'),
	('TT007', N'Hoàng Nam Sơn', N'Nam', '03/12/1969', 8200000, '', '', '02/07/2015'),
	('KT008', N'Lê Thu Trang', N'Nữ', '06/07/1970', 7500000, 'KTA', '', '02/08/2018'),
	('KT009', N'Khúc Nam Hải', N'Nam', '07/22/1980', 7000000, 'KTA', '', '01/01/2015'),
	('TT010', N'Phùng Trung Dũng', N'Nam', '08/28/1978', 7200000, '', '', '09/24/2012')

delete from TDNN
insert into TDNN
	(manv, mann, tdo)
values
	('HC001', '01', 'A'),
	('HC001', '02', 'B'),
	('HC002', '01', 'C'),
	('HC002', '03', 'C'),
	('HC003', '01', 'D'),
	('KD001', '01', 'C'),
	('KD001', '02', 'B'),
	('KD002', '01', 'D'),
	('KD002', '02', 'A'),
	('KD003', '01', 'B'),
	('KD003', '02', 'C'),
	('KD004', '01', 'C'),
	('KD004', '04', 'A'),
	('KD004', '05', 'A'),
	('KD005', '01', 'B'),
	('KD005', '02', 'D'),
	('KD005', '03', 'B'),
	('KD005', '04', 'B'),
	('KT001', '01', 'D'),
	('KT001', '04', 'E'),
	('KT003', '01', 'D'),
	('KT003', '03', 'C'),
	('KT004', '01', 'D'),
	('KT005', '01', 'C')

-- 2. Thêm bản thân vào database

insert into NhanVien
	(manv, hoten, gioitinh, ngaysinh, luong, maph, sdt, ngaybc)
values
	('QT001', N'Nguyễn Văn Khánh', N'Nam', '02/07/2004', 8000000, 'QTA', '0937927513', '01/01/2023')

insert into TDNN
	(manv, mann, tdo)
values
	('QT001', '01', 'C'),
	('QT001', '04', 'A')

-- 3. Thêm ràng buộc vào các bảng

-- Phong
alter table Phong alter column maph char(3) not null
alter table Phong alter column tenph nvarchar(40) not null
alter table Phong add constraint pk_Phong primary key (maph)

-- DMNN
alter table DMNN alter column mann char(2) not null
alter table DMNN alter column tennn nvarchar(20) not null
alter table DMNN add constraint pk_DMNN primary key (mann)

-- NhanVien
alter table NhanVien alter column manv char(5) not null
alter table NhanVien alter column hoten nvarchar(40) not null
alter table NhanVien add constraint pk_NhanVien primary key (manv)

-- TDNN
alter table TDNN alter column tdo char(1) not null
alter table TDNN add constraint fk_manv foreign key (manv) references NhanVien(manv)
alter table TDNN add constraint fk_mann foreign key (mann) references DMNN(mann)

----- BAI TAP THUC HANH SO 2 -----

-- 1. Tạo thủ tục hoặc hàm tìm nhân viên theo mã nhân viên (ví dụ timNV 'HC001' sẽ in ra thông tin nhân viên này)

go
create proc timNV (@manv char(5))
as
begin
	select *
	from NhanVien
	where manv = @manv
end

-- 2. Tạo thủ tục hoặc hàm có đếm số lượng nhân viên nam và nữ (ví dụ demNV N'Nam' sẽ in ra số lượng nhân viên nam).

go
create proc demNV (@gioitinh nchar(3))
as
begin
	select count(manv)
	from NhanVien
	where gioitinh = @gioitinh
end

-- 3. Tạo thủ tục hoặc hàm hiển thị mã các ngoại ngữ của nhân viên (ví dụ DSNgoaingu N'Nguyễn Thị Hà' sẽ in ra các ngoại ngữ của 'Nguyễn Thị Hà').

go
create proc DSNgoaingu (@tennv nvarchar(40))
as
begin
	select mann
	from TDNN
	join NhanVien on NhanVien.manv = TDNN.manv
	where NhanVien.hoten = @tennv
end

-- 4. Tạo thủ tục hoặc hàm in ra danh sách nhân viên có trình độ ngoại ngữ cần tìm (ví dụ timNVNN N'Anh' sẽ in ra những nhân viên có trình độ tiếng Anh).

go
create proc timNVNN (@tennn nvarchar(200))
as
begin
	select NhanVien.*
	from TDNN
	join NhanVien on NhanVien.manv = TDNN.manv
	join DMNN on DMNN.mann = TDNN.mann
	where DMNN.tennn = @tennn
end

-- 5. Tạo thủ tục hoặc hàm cập nhật sdt cho các nhân viên (thủ tục có hai tham số đầu vào gồm mã nhân viên, số điện thoại). Nếu không tìm thấy nhân viên cần cập nhật thì in ra ghi chú 'Không tìm thấy nhân viên'. Ngược lại, cho phép cập nhật.

go
create proc capnhatSDT (@manv char(5), @sdt char(10))
as
begin
	if not exists (select * from NhanVien where manv = @manv)
	begin
		print N'Không tìm thấy nhân viên này'
		return -1
	end
	update NhanVien
	set sdt = @sdt
	where manv = @manv
end

-- 6. Viết thủ tục hoặc hàm có tham số đưa vào là manv, hoten, gioitinh, ngaysinh, luong, maph, sdt, ngaybc. Trước khi chèn một bản ghi mới vào bảng NhanVien thì phải kiểm tra xem manv và maph đã tồn tại bên bảng Phong chưa.

go
create proc proc_bai06(@manv char(5), @hoten nvarchar(40), @gioitinh nchar(3), @ngaysinh date, @luong int, @maph char(3), @sdt char(10), @ngaybc date)
as
begin
	if exists (select * from NhanVien where manv = @manv)
	begin
		print N'Nhân viên này đã tồn tại'
		return -1
	end
	insert into NhanVien
		(manv, hoten, gioitinh, ngaysinh, luong, maph, sdt, ngaybc)
	values
		(@manv, @hoten, @gioitinh, @ngaysinh, @luong, @maph, @sdt, @ngaybc)
end

-- 7. Tạo hàm có đầu vào là tennn và đầu ra là tổng số lượng nhân viên đã học ngoại ngữ này.

go
create function fc_bai07(@tennn nvarchar(20))
returns int 
as
begin
	return (
		select count(manv)
		from TDNN
		join DMNN on DMNN.mann = TDNN.mann
		where (
			DMNN.tennn = N'Anh'
		)
	)
end


-- 8. Tạo hàm có:
--		Đầu vào: Tuoi1, Tuoi2
--		Đầu ra: tổng số nhân viên trong cơ quan có độ tuổi trong khoảng Tuoi1 và Tuoi2

go
create function fc_bai08(@Tuoi1 int, @Tuoi2 int)
returns int 
as 
begin
	return (
		select count(manv)
		from NhanVien
		where (year(current_timestamp) - year(ngaysinh)) between @Tuoi1 and @Tuoi2
	)
end

-- 9. Viết hàm fc_timgioitinhNV cho biết giới tính của nhân viên (Ví dụ fc_timgioitinhNV 'HC001' sẽ cho biết giới tính của nhân viên này).

go
create function fc_timgioitinhNV(@manv char(5))
returns char(3) 
as
begin
	return (
		select gioitinh
		from NhanVien
		where manv = @manv
	)
end

-- 10. Viết hàm cho biết nhân viên nào có mức lương lớn hơn mức lương trung bình của phòng Kinh Doanh.

go
create function fc_bai10()
returns table
as
return (
	select *
	from NhanVien
	where luong > (
		select avg(luong)
		from NhanVien
		join Phong on Phong.maph = NhanVien.maph
		where Phong.tenph = 'Kinh Doanh'
	)
)

-- 11. Viết hàm fc_timSoluongNV cho biết số lượng nhân viên của từng phòng.

go
create function fc_timSoluongNV()
returns table
as
return (
	select Phong.maph, count(NhanVien.manv) as tong
	from Phong
	join NhanVien on NhanVien.maph = Phong.maph
	group by Phong.maph
)

-- 12. Viết hàm fc_timTongluongNV cho biết tổng lương nhân viên của từng phòng.

go
create function fc_timTongluongNV()
returns table
as
return (
	select Phong.maph, sum(NhanVien.luong) as tongLuong
	from Phong
	join NhanVien on NhanVien.maph = Phong.maph
	group by Phong.maph
)

-- 13. Viết hàm fc_kiemtraHuu cho biết nhân viên năm nay đã đủ tuổi nghỉ hưu hay chưa (Nam >= 60 tuổi, Nữ >= 55 tuổi).

go
create function fc_kiemtraHuu(@manv char(5))
returns nvarchar(255)
as
begin
	if not exists (select * from NhanVien where manv = @manv)
	begin
		print N'Không tìm thấy nhân viên này'
		return -1
	end
	declare @kq nvarchar(255)
	if exists (
		select * 
		from NhanVien
		where 
			manv = @manv 
				and 
			(
				((gioitinh = N'Nam') and (year(current_timestamp) - year(ngaysinh)) >= 60)
				or
				((gioitinh = N'Nữ') and (year(current_timestamp) - year(ngaysinh)) >= 60)
			)
	)
	begin
		set @kq = N'Đã đủ tuổi nghỉ hưu'
	end
	else
	begin
		set @kq = N'Chưa đủ tuổi nghỉ hưu'
	end
	return @kq
end

-- 14. Tạo khung nhìn tên là vwNVANH gồm các thuộc tính mã nhân viên, tên nhân viên, trình độ tiếng Anh của những nhân viên này.

go
create view vwNVANH 
as
	select NhanVien.manv, hoten, tdo
	from NhanVien
	join TDNN on TDNN.manv = NhanVien.manv
	join DMNN on DMNN.mann = TDNN.mann
	where tennn = N'Anh'

-- 15. Tạo khung nhìn tên vwDSTA đưa ra danh sách các nhân viên học tiếng Anh (mã nhân viên, họ tên, ngày sinh, giới tính, tên phòng, trình độ). Sau đó dựa vào khung nhìn này để thực hiện:
--		a. Đưa ra danh sách các nhân viên có trình độ tiếng Anh từ loại C trở lên.
--		b. Tạo khung nhìn tên vwTAKD đưa ra danh sách nhân viên phòng Kinh Doanh học tiếng Anh
--		c. Thực hiện thử một câu lệnh Insert, Delete, Update vào khung nhìn.

go
create view vwDSTA
as
	select NhanVien.manv, hoten, ngaysinh, gioitinh, tenph, tdo
	from NhanVien
	join Phong on Phong.maph = NhanVien.maph
	join TDNN on TDNN.manv = NhanVien.manv
	join DMNN on DMNN.mann = TDNN.mann
	where tennn = N'Anh'

--		a.

select *
from vwDSTA
where tdo < 'C'

--		b.

go
create view vwTAKD
as
	select *
	from vwDSTA
	where tenph = N'Kinh Doanh'

--		c.

insert into vwDSTA
	(manv, hoten, ngaysinh, gioitinh, tenph, tdo)
values
	('QT002', N'Nguyễn Văn Khánh', '02/07/2004', N'Nam', 'Quản trị', 'A')

-- 16. Tạo khung nhìn có tên vwNV_TRE để đưa ra danh sách các nhân viên có độ tuổi trong dưới 35. Sau đó dựa trên khung nhìn thực hiện các công việc sau:
--		a. In danh sách các nhân viên có độ tuổi từ 25 đến 30.
--		b. Thực hiện thử một câu lệnh Insert, Delete, Update vào khung nhìn vwNV_TRE
--		c. Xóa vwNV_TRE sau đó tạo lại view này với mệnh đề WITH CHECK OPTION và thực hiện các câu lệnh Insert, Update, Delete trên view này.

go
create view vwNV_TRE
as
	select *
	from NhanVien
	where (year(current_timestamp) - year(ngaysinh)) < 35

--		a. 

select *
from vwNV_TRE
where (year(current_timestamp) - year(ngaysinh)) between 25 and 30

--		b.

insert into vwNV_TRE
	(manv, hoten, gioitinh, ngaysinh, luong, maph, sdt, ngaybc)
values
	('QT002', N'Nguyễn Văn Khánh', N'Nam', '02/07/2004', 8000000, 'QTA', '0937927513', '01/01/2023')

--		c.

drop view vwNV_TRE
go
create view vwNV_TRE
as
	select *
	from NhanVien
	where (year(current_timestamp) - year(ngaysinh)) < 35
with check option

insert into vwNV_TRE
	(manv, hoten, gioitinh, ngaysinh, luong, maph, sdt, ngaybc)
values
	('QT003', N'Nguyễn Văn Khánh', N'Nam', '02/07/2004', 8000000, 'QTA', NULL, '01/01/2023')

update vwNV_TRE
set sdt = '0937927513'
where manv = 'QT003'

delete from vwNV_TRE
where manv = 'QT003'