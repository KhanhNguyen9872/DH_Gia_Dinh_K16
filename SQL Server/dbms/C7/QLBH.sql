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
	tenmh nvarchar(255),
	dvt nvarchar(255),
	gia int
);

create table khachhang (
	-- makh,tenkh,diachi,sdt,loaikh
	-- KH01,Nguyễn Mai Chi,HCM,0164652182,VIP
	makh nvarchar(255) primary key,
	tenkh nvarchar(255),
	diachi nvarchar(255),
	sdt nvarchar(255),
	loaikh nvarchar(255) not null,
	check (loaikh in ('VIP', 'TV')),
);

create table hoadon (
	-- mahd,makh,ngaylap
	-- HD01,KH01,2024-01-20
	mahd nvarchar(255) primary key,
	makh nvarchar(255) not null,
	ngaylap date,
	foreign key (makh) references khachhang(makh)
)

create table cthd (
	-- mahd,mamh,soluong
	-- HD01,MH01,30
	mahd nvarchar(255) not null,
	mamh nvarchar(255) not null,
	soluong int,
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


----	 Dạng 1: Hàm	----

-- bai 01
/*
	 Viết hàm fc_tachho dùng để tách họ từ chuỗi
 họ tên, Ví dụ: Nguyễn Mai Chi → Nguyễn.
*/


go
CREATE FUNCTION dbo.fc_tachho (@ho_ten NVARCHAR(255))
RETURNS NVARCHAR(255)
AS
BEGIN
    DECLARE @ho NVARCHAR(255)
    
    DECLARE @vi_tri_khoang_trang INT
    SET @vi_tri_khoang_trang = CHARINDEX(' ', @ho_ten)
    
    IF @vi_tri_khoang_trang = 0
    BEGIN
        SET @ho = @ho_ten
    END
    ELSE
    BEGIN
        SET @ho = SUBSTRING(@ho_ten, 1, @vi_tri_khoang_trang - 1)
    END
    RETURN @ho
END
go

-- bai 02
/*
	Viết hàm fc_tachhodem dùng để tách họ đệm
 từ chuỗi họ tên, Ví dụ: Nguyễn Mai Chi → Mai.
*/

go
CREATE FUNCTION dbo.fc_tachhodem (@ho_ten NVARCHAR(255))
RETURNS NVARCHAR(255)
AS
BEGIN
    DECLARE @ho NVARCHAR(255);
    
    DECLARE @vi_tri_khoang_trang INT;
    SET @vi_tri_khoang_trang = CHARINDEX(' ', @ho_ten);
    
    IF @vi_tri_khoang_trang = 0
    BEGIN
        SET @ho = @ho_ten;
    END
    ELSE
    BEGIN
        SET @ho = SUBSTRING(@ho_ten, 1, @vi_tri_khoang_trang - 1);
    END
    RETURN @ho;
END;
go



-- bai 03
/*
	 Viết hàmfc_tachten dùngđểtáchtêntừchuỗi
 họ tên. Ví dụ: Nguyễn Mai Chi → Chi.
*/

go
CREATE FUNCTION dbo.fc_tachten (@ho_ten NVARCHAR(100))
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @ten NVARCHAR(50)

    DECLARE @vi_tri_khoang_trang INT
    SET @vi_tri_khoang_trang = LEN(@ho_ten) - CHARINDEX(' ', REVERSE(@ho_ten)) + 1

    SET @ten = SUBSTRING(@ho_ten, @vi_tri_khoang_trang, LEN(@ho_ten))

    RETURN @ten
END
go

-- bai 04
/*
	 Viết hàm fc_doc3so đọc số có 3 chữ số thành
 chữ tương ứng.
*/

go
CREATE FUNCTION dbo.fc_doc3so (@number INT)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @result NVARCHAR(100);

    IF @number < 100 OR @number > 999
        SET @result = 'Số không hợp lệ';
    ELSE
    BEGIN
        DECLARE @ones NVARCHAR(20);
        DECLARE @tens NVARCHAR(20);
        DECLARE @hundreds NVARCHAR(20);
        
        SET @hundreds = 
            CASE 
                WHEN @number / 100 = 1 THEN 'một trăm '
                WHEN @number / 100 = 2 THEN 'hai trăm '
                WHEN @number / 100 = 3 THEN 'ba trăm '
                WHEN @number / 100 = 4 THEN 'bốn trăm '
                WHEN @number / 100 = 5 THEN 'năm trăm '
                WHEN @number / 100 = 6 THEN 'sáu trăm '
                WHEN @number / 100 = 7 THEN 'bảy trăm '
                WHEN @number / 100 = 8 THEN 'tám trăm '
                WHEN @number / 100 = 9 THEN 'chín trăm '
                ELSE ''
            END;

        SET @tens =
            CASE 
                WHEN (@number % 100) / 10 = 1 THEN 'mười'
                WHEN (@number % 100) / 10 = 2 THEN 'hai mươi '
                WHEN (@number % 100) / 10 = 3 THEN 'ba mươi '
                WHEN (@number % 100) / 10 = 4 THEN 'bốn mươi '
                WHEN (@number % 100) / 10 = 5 THEN 'năm mươi '
                WHEN (@number % 100) / 10 = 6 THEN 'sáu mươi '
                WHEN (@number % 100) / 10 = 7 THEN 'bảy mươi '
                WHEN (@number % 100) / 10 = 8 THEN 'tám mươi '
                WHEN (@number % 100) / 10 = 9 THEN 'chín mươi '
                ELSE ''
            END;

        SET @ones =
            CASE 
                WHEN @number % 10 = 1 THEN 'một'
                WHEN @number % 10 = 2 THEN 'hai'
                WHEN @number % 10 = 3 THEN 'ba'
                WHEN @number % 10 = 4 THEN 'bốn'
                WHEN @number % 10 = 5 THEN 'năm'
                WHEN @number % 10 = 6 THEN 'sáu'
                WHEN @number % 10 = 7 THEN 'bảy'
                WHEN @number % 10 = 8 THEN 'tám'
                WHEN @number % 10 = 9 THEN 'chín'
                ELSE ''
            END;

        IF @tens = 'mười' AND @ones != ''
            SET @result = @hundreds + @tens + ' ' + @ones;
        ELSE
            SET @result = @hundreds + @tens + @ones;
    END

    RETURN @result;
END;
go


-- bai 05
/*
	 Viết hàmfc_doc10so đọc số có 10 chữ số thành
 chữ tương ứng.
*/

go
CREATE FUNCTION dbo.fc_doc10so (@so BIGINT)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @chu NVARCHAR(100)

    IF @so BETWEEN 0 AND 9
        SET @chu = 'Không'
    ELSE IF @so BETWEEN 10 AND 19
        SET @chu = 'Mười'
    ELSE IF @so BETWEEN 20 AND 29
        SET @chu = 'Hai mươi'
    ELSE IF @so BETWEEN 30 AND 39
        SET @chu = 'Ba mươi'
    ELSE IF @so BETWEEN 40 AND 49
        SET @chu = 'Bốn mươi'
    ELSE IF @so BETWEEN 50 AND 59
        SET @chu = 'Năm mươi'
    ELSE IF @so BETWEEN 60 AND 69
        SET @chu = 'Sáu mươi'
    ELSE IF @so BETWEEN 70 AND 79
        SET @chu = 'Bảy mươi'
    ELSE IF @so BETWEEN 80 AND 89
        SET @chu = 'Tám mươi'
    ELSE IF @so BETWEEN 90 AND 99
        SET @chu = 'Chín mươi'
    ELSE IF @so BETWEEN 100 AND 999
        SET @chu = 'Trăm'
    ELSE IF @so BETWEEN 1000 AND 999999
        SET @chu = 'Nghìn'
    ELSE IF @so BETWEEN 1000000 AND 999999999
        SET @chu = 'Triệu'
    ELSE IF @so BETWEEN 1000000000 AND 999999999999
        SET @chu = 'Tỷ'
    ELSE
        SET @chu = 'Số quá lớn'

    RETURN @chu
END
go

-- bai 06
/*
	 Viết hàm fc_doanhthunam tính doanh thu của
 năm chỉ định.
*/

go
create function dbo.fc_doanhthunam (@nam int)
returns bigint
as
begin
    declare @tong bigint
	set @tong = (
		select sum(mathang.gia * cthd.soluong) as tongtien
		from hoadon
		join cthd on cthd.mahd = hoadon.mahd
		join mathang on mathang.mamh = cthd.mamh
		where (
			year(hoadon.ngaylap) = @nam
		)
	)
    return @tong
end
go

-- bai 07
/*
	 Viết hàm fc_doanhthuthang tính doanh thu
 của tháng chỉ định.
*/

go
create function dbo.fc_doanhthuthang (@thang int)
returns bigint
as
begin
    declare @tong bigint
	set @tong = (
		select sum(mathang.gia * cthd.soluong) as tongtien
		from hoadon
		join cthd on cthd.mahd = hoadon.mahd
		join mathang on mathang.mamh = cthd.mamh
		where (
			month(hoadon.ngaylap) = @thang
		)
	)
    return @tong
end
go


-- bai 08
/*
	 Viết hàm fc_doanhthuKH tính doanh thu của
 khách hàng chỉ định.
*/

go
create function dbo.fc_doanhthuKH (@makh nvarchar(255))
returns bigint
as
begin
    declare @tong bigint
	set @tong = (
		select sum(mathang.gia * cthd.soluong) as tongtien
		from hoadon
		join cthd on cthd.mahd = hoadon.mahd
		join mathang on mathang.mamh = cthd.mamh
		where (
			hoadon.makh = @makh
		)
	)
    return @tong
end
go


-- bai 09
/*
	 Viết hàm fc_soluongban tính tổng số lượng
 bán được cho từng mặt hàng chỉ định và tháng
 chỉ định, nếu tháng không nhập vào tức là tính
 tất cả các tháng.
*/

go
create function dbo.fc_soluongban(@mamh nvarchar(255), @thang int)
returns int
as
begin
	declare @tong int;
	if @thang is not null
	begin
		set @tong = (
			select sum(cthd.soluong) as soluong
			from cthd
			join hoadon on hoadon.mahd = cthd.mahd
			where (
				month(hoadon.ngaylap) = @thang
				and
				cthd.mamh = @mamh
			)
		)
	end
	else
	begin
		set @tong = (
			select sum(cthd.soluong) as soluong
			from cthd
			join hoadon on hoadon.mahd = cthd.mahd
			where (
				cthd.mamh = @mamh
			)
		)
	end
	return @tong
end
go


-- bai 10
/*
	 Viết hàm fc_solanmuahang đếm số lần mua
 hàng của khách hàng chỉ định.
*/

go
create function dbo.fc_solanmuahang(@makh nvarchar(255))
returns int
as
begin
	declare @solanmuahang int
	set @solanmuahang = (
		select count(hoadon.mahd) as solanmuahang
		from hoadon
		where (
			hoadon.makh = @makh
		)
		group by hoadon.makh
	)
	return @solanmuahang
end
go


----	 Dạng 2: Thủ tục	----

-- bai 01
/*
	 Viết thủ tục hiển thị danh sách các khách hàng đã
 mua hàng trong ngày chỉ định.
*/

go
create proc proc_bai01(@ngay int)
as
	begin
	select *
	from khachhang
	where (
		khachhang.makh in (
			select makh 
			from hoadon
			where (
				month(ngaylap) = @ngay
			)
		)
	)
	end
go

-- bai 02
/*
	 Viết thủ tục hiển thị danh sách 5 khách hàng
 có tổng trị giá các đơn hàng lớn nhất
*/

go
create proc proc_bai02
as	
begin
	select top 5 khachhang.makh, tenkh, sum(soluong * gia) as tongtrigia
	from hoadon
	join khachhang on khachhang.makh = hoadon.makh
	join cthd on cthd.mahd = hoadon.mahd
	join mathang on mathang.mamh = cthd.mamh
	group by khachhang.makh, tenkh
	order by tongtrigia desc
end
go

-- bai 03
/*
	 Viết thủ tục hiển thị danh sách 10 mặt hàng có
 số lượng bán lớn nhất.
*/

go
create proc proc_bai03
as
	begin
	select mathang.*, ds.soluong
	from (
		select top 10 cthd.mamh, sum(cthd.soluong) as soluong
		from cthd
		group by cthd.mamh
		order by soluong desc
	) ds
	join mathang on mathang.mamh = ds.mamh
	end
go

-- bai 04
/*
	 Viết thủ tục cập nhật loại khách hàng là VIP
 nếu tổng thành tiền trong năm lớn hơn hoặc
 bằng 10 triệu.
*/

go
create proc proc_bai04
as
	begin
	update khachhang
	set khachhang.loaikh = 'VIP'
	where (
		khachhang.makh in (
			select hoadon.makh
			from cthd
			join hoadon on hoadon.mahd = cthd.mahd
			left join mathang on mathang.mamh = cthd.mamh
			group by hoadon.makh
			having sum(cthd.soluong * mathang.gia) > 10000000
		)
	)
	end
go

-- bai 05
/*
	 Viết thủ tục thêm vào một hóa đơn vào bảng
 HoaDon với tham số truyền vào là mahd, makh
 và ngaylap. Kiểm tra ngày lập hóa đơn phải
 lớn hơn ngày hiện tại và ràng buộc makh.
*/

go
create proc proc_bai05 (@mahd nvarchar(255), @makh nvarchar(255), @ngaylap date)
as
	begin
	if @ngaylap <= CURRENT_TIMESTAMP
	begin
		print N'Ngày lập hóa đơn phải lớn hơn ngày hiện tại!'
		return -1
	end
	if not exists (
		select khachhang.makh
		from khachhang
		where (
			khachhang.makh = @makh
		)
	)
	begin
		print N'Mã khách hàng không tồn tại'
		return -1
	end
	insert into hoadon
		(mahd, makh, ngaylap)
	values
		(@mahd, @makh, @ngaylap)
	end
go

-- bai 06
/*
	 Viết thủ tục cập nhật giá của một mặt hàng.
*/

go
create proc proc_bai06 (@mamh nvarchar(255), @gia int)
as
	begin
	if not exists (
		select mamh
		from mathang
		where (
			mamh = @mamh
		)
	)
	begin
		print N'Mã mặt hàng không tồn tại!'
		return -1
	end

	update mathang
	set gia = @gia
	where (
		mathang.mamh = @mamh
	)
	end
go


-- bai 07
/*
	 Viết thủ tục liệt kê các hóa đơn có mua mặt
 hàng có tham số truyền vào là mã mặt hàng.
*/

go
create proc proc_bai07 (@mamh nvarchar(255))
as
	begin
	if not exists (
		select mamh 
		from mathang
		where (
			mamh = @mamh
		)
	) 
	begin
		print N'Mã mặt hàng không tồn tại!'
		return -1
	end
	select distinct cthd.mahd
	from cthd
	where (
		cthd.mamh = @mamh
	)
	end
go


-- bai 08
/*
	 Viết thủ tục tìm mặt hàng bán chạy nhất.
*/

go
create proc proc_mathangbanchaynhat
as
	begin
	select mathang.*
	from (
		select top 1 cthd.mamh, sum(cthd.soluong) as soluong
		from cthd
		group by cthd.mamh
		order by soluong desc
	) ds
	join mathang on mathang.mamh = ds.mamh
	end
go

-- bai 09
/*
	 Viết thủ tục tính tổng doanh thu của các hóa
 đơn trong một ngày bất kỳ.
*/

go
create proc proc_bai09 (@ngay date)
as 
	begin
		select hoadon.mahd, sum(cthd.soluong * mathang.gia) as tong
		from hoadon
		join cthd on cthd.mahd = hoadon.mahd
		join mathang on mathang.mamh = cthd.mamh
		where (
			hoadon.ngaylap = @ngay
		)
		group by hoadon.mahd
	end
go

-- bai 10
/*
	 Viết thủ tục tính tổng số lượng mặt hàng của
 mỗi hóa đơn.
*/

go
create proc proc_bai10
as 
	begin
		select hoadon.mahd, sum(cthd.soluong) as soluong
		from hoadon
		join cthd on cthd.mahd = hoadon.mahd
		group by hoadon.mahd
	end
go

-- bai 11
/*
	 Viết thủ tục tính trị giá cho mỗi hoá đơn.
*/

go
create proc proc_bai11
as 
	begin
		select hoadon.mahd, sum(cthd.soluong * mathang.gia) as tong
		from hoadon
		join cthd on cthd.mahd = hoadon.mahd
		join mathang on mathang.mamh = cthd.mamh
		group by hoadon.mahd
	end
go

-- bai 12
/*
	 Viết thủ tục với tùy chọn WITH ENCRYPTION,
 mã hóa không cho người dùng xem được nội
 dung của thủ tục
*/

go
create proc proc_bai12
WITH ENCRYPTION
as 
	begin
		select hoadon.mahd, sum(cthd.soluong * mathang.gia) as tong
		from hoadon
		join cthd on cthd.mahd = hoadon.mahd
		join mathang on mathang.mamh = cthd.mamh
		group by hoadon.mahd
	end
go

----	Dạng 3: Trigger		----

-- bai 01
/*
	 Tạo trigger kiểm tra rằng buộc khoá ngoại ở
 bảng HoaDon và CTHD.
*/

go
create trigger trg_bai01
on cthd
for insert, update
as
	if not exists (
		select hoadon.mahd
		from hoadon
		where (
			hoadon.mahd in (
				select inserted.mahd
				from inserted
			)
		)
	)
	begin
		print N'Dữ liệu không hợp lệ!'
		rollback transaction
	end

	if not exists (
		select mathang.mamh
		from mathang
		where (
			mathang.mamh in (
				select inserted.mamh
				from inserted
			)
		)
	)
	begin
		print N'Dữ liệu không hợp lệ!'
		rollback transaction
	end
go


go
create trigger trg_bai01_
on hoadon
for insert, update
as
	if not exists (
		select khachhang.makh
		from khachhang
		where (
			khachhang.makh in (
				select inserted.makh
				from inserted
			)
		)
	)
	begin
		print N'Dữ liệu không hợp lệ!'
		rollback transaction
	end
go

-- bai 02
/*
	 Tạotrigger không cho phép cascade delete trong
 các rằng buộc khoá ngoại. Ví dụ không cho
 phép xóa các chi tiết hóa đơn nào có số hóa
 đơn còn trong bảng HoaDon.
*/

go
create trigger trg_bai02
on cthd
for delete
as
	begin
	if exists (
		select *
		from hoadon
		where (
			hoadon.mahd in (
				select deleted.mahd
				from deleted
			)
		)
	)
	begin
		print N'Không thể xóa chi tiết hóa đơn khi còn tồn tại hóa đơn!'
		rollback transaction
	end
	end
go

delete from cthd
where (
	cthd.mahd = 'HD02'
)


-- bai 03
/*
	 Tạo trigger không cho phép người dùng nhập
 vào hai mặt hàng có cùng tên.
*/

go
create trigger trg_bai03
on mathang
for insert, update
as
	begin
	if exists (
		select inserted.tenmh
		from inserted
		join mathang on mathang.tenmh = inserted.tenmh
		group by inserted.tenmh
		having count(inserted.tenmh) > 1
	)
	begin
		print N'Không được phép đặt tên hai mặt hàng giống nhau!'
		rollback transaction
	end
	end
go


-- bai 04
/*
	 Tạotrigger không cho phép người dùng xóa một
 lúc nhiều hơn một mặt hàng.
*/

go
create trigger trg_bai04
on mathang
for delete
as
	begin
		if (select count(*) from deleted) > 1
		begin
			print N'Chỉ được xóa 1 mặt hàng trong 1 lần!'
			rollback transaction
		end
	end
go

-- bai 05
/*
	 Tạo trigger chỉ cho phép bán mặt hàng sữa với
 số lượng là bội số của 10.
*/

go
create trigger trg_bai05
on cthd
for insert, update
as
	begin
		if not exists ( 
			select *
			from (
				select dbo.fc_tachho(mathang.tenmh) as tenmh, inserted.soluong
				from inserted
				join mathang on mathang.mamh = inserted.mamh
			) ds
			where (
				ds.tenmh = N'Sữa'
				and
				ds.soluong % 10 = 0
			)
		)
		begin
			print N'Mặt hàng sữa chỉ cho phép bán với số lượng là bội số của 10!'
			rollback transaction
		end
	end
go

-- bai 06
/*
	 Tạo trigger bắt lỗi khi thêm bản ghi vào bảng
 CTHD. Kiểm tra mã mặt hàng có tồn tại không,
 không cho phép nhập số lượng âm.
*/

go
create trigger trg_bai06
on cthd
for insert
as
	begin
	if not exists (
		select mathang.mamh
		from mathang
		where (
			mathang.mamh in (
				select inserted.mamh
				from inserted
			)
		)
	)
	begin
		print N'Mã mặt hàng không tồn tại!'
		rollback transaction
	end

	if exists (
		select *
		from inserted
		where (
			inserted.soluong < 0
		)
	)
	begin
		print N'Mã mặt hàng không tồn tại!'
		rollback transaction
	end
	end
go

-- bai 07
/*
	 Tạo trigger cho lệnh xóa của bảng MatHang.
 Khi xóa một mặt hàng thì tự động xóa trong
 các bảng có liên quan.
*/

go
create trigger trg_bai07
on mathang
for delete
as
	begin
	delete from cthd
	where (
		cthd.mamh in (
			select mamh
			from deleted
		)
	)
	end
go

-- bai 08
/*
	 Tạo trigger trong bảng MatHang kiểm tra đơn
 vị tính chỉ có thể là lốc, lon, gói và hộp.
*/

go
create trigger trg_bai08
on mathang
for insert, update
as
	begin
	if not exists (
		select *
		from inserted
		where (
			inserted.dvt in (
				N'lốc', N'lon', N'gói', N'hộp'
			)
		)
	)
	begin
		print N'Đơn vị tính không hợp lệ!'
		rollback transaction
	end
	end
go

-- bai 09
/*
	Tạo trigger bắt lỗi số điện thoại trong bảng
 KhachHang. Số điện thoại phải gồm 10 số và
 bắt đầu bằng ’01’ hoặc ’03’.
*/

go
create trigger trg_bai09
on khachhang
for insert, update
as
	begin
	if not exists (
		select *
		from inserted
		where (
			len(inserted.sdt) = 10
			and
			left(inserted.sdt, 2) in ('01', '03')
		)
	)
	begin
		print N'Số điện thoại không hợp lệ!'
		rollback transaction
	end
	end
go

-- bai 10
/*
	Tạo trigger cập nhật loại khách hàng là VIP
 nếu tổng thành tiền trong năm lớn hơn hoặc
 bằng 10 triệu
*/

go
create trigger trg_bai10
on hoadon
for insert, update
as
begin
	update khachhang
	set loaikh = 'VIP'
	from khachhang kh
	join (
        select hoadon.makh, SUM(cthd.soluong * mathang.gia) as tongtien
        from hoadon
        join cthd on cthd.mahd = hoadon.mahd
		join mathang on mathang.mamh = cthd.mamh
		where (
			year(hoadon.ngaylap) = year(CURRENT_TIMESTAMP)
		)
		group by hoadon.makh
    ) as hd on kh.makh = hd.makh
	where (
		hd.tongtien >= 10000000
	)
end
go

----	 Dạng 4: Con trỏ	----



----	 Dạng 5: Bài tập tổng hợp	----

