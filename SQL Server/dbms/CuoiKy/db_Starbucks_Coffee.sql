-- 221402

use master;
ALTER DATABASE db_Starbucks_Coffee SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE db_Starbucks_Coffee SET ONLINE;

DROP DATABASE db_Starbucks_Coffee;

-- 1.
/*
	Cài đặt CSDL quản lý chuỗi cửa hàng Starbucks Coffee có tên là db_Starbucks_Coffee. 
Lưu ý, trước khi tạo CSDL nên kiểm tra CSDL đã tồn tại chưa, nếu đã tồn tại rồi thì không 
cho phép tạo mới CSDL. 
*/

CREATE DATABASE db_Starbucks_Coffee;
GO
use db_Starbucks_Coffee;
GO

-- 2.
/*
	Tạo các bảng dữ liệu và thiết lập tên cột, kiểu dữ liệu theo mô tả ở Phần IV. Bổ sung 
tất cả các ràng buộc cần thiết (nếu có). 
*/

create table nhanvien (
	manv char(5) primary key,
	tennv nvarchar(100),
	macv char(3),
	macn char(3),
	ngaysinh datetime,
	gioitinh bit,
	sodt char(10),
	email nvarchar(50),
	diachi nvarchar(100),
	ngayvao datetime,
	ngaynghi datetime
)

create table chucvu (
	macv char(3) primary key,
	tencv nvarchar(100)
)

create table loaithucuong (
	maloai char(5) primary key,
	tenloai nvarchar(100)
)

create table thucuong (
	matu char(5) primary key,
	maloai char(5),
	tentu nvarchar(100),
	dongia decimal
)

create table khuvuc (
	makv char(3) primary key,
	tenkv nvarchar(10),
	hesogia float
)

create table congthuc (
	matu char(5),
	manl char(10),
	soluong float
)

create table chinhanh (
	macn char(3) primary key,
	tencn nvarchar(100),
	sodt char(10),
	diachi nvarchar(100),
	hesogia float
)

create table baocao (
	mabc char(10) primary key,
	manv char(5),
	tenbc nvarchar(100),
	ngaylap datetime,
	noidung nvarchar(max)
)

create table nhacungcap (
	mancc char(5) primary key,
	tenncc nvarchar(10),
	sodt char(10),
	email nvarchar(50),
	diachi nvarchar(100)
)

create table phieuphuthu (
	maphieupt char(10) primary key,
	manv char(5),
	tenppt nvarchar(100),
	ngaylap datetime,
	sotien decimal
)

create table phieuchi (
	mapc char(10) primary key,
	manv char(5),
	noidungchi nvarchar(max),
	ngaylap datetime,
	tongtien decimal
)

create table phieunhap (
	mapn char(10) primary key,
	manv char(5),
	mancc char(5),
	ngaylap datetime,
	tongtien decimal
)

create table hoadon (
	mahd nvarchar(20) primary key,
	manv char(5),
	makv char(3),
	ngaylap datetime,
	tongtien decimal
)

create table chitiet_hoadon (
	matu char(5),
	mahd nvarchar(20),
	soluong float
)

create table chitiet_phieunhap (
	manl char(10),
	mapn char(10),
	soluong float
)

create table nguyenlieu (
	manl char(10) primary key,
	tennl nvarchar(100),
	soluong float,
	donvi nvarchar(25)
)

alter table nhanvien add constraint fk_nhanvien_macv foreign key (macv) references chucvu(macv)
alter table nhanvien add constraint fk_nhanvien_macn foreign key (macn) references chinhanh(macn)
alter table thucuong add constraint fk_thucuong_maloai foreign key (maloai) references loaithucuong(maloai)
alter table congthuc add constraint fk_congthuc_matu foreign key (matu) references thucuong(matu)
alter table congthuc add constraint fk_congthuc_manl foreign key (manl) references nguyenlieu(manl)
alter table baocao add constraint fk_baocao_manv foreign key (manv) references nhanvien(manv)
alter table phieuphuthu add constraint fk_phiephuthu_manv foreign key (manv) references nhanvien(manv)
alter table phieuchi add constraint fk_phieuchi_manv foreign key (manv) references nhanvien(manv)
alter table phieunhap add constraint fk_phieunhap_manv foreign key (manv) references nhanvien(manv)
alter table phieunhap add constraint fk_phieunhap_mancc foreign key (mancc) references nhacungcap(mancc)
alter table hoadon add constraint fk_hoadon_manv foreign key (manv) references nhanvien(manv)
alter table hoadon add constraint fk_hoadon_makv foreign key (makv) references khuvuc(makv)
alter table chitiet_hoadon add constraint fk_chitiet_hoadon_matu foreign key (matu) references thucuong(matu)
alter table chitiet_hoadon add constraint fk_chitiet_hoadon_mahd foreign key (mahd) references hoadon(mahd)
alter table chitiet_phieunhap add constraint fk_chitiet_phieunhap_manl foreign key (manl) references nguyenlieu(manl)
alter table chitiet_phieunhap add constraint fk_chitiet_phieunhap_mapn foreign key (mapn) references phieunhap(mapn)

-- 3.
/*
	Thêm dữ liệu vào CSDL db_Starbucks_Coffee. Mỗi bảng tối thiểu 10-50 dòng dữ 
liệu (sinh viên tùy chỉnh dữ liệu sau cho mỗi yêu cầu truy vấn bên dưới đều trả về ít 
nhất một dòng giá trị, yêu cầu đọc dữ liệu từ file .csv).
*/

begin
	alter table nhanvien nocheck constraint all
	delete from nhanvien
	bulk insert nhanvien
	from 'C:\Users\KhanhNguyen9872\Documents\GitHub\DH_Gia_Dinh_K16\SQL Server\dbms\CuoiKy\csv\nhanvien.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a',
		CODEPAGE = '65001'
	);
	alter table nhanvien check constraint all
end

begin
	alter table chucvu nocheck constraint all
	delete from chucvu
	bulk insert chucvu
	from 'C:\Users\KhanhNguyen9872\Documents\GitHub\DH_Gia_Dinh_K16\SQL Server\dbms\CuoiKy\csv\chucvu.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a',
		CODEPAGE = '65001'
	);
	alter table chucvu check constraint all
end

begin
	alter table loaithucuong nocheck constraint all
	delete from loaithucuong
	bulk insert loaithucuong
	from 'C:\Users\KhanhNguyen9872\Documents\GitHub\DH_Gia_Dinh_K16\SQL Server\dbms\CuoiKy\csv\loaithucuong.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a',
		CODEPAGE = '65001'
	);
	alter table loaithucuong check constraint all
end

begin
	alter table thucuong nocheck constraint all
	delete from thucuong
	bulk insert thucuong
	from 'C:\Users\KhanhNguyen9872\Documents\GitHub\DH_Gia_Dinh_K16\SQL Server\dbms\CuoiKy\csv\thucuong.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a',
		CODEPAGE = '65001'
	);
	alter table thucuong check constraint all
end

