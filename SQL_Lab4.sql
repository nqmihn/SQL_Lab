create database CONGTY
use CONGTY

create table NHANVIEN(
	HoNV nvarchar(15) not null,
	TenLot nvarchar(15) not null,
	TenNV nvarchar(15) not null,
	MANV char(9) ,
	NGSINH date  default(GETDATE()),
	DCHI nvarchar(30), 
	PHAI nvarchar(3)  default(N'Nữ'),
	LUONG float ,
	MA_NQL nchar(9),
	PHNG int,
	primary key(MANV),
)

create table PHONGBAN(
	TENPHG nvarchar(15),
	MAPHG int ,
	TRPHG char(9),
	NG_NHANCHUC date not null default(getdate()),
	primary key(MAPHG)

)



alter table NHANVIEN
add constraint FK_PHNG foreign key(PHNG) references PHONGBAN(MAPHG)

create table DIADIEM_PHG(
	MAPHG int ,
	DIADIEM nvarchar(15),
	primary key(MAPHG,DIADIEM)
)

alter table DIADIEM_PHG
add constraint FK_DIADIEM_PHG_BAN foreign key(MAPHG) references PHONGBAN(MAPHG)

create table DEAN(
	TENDA nvarchar(15) ,
	MADA int ,
	DDIEM_DA nvarchar(15) ,
	PHONG int ,
	primary key(MADA),
	foreign key (PHONG) references PHONGBAN(MAPHG)
)

create table CONGVIEC(
	MADA int,
	STT int,
	TEN_CONG_VIEC nvarchar(50) ,
	primary key(MADA,STT)
)


create table PHANCONG(
	MANVIEN char(9) ,
	MADA int ,
	STT int ,
	THOIGIAN numeric(5,1),
	primary key(MANVIEN,MADA),
	foreign key(MADA,STT) references CONGVIEC(MADA,STT)
)

create table THANNHAN(
	MA_NVIEN char(9) ,
	TENTN nvarchar(15) ,
	PHAI nvarchar(3)  default(N'Nữ'),
	NGSINH date ,
	QUANHE nvarchar(15) ,
	primary key(MA_NVIEN,TENTN),
	foreign key(MA_NVIEN) references NHANVIEN(MANV)
)

insert into PHONGBAN
values(N'Nghiên cứu',5,'005','1978/05/22'),
(N'Điều Hành',4,'008','1985/01/01'),
(N'Quản lý',1,'006','1971/06/19')

insert into NHANVIEN
values(N'Đinh',N'Bá',N'Tiên','009','1960/02/11',N'119 Cống Quỳnh,TPHCM','NAM',30000,'005',5),
(N'Nguyễn',N'Thanh',N'Tùng','005','1962/08/20',N'222 Nguyễn Văn Cừ, Tp HCM','NAM',40000,'006',5),
(N'Bùi',N'Ngọc',N'Hằng','007','1954/03/11',N'332 Nguyễn Thái Học','NAM',25000,'001',4),
(N'Lê',N'Quỳnh',N'Như','001','1967/02/01',N'291 Hồ Văn Huê, Tp HCM',default,43000,'006',4),
(N'Nguyễn',N'Mạnh',N'Hùng','004','1967/03/04',N'95 Bà Rịa, Vũng Tàu','NAM',38000,'005',5),
(N'Trần',N'Thanh',N'Tâm','003','1957/05/04',N'34 Mai Thị Lự, Tp HCM','NAM',25000,'005',5),
(N'Trần',N'Hồng',N'Quang','008','1967/09/01',N'80 Lê Hồng Phong, Tp HCM','NAM',25000,'001',4),
(N'Phạm',N'Văn',N'Vinh','006','1965/01/01',N'45 Trưng Vương, Hà Nội',default,55000,NULL,1)


alter table PHONGBAN
add constraint FK_PHONGBAN foreign key (TRPHG) references NHANVIEN(MANV)

insert into DIADIEM_PHG
values(1,'TP HCM'),(4,N'Hà Nội'),(5,'TAU')

insert into DEAN
values('San pham X',1,N'Vũng Tàu',5),
('San pham Y',2,N'Nha Trang',5),
('San pham Z',3,N'TP HCM',5),
('Tin hoc hoa',10,N'Hà Nội',4),
('Cap quang',20,N'TP HCM',1),
('Dao tao',30,N'Hà Nội',4)

insert into CONGVIEC 
values (1, 1, 'Thiet ke san pham X'),
(1, 2, 'Thu nghiem san pham X'),
(2, 1, 'San xuat san pham Y'),
(2, 2, 'Quang cao san pham Y'),
(3, 1, 'Khuyen mai san pham Z'),
(10, 1, 'Tin hoc hoa nhan su tien luong'),
(10, 2, 'Tin hoc hoa phong Kinh Doanh'),
(20, 1, 'Lap dat cap quang'),
(30, 1, 'Dao tao nhan vien Marketing'),
(30, 2, 'Dao tao chuyen vien thiet ke')


insert into PHANCONG 
values ('009', 1, 1, 32),
('009', 2, 2, 8),
('004', 3, 1, 40),
('003', 1, 2, 20.0),
('003', 2, 1, 20.0),
('008', 10, 1, 35),
('001',	30, 2, 5),
('001', 20, 1, 15),
('006', 20, 1, 30),
('005', 3, 1, 10),
('005', 10, 2, 10),
('005', 20, 1, 10),
('007', 30, 2, 30),
('007', 10, 2, 10)


insert into THANNHAN values ('005', N'Trinh', N'Nữ', '4/5/1976', N'Con gái'),
('005', N'Khang', N'Nam', '10/25/1973', N'Con trai'),
('005', N'Phương', N'Nữ', '5/3/1948', N'Vợ chồng'),
('001', N'Minh', N'Nam', '2/29/1932', N'Vợ chồng'),
('009', N'Tiến', N'Nam', '1/1/1978', N'Con trai'),
('009', N'Châu', N'Nữ', '12/30/1978', N'Con gái'),
('009', N'Phương', N'Nữ', '5/5/1957', N'Vợ chồng')

select * from PHONGBAN
select * from NHANVIEN
select * from THANNHAN
select * from DEAN
select * from DIADIEM_PHG
select * from CONGVIEC
select * from PHANCONG

