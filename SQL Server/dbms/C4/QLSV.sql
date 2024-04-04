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


----- Dạng 1: Hàm ------'

-- bai 06
/*
	Viết hàm đếm số sinh viên có điểm dưới 8 của
 học phần chỉ định.
*/

go
 CREATE FUNCTION fc_bai06(@mahp nvarchar(255))
 RETURNS int AS
 BEGIN
	 declare @tong int
	 set @tong = (
		 select count(*) as tong
		 from (
			 select distinct ketqua.masv
			 from ketqua
			 where (
				ketqua.diem < 8
				and
				ketqua.mahp = @mahp
			 )
			 group by ketqua.masv
		) ds
	)
	 RETURN @tong
 END
 go


-- bai 07
/*
	Viết hàm đếm số học phần có điểm dưới 8 của
 sinh viên chỉ định.
*/

go
 CREATE FUNCTION fc_bai07(@masv nvarchar(255))
 RETURNS int AS
 BEGIN
	 declare @tong int
	 set @tong = (
		 select count(*) as tong
		 from (
			 select distinct ketqua.mahp
			 from ketqua
			 where (
				ketqua.diem < 8
				and
				ketqua.masv = @masv
			 )
		) ds
	)
	 RETURN @tong
 END
 go


----- Dạng 2: Thủ tục ------

-- bai 03
/*
	Tạo thủ tục bổ sung dữ liệu cho bảng KetQua
*/

go
create proc sp_bai03 (@masv int, @mahp nvarchar(255), @diem float)
AS
	if not exists (select * from sinhvien where masv = @masv)
	begin
		print N'Sinh viên không tồn tại'
		return -1
	end
	insert into ketqua
		(masv, mahp, diem)
	values
		(@masv, @mahp, @diem)

go

-- bai 04
/*
	 Viết thủ tục xóa sinh viên có mã chỉ định.
*/


go
create proc sp_bai04 (@masv int)
AS
	if not exists (select * from sinhvien where masv = @masv)
	begin
		print N'Sinh viên không tồn tại'
		return -1
	end
	delete from ketqua
	where (
		ketqua.masv = @masv
	)
	delete from sinhvien
	where (
		sinhvien.masv = @masv
	)

go


-- bai 05
/*
	 Viết thủ tục cập nhật lại dữ liệu cho khoa có
 mã chỉ định.
*/

go
create proc sp_bai05 (@makhoa nvarchar(255), @tenkhoa nvarchar(255), @dienthoai nvarchar(255))
AS
	if not exists (select * from khoa where makhoa = @makhoa)
	begin
		print N'Khoa không tồn tại'
		return -1
	end
	update khoa
	set tenkhoa = @tenkhoa, dienthoai = @dienthoai
	where (
		khoa.makhoa = @makhoa
	)
go

-- bai 06
/*
	 Viết thủ tục cập nhật lại điểm có mã chỉ định.
*/


go
create proc sp_bai06 (@masv int, @mahp nvarchar(255), @diem float)
AS
	if not exists (select * from sinhvien where masv = @masv)
	begin
		print N'Sinh viên không tồn tại'
		return -1
	end
	update ketqua
	set diem = @diem
	where (
		ketqua.masv = @masv
		and
		ketqua.mahp = @mahp
	)
go

-- bai 07
/*
	 Viết thủ tục phân lớp thành 2 lớp A,B với điều
 kiện là: Nếu Mã sinh viên là số lẻ thì là lớp A,
 nếu Mã sinh viên là chẵn thì là lớp B.
*/

go
create proc sp_bai07 (@masv int)
AS
	if not exists (select * from sinhvien where masv = @masv)
	begin
		print N'Sinh viên không tồn tại'
		return -1
	end
	if (@masv % 2 = 0)
	begin
		print N'Lớp B'
	end
	else
	begin
		print N'Lớp A'
	end
go