begin
	alter table khuvuc nocheck constraint all
	delete from khuvuc
	bulk insert khuvuc
	from 'C:\Users\KhanhNguyen9872\Documents\GitHub\DH_Gia_Dinh_K16\SQL Server\dbms\CuoiKy\csv\khuvuc.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a',
		CODEPAGE = '65001'
	);
	alter table khuvuc check constraint all
end

begin
	alter table congthuc nocheck constraint all
	delete from congthuc
	bulk insert congthuc
	from 'C:\Users\KhanhNguyen9872\Documents\GitHub\DH_Gia_Dinh_K16\SQL Server\dbms\CuoiKy\csv\congthuc.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a',
		CODEPAGE = '65001'
	);
	alter table congthuc check constraint all
end

begin
	alter table chinhanh nocheck constraint all
	delete from chinhanh
	bulk insert chinhanh
	from 'C:\Users\KhanhNguyen9872\Documents\GitHub\DH_Gia_Dinh_K16\SQL Server\dbms\CuoiKy\csv\chinhanh.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a',
		CODEPAGE = '65001'
	);
	alter table chinhanh check constraint all
end

begin
	alter table baocao nocheck constraint all
	delete from baocao
	bulk insert baocao
	from 'C:\Users\KhanhNguyen9872\Documents\GitHub\DH_Gia_Dinh_K16\SQL Server\dbms\CuoiKy\csv\baocao.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a',
		CODEPAGE = '65001'
	);
	alter table baocao check constraint all
end
	
begin
	alter table nhacungcap nocheck constraint all
	delete from nhacungcap
	bulk insert nhacungcap
	from 'C:\Users\KhanhNguyen9872\Documents\GitHub\DH_Gia_Dinh_K16\SQL Server\dbms\CuoiKy\csv\nhacungcap.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a',
		CODEPAGE = '65001'
	);
	alter table nhacungcap check constraint all
end

begin
	alter table phieuphuthu nocheck constraint all
	delete from phieuphuthu
	bulk insert phieuphuthu
	from 'C:\Users\KhanhNguyen9872\Documents\GitHub\DH_Gia_Dinh_K16\SQL Server\dbms\CuoiKy\csv\phieuphuthu.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a',
		CODEPAGE = '65001'
	);
	alter table phieuphuthu check constraint all
end

begin
	alter table phieuchi nocheck constraint all
	delete from phieuchi
	bulk insert phieuchi
	from 'C:\Users\KhanhNguyen9872\Documents\GitHub\DH_Gia_Dinh_K16\SQL Server\dbms\CuoiKy\csv\phieuchi.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a',
		CODEPAGE = '65001'
	);
	alter table phieuchi check constraint all
end

begin
	alter table phieunhap nocheck constraint all
	delete from phieunhap
	bulk insert phieunhap
	from 'C:\Users\KhanhNguyen9872\Documents\GitHub\DH_Gia_Dinh_K16\SQL Server\dbms\CuoiKy\csv\phieunhap.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a',
		CODEPAGE = '65001'
	);
	alter table phieunhap check constraint all
end

begin
	alter table hoadon nocheck constraint all
	delete from hoadon
	bulk insert hoadon
	from 'C:\Users\KhanhNguyen9872\Documents\GitHub\DH_Gia_Dinh_K16\SQL Server\dbms\CuoiKy\csv\hoadon.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a',
		CODEPAGE = '65001'
	);
	alter table hoadon check constraint all
end

begin
	alter table chitiet_hoadon nocheck constraint all
	delete from chitiet_hoadon
	bulk insert chitiet_hoadon
	from 'C:\Users\KhanhNguyen9872\Documents\GitHub\DH_Gia_Dinh_K16\SQL Server\dbms\CuoiKy\csv\chitiet_hoadon.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a',
		CODEPAGE = '65001'
	);
	alter table chitiet_hoadon check constraint all
end

begin
	alter table chitiet_phieunhap nocheck constraint all
	delete from chitiet_phieunhap
	bulk insert chitiet_phieunhap
	from 'C:\Users\KhanhNguyen9872\Documents\GitHub\DH_Gia_Dinh_K16\SQL Server\dbms\CuoiKy\csv\chitiet_phieunhap.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a',
		CODEPAGE = '65001'
	);
	alter table chitiet_phieunhap check constraint all
end

begin
	alter table nguyenlieu nocheck constraint all
	delete from nguyenlieu
	bulk insert nguyenlieu
	from 'C:\Users\KhanhNguyen9872\Documents\GitHub\DH_Gia_Dinh_K16\SQL Server\dbms\CuoiKy\csv\nguyenlieu.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a',
		CODEPAGE = '65001'
	);
	alter table nguyenlieu check constraint all
end


-- 4.
/*
	Viết câu lệnh thêm bảng vào HOADON có mã hóa đơn là HD101, mã nhân viên 
NV1, mã khu vực KV1, ngày lập 12/2/2024, tổng tiền là 83000. 
*/

insert into hoadon
	(mahd, manv, makv, ngaylap, tongtien)
values
	('HD101', 'NV1', 'KV1', '02/12/2024', 83000)

-- 5.
/*
	Viết câu lệnh thêm vào bảng CHITIET_HOADON các giá trị: mã hóa đơn là HD101, 
mã thức uống là TU10, số lượng là 1. 
*/

insert into chitiet_hoadon
	(matu, mahd, soluong)
values
	('TU10', 'HD101', 1)

-- 6.
/*
	Viết câu lệnh thêm vào bảng PHIEUCHI có mã phiếu chi là PC51, mã nhân viên là 
NV5, nội dung chi là ‘rút doanh thu ngày’, ngày lập: 11/2/2024 và tổng tiền: 
15000000. 
*/

insert into phieuchi
	(mapc, manv, noidungchi, ngaylap, tongtien)
values
	('PC51', 'NV5', N'rút doanh thu ngày', '02/11/2024', 15000000)

-- 7.
/*
	Viết câu lệnh thêm vào bảng PHIEUNHAP có mã phiếu nhập là PN55, mã nhân 
viên là NV3, mã nhà cung cấp là NCC1, ngày lập 12/1/2024 và tổng tiền là 1200000. 
*/

insert into phieunhap
	(mapn, manv, mancc, ngaylap, tongtien)
values
	('PN55', 'NV3', 'NCC01', '01/12/2024', 1200000)

-- 8.
/*
	Viết câu lệnh thêm vào PHIEUPHUTHU có mã phiếu phụ thu PTT63, mã nhân viên 
là NV2, tên phiếu phụ thu là ‘Khách làm vỡ ly’, ngày lập 11/20/2024, số tiền phụ 
thu là 30000.  
*/

insert into phieuphuthu
	(maphieupt, manv, tenppt, ngaylap, sotien)
values
	('PTT63', 'NV2', N'Khách làm vỡ ly', '11/20/2024', 30000)

-- 9.
/*
	Viết câu lệnh sửa tất cả mã nhân viên trong bảng PHIEUPHUTHU thành 'NV2' trong 
duy nhất ngày 14/02/2024.
*/

update phieuphuthu
set manv = 'NV2'
where ngaylap = '02/14/2024'

