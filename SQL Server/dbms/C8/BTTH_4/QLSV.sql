-- 221402 - KhanhNguyen9872

use master;
ALTER DATABASE QLSV SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE QLSV SET ONLINE;

DROP DATABASE QLSV;

CREATE DATABASE QLSV
GO
USE QLSV
GO

create table Khoa(
	makhoa VARCHAR(50) primary key,
	tenkhoa NVARCHAR(50),
	diachi NVARCHAR(50),
	dienthoai INT
)

create table SinhVien(
	masv VARCHAR(50) primary key,
	hoten NVARCHAR(50),
	ngaysinh DATE,
	makhoa VARCHAR(50)
	FOREIGN KEY (makhoa) REFERENCES khoa(makhoa)
)

create table MonHoc(
	mamon VARCHAR(50) primary key,
	tenmon NVARCHAR (50),
	stc INT,
	tengv NVARCHAR(50)
)

create table DangKyHoc(
	masv VARCHAR(50) ,
	mamon VARCHAR(50),
	hocky INT,
	FOREIGN KEY (masv) REFERENCES SinhVien(masv),
    FOREIGN KEY (mamon) REFERENCES MonHoc(mamon)
)

insert into Khoa 
	(makhoa,tenkhoa, diachi, dienthoai)
values
	('TOAN', 'Toán-Tin','Nhà C','0375473250'),
	('CNTT', 'Công nghệ thông tin','Nhà C','0375471002'),
	('DIAL','Địa lý','Nhà A1',null),
	('HOAH','Hóa học','Nhà A2',null)

insert into SinhVien
	(masv,hoten, ngaysinh, makhoa)
values
	('K6100001','Phạm Văn Bình','2003-02-24','TOAN'),
	('K6100002','Nguyễn Thị Hoài','2002-04-12','CNTT'),
	('K6100003','Trần Ngọc','2003-04-15','DIAL'),
	('K6100004','Nguyễn Tấn Dũng ','2002-12-23','CNTT'),
	('K6100005','Trương Tấn Sang ','2002-12-04','DIAL'),
	('K6100006','Nguyễn Sinh Hùng','2002-03-13','HOAH')

insert into MonHoc
	(mamon, tenmon,stc, tengv)
values 
	('GT1','Giải tích 1','2','Đỗ Đức Thái'),
	('DSTT','Đại số tuyến tính','3','Nguyễn Văn Trào'),
	('HH','Hình học Afin','2','Lê Minh Tuấn'),
	('XSTK','Xác suất thống kê','2','Đỗ Đức Thái')

insert into DangKyHoc
	(masv,mamon,hocky)
values
	('K6100001','GT1','1'),
	('K6100001','DSTT','2'),
	('K6100001','HH','1'),
	('K6100002','DSTT','1'),
	('K6100002','XSTK','2'),
	('K6100002','GT1','1'),
	('K6100003','HH','1'),
	('K6100003','GT1','1'),
	('K6100003','XSTK','2'),
	('K6100004','XSTK','2'),
	('K6100004','DSTT','3'),
	('K6100004','DSTT','1'),
	('K6100005','GT1','1')

--1 thủ tục có tên DSMonhoc hiển thị mã các môn đăng ký học bởi sinh viên trước đó
go
create proc DSMonhoc(@hoten NVARCHAR(50))
as
begin
	select Monhoc.mamon from DangKyHoc,SinhVien, MonHoc
	where DangKyHoc.masv=SinhVien.masv
	and DangKyHoc.mamon=MonHoc.mamon and SinhVien.hoten=@hoten
end

--2 thủ tục DSSinhVien hiển thị danh sách danh sách các sinh viên đăng ký môn học trước trong 1 kỳ nào đó
go
create proc DSSinhVien(@tenmon NVARCHAR(50), @hocky INT)
as
begin
    select sv.masv, sv.hoten, k.tenkhoa
    from SinhVien sv, DangKyHoc dk, MonHoc mh, Khoa k
    where sv.masv = dk.masv
       and dk.mamon = mh.mamon
        and sv.makhoa = k.makhoa
        and mh.tenmon = @tenmon
        and dk.hocky = @hocky
end

--3 viết thủ tục DSMonhoc hiển tị danh sách các môn học sinh viên đăng ký trong 1 học kỳ nào đó
go
create proc DSMonhoc1(@hocky INT)
as
begin 
	select distinct mh.mamon, mh.tenmon, mh.stc, mh.tengv
	from MonHoc mh
	inner join DangKyHoc dk ON mh.mamon = dk.mamon
	where dk.hocky=@hocky
end

--4 tạo khung nhinnf có DSSinhvientheokhoa hiển thị danh sách sinh viên sắp xếp theo tên khoa mỗi khoa sắp xếp theo họ tên 
go
create view DSSinhvientheokhoa 
as
	select sv.masv, sv.hoten, sv.ngaysinh, k.tenkhoa
	from SinhVien sv, Khoa k
	where sv.makhoa = k.makhoa
	order by tenkhoa, hoten

--5 viết hàm SoluongSV cho số lượng sinh vien của một khoa
go
create function SoluongSV(@tenkhoa nvarchar (50))
returns int
as
begin 
	declare @soluong int
	select @soluong=count(sv.masv)
	from SinhVien sv
	join Khoa k on sv.makhoa=k.makhoa
	where k.tenkhoa=@tenkhoa
	return @soluong
end

--6 viết hàm thay thế thủ tục trong câu 1,2,3
-- hàm thay thế cho câu 1
go
create function DSMonhoc2(@hoten NVARCHAR (50))
returns table 
as 
return (
	select MonHoc.mamon
	from DangKyHoc, SinhVien, MonHoc
	where DangKyHoc.masv=SinhVien.masv and DangKyHoc.mamon =MonHoc.mamon
	and SinhVien.hoten=@hoten
)

-- hàm thay thế cho câu 2
go 
create function DSSinhVien2(@tenmon nvarchar (50),@hocky int)
returns table 
as 
return (
	select sv.masv, sv.hoten,k.tenkhoa
	from SinhVien sv, DangKyHoc dk, MonHoc mh, Khoa k
	where sv.masv=dk.masv and dk.mamon=mh.mamon and sv.makhoa=k.makhoa
	and mh.tenmon=@tenmon and dk.hocky=@hocky
)

-- hàm thay thế câu 3
go
create function DSMonhoc3(@hocky int)
returns table
as
return (
	select distinct mh.mamon, mh.tenmon, mh.stc, mh.tengv
	from MonHoc mh, DangKyHoc dk
	where mh.mamon= dk.mamon and dk.hocky = @hocky
)

-- 7 viết hàm hiển thị danh sách sinh viên đăng ký nhiều môn học nhất 
go
create function DanhSachSVDKnhieumonhocnhat()
returns table 
as 
return (
	select top 1 with ties sv.masv, sv.hoten, COUNT(dk.mamon) as somonhocdangky
	from SinhVien sv, DangKyHoc dk
    where sv.masv = dk.masv
    group by sv.masv, sv.hoten
    order by COUNT(dk.mamon) desc
)

--8 viết hảm hiển thị danh sách sinh viên đăng ký ít môn học nhất
go
create function DanhSachSVDKitmonhocnhat()
returns table 
as 
return (
	select top 1 with ties sv.masv, sv.hoten, COUNT(dk.mamon) as somonhocdangky
	from SinhVien sv, DangKyHoc dk
    where sv.masv = dk.masv
    group by sv.masv, sv.hoten
    order by COUNT(dk.mamon) asc
)
