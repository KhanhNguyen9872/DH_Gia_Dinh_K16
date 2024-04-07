-- 221402 - KhanhNguyen9872

use master;
ALTER DATABASE QLTV SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE QLTV SET ONLINE;

DROP DATABASE QLTV;

CREATE DATABASE QLTV
GO
USE QLTV
GO

CREATE TABLE NhaXuatBan(
	manxb varchar(50) primary key,
	tennxb nvarchar(50),
);
CREATE TABLE TheLoai(
	matl varchar(50) primary key,
	tentl nvarchar(50),
);

CREATE TABLE Sach (
    masach int PRIMARY KEY,
    tuade nvarchar(255) NOT NULL,
    manxb varchar(50),
    tacgia nvarchar(255) NOT NULL,
    sl int NOT NULL,
    ngnhap DATE,
    matl varchar(50),
    FOREIGN KEY (manxb) REFERENCES NhaXuatBan(manxb),
    FOREIGN KEY (matl) REFERENCES TheLoai(matl)
);

CREATE TABLE BanDoc (
    mathe int PRIMARY KEY,
    tenbandoc varchar(255) NOT NULL,
    diachi nvarchar(255) NOT NULL,
    sdt varchar(15) NOT NULL
);

CREATE TABLE MuonSach (
    mathe int,
    masach int,
    ngaymuon DATE,
    ngaytra DATE,
    FOREIGN KEY (mathe) REFERENCES BanDoc(mathe),
    FOREIGN KEY (masach) REFERENCES Sach(masach)
);

insert into NhaXuatBan
	(manxb,tennxb)
values
    ('N001','Giáo dục'),
    ('N002','Khoa học kỹ thuật'),
    ('N003','Thống kê'),
    ('N004','Thanh niên')

insert into TheLoai
	(matl, tentl)
values
    ('TH', 'Tin học'),
    ('HH', 'Hóa học'),
    ('KT', 'Kinh tế'),
    ('TN','Toán học')

insert into Sach 
	(masach, tuade, manxb, tacgia, sl, ngnhap, matl)
values
    ('1001','Nhập môn cơ sở dữ liệu','N003','Đinh Bá Tiến','6','2022-09-08','TH'),
    ('1002','Giáo trình SQL Sever','N001','Lê Quang Minh','3','2021-11-22','TH'),
    ('1003','Chuyên đề Orale','N002','Phan Thanh Tâm','5','2023-03-14','TH'),
    ('1004','Kỹ thuật lập trình C/C++','N001','Đặng Bình Phương','4','2022-06-11','TH'),
    ('1005','Giáo trình Khai phá dữ liệu','N003','Trần Hoài Ân ','2','2022-12-01','TH'),
    ('1006','Phân tích dữ liệu','N003','Bùi Ngọc Ngân','4','2022-07-23','KT'),
    ('1007','Lập trình python','N001','Lê Đại Minh','1','2022-11-12','TH'),
    ('1008','Trực quan hóa dữ liệu','N003','Lê Quang Đại','4','2022-11-29','KT'),
    ('1009','Giáo trình Access 2022','N004','Thiện Tâm','3','2023-01-11','TH'),
    ('1010','Kỹ thuật thiết kế hệ thống','N002','Phạm Minh Chính','2','2023-01-16','TH'),
    ('1011','Đại số tuyến tính','N001','Phùng Văn Minh','5','2023-01-10','TN'),
    ('1012','Lý thuyết trò chơi ','N001','Phùng Văn Minh','5','2022-08-10','TN')

insert into BanDoc
	(mathe, tenbandoc, diachi, sdt)
values
    ('050001', 'Trần Thị Xuân','17Pauster', '0392736451'),
    ('050002', 'Lê Hoài Nam','145 Trần Phú', '038276201'),
    ('060001', 'Trần Xuân Hùng','20 Trần Phú', '0392736451'),
    ('060002', 'Nguyễn Tâm ','102 Nguyễn Trãi', '0896885422')

insert into MuonSach 
    (mathe, masach, ngaymuon, ngaytra)
values
    ('050001','1006','2022-11-12','2023-02-01'),
    ('050001','1007','2022-11-12', null),
    ('050002','1001','2023-03-22','2023-05-10'),
    ('050002','1004','2023-03-22', null),
    ('050002','1005','2023-04-09','2023-06-15'),
    ('050002','1008','2023-01-19', null),
    ('060002','1003','2022-08-17','2023-04-01'),
    ('060002','1009','2022-09-22', null),
    ('060002','1001','2022-11-29', null)


-- 1 tạo khung nhìn vwNXBKHKT gồm các thuộc tính mã sách, tên sách,tác giả của những cuốn sách xuất bản bởi nhà xuất bản 'Khoa học kỹ thuật '
go
create view vwNXBKHKT 
as
    select masach,tuade, tacgia
    from Sach
    where manxb in (
        select manxb from NhaXuatBan where tennxb= 'Khoa học kỹ thuật'
    )

--2 tạo khung nhìn vwDSmuonTin gồm các thuộc tính  tenbandoc, dia chi,sdt, masach, tua de cua tất cả các cuốn sách thuộc thể loại tin học 
go
create view vwDSmuonTin 
as
    select BanDoc.tenbandoc, BanDoc.diachi, BanDoc.sdt, Sach.masach, Sach.tuade
    from BanDoc
    join MuonSach on BanDoc.mathe = MuonSach.mathe
    join Sach on MuonSach.masach = Sach.masach
    join TheLoai on Sach.matl = TheLoai.matl
    where TheLoai.tentl = 'tin học'