-- 10.
/*
	Viết câu lệnh sửa TENPPT của nhân viên có mã NV3 trong ngày 30/01/2024 thành 
'Quay phim'. 
*/

update phieuphuthu
set tenppt = N'Quay phim'
where manv = 'NV3' and ngaylap = '01/30/2024'

-- 11.
/*
	 Tăng hệ số giá thêm 1 cho khu vực có nhiều người uống nhất.
*/

update khuvuc
set hesogia = hesogia + 1
where makv in (
	select top 1 makv
	from hoadon
	left join chitiet_hoadon on chitiet_hoadon.mahd = hoadon.mahd
	group by makv
	order by sum(soluong) desc
)

-- 12.
/*
	 Giảm 20% giá các thức uống không bán được trong tháng 1/2024.
*/

update thucuong
set dongia = dongia * 0.8
where matu not in (
	select matu
	from hoadon
    right join chitiet_hoadon on hoadon.mahd = chitiet_hoadon.mahd
    where month(hoadon.ngaylap) = 1 and year(hoadon.ngaylap) = 2024
)

-- 13.
/*
	Tăng thêm 50% giá các thức uống bán chạy nhất. 
*/

update thucuong
set dongia = dongia * 1.5
where matu in (
	select top 1 matu
	from chitiet_hoadon
    group by matu
	order by sum(soluong) desc
)

-- 14.
/*
	Viết câu lệnh xóa báo cáo của một nhân viên với MANV=NV5 vào  ngày 31/01/2024.
*/

delete from baocao
where manv = 'NV5' and ngaylap = '01/31/2024'

-- 15.
/*
	 Viết câu lệnh xóa phiếu phụ thu của nhân viên có mã là NV3 đã lập vào ngày 
21/09/2023.
*/

delete from phieuphuthu
where manv = 'NV3' and ngaylap = '09/21/2023'

-- 16.
/*
	Xuất ra danh sách các thức uống có loại là Tea (mã: tea) 
*/

select *
from thucuong
where maloai = 'tea'

-- 17.
/*
	 Xuất ra danh sách thức uống không chứa nguyên liệu sữa đặc. 
*/

select distinct thucuong.* 
from thucuong
join congthuc on congthuc.matu = thucuong.matu
join nguyenlieu on nguyenlieu.manl = congthuc.manl
where not tennl = N'sữa đặc'

-- 18.
/*
	Xuất ra danh sách những loại thức uống có giá thấp hơn 50 ngàn.
*/

select *
from thucuong
where dongia < 50000

-- 19.
/*
	 Hãy lọc ra những nguyên liệu được cung cấp bởi nhà cung cấp NCC1. 
*/

select nguyenlieu.*
from nguyenlieu
join chitiet_phieunhap on chitiet_phieunhap.manl = nguyenlieu.manl
join phieunhap on phieunhap.mapn = chitiet_phieunhap.mapn
where mancc = 'NCC01'

-- 20.
/*
	 Viết câu lệnh thống kê toàn bộ những nhà cung cấp đang cấp hàng cho hệ thống.
*/

select nhacungcap.mancc, tenncc
from nguyenlieu
join chitiet_phieunhap on chitiet_phieunhap.manl = nguyenlieu.manl
join phieunhap on phieunhap.mapn = chitiet_phieunhap.mapn
join nhacungcap on nhacungcap.mancc = phieunhap.mancc

-- 21.
/*
	 Hãy liệt kê danh sách nhân viên theo chi nhánh 1, 2, 3.
*/

select macn, manv, tennv
from nhanvien
where macn = 'CN1' or macn = 'CN2' or macn = 'CN3'
order by macn

-- 22.
/*
	 Viết câu lệnh để liệt kê thức uống bán nhiều nhất. 
*/

select top 1 matu, sum(soluong) as soluong2
from chitiet_hoadon
group by matu
order by soluong2 desc

-- 23.
/*
	Viết câu lệnh tìm khu vực khách hàng chọn nhiều nhất. 
*/

select top 1 makv, count(mahd) as soluong
from hoadon
group by makv
order by soluong desc

-- 24.
/*
	 Viết câu lệnh thống kê tổng chi theo từng quý.
*/

SELECT YEAR(ngaylap) AS Nam, DATEPART(QUARTER, ngaylap) AS Quy, SUM(tongtien) AS TongChi
FROM (
    SELECT ngaylap, SUM(tongtien) AS tongtien
    FROM phieunhap
    GROUP BY ngaylap
    UNION ALL
    SELECT ngaylap, SUM(tongtien) AS tongtien
    FROM phieuchi
    GROUP BY ngaylap
) AS TongChiTheoQuy
GROUP BY YEAR(ngaylap), DATEPART(QUARTER, ngaylap)
ORDER BY YEAR(ngaylap), DATEPART(QUARTER, ngaylap)

-- 25.
/*
	 Viết câu lệnh để thống kê tổng phụ thu. 
*/

select ngaylap, sum(sotien) as tongphuthu
from phieuphuthu
group by ngaylap
order by ngaylap

-- 26.
/*
	 Viết câu lệnh để tính doanh thu toàn hệ thống năm 2023.
*/

select (ds1.doanhthu + ds2.phuthu) as doanhthu
from (
	select sum(tongtien) as doanhthu
	from hoadon
	where YEAR(ngaylap) = 2023
) ds1,
(
	select sum(sotien) as phuthu
	from phieuphuthu
	where YEAR(ngaylap) = 2023
) ds2

-- 27.
/*
	Viết câu lệnh để tính doanh thu toàn hệ thống của quý 1 năm 2024. 
*/

select (isnull(ds1.doanhthu, 0) + isnull(ds2.phuthu,0)) as doanhthu
from (
	select sum(tongtien) as doanhthu
	from hoadon
	where YEAR(ngaylap) = 2024 and MONTH(ngaylap) = 1
) ds1,
(
	select sum(sotien) as phuthu
	from phieuphuthu
	where YEAR(ngaylap) = 2024 and MONTH(ngaylap) = 1
) ds2

-- 28.
/*
	 Tính lợi nhuận toàn hệ thống năm 2023.
*/

select (isnull(ds1.doanhthu, 0) - isnull(ds2.tongchi, 0)) as loinhuan
from (
	select sum(tongtien) as doanhthu
	from hoadon
	where YEAR(ngaylap) = 2023
) ds1,
(
	select sum(phieuchi.tongtien + phieunhap.tongtien) as tongchi
	from phieuchi
	join phieunhap on phieunhap.manv = phieuchi.manv
	where YEAR(phieunhap.ngaylap) = 2023 and YEAR(phieuchi.ngaylap) = 2023
) ds2


-- 29.
/*
	Tính lợi nhuận theo từng chi nhánh. 
*/

select	ds1.makv, (isnull(ds1.doanhthu, 0) - isnull(ds2.tongchi,0)) as loinhuan
from (
	select makv, sum(tongtien) as doanhthu
	from hoadon
	group by makv
) ds1,
(
	select sum(phieuchi.tongtien + phieunhap.tongtien) as tongchi
	from phieuchi
	join phieunhap on phieunhap.manv = phieuchi.manv
) ds2


