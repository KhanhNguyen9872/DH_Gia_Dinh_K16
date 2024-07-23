CREATE TABLE `house` (
  `maGiaoDich` int(11) NOT NULL,
  `ngayGiaoDich` date NOT NULL,
  `donGia` int(11) NOT NULL,
  `loaiNha` varchar(255) NOT NULL,
  `diaChi` varchar(255) NOT NULL,
  `dienTich` double NOT NULL,
  primary key (`maGiaoDich`)
);

INSERT INTO `house` (`maGiaoDich`, `ngayGiaoDich`, `donGia`, `loaiNha`, `diaChi`, `dienTich`) VALUES
(1, '2024/07/23', 5000, 'Nhà cấp 4', 'Bình Thuận', 500);