-- bai 08
/*
	 Viết thủ tục phân lớp thành A,B,C,D,.. bất kỳ
 với số lượng lớp chỉ định. Phân lớp được quy
 định như sau:
 • Nếu Mã sinh viên chia cho số lớp dư 0 là
 lớp ‘A’
 • Nếu Mã sinh viên chia cho số lớp dư 1 là
 lớp ‘B’
 • ..
*/

go
create proc sp_bai08(@soluong int)
as
begin
    declare @Class table (
        masv nvarchar(255),
        lop nvarchar(1)
    )

    declare @i int = 0

    while @i < @soluong
    begin
        insert into @Class (masv, lop)
        select masv, 
               case 
                   when masv % @soluong = @i then char(65 + @i)
               end
        from sinhvien

        set @i = @i + 1
    end

    select * from @Class;
end
go


-- bai 09
/*
	 Viết thủ tục hiển thị danh sách gồm mã sinh
 viên, họ tên, mã lớp, mã học phần, điểm của
 những sinh viên có điểm nhỏ hơn số chỉ định,
 nếu không có thì hiển thị thông báo không có
 sinh viên nào.
*/


go
create proc sp_bai09 (@diem float)
AS
	if exists (select * from ketqua where (diem < @diem))
	begin
		select sinhvien.masv, hodem + ' ' + ten as hoten,
			malop, mahp, diem
		from ketqua
		join sinhvien on sinhvien.masv = ketqua.masv
		where (
			ketqua.diem < @diem
		)
	end
	else
		print N'Không có sinh viên nào'
go

-- bai 10
/*
	 Viết thủ tục hiển thị họ tên sinh viên chưa học
 học phần có mã chỉ định. Kiểm tra mã học
 phần có trong danh mục không, Nếu không có
 thì hiển thị thông báo không có học phần này.
*/


go
create proc sp_bai10 (@mahp nvarchar(255))
AS
	if exists (select * from hocphan where (mahp = @mahp))
	begin
		select hodem + ' ' + ten as hoten
		from sinhvien
		where (
			sinhvien.masv not in (
				select masv
				from ketqua
				where (
					mahp = @mahp
				)
			)
		)

	end
	else
		print N'Không có học phần này'
go


-- bai 11
/*
	 Viết thủ tục hiển thị danh sách gồm: mã sinh
 viên, họ tên, mã lớp, ngày sinh (dd/mm/yyyy),
 giới tính (Nam, Nữ), tuổi của những sinh viên
 có tuổi trong khoảng chỉ định. Nếu không có
 thì hiển thị thông báo không có sinh viên nào.
*/


go
create proc sp_bai11 (@tuoi int)
AS
	if exists (select * from sinhvien where ((year(CURRENT_TIMESTAMP) - year(ngaysinh)) = @tuoi))
	begin
		select masv, hodem + ' ' + ten as hoten, malop, ngaysinh, 
		CASE gioitinh
			WHEN 0 THEN N'Nu' 
			WHEN 1 THEN N'Nam'
		END AS gioitinh
		, (year(CURRENT_TIMESTAMP) - year(ngaysinh)) as tuoi
		from sinhvien
		where (
			(year(CURRENT_TIMESTAMP) - year(ngaysinh)) = @tuoi
		)

	end
	else
		print N'Không có sinh viên nào'
go

-- bai 12
/*
	 Viết thủ tục cho biết mã khoa, tên khoa, tổng
 số sinh viên của khoa chỉ định. Kiểm tra điều
 kiện mã khoa có trong bảng danh mục không.
*/


go
create proc sp_bai12 (@makhoa nvarchar(255))
AS
	if not exists (select * from khoa where makhoa = @makhoa)
	begin
		print N'Khoa không tồn tại'
		return -1
	end
	select khoa.makhoa, khoa.tenkhoa, count(sinhvien.masv) as tongsinhvien
	from khoa
	join nganh on nganh.makhoa = khoa.makhoa
	join lop on lop.manganh = nganh.manganh
	join sinhvien on sinhvien.malop = lop.malop
	where (
		khoa.makhoa = @makhoa
	)
	group by khoa.makhoa, khoa.tenkhoa
go