-- 30.
/*
	 Thống kê số lượng tồn của tất cả các nguyên liệu còn dưới mức quy định.
*/

select *
from nguyenlieu
where soluong < 10;


-- 31.
/*
	Liệt kê loại nguyên liệu được sử dụng nhiều nhất. 
*/

select top 1 manl, sum(soluong) as soluong
from congthuc
group by manl
order by soluong desc

-- 32.
/*
	 Hãy viết thủ tục thêm một nhân viên mới vào bảng NHANVIEN với tham số truyền 
vào là mã nhân viên, tên nhân viên, mã chức chức vụ, mã chi nhánh, giới tính, ngày 
vào, ngày nghĩ (có thể null). Kiểm tra ngày vào phải lớn hơn ngày thành lập hệ thống 
(01/01/2020) và ràng buộc tồn tại các mã chức vụ, mã chi nhánh.
*/

go
create proc proc_bai32(@manv char(5), @tennv nvarchar(100), @macv char(3), @macn char(3), @gioitinh bit, @ngayvao datetime, @ngaynghi datetime)
as
begin
	if (@ngayvao > 01/01/2020)
	begin
		if not exists (select * from chucvu where macv = @macv)
		begin
			print N'Mã chức vụ không tồn tại'
		end
		else
		begin
			if not exists (select * from chinhanh where macn = @macn)
			begin
				print N'Mã chi nhánh không tồn tại'
			end
			else
			begin
				insert into nhanvien
					(manv, tennv, macv, macn, gioitinh, ngayvao, ngaynghi)
				values
					(@manv, @tennv, @macv, @macn, @gioitinh, @ngayvao, @ngaynghi)
				
			end
		end
	end
end

proc_bai32 'NV200', N'Nguyen Van A', 'CV1', 'CN1', '0', '01/01/2023', '12/31/2023'
select * from nhanvien

-- 33.
/*
	Viết thủ tục thêm một thức uống vào bảng THUCUONG với tham số truyền vào là 
mã thức uống, mã loại thức uống, tên thức uống, đơn giá. Kiểm tra tham số vào 
(kiểm tra tồn tại mã loại thức uống). 
*/

go
create proc proc_bai33(@matu char(5), @maloai char(5), @tentu nvarchar(100), @dongia decimal) 
as
begin
	if not exists (select * from loaithucuong where maloai = @maloai)
	begin
		print N'Mã loại thức uống không tồn tại'
	end
	else
	begin
		insert into thucuong
			(matu, maloai, tentu, dongia)
		values
			(@matu, @maloai, @tentu, @dongia)
	end
end

proc_bai33 'TU70', 'tea', N'Rồng đỏ', '5000'
select * from thucuong

-- 34.
/*
	Viết thủ tục thêm mới một loại thức uống mới vào bảng LOAITHUCUONG với 
tham số truyền vào là mã loại, tên loại thức uống.
*/

go
create proc proc_bai34(@maloai char(5), @tenloai nvarchar(100))
as
begin
	if exists (select * from loaithucuong where maloai = @maloai)
	begin
		print N'Loại thức uống này đã tồn tại!'
	end
	else
	begin
		insert into loaithucuong
			(maloai, tenloai)
		values
			(@maloai, @tenloai)
	end
end

proc_bai34 'L50', N'loại t50'
select * from loaithucuong

-- 35.
/*
	Viết thủ tục thêm mới một nguyên vào bảng NGUYENLIEU với tham số đầu vào 
là mã nguyên liệu, tên nguyên liệu, số lượng, đơn vị.  
*/

go
create proc proc_bai35(@manl char(10), @tennl nvarchar(100), @soluong float, @donvi nvarchar(25))
as
begin
	if exists (select * from nguyenlieu where manl = @manl)
	begin
		print N'Nguyên liệu này đã tồn tại!'
	end
	else
	begin
		insert into nguyenlieu
			(manl, tennl, soluong, donvi)
		values
			(@manl, @tennl, @soluong, @donvi)
	end
end

proc_bai35 'NL50', 'Nguyenlieu', 50, 'cái'
select * from nguyenlieu

-- 36.
/*
	 Viết thủ tục để cập nhật thông tin của một thức uống trong bảng THUCUONG với 
tham số đầu vào là mã thức uống, mã loại thức uống, tên thức uống, đơn giá. Kiểm 
tra ràng buộc tồn tại thức uống và mã loại thức uống.
*/

go
create proc proc_bai36(@matu char(5), @maloai char(5), @tentu nvarchar(100), @dongia decimal)
as
begin
	if not exists (select * from thucuong where matu = @matu)
	begin
		print N'Thức uống này khồng tồn tại!'
	end
	else
	begin
		if not exists (select * from loaithucuong where maloai = @maloai)
		begin
			print N'Loại thức uống không tồn tại!'
		end
		else
		begin
			update thucuong
			set maloai = @maloai, tentu = @tentu, dongia = @dongia
			where matu = @matu
		end
	end
end

proc_bai36 'TU10', 'tea', 'Thucuong10', 50000
select * from thucuong

-- 37.
/*
	Viết thủ tục liệt kê các thức uống thuộc một loại thức uống bất kì, với tham số truyền 
vào là tên loại. Kiểm tra ràng buộc tồn tại tên loại.   
*/

go
create proc proc_bai37(@tenloai nvarchar(100))
as
begin
	if not exists (select * from loaithucuong where tenloai = @tenloai)
	begin
		print N'Tên loại thức uống không tồn tại!'
	end
	else
	begin
		select *
		from thucuong
		join loaithucuong on loaithucuong.maloai = thucuong.maloai
		where tenloai = @tenloai
	end
end

proc_bai37 'Orange'

-- 38.
/*
	 Viết thủ tục liệt kê thông tin tất cả các nguyên liệu (tên nguyên liệu, số lượng tồn 
kho, đơn vị) của một thức uống bất kì, với tham số truyền vào là tên thức uống. Kiểm 
tra ràng buộc tồn tại tên thức uống. 
*/

go
create proc proc_bai38(@tentu nvarchar(100))
as
begin
	if not exists (select * from thucuong where tentu = @tentu)
	begin
		print N'Tên thức uống không tồn tại!'
	end
	else
	begin
		declare @matu char(5)
		set @matu = (select matu from thucuong where tentu = @tentu)

		select nguyenlieu.*
		from congthuc
		join nguyenlieu on nguyenlieu.manl = congthuc.manl
		where matu = @matu
	end
end

proc_bai38 N'Trà dâu'

-- 39.
/*
	Viết thủ tục dùng để tìm những thức uống không bán được của chi nhánh bất kì trong 
khoảng thời gian nào đó. Với tham số đầu vào là tên chi nhánh, thời gian bắt đầu và 
thời gian kết thúc.   
*/

go
alter proc proc_bai39(@tencn nvarchar(100), @batdau datetime, @ketthuc datetime)
as
begin
	select *
	from thucuong
	where matu not in (
		select matu
		from chitiet_hoadon
		join hoadon on chitiet_hoadon.mahd = hoadon.mahd
		where ngaylap between @batdau and @ketthuc
	)
end