--3 tạo thủ tục sp_insach nhằm liệt kê danh sách các sách có tựa đề chứa xâu con cho trước 
go
create proc sp_insach(@tuade1 nvarchar(50))
as
begin
	declare @tuade2 nvarchar(50)
	set @tuade2='%'+@tuade1+'%'
	select * from Sach
	where tuade like @tuade2
end

--4 tạo thủ tục sp_insachmuon hiển thị danh sách các sách mượn
go
create proc sp_insachmuon(@mathe int)
as
begin
	declare @mathe2 int 
	set @mathe2 =@mathe
	select Sach.masach, Sach.tuade,MuonSach.ngaymuon, MuonSach.ngaytra
	From Sach, MuonSach
	where Sach.masach= MuonSach.masach and MuonSach.mathe=@mathe2
end

--5 tạo thủ tục sp_sachbandocmuon liệt kê các danh sách các bạn đọc có mượn một đầu sách có mã sách nào đó
go
create proc sp_sachbandocmuon(@masach int)
as
begin
	declare @masach2 int
	set @masach2=@masach
	select BanDoc.mathe,BanDoc.tenbandoc,BanDoc.diachi,BanDoc.sdt
	from BanDoc, MuonSach
	where BanDoc.mathe=MuonSach.mathe and MuonSach.masach =@masach2
end

--6 tạo thủ tục sp_insach nhằm liệt kê danh sách các sách có tựa đề chứa xâu con cho trước 
go
create proc sp_sachchuaduocmuon
as
begin
	select masach,tuade from Sach
	where masach not in (select masach from MuonSach)
end

--7 viêt hàm thay thế câu 3 và  câu 6
go
create function fn_insach(@xaucon nvarchar(50))
returns table 
as
return (
	select masach, tuade from Sach 
	where tuade like '%' +@xaucon+'%'
)

--8 tạo hàm fc_soluongsach cho kết quả số lượng sách có trong thư viện thuộc thể loại
go
create function fc_soluongsach(@matl varchar(50))
returns int 
as
begin 
	declare @soluong int
	select @soluong = COUNT(*)
	from Sach
	where matl = @matl
	return @soluong
end

--9 tạo hàm fc số lượng sách fc_soluongsachxuatban cho số lượng sách có trong thư viện
go
create function fc_soluongsachxuatban(@manxb varchar(50))
returns int
as
begin
    declare @soluong int

    select @soluong = count(*)
    from Sach
    where manxb = @manxb

    return @soluong
end


go
--10 viết hàm fc_sachchuatra hiển thị danh sách chưa được trả 
go
create function fc_sachchuatra()
returns table
as
return (
    select MuonSach.masach, Sach.tuade, MuonSach.mathe, BanDoc.tenbandoc, MuonSach.ngaymuon
    from MuonSach
    INNER JOIN Sach ON MuonSach.masach = Sach.masach
    INNER JOIN BanDoc ON MuonSach.mathe = BanDoc.mathe
    where MuonSach.ngaytra IS NULL
)

--11 viết hàm liệt kê các đầu sách được nhập 2023
go
create function fc_dausachnhap2023()
returns table
as
return (
    select masach, tuade, ngnhap
    from Sach
    where year(ngnhap) = 2023
)

--12 viết hàm cho  biết các đầu sách  mượn 2022
go
create function fc_dausachmuon2022()
returns int
as
begin
    declare @soluong int
    select @soluong = count(distinct masach)
    from MuonSach
    where year(ngaymuon) = 2022
    return @soluong
end

--13 viết hàm cho  biết các đầu sách được mượn 2022 nhưng vẫn chưa trả
go
create function fc_dausachmuonchuatra_2022()
returns table
as
return (
    select MuonSach.masach, Sach.tuade, MuonSach.mathe, BanDoc.tenbandoc, MuonSach.ngaymuon
    from MuonSach, Sach, BanDoc
    where MuonSach.masach = Sach.masach
      and MuonSach.mathe = BanDoc.mathe
      and year(MuonSach.ngaymuon) = 2022
      and MuonSach.ngaytra is null
)

--14 viết hàm cho biết có bao nhiêu đầu sách được mượn từ tháng 01/10/2022 đến 01/05/2023
go
create function fc_soluong_dausachmuon()
returns int
as
begin
    declare @soluong int
    select @soluong = count(*)
    from MuonSach
    where ngaymuon >= '2022-10-01' and ngaymuon <= '2023-05-01'

    return @soluong
end;

--15 viết hàm sắp xếp danh sách bạn đọc theo số lượng sách đã mượn giảm dần
go
create function fc_sapxep_bandoctheosoluongmuon()
returns table
as
return (
    select BanDoc.mathe, BanDoc.tenbandoc, 
        COUNT(CASE WHEN MuonSach.mathe IS NOT NULL THEN MuonSach.mathe END) AS soluongsachmuon
    from BanDoc
    JOIN MuonSach ON BanDoc.mathe = MuonSach.mathe
    group by BanDoc.mathe, BanDoc.tenbandoc
)

--16 viết hàm cho biết những sách được nhập sau năm 2021 của nhà xuất bản giáo dục 
go
create function fc_sach_nhap_sau_2021_cua_NXB_GiaoDuc()
returns table
as
return (
    select Sach.masach, Sach.tuade, Sach.manxb AS manxb_sach, Sach.tacgia, Sach.sl, Sach.ngnhap, Sach.matl
    from Sach
    JOIN NhaXuatBan ON Sach.manxb = NhaXuatBan.manxb
    where NhaXuatBan.tennxb = 'Giáo dục' AND YEAR(Sach.ngnhap) > 2021
)

