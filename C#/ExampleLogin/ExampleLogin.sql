-- 221402 - KhanhNguyen9872

use master;
ALTER DATABASE Nhom1 SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE Nhom1 SET ONLINE;

DROP DATABASE Nhom1;

create database Nhom1;
go
use Nhom1;
go

create table account (
	username nvarchar(50) primary key,
	password nvarchar(50) not null,
	sdt nchar(10) not null,
	email nvarchar(255) not null unique,
	lock bit not null
)

insert into account values 
	('root', 'root', '0123456789', 'root@localhost.com', 0)