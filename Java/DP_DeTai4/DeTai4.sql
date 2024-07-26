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

CREATE TABLE `land` (
  `maGiaoDich` int(11) NOT NULL,
  `ngayGiaoDich` date NOT NULL,
  `donGia` int(11) NOT NULL,
  `loaiDat` varchar(255) NOT NULL,
  `dienTich` double NOT NULL,
  primary key (`maGiaoDich`)
);

INSERT INTO `land` (`maGiaoDich`, `ngayGiaoDich`, `donGia`, `loaiDat`, `dienTich`) VALUES
(1, '2024/07/23', 5000, 'A', 500),
(2, '2024/07/23', 5000, 'B', 500),
(3, '2024/07/23', 5000, 'C', 500);
