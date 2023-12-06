---- Nhom 4 - 221402 ----
DROP TABLE IF EXISTS NHANVIEN;

CREATE TABLE `NHANVIEN` (
	`MANV` int NOT NULL AUTO_INCREMENT,
	`HONV` varchar(32) NOT NULL,
	`TENLOT` varchar(32) NOT NULL,
	`TENNV` varchar(32) NOT NULL,
	`PHAI` char(3) NOT NULL CHECK (PHAI IN ('NAM', 'NU')),
	`NGSINH` datetime NOT NULL DEFAULT current_timestamp,
	`QUEQUAN` varchar(255) NOT NULL,
	`NOISINH` varchar(255) NOT NULL,
	`PHG` int(16) NOT NULL DEFAULT -1,
	PRIMARY KEY (`MANV`)
)

INSERT INTO `NHANVIEN` (
	`HONV`,
	`TENLOT`,
	`TENNV`,
	`PHAI`,
	`NGSINH`,
	`QUEQUAN`,
	`NOISINH`
) VALUES (
	'Nguyễn',
	'Văn',
	'Khánh',
	'Nam',
	'2004-07-02 12:00:00',
	'Binh Thuan',
	'Lagi'
)

---------- END ----------