proc_bai39 N'Chi nhánh Bình Minh', '01/01/2023', '12/04/2024'
select * from hoadon

-- 40.
/*
	Viết thủ tục liệt kê tên các nguyên liệu của một nhà cung cấp bất kì, với tham số đầu 
vào là tên nhà cung cấp, kiểm tra ràng buộc tồn tại tên nhà cung cấp.  
*/

go
create proc proc_bai40(@tenncc nvarchar(10))
as
begin
	if not exists (select * from nhacungcap where tenncc = @tenncc)
	begin
		print N'Tên nhà cung cấp không tồn tại!'
	end
	else
	begin
		select manl
		from nhacungcap
		join phieunhap on phieunhap.mancc = nhacungcap.mancc
		join chitiet_phieunhap on chitiet_phieunhap.mapn = phieunhap.mapn
		where tenncc = @tenncc
	end
end

proc_bai40 N'ABC'


-- 41.
/*
	 Viết thủ tục tăng giá của một thức uống bất kì với tham số truyền vào là tên thức 
uống và hệ số giá. Điều kiện tên thức uống tồn tại và hệ số tăng giá phải nhỏ hơn 1 
đồng thời không nhỏ hơn -0.5. 
*/

go
create proc proc_bai41(@tentu nvarchar(100), @hesogia float)
as
begin
	if not exists (select * from thucuong where tentu = @tentu)
	begin
		print N'Tên thức uống không tồn tại!'
	end
	else
	begin
		if (@hesogia < 1 and @hesogia >= -0.5)
		begin
			update thucuong
			set dongia = dongia * (1 + @hesogia)
			where tentu = @tentu
		end
		else
		begin
			print N'Hệ số giá sai!'
		end
	end
end

proc_bai41 N'Trà dâu', 0.5
select * from thucuong

-- 42.
/*
	Viết thủ tục tính tổng tiền phụ thu của một chi nhánh bất kì trong thời gian bất kì. 
Với tham số truyền vào là tên chi nhánh, thời gian bắt đầu và thời gian kết thúc. Điều 
kiện ràng buộc thời gian bắt đầu phải trước thời gian kết thúc.     
*/

go
create proc proc_bai42(@tencn nvarchar(100), @batdau datetime, @ketthuc datetime)
as
begin
	if (@batdau < @ketthuc)
	begin
		select sum(sotien) as tienphuthu
		from chinhanh
		join nhanvien on nhanvien.macn = chinhanh.macn
		join phieuphuthu on phieuphuthu.manv = nhanvien.manv
		where tencn = @tencn and (ngaylap between @batdau and @ketthuc)
	end
	else
	begin
		print N'Thời gian không hợp lệ!'
	end
end

proc_bai42 N'Chi nhánh Ngọc Lan', '01/01/2023', '12/31/2024'

-- 43.
/*
	Viết thủ tục tính lợi nhuận của hệ thống trong khoảng thời gian bất kì. Với tham số 
đầu vào là thời gian bắt đầu, thời gian kết thúc. Tham sô đầu ra là tổng lợi nhuận của 
hệ thống (lợi nhuận = tổng doanh thu - tổng chi). 
*/

go
create proc proc_bai43(@batdau datetime, @ketthuc datetime)
as
begin
	select (ds1.doanhthu - ds2.tongchi) as loinhuan
	from (
		select sum(tongtien) as doanhthu
		from hoadon
		where ngaylap between @batdau and @ketthuc
	) ds1,
	(
		select sum(phieuchi.tongtien + phieunhap.tongtien) as tongchi
		from phieuchi
		join phieunhap on phieunhap.manv = phieuchi.manv
		where (phieuchi.ngaylap between @batdau and @ketthuc) and (phieunhap.ngaylap between @batdau and @ketthuc)
	) ds2
end

proc_bai43 '01/01/2023', '12/31/2024'

-- 44.
/*
	 Viết thủ tục tìm thức uống bán chạy nhất của chi nhánh bất kì trong khoảng thời gian 
bất kì, với tham số truyền vào là tên chi nhánh, thời gian bắt đầu và thời gian kết 
thúc. Điều kiện thời gian bắt đầu trước thời gian kết thúc.   
*/

go
create proc proc_bai44(@tencn nvarchar(100), @batdau datetime, @ketthuc datetime)
as
begin
	if (@batdau < @ketthuc)
	begin
		select top 1 thucuong.*
		from hoadon
		join chitiet_hoadon on chitiet_hoadon.mahd = hoadon.mahd
		join thucuong on thucuong.matu = chitiet_hoadon.matu
		join nhanvien on nhanvien.manv = hoadon.manv
		join chinhanh on chinhanh.macn = nhanvien.macn
		where (tencn = @tencn) and (hoadon.ngaylap between @batdau and @ketthuc)
		order by soluong desc
	end
	else
	begin
		print N'Thời gian không hợp lệ!'
	end
end

proc_bai44 N'Chi nhánh Bình Minh', '01/01/2023', '12/31/2024'

-- 45.
/*
	 Viết thủ tục tính tổng số tiền doanh thu của hệ thống trong một ngày bất kì với tham 
số đầu vào là ngày và tham số đầu ra là tổng doanh thu của ngày đó. 
*/

go
create proc proc_bai45(@ngay date)
as
begin
	declare @tienhd bigint
	set @tienhd = (
		select sum(isnull(tongtien, 0)) as doanhthu
		from hoadon
		where ngaylap = @ngay
	)

	declare @tienpt bigint
	set @tienpt = (
		select sum(isnull(sotien, 0)) as phuthu
		from phieuphuthu
		where ngaylap = @ngay
	)

	select isnull(@tienhd, 0) + isnull(@tienpt, 0) as doanhthu
end

proc_bai45 '04/04/2024'

-- 46.
/*
	 Viết thủ tục tìm thức uống bán chạy nhất của hệ thống trong khoảng thời gian bất kì, 
với tham số truyền vào là thời gian bắt đầu và thời gian kết thúc. Điều kiện thời gian 
bắt đầu trước thời gian kết thúc.  
*/

go
create proc proc_bai46(@batdau datetime, @ketthuc datetime)
as
begin
	if (@batdau < @ketthuc)
	begin
		select top 1 thucuong.*
		from hoadon
		join chitiet_hoadon on chitiet_hoadon.mahd = hoadon.mahd
		join thucuong on thucuong.matu = chitiet_hoadon.matu
		where ngaylap between @batdau and @ketthuc
		order by soluong desc
	end
	else
	begin
		print N'Thời gian không hợp lệ!'
	end
end

proc_bai46 '01/01/2023', '12/31/2024'

-- 47.
/*
	 Viết thủ tục liệt kê các loại nguyên liệu (tên, số lượng tồn, đơn vị) của một phiếu 
nhập bất kì, với tham số đầu vào là mã phiếu nhập. 
*/

go
create proc proc_bai47(@mapn char(10))
as
begin
	select tennl, nguyenlieu.soluong, donvi
	from chitiet_phieunhap
	join nguyenlieu on nguyenlieu.manl = chitiet_phieunhap.manl
	where mapn = @mapn
end