-- bai 13
/*
	 Viết thủ tục cho biết mã lớp, tên lớp, tổng số
 sinh viên mỗi lớp của khoa có mã chỉ định,
 Kiểm tra điều kiện mã khoa có trong bảng danh
 mục không, Nếu không có thì hiển thị thông
 báo Không có lớp này.
*/


go
create proc sp_bai13 (@makhoa nvarchar(255))
AS
	if not exists (
		select *
		from lop
		join nganh on nganh.manganh = lop.manganh
		join khoa on khoa.makhoa = nganh.makhoa
		where khoa.makhoa = @makhoa
	)
	begin
		print N'Không có lớp này'
		return -1
	end
	select lop.malop, lop.tenlop, count(sinhvien.masv) as tongsinhvien
	from lop
	join nganh on nganh.manganh = lop.manganh
	join khoa on khoa.makhoa = nganh.makhoa
	join sinhvien on sinhvien.malop = lop.malop
	where (
		khoa.makhoa = @makhoa
	)
	group by lop.malop, lop.tenlop
go

-- bai 14
/*
	 Viết thủ tục tính điểm trung bình từng học kỳ
 theo từng sinh viên của lớp có mã chỉ định.
*/

go
create proc sp_bai14 (@hocky int,@malop char(4))
 AS
	 IF NOT EXISTS (SELECT *
	 FROM SinhVien
	 WHERE malop = @malop)
	 BEGIN
		 PRINT N'Lớp không có sinh viên'
		 RETURN-1
	 END
	 SELECT SV.masv, hodem,
		ten, SUM(diem*stc)/SUM(stc) AS DTB
	 FROM KetQua 
	 JOIN HocPhan ON KetQua.mahp = HocPhan.mahp
	 JOIN SinhVien AS SV ON SV.masv = KetQua.masv
	 WHERE malop = @malop
		AND hocky = @hocky
	 GROUP BY SV.masv, hodem, ten


-- bai 15
/*
	 Viết thủ tục hiển thị danh sách gồm: mã sinh
 viên, họ tên, mã lớp, mã khoa, ngày sinh (định
 dạng dd/mm/yyyy), giới tính (Nam, Nữ) của
 những sinh viên ở khoa có mã chỉ định, nếu
 không có thì hiển thị thông báo Không có sinh
 viên nào.
*/


go
create proc sp_bai15 (@makhoa nvarchar(255))
AS
	if not exists (
		select * 
		from sinhvien 
		join lop on lop.malop = sinhvien.malop
		join nganh on nganh.manganh = lop.manganh
		join khoa on khoa.makhoa = nganh.makhoa
		where khoa.makhoa = @makhoa
	)
	begin
		print N'Không có sinh viên nào'
		return -1
	end
	select sinhvien.masv, sinhvien.hodem + ' ' + sinhvien.ten as hoten, sinhvien.malop, khoa.makhoa, FORMAT(sinhvien.ngaysinh, 'dd/MM/yyyy') AS ngaysinh, 
		case gioitinh
			WHEN 0 THEN N'Nu' 
			WHEN 1 THEN N'Nam'
		END AS gioitinh
	from sinhvien
	join lop on lop.malop = sinhvien.malop
	join nganh on nganh.manganh = lop.manganh
	join khoa on khoa.makhoa = nganh.makhoa
	where (
		khoa.makhoa = @makhoa
	)
go

-- bai 16
/*
	 Viết thủ tục cho biết mã sinh viên, họ tên của
 những sinh viên học lớp có mã chỉ định.
*/

go
create proc sp_bai16 (@malop nvarchar(255))
AS
	if not exists (
		select * 
		from sinhvien 
		join lop on lop.malop = sinhvien.malop
		where sinhvien.malop = @malop
	)
	begin
		print N'Không có sinh viên nào'
		return -1
	end
	select sinhvien.masv, sinhvien.hodem + ' ' + sinhvien.ten as hoten
	from sinhvien
	join lop on lop.malop = sinhvien.malop
	where (
		lop.malop = @malop
	)
go

