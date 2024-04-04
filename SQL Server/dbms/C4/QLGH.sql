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

--				Dạng 5: Bài tập tổng hợp				--

-- bai 1.1
/*
	Tạo thủ tục lưu trữ để thông qua thủ tục này
 có thể bổ sung thêm một bản ghi mới cho bảng
 MatHang (thủ tục phải thực hiện kiểm tra tính
 hợp lệ của dữ liệu cần bổ sung: không trùng
 khóa chính và đảm bảo toàn vẹn tham chiếu)
*/	

go
create proc proc_bai1_1(@mahang nvarchar(255), @tenhang nvarchar(255), @macongty nvarchar(255), @maloaihang nvarchar(255), @soluong int, @donvitinh nvarchar(255), @giahang int)
as
	begin
	
	if not exists (
		select *
		from nhacungcap
		where (
			nhacungcap.macongty = @macongty
		)
	)
	begin
		print N'Mã công ty không hợp lệ'
		return -1
	end

	if not exists (
		select *
		from loaihang
		where (
			loaihang.maloaihang = @maloaihang
		)
	)
	begin
		print N'Mã loại hàng không hợp lệ'
		return -1
	end

	insert into mathang
		(mahang, tenhang, macongty, maloaihang, soluong, donvitinh, giahang)
	values
		(@mahang, @tenhang, @macongty, @maloaihang, @soluong, @donvitinh, @giahang)
	end
go


-- bai 1.2
/*
	Tạo thủ tục lưu trữ có chức năng thống kê tổng
 số lượng hàng bán được của một mặt hàng có
 mã bất kỳ (mã mặt hàng cần thống kê là tham
 số của thủ tục).
*/

go
create proc proc_bai1_2(@mahang nvarchar(255))
as
	begin
	if not exists (
		select *
		from mathang
		where (
			mathang.mahang = @mahang
		)
	)
	begin
		print N'Mặt hàng không hợp lệ'
		return -1
	end

	select sum(soluong) as tongsoluong
	from chitietdathang
	where (
		chitietdathang.mahang = @mahang
	)
	end
go

-- bai 1.3
/*
	Viết hàm trả về một bảng trong đó cho biết
 tổng số lượng hàng bán được của mỗi mặt hàng.
 Sử dụng hàm này để thống kê xem tổng số
 lượng hàng (hiện có và đã bán) của mỗi mặt
 hàng là bao nhiêu.
*/

go
create function dbo.func_bai1_3()
returns table
as
	return (
		select ds.mahang, ds.tenhang, ds.daban, ds2.hienco
		from (
			select mathang.mahang, mathang.tenhang, isnull(sum(chitietdathang.soluong), 0) as daban
			from mathang
			left join chitietdathang on chitietdathang.mahang = mathang.mahang
			group by mathang.mahang, mathang.tenhang
		) ds
		join (
			select mathang.mahang, mathang.tenhang, isnull(sum(mathang.soluong), 0) as hienco
			from mathang
			group by mathang.mahang, mathang.tenhang
		) as ds2 on ds2.mahang = ds.mahang
	)
go

-- bai 1.4
/*
	Viết trigger cho bảng ChiTietDatHang theo yêu
 cầu sau:
	• Khi một bản ghi mới được bổ sung vào
 bảng này thì giảm số lượng hàng hiện có
 nếu số lượng hàng hiện có lớn hơn hoặc
 bằng số lượng hàng được bán ra. Ngược lại
 thì huỷ bỏ thao tác bổ sung.
	• Khi cập nhật lại số lượng hàng được bán,
 kiểm tra số lượng hàng được cập nhật lại
 có phù hợp hay không (số lượng hàng bán
 ra không được vượt quá số lượng hàng hiện
 có và không được nhỏ hơn 1). Nếu dữ liệu
 hợp lệ thì giảm (hoặc tăng) số lượng hàng
 hiện có trong công ty, ngược lại thì huỷ bỏ
 thao tác cập nhật.
*/

go
create trigger trg_bai1_4
on chitietdathang
for insert
as
	if (
		select mathang.soluong
		from inserted
		join mathang on inserted.mahang = mathang.mahang
	) < (
		select inserted.soluong
		from inserted
	)
	begin
		print N'Số lượng hàng hiện có hiện không đủ!'
		rollback transaction
	end

	update mathang
	set soluong = mathang.soluong - inserted.soluong
	from inserted
	where (
		mathang.mahang in (
			select inserted.mahang
			from inserted
		)
	)
go

go
create trigger trg_bai1_4_update
on chitietdathang
after update
as
	declare @soluongcu int, @soluongmoi int, @mahang nvarchar(255), @soluonghientai int
	select @mahang = mahang, @soluongcu = soluong from deleted
	select @soluongmoi = soluong from inserted
	if (@soluongmoi < 1)
	begin
		print N'Số lượng hàng không hợp lệ!'
		rollback transaction
	end

	select @soluonghientai = soluong from mathang where mahang = @mahang;

    if (@soluonghientai + @soluongcu - @soluongmoi) >= 0
    begin
        update mathang
        set soluong = @soluonghientai + @soluongcu - @soluongmoi
        where mahang = @mahang;
    end