proc_bai47 'PN01'

-- 48.
/*
	Viết thủ tục tính tổng doanh thu của hệ thống trong khoảng thời gian bất kì. Với 
tham số đầu vào là thời gian bắt đầu, thời gian kết thúc. Tham sô đầu ra là tổng 
doanh thu của hệ thống (doanh thu= tổng tiền hóa đơn + tổng tiền phụ thu).  
*/

go
create proc proc_bai48(@batdau datetime, @ketthuc datetime)
as
begin
	declare @tienhd bigint
	set @tienhd = (
		select sum(tongtien) as doanhthu
		from hoadon
		where ngaylap between @batdau and @ketthuc
	)

	declare @tienpt bigint
	set @tienpt = (
		select sum(sotien) as phuthu
		from phieuphuthu
		where ngaylap between @batdau and @ketthuc
	)

	select isnull(@tienhd, 0) + isnull(@tienpt, 0) as doanhthu
end

proc_bai48 '01/01/2024', '12/31/2024'

-- 49.
/*
	Viết thủ tục tính tổng chi tiêu của hệ thống trong khoảng thời gian bất kì. Với tham 
số đầu vào là thời gian bắt đầu, thời gian kết thúc. Tham sô đầu ra là tổng tiền chi 
của hệ thống (tổng chi= tổng tiền phiếu nhập + tổng tiền phiếu chi).
*/

go
create proc proc_bai49(@batdau datetime, @ketthuc datetime)
as
begin
	declare @tienpn bigint
	set @tienpn = (
		select sum(tongtien) as tienpn
		from phieunhap
		where ngaylap between @batdau and @ketthuc
	)

	declare @tienpc bigint
	set @tienpc = (
		select sum(tongtien) as tienpc
		from phieuchi
		where ngaylap between @batdau and @ketthuc
	)

	select (isnull(@tienpn, 0) + isnull(@tienpc, 0)) as tongchi
end

proc_bai49 '01/01/2024', '12/31/2024'


-- 50.
/*
	 Viết một thủ tục với tùy chọn ‘with encryption’, mã hóa không cho người dùng xem 
được nội dung của thủ tục.  
*/

go
create proc proc_bai50(@mapn char(10))
with encryption
as
begin
	select tennl, nguyenlieu.soluong, donvi
	from chitiet_phieunhap
	join nguyenlieu on nguyenlieu.manl = chitiet_phieunhap.manl
	where mapn = @mapn
end

proc_bai50 'PN01'

-- 51.
/*
	 Viết Trigger bắt lỗi cho lệnh Insert vào bảng CHITIET_HOADON. Khi thêm chi 
tiết hóa đơn thì kiểm tra trùng mã, kiểm tra nhập số lượng âm, thông báo không đủ 
nguyên liệu nếu hết và phải giảm số lượng tồn của nguyên liệu nếu thỏa các điều 
kiện còn lại.
*/

go
CREATE TRIGGER trg_bai51
ON CHITIET_HOADON
INSTEAD OF INSERT
AS
BEGIN
	 DECLARE @MATU CHAR(5)
	 DECLARE @MAHD NVARCHAR(20)
	 DECLARE @SOLUONG FLOAT
	 SELECT @MATU = MATU, @MAHD = MAHD, @SOLUONG = SOLUONG FROM inserted

	 IF EXISTS (SELECT 1 FROM CHITIET_HOADON WHERE MATU = @MATU AND MAHD = @MAHD)
	 BEGIN
		 PRINT N'Mã thức uống đã tồn tại'
		 ROLLBACK TRANSACTION
		 RETURN
	 END
	 IF @SOLUONG < 0
	 BEGIN
		 PRINT N'Số lượng không thể âm'
		 ROLLBACK TRANSACTION
		 RETURN
	 END
	 IF NOT EXISTS (SELECT 1 FROM NGUYENLIEU WHERE MANL = @MATU AND SOLUONG >= @SOLUONG)
	 BEGIN
		 PRINT N'Không đủ nguyên liệu để thêm'
		 ROLLBACK TRANSACTION
		 RETURN
	 END

	 UPDATE NGUYENLIEU
	 SET SOLUONG = SOLUONG - @SOLUONG
	 WHERE MANL = @MATU

	 INSERT INTO CHITIET_HOADON (MATU, MAHD, SOLUONG) VALUES (@MATU, @MAHD, @SOLUONG)
END

INSERT INTO CHITIET_HOADON (MATU, MAHD, SOLUONG)
VALUES ('TU01', 'HD00', 100)


-- 52.
/*
	 Viết Trigger bắt lỗi cho lệnh Update vào bảng CHITIET_HOADON. Khi sửa số 
lượng thức uống trong chi tiết hóa đơn thì phải sửa số lượng tồn của nguyên liệu. 
*/

go
CREATE TRIGGER trg_bai52
ON CHITIET_HOADON AFTER UPDATE AS
BEGIN
    IF UPDATE(SOLUONG)
    BEGIN
        DECLARE @MATU CHAR(5)
        DECLARE @SOLUONG_OLD FLOAT
        DECLARE @SOLUONG_NEW FLOAT
        SELECT @MATU = INSERTED.MATU, @SOLUONG_OLD = d.SOLUONG, @SOLUONG_NEW = INSERTED.SOLUONG FROM INSERTED INNER JOIN DELETED d ON INSERTED.MATU = d.MATU AND INSERTED.MAHD = d.MAHD
        IF NOT EXISTS (SELECT * FROM NGUYENLIEU WHERE MANL = @MATU AND SOLUONG >= @SOLUONG_NEW) BEGIN
            PRINT N'Phải sửa số lượng tồn của nguyên liệu.'; ROLLBACK TRANSACTION; RETURN;
        END
        ELSE UPDATE NGUYENLIEU SET SOLUONG = SOLUONG - (@SOLUONG_NEW - @SOLUONG_OLD) WHERE MANL = @MATU
    END
END

UPDATE CHITIET_HOADON SET SOLUONG = 50
WHERE MATU = 'TU01' AND MAHD = 'HD01';



-- 53.
/*
	 Viết Trigger bắt lỗi cho lệnh Delete vào bảng CHITIET_HOADON. Khi xóa chi tiết 
hóa đơn thì phải tăng số lượng tồn của nguyên liệu kiểm tra nếu xóa hết mã hóa đơn 
đó thì xóa lun bên bảng hóa đơn. 
*/

go
CREATE TRIGGER trg_bai53
ON CHITIET_HOADON AFTER DELETE AS
BEGIN
    DECLARE @DeletedHoaDon NVARCHAR(20)
    SELECT @DeletedHoaDon = MAHD FROM deleted;
    IF @DeletedHoaDon IS NULL
		PRINT N'Không có chi tiết hóa đơn nào được xóa.';RETURN;
    UPDATE NGUYENLIEU SET SOLUONG = SOLUONG + (SELECT SUM(SOLUONG) FROM deleted WHERE MAHD = @DeletedHoaDon) WHERE MANL IN (SELECT MANL FROM deleted)
    IF NOT EXISTS (SELECT 1 FROM CHITIET_HOADON WHERE MAHD = @DeletedHoaDon)
    BEGIN
        DELETE FROM HOADON WHERE MAHD = @DeletedHoaDon;
        PRINT N'Đã xóa hóa đơn ' + @DeletedHoaDon + N' do không còn chi tiết hóa đơn liên quan.';
    END
    ELSE
        PRINT N'Đã xóa chi tiết hóa đơn và cập nhật số lượng tồn của nguyên liệu.'
