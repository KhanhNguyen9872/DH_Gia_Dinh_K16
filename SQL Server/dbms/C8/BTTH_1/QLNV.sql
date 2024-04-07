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

----- BAI TAP THUC HANH SO 1 -----

-- 4. Đưa thông tin của nhân viên có mã số KT001

select *
from NhanVien
where manv = 'KT001'

-- 5. Đưa ra danh sách các nhân viên nữ

select *
from NhanVien
where gioitinh = N'Nữ'

-- 6. Tìm ra những nhân viên có họ 'Nguyễn'?

select *
from NhanVien
where substring(hoten, 1, charindex(' ', hoten) - 1) = N'Nguyễn'

-- 7. Hãy thực hiện truy vấn các thông tin sau của người có họ tên là tên của bạn: thuộc phòng ban nào, biết ngoại ngữ gì, mức lương bao nhiêu?

select hoten, tenph, string_agg(N'Tiếng ' + tennn, ', ') as ngoaiNgu, luong
from NhanVien
join Phong on Phong.maph = NhanVien.maph
join TDNN on TDNN.manv = NhanVien.manv
join DMNN on DMNN.mann = TDNN.mann
where hoten = N'Nguyễn Văn Khánh'
group by hoten, tenph, luong

-- 8. Đưa ra danh sách các nhân viên có tên chứa từ 'Văn'.

select *
from NhanVien
where hoten like N'%Văn%'

-- 9. Đưa ra những nhân viên có tuổi dưới 30? (Đưa ra cả thông tin tuổi trong kết quả).

select *, (year(current_timestamp) - year(ngaysinh)) as tuoi
from NhanVien
where (year(current_timestamp) - year(ngaysinh)) < 30

-- 10. Đưa ra danh sách các nhân viên có tuổi nằm trong khoảng 25 đến 30 tuổi? (Đưa ra cả thông tin tuổi trong kết quả).

select *, (year(current_timestamp) - year(ngaysinh)) as tuoi
from NhanVien
where (year(current_timestamp) - year(ngaysinh)) between 25 and 30

-- 11. Đưa ra các mã nhân viên đã học các ngoại ngữ 01 ở trình độ C trở lên?

select manv
from TDNN
where mann = '01' and tdo < 'C'

-- 12. Nhân viên nào đã vào biên chế trước năm 2015?

select *
from NhanVien
where year(ngaybc) < 2015

-- 13. Nhân viên nào đã vào biên chế hơn 10 năm?

select *
from NhanVien
where (year(current_timestamp) - year(ngaybc)) > 10

-- 14. Đưa ra danh sách các nhân viên năm nay đủ tuổi nghỉ hưu (Nam >= 60 tuổi, Nữ >= 55 tuổi)?

select *
from NhanVien
where (
	(gioitinh = N'Nam' and (year(current_timestamp) - year(ngaysinh)) >= 60)
	or
	(gioitinh = N'Nữ' and (year(current_timestamp) - year(ngaysinh)) >= 55)
)

-- 15. Cho biết thông tin (Mã phòng, tên phòng, điện thoại, liên hệ) về các phòng ban?

select maph, tenph, tel, diachi
from Phong

-- 16. Đưa ra tất cả thông tin về 2 nhân viên đầu tiên trong bảng nhân viên?

select top 2 *
from NhanVien

-- 17. Cho biết mã nhân viên, họ tên, ngày sinh, lương của các nhân viên có lương nằm trong khoảng từ 7.000.000 đồng đến 8.000.000 đồng?

select manv, hoten, ngaysinh, luong
from NhanVien
where luong between 7000000 and 8000000

-- 18. Nhân viên nào chưa có số điện thoại?

select *
from NhanVien
where sdt IS NULL or sdt = ''

-- 19. Nhân viên nào có sinh nhật trong tháng 4.

select *
from NhanVien
where month(ngaysinh) = 4

-- 20. Đưa ra danh sách nhân viên theo lương tăng dần?

select *
from NhanVien
order by luong

-- 21. Cho biết lương trung bình của phòng Kinh doanh?

select avg(luong) as luongTrungBinh
from NhanVien
join Phong on Phong.maph = NhanVien.maph
where tenph = N'Kinh doanh'

-- 22. Cho biết tổng số nhân viên và lương trung bình của phòng Kinh doanh?

select count(manv) as tongSoNhanVien, avg(luong) as luongTrungBinh
from NhanVien
join Phong on Phong.maph = NhanVien.maph
where tenph = N'Kinh doanh'