go

-- bai 1.5
/*
	 Viết trigger cho bảng ChiTietDatHang để sao
 cho chỉ chấp nhận giá hàng bán ra phải nhỏ hơn
 hoặc bằng giá gốc (giá trong bảng MatHang).
*/

go
create trigger trg_bai1_5
on chitietdathang
for insert, update
as
	declare @giagoc int, @giadonhang int, @mahang nvarchar(255);
	select @mahang = mahang, @giadonhang = giaban from inserted
	select @giagoc = giahang from mathang where (mathang.mahang = @mahang)

	if (@giadonhang > @giagoc) 
	begin
		print N'Số lượng hàng không hợp lệ!'
		rollback transaction
	end
go

-- bai 2
/*
	 Để quản lý các bản tin trong một Website, người ta
 sử dụng hai bảng sau:

	- Bảng LOAIBANTIN (loại bản tin)
 CREATE TABLE loaibantin (
	maloai INT PRIMARY KEY,
	tenphanloai NVARCHAR(100) NOT NULL,
	bantinmoinhat INT DEFAULT(0)
 )

	- Bảng BANTIN (bản tin)
 CREATE TABLE bantin (
	 maso INT PRIMARY KEY,
	 ngayduatin DATETIME NULL,
	 tieude NVARCHAR(200) NULL,
	 noidung NTEXT NULL,
	 maloai INT NULL,
	 FOREIGN KEY REFERENCES loaibantin(maloai)
 )

	Trong bảng LOAIBANTIN, giá trị cột bantinmoinhat
 cho biết mã số của bản tin thuộc loại tương ứng mới
 nhất (được bổ sung sau cùng).
 Hãy viết các trigger cho bảng BANTIN sao cho:
	• Khi một bản tin mới được bổ sung, cập nhật
 lại cột bantinmoinhat của dòng tương ứng với
 loại bản tin vừa bổ sung.
	• Khi một bản tin bị xóa, cập nhật lại giá trị của
 cột bantinmoinhat trong bảng LOAIBANTIN của
 dòng ứng với loại bản tin vừa xóa là mã số của
 bản tin trước đó (dựa vào ngày đưa tin). Nếu
 không còn bản tin nào cùng loại thì giá trị của
 cột này bằng 0.
	 • Khi cập nhật lại mã số của một bản tin và
 nếu đó là bản tin mới nhất thì cập nhật lại cột
 bantinmoinhat mã số mới.
*/

CREATE TABLE loaibantin (
	maloai INT PRIMARY KEY,
	tenphanloai NVARCHAR(100) NOT NULL,
	bantinmoinhat INT DEFAULT(0)
)

CREATE TABLE bantin (
	 maso INT PRIMARY KEY,
	 ngayduatin DATETIME NULL,
	 tieude NVARCHAR(200) NULL,
	 noidung NTEXT NULL,
	 maloai INT NULL,
	 FOREIGN KEY (maloai) REFERENCES loaibantin(maloai)
)

go
create trigger trg_bai2_1
on bantin
for insert
as
	declare @maloai int, @maso int;
	select @maloai = maloai, @maso = maso from inserted
	update loaibantin
	set bantinmoinhat = @maso
	where (
		loaibantin.maloai = @maloai
	)

go


go
create trigger trg_bai2_2
on bantin
for delete
as
	declare @masocu int, @maloaicu int
	select @masocu = maso, @maloaicu = maloai from deleted

	if exists (
		select bantinmoinhat
		from loaibantin
		where (
			bantinmoinhat = @masocu
		)
	)
	begin
		if not exists (
			select *
			from bantin
			where (
				bantin.maloai = @maloaicu
			)
		) 
		begin
			update loaibantin
			set bantinmoinhat = 0
			where (
				loaibantin.maloai = @maloaicu
			)

		end
		else
		begin
			update loaibantin
			set bantinmoinhat = (
				select bantin.maso
				from bantin
				where (
					bantin.maloai = @maloaicu
					and
					bantin.ngayduatin = (
						select max(ngayduatin)
						from bantin
						where (
							bantin.maloai = @maloaicu
						)
					)
				)
			)
			where (
				loaibantin.maloai = @maloaicu
			)
		end
	end
go

go
create trigger trg_bai2_3
on bantin
for update
as
	declare @maloaicu int;
	select @maloaicu = maloai from deleted
	
	update loaibantin
	set bantinmoinhat = (
		select bantin.maso
		from bantin
		where (
			bantin.maloai = @maloaicu
			and
			bantin.ngayduatin = (
				select max(ngayduatin)
				from bantin
				where (
					bantin.maloai = @maloaicu
				)
			)
		)
	)
	where (
		loaibantin.maloai = @maloaicu
	)
go