END

DELETE FROM CHITIET_HOADON WHERE MAHD = 'HD100' AND MATU = 'TU09';

-- 54.
/*
	 Viết Trigger bắt lỗi cho lệnh Insert vào bảng CHITIET_PHIEUNHAP. Khi thêm chi 
tiết nhập thì kiểm tra trùng mã, bắt không được nhập số âm phải tăng số lượng tồn 
của nguyên liệu (nhập hàng). 
*/

go
CREATE TRIGGER trg_bai54
ON CHITIET_PHIEUNHAP INSTEAD OF INSERT AS
BEGIN
    DECLARE @MANL CHAR(5);
    DECLARE @SOLUONG INT;
    SELECT @MANL = MANL, @SOLUONG = SOLUONG FROM inserted;
    IF @SOLUONG < 0
    BEGIN
        PRINT N'Số lượng không được âm.';ROLLBACK TRANSACTION;RETURN;
    END
    IF NOT EXISTS (SELECT 1 FROM CHITIET_PHIEUNHAP WHERE MANL = @MANL)
    BEGIN
        UPDATE NGUYENLIEU SET SOLUONG = SOLUONG + @SOLUONG WHERE MANL = @MANL;

        INSERT INTO CHITIET_PHIEUNHAP (MANL, SOLUONG)
        SELECT MANL, SOLUONG FROM inserted;
    END
    ELSE
    BEGIN
        PRINT N'Mã nguyên liệu đã tồn tại trong chi tiết phiếu nhập.';ROLLBACK TRANSACTION;RETURN;
    END
END;

INSERT INTO CHITIET_PHIEUNHAP (MANL, SOLUONG)
VALUES ('NL01', -20);

-- 55.
/*
	Viết Trigger bắt lỗi cho lệnh Update vào bảng CHITIET_PHIEUNHAP. Khi sửa số 
lượng nguyên liệu trong chi tiết phiếu nhập thì: không được sửa số âm, phải sửa số 
lượng tồn của nguyên liệu. 
*/

go
CREATE TRIGGER trg_bai55
ON CHITIET_PHIEUNHAP INSTEAD OF UPDATE AS
BEGIN
    DECLARE @UpdatedRows TABLE (MANL CHAR(5),SOLUONG FLOAT);
    DECLARE @OldManl CHAR(5);DECLARE @OldSoluong FLOAT;
    DECLARE @NewManl CHAR(5);DECLARE @NewSoluong FLOAT;
    INSERT INTO @UpdatedRows (MANL, SOLUONG) SELECT i.MANL, i.SOLUONG FROM inserted i INNER JOIN deleted d ON i.MANL = d.MANL;
    IF EXISTS (SELECT * FROM @UpdatedRows WHERE SOLUONG < 0)
    BEGIN
        PRINT N'Số lượng không được âm.';ROLLBACK TRANSACTION;RETURN;
    END;
    DECLARE @RowCount INT = (SELECT COUNT(*) FROM @UpdatedRows);
    IF @RowCount > 0 BEGIN
        DECLARE @Index INT = 1;
        WHILE @Index <= @RowCount
        BEGIN
            SELECT @OldManl = MANL, @OldSoluong = SOLUONG FROM @UpdatedRows WHERE @@ROWCOUNT = 1;
            SELECT @NewManl = MANL, @NewSoluong = SOLUONG FROM @UpdatedRows WHERE @@ROWCOUNT = 1;
            UPDATE NGUYENLIEU SET SOLUONG = SOLUONG - @OldSoluong + @NewSoluong WHERE MANL = @NewManl;
            PRINT N'Đã sửa số lượng tồn của nguyên liệu thành công.';
            SET @Index = @Index + 1;
        END;
    END;
    UPDATE CHITIET_PHIEUNHAP SET SOLUONG = u.SOLUONG FROM CHITIET_PHIEUNHAP cp JOIN @UpdatedRows u ON cp.MANL = u.MANL;
END;

UPDATE CHITIET_PHIEUNHAP SET SOLUONG = -50 WHERE MANL = 'NL01';

-- 56.
/*
	Viết Trigger bắt lỗi cho lệnh Delete vào bảng CHITIET_PHIEUNHAP. Khi xóa chi 
tiết nhập thì phải giảm số lượng tồn của nguyên liệu, kiểm tra chi tiết phiếu nhập của 
Mã phiếu nhập vừa xóa còn trong bảng chi tiết phiếu nhập hay không, nếu không thì 
xóa phiếu nhập đó bên bảng PHIEUNHAP. 
*/

go
CREATE TRIGGER trg_bai56
ON CHITIET_PHIEUNHAP INSTEAD OF DELETE AS
BEGIN
    IF NOT EXISTS (SELECT * FROM deleted) BEGIN PRINT N'Không có chi tiết phiếu nhập nào được xóa.';ROLLBACK TRANSACTION;RETURN;END;
    DECLARE @DeletedRows TABLE (MANL CHAR(5), SOLUONG FLOAT); DECLARE @Mapn CHAR(10);
    INSERT INTO @DeletedRows (MANL, SOLUONG) SELECT MANL, SOLUONG FROM deleted;
    DECLARE @RowCount INT = (SELECT COUNT(*) FROM @DeletedRows);
    IF @RowCount > 0 BEGIN
        DECLARE @Index INT = 1;
        WHILE @Index <= @RowCount BEGIN
            DECLARE @ManlToDelete CHAR(5);DECLARE @SoluongToDelete FLOAT;
            SELECT @ManlToDelete = MANL, @SoluongToDelete = SOLUONG FROM @DeletedRows WHERE @@ROWCOUNT = 1;
            UPDATE NGUYENLIEU SET SOLUONG = SOLUONG - @SoluongToDelete WHERE MANL = @ManlToDelete;
            PRINT N'Đã giảm số lượng tồn của nguyên liệu thành công.';
            SET @Index = @Index + 1;
        END;
    END;
    SELECT @Mapn = MAPN FROM deleted;
    IF NOT EXISTS (SELECT 1 FROM CHITIET_PHIEUNHAP WHERE MAPN = @Mapn) BEGIN
        DELETE FROM PHIEUNHAP WHERE MAPN = @Mapn;
        PRINT N'Đã xóa phiếu nhập ' + @Mapn + N' và chi tiết phiếu nhập tương ứng thành công.'; END
    ELSE
        PRINT N'Đã xóa chi tiết phiếu nhập thành công.';
END;

DELETE FROM CHITIET_PHIEUNHAP WHERE MANL ='NL01'


-- 57.
/*
	 Viết Trigger cho lệnh Delete của bảng NHANVIEN. Khi xóa nhân viên thì tự động 
xóa các bảng có liên quan ( chỉ xóa nhân viên đã nghĩ hơn 12 tháng). 
*/