-- bai 17
/*
	 Viết thủ tục cho biết họ tên sinh viên không có
 điểm dưới 8 ở lớp có mã chỉ định.
*/

go
create proc sp_bai17 (@malop nvarchar(255))
AS
	if not exists (
		select * 
		from sinhvien 
		join lop on lop.malop = sinhvien.malop
		where sinhvien.malop = @malop
	)
	begin
		print N'Không có sinh viên nào'
		return -1
	end
	select sinhvien.masv, sinhvien.hodem + ' ' + sinhvien.ten as hoten
	from sinhvien
	join lop on lop.malop = sinhvien.malop
	where (
		lop.malop = @malop
		and
		(
			sinhvien.masv not in (
				select masv
				from ketqua
				where (
					ketqua.diem < 8.0
				)
			)
		)
	)
go

----- Dạng 3: Trigger ------

-- bai 04
/*
	Tạo trigger không cho phép xóa các sinh viên
 ở lớp PM24.
*/

go
CREATE TRIGGER trg_xoaSV
 ON SinhVien
 FOR DELETE
 AS
	 IF EXISTS(SELECT *
	 FROM DELETED WHERE malop = 'PM24')
	 BEGIN
	 PRINT N'Không thể xóa sv lớp PM24'
	 ROLLBACK TRANSACTION
	 END


-- bai 05
/*
	Tạo trigger không cho phép xóa nhiều hơn hai
 lớp trong bảng Lop.
*/

go
 CREATE TRIGGER trg_xoaLop
 ON Lop
 FOR DELETE
 AS
	 IF ((SELECT COUNT(*) FROM DELETED) > 2)
	 BEGIN
	 PRINT N'Không thể xóa hơn 2 lớp'
	 ROLLBACK TRANSACTION
	 END


-- bai 06
/*
	Tạo trigger sao cho khi xóa một sinh viên mới
 từ bảng SinhVien thì sỉ số của lớp tương ứng
 trong bảng Lop tự động giảm xuống 1.
*/

go
create trigger trg_giam_si_so_lop
on sinhvien 
for delete
as
	update lop
	set siso = siso - 1
	where (
		lop.malop in (
			select malop
			from deleted
		)
	)
go

-- bai 07
/*
	Tạo trigger kiểm tra điều kiện cho cột điểm là
 <=10.
*/

go
create trigger trg_kiem_tra_cot_diem
on ketqua
for insert
as
	if (select diem from inserted) > 10
	begin
		print N'Điểm không hợp lệ'
		rollback transaction
	end
go

-- bai 08
/*
	Tạo trigger bẫy lỗi cho khoá ngoại của bảng
 SinhVien khi chỉnh sửa.
*/

go
create trigger trg_bay_loi_sinhvien
on sinhvien
after update
as
begin
	if (select malop from inserted) != any(select malop from lop)
	begin
		print N'Lốp không tồn tại'
		rollback transaction
	end
end
go

-- bai 09
/*
	 Tạo trigger sao cho khi cập nhật mã lớp một
 sinh viên trong bảng SinhVien thì sỉ số của lớp
 tương ứng trong bảng Lop tự động thay đổi.
*/

go
create trigger trg_cap_nhat_si_so
on sinhvien
after update
as
begin
	update lop
	set siso = siso + 1
	where (
		lop.malop in (
			select malop
			from inserted
		)
	)

	update lop
	set siso = siso - 1
	where (
		lop.malop in (
			select malop
			from deleted
		)
	)
end
go

-- bai 10
/*
	 Tạo trigger sao cho khi sửa mã lớp những sinh
 viên trong bảng SinhVien thì sỉ số của lớp
 tương ứng trong bảng Lop tự động thay đổi.
*/


go
create trigger trg_cap_nhat_si_so
on sinhvien
after update
as
begin
	update lop
	set siso = siso + 1
	where (
		lop.malop in (
			select malop
			from inserted
		)
	)

	update lop
	set siso = siso - 1
	where (
		lop.malop in (
			select malop
			from deleted
		)
	)
end
go



---------------------------------------------------------