go
CREATE TRIGGER trg_bai57
ON NHANVIEN
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @DeletedEmployees TABLE (manv CHAR(5));
    INSERT INTO @DeletedEmployees (manv) SELECT manv FROM deleted where DATEDIFF(MONTH, ngaynghi, GETDATE()) > 12;
    DELETE FROM baocao WHERE manv IN (SELECT manv FROM @DeletedEmployees)
	DELETE FROM phieuphuthu WHERE manv IN (SELECT manv FROM @DeletedEmployees)
    DELETE FROM phieuchi WHERE manv IN (SELECT manv FROM @DeletedEmployees)
	DECLARE @TablePhieuNhap TABLE (mapn CHAR(10));
	INSERT INTO @TablePhieuNhap (mapn) SELECT mapn FROM phieunhap WHERE manv IN (SELECT manv FROM @DeletedEmployees)
	DELETE FROM chitiet_phieunhap where mapn in (select mapn from @TablePhieuNhap)
    DELETE FROM phieunhap WHERE mapn IN (SELECT mapn FROM @TablePhieuNhap)
    DELETE FROM hoadon WHERE manv IN (SELECT manv FROM @DeletedEmployees)
    DELETE FROM NHANVIEN WHERE manv IN (SELECT manv FROM @DeletedEmployees) 
END

DELETE FROM NHANVIEN WHERE MANV = 'NV0';


-- 58.
/*
	 Viết Trigger bắt lỗi tuổi nhân viên khi Insert và khi Update bảng NHANVIEN. Điều 
kiện nhân viên phải trên 18 tuổi. 
*/

go
CREATE TRIGGER trg_bai58
ON NHANVIEN
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE (year(CURRENT_TIMESTAMP) - year(ngaysinh)) <= 18)
    BEGIN
        print N'Nhân viên phải trên 18 tuổi!'
        ROLLBACK TRANSACTION
    END
END

insert into NHANVIEN
	(MANV,TENNV,MACV,MACN,NGAYSINH,GIOITINH,SODT,EMAIL,DIACHI,NGAYVAO,NGAYNGHI)
values
	('NV200', N'Trần Thị Tú', 'CV0', 'CN0', '01/01/2018', 1, '6464336535' ,'tttu@gmail.com', N'123 Nguyen Trai - Q.1 - TP.HCM', '04/14/2024', NULL)

-- 59.
/*
	Viết Trigger bắt lỗi dữ liệu không âm cho các trường số lượng , tổng tiền,.. (kiểu số) 
có các bảng dữ liệu.
*/

go
CREATE TRIGGER trg_bai59_phieuphuthu
ON phieuphuthu
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE sotien < 0)
    BEGIN
        print N'Dữ liệu không được âm!'
        ROLLBACK TRANSACTION
    END
END

go
CREATE TRIGGER trg_bai59_phieuchi
ON phieuchi
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE tongtien < 0)
    BEGIN
        print N'Dữ liệu không được âm!'
        ROLLBACK TRANSACTION
    END
END

go
CREATE TRIGGER trg_bai59_phieunhap
ON phieunhap
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE tongtien < 0)
    BEGIN
        print N'Dữ liệu không được âm!'
        ROLLBACK TRANSACTION
    END
END

go
CREATE TRIGGER trg_bai59_hoadon
ON hoadon
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE tongtien < 0)
    BEGIN
        print N'Dữ liệu không được âm!'
        ROLLBACK TRANSACTION
    END
END

go
CREATE TRIGGER trg_bai59_chitiet_hoadon
ON chitiet_hoadon
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE soluong < 0)
    BEGIN
        print N'Dữ liệu không được âm!'
        ROLLBACK TRANSACTION
    END
END

go
CREATE TRIGGER trg_bai59_nguyenlieu
ON nguyenlieu
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE soluong < 0)
    BEGIN
        print N'Dữ liệu không được âm!'
        ROLLBACK TRANSACTION
    END
END

insert into chitiet_hoadon
	(MATU,MAHD,SOLUONG)
values
	('TU01', 'HD07', -1)


-- 60.
/*
	Hệ thống có 4 nhóm quyền: BANHANG, KIEMKHO, QUANLY, GIAMDOC. Hãy 
phân quyền cho từng nhóm này theo mô tả ở Phần II.
*/

-- BANHANG

GRANT SELECT, INSERT ON HOADON TO BANHANG;
GRANT SELECT, INSERT ON CHITIET_HOADON TO BANHANG;
GRANT SELECT, INSERT ON PHIEUPHUTHU TO BANHANG;
GRANT SELECT, INSERT ON PHIEUCHI TO BANHANG;

DENY UPDATE, DELETE ON LOAITHUCUONG TO BANHANG;
DENY UPDATE, DELETE ON THUCUONG TO BANHANG;
DENY UPDATE, DELETE ON NGUYENLIEU TO BANHANG;
DENY UPDATE, DELETE ON KHUVUC TO BANHANG;
DENY UPDATE, DELETE ON CHINHANH TO BANHANG;
DENY UPDATE, DELETE ON CONGTHUC TO BANHANG;

-- KIEMKHO

GRANT SELECT, INSERT ON PHIEUNHAP TO KIEMKHO;
GRANT SELECT, INSERT ON CHITIET_PHIEUNHAP TO KIEMKHO;
GRANT SELECT ON NGUYENLIEU TO KIEMKHO;

DENY UPDATE, DELETE ON PHIEUNHAP TO KIEMKHO;
DENY UPDATE, DELETE ON CHITIET_PHIEUNHAP TO KIEMKHO;
DENY UPDATE, DELETE ON NGUYENLIEU TO KIEMKHO;

-- QUANLY

GRANT SELECT, INSERT, UPDATE ON NHANVIEN TO QUANLY;
GRANT SELECT, INSERT, UPDATE ON BAOCAO TO QUANLY;
GRANT SELECT, INSERT, UPDATE ON CONGTHUC TO QUANLY;
GRANT SELECT, INSERT, UPDATE ON KHUVUC TO QUANLY;
GRANT SELECT, INSERT, UPDATE ON CHINHANH TO QUANLY;
GRANT SELECT, INSERT, UPDATE ON LOAITHUCUONG TO QUANLY;
GRANT SELECT, INSERT, UPDATE ON NHACUNGCAP TO QUANLY;

GRANT SELECT, INSERT ON HOADON TO QUANLY;
GRANT SELECT, INSERT ON CHITIET_HOADON TO QUANLY;
GRANT SELECT, INSERT ON PHIEUPHUTHU TO QUANLY;
GRANT SELECT, INSERT ON PHIEUCHI TO QUANLY;
GRANT SELECT, INSERT ON PHIEUNHAP TO QUANLY;
GRANT SELECT, INSERT ON CHITIET_PHIEUNHAP TO QUANLY;
GRANT SELECT ON THUCUONG TO QUANLY;

DENY UPDATE, DELETE ON CHUCVU TO QUANLY;

-- GIAMDOC

GRANT ALL PRIVILEGES TO GIAMDOC;
