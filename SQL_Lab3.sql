CREATE DATABASE QUANLY_DEANCONGTY
 
USE QUANLY_DEANCONGTY
--Thêm nhân viên
CREATE TABLE NHANVIEN
(
	MANV char(9),
	HONV nchar(15),
	TENLOT nchar(15),
	TENNV nchar(15),
	NGSINH SMALLDATETIME,
	DCHI nchar(30),
	PHAI nchar(3) ,
	LUONG money,
	MA_NQL char(9),
	PHG tinyint,
	CONSTRAINT NV_MANV_PK PRIMARY KEY (MANV),
	CONSTRAINT NV_PHAI_CK CHECK (PHAI= N'Nam' or Phai = N'Nữ')
)
 

--Thêm phòng ban
CREATE TABLE PHONGBAN
(
	MAPHG tinyint,
	TENPHG nchar(15),
	TRPHG char(9),
	NG_NHANCHUC SMALLDATETIME,
	PRIMARY KEY (MAPHG)
)
 
--Thêm địa điểm phòng ban
CREATE TABLE DIADIEM_PHG
(
	MAPHG tinyint,
	DIADIEM nchar(15),
	PRIMARY KEY (MAPHG, DIADIEM)
)
 
--Thêm đề án
CREATE TABLE DEAN
(
	MADA tinyint,
	TENDA nchar(15),
	DDIEM_DA nchar(15),
	PHONG tinyint,
	PRIMARY KEY (MADA)
)
 
--Thêm công việc
CREATE TABLE CONGVIEC
(
	MADA tinyint,
	STT tinyint,
	TEN_CONG_VIEC nchar(50),
	PRIMARY KEY (MADA, STT)
)
 
--Thêm phân công
CREATE TABLE PHANCONG
(
	MA_NVIEN char(9),
	MADA tinyint,
	STT tinyint,
	THOIGIAN numeric (5,1),
	PRIMARY KEY (MA_NVIEN, MADA, STT)
)
 

--Thêm thân nhân của nhân viên	
CREATE TABLE THANNHAN
(
	MA_NVIEN char(9),
	TENTN nchar(15),
	PHAI nchar(3),
	NGSINH SMALLDATETIME,
	QUANHE nchar(15),
	PRIMARY KEY(MA_NVIEN, TENTN)
)

 
--Thêm dữ liệu khóa n ài cho các bảng
ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NV_MA_NQL FOREIGN KEY (MA_NQL) REFERENCES NHANVIEN(MANV),
	CONSTRAINT FK_NV_PHG FOREIGN KEY (PHG) REFERENCES PHONGBAN(MAPHG)
ALTER TABLE PHONGBAN
ADD CONSTRAINT FK_PB_TRPHG FOREIGN KEY (TRPHG) REFERENCES NHANVIEN(MANV)
ALTER TABLE DIADIEM_PHG
ADD CONSTRAINT FK_DDP_MAPHG FOREIGN KEY (MAPHG) REFERENCES PHONGBAN(MAPHG)
ALTER TABLE DEAN
ADD CONSTRAINT FK_DA_PHONG FOREIGN KEY (PHONG) REFERENCES PHONGBAN(MAPHG)
ALTER TABLE CONGVIEC
ADD CONSTRAINT FK_CV_MADA FOREIGN KEY (MADA) REFERENCES DEAN(MADA)
ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PC_MANVIEN FOREIGN KEY (MA_NVIEN) REFERENCES NHANVIEN(MANV),
	CONSTRAINT FK_PC_MADA_STT FOREIGN KEY (MADA, STT) REFERENCES CONGVIEC(MADA, STT)
ALTER TABLE THANNHAN
ADD CONSTRAINT FK_TN_MA_NVIEN FOREIGN KEY (MA_NVIEN) REFERENCES NHANVIEN(MANV)
 	


--Thêm dữ liệu cho phòng ban
insert into PHONGBAN values ( 5, N'Nghiên cứu', NULL, '5/22/1978')
insert into PHONGBAN values ( 4, N'Điều hành', NULL, '01/01/1985')
insert into PHONGBAN values ( 1, N'Quản lý', NULL, '6/19/1971')
 

--Thêm dữ liêu cho Nhân viên

insert into NHANVIEN values ('009',N'Đinh' , N'Bá', N'Tiên', '2/11/1960', N'119 Cống Quỳnh, Tp HCM', N'Nam', 30000, NULL, 5)
insert into NHANVIEN values ('005', N'Nguyễn', N'Thanh', N'Tùng', '8/20/1962', N'222 Nguyễn Văn Cừ, Tp HCM', N'Nam', 40000, NULL, 5)
insert into NHANVIEN values ('007', N'Bùi', N'Ngọc', N'Hằng', '3/11/1954', N'332 Nguyễn Thái Học, Tp HCM', N'Nam ', 25000, NULL, 4)
insert into NHANVIEN values ('001', N'Lê', N'Quỳnh', N'Như', '2/1/1967', N'291 Hồ Văn Huê, Tp HCM', N'Nữ', 43000, NULL, 4)
insert into NHANVIEN values ('004', N'Nguyễn', N'Mạnh', N'Hùng', '3/4/1967', N'95 Bà Rịa, Vũng Tàu', N'Nam', 38000, NULL, 5)
insert into NHANVIEN values ('003', N'Trần', N'Thanh', N'Tâm', '5/4/1957', N'34 Mai Thị Lự, Tp HCM', N'Nam', 25000, NULL, 5)
insert into NHANVIEN values ('008', N'Trần', N'Hồng', N'Quang', '9/1/1967', N'80 Lê Hồng Phong Tp HCM', N'Nam', 25000, NULL, 4)
insert into NHANVIEN values ('006', N'Phạm', N'Văn', N'Vinh', '1/1/1965', N'46 Trưng Vương, Hà Nội', N'Nữ', 55000, NULL, 1)
 

--Thêm dữ liệu cho thân nhân
insert into THANNHAN values ('005', N'Trinh', N'Nữ', '4/5/1976', N'Con gái')
insert into THANNHAN values ('005', N'Khang', N'Nam', '10/25/1973', N'Con trai')
insert into THANNHAN values ('005', N'Phương', N'Nữ', '5/3/1948', N'Vợ chồng')
insert into THANNHAN values ('001', N'Minh', N'Nam', '2/29/1932', N'Vợ chồng')
insert into THANNHAN values ('009', N'Tiến', N'Nam', '1/1/1978', N'Con trai')
insert into THANNHAN values ('009', N'Châu', N'Nữ', '12/30/1978', N'Con gái')
insert into THANNHAN values ('009', N'Phương', N'Nữ', '5/5/1957', N'Vợ chồng')
 

--Thêm dữ liệu cho đề án
insert into DEAN values (1, 'San pham X', N'Vũng Tàu', 5)
insert into DEAN values (2, 'San pham Y', N'Nha Trang', 5)
insert into DEAN values (3, 'San pham Z', N'TP HCM', 5)
insert into DEAN values (10, 'Tin hoc hoa', N'Hà Nội', 4)
insert into DEAN values (20, 'Cap quang', N'TP HCM', 1)
insert into DEAN values (30, 'Dao tao', N'Hà Nội', 4)
 

--Thêm dữ liệu cho địa điểm phòng ban
insert into DIADIEM_PHG values(1, N'TP HCM')
insert into DIADIEM_PHG values(4, N'Hà Nội')
insert into DIADIEM_PHG values(5, N'Vũng Tàu ')
insert into DIADIEM_PHG values(5, N'NHA TRANG')
insert into DIADIEM_PHG values(5, N'TP HCM')
 
--Thêm dữ liệu cho công việc
insert into CONGVIEC values (1, 1, 'Thiet ke san pham X')
insert into CONGVIEC values (1, 2, 'Thu nghiem san pham X')
insert into CONGVIEC values (2, 1, 'San xuat san pham Y')
insert into CONGVIEC values (2, 2, 'Quang cao san pham Y')
insert into CONGVIEC values (3, 1, 'Khuyen mai san pham Z')
insert into CONGVIEC values (10, 1, 'Tin hoc hoa nhan su tien luong')
insert into CONGVIEC values (10, 2, 'Tin hoc hoa phong Kinh Doanh')
insert into CONGVIEC values (20, 1, 'Lap dat cap quang')
insert into CONGVIEC values (30, 1, 'Dao tao nhan vien Marketing')
insert into CONGVIEC values (30, 2, 'Dao tao chuyen vien thiet ke')
 

--Thêm dữ liệu cho phân công công việc
insert into PHANCONG values ('009', 1, 1, 32)
insert into PHANCONG values ('009', 2, 2, 8)
insert into PHANCONG values ('004', 3, 1, 40)
insert into PHANCONG values ('003', 1, 2, 20.0)
insert into PHANCONG values ('003', 2, 1, 20.0)
insert into PHANCONG values ('008', 10, 1, 35)
insert into PHANCONG values ('001',	30, 2, 5)
insert into PHANCONG values ('001', 20, 1, 15)
insert into PHANCONG values ('006', 20, 1, 30)
insert into PHANCONG values ('005', 3, 1, 10)
insert into PHANCONG values ('005', 10, 2, 10)
insert into PHANCONG values ('005', 20, 1, 10)
insert into PHANCONG values ('007', 30, 2, 30)
insert into PHANCONG values ('007', 10, 2, 10)
 
--Set update dữ liệu còn trống 
UPDATE PHONGBAN
SET	TRPHG = '005'
WHERE MAPHG = 5
UPDATE PHONGBAN
SET TRPHG = '008'
WHERE MAPHG = 4
UPDATE PHONGBAN
SET TRPHG = '006'
WHERE MAPHG = 1
 

UPDATE NHANVIEN
SET MA_NQL = '005'
WHERE MANV = '009' OR MANV = '004' OR MANV = '003'
UPDATE NHANVIEN
SET MA_NQL = '006'
WHERE MANV = '005' OR MANV = '001'
UPDATE NHANVIEN
SET MA_NQL = '001'
WHERE MANV = '007' OR MANV = '008'
 
--BTTH2: TRUY VẤN CƠ BẢN 
--1. Tìm những nhân viên làm việc ở phòng số 4
select * 
from NHANVIEN NV
where NV.PHG = 4
 
--2.Tìm những nhân viên có mức lương trên 30000 
select * 
from NHANVIEN NV
where NV.LUONG > 30000
 
--3.Tìm các nhân viên có mức lương trên 25000 ở phòng 4 hoặc các nhân viên có mức lương trên 30000 ở phòng 5 
select * 
from NHANVIEN NV
where NV.LUONG > 25000 and NV.PHG = 4
union all
select * 
from NHANVIEN NV
where NV.LUONG > 30000 and NV.PHG = 5
 
--4.Cho biết họ tên đầy đủ của nhân viên ở TP HCM
select NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV as HOVATEN, NV.DCHI 
from NHANVIEN NV
where NV.DCHI like N'%Tp HCM%'
 
--5. Cho biết họ tên đầy đủ của nhân viên có họ bắt đầu bằng ký tự 'N'
select NV.HONV, NV.TENLOT, NV.TENNV 
from NHANVIEN NV
where NV.HONV = 'N%'
 
--6. Cho biết ngày sinh và địa chỉ của nhân viên Dinh Ba Tien 
select NV.NGSINH, NV.DCHI 
from NHANVIEN NV
where NV.HONV = N'Đinh' and NV.TENLOT = N'Bá' and NV.TENNV = N'Tiên'
 

--7. Cho biết các nhân viên sinh năm 1975
select * 
from NHANVIEN NV
where year(NV.NGSINH) like '1975'
 
--8. Cho biết các nhân viên sinh trước ngày 30/4/1975
select *
from NHANVIEN NV
where NV.NGSINH between '1/1/1900' and '4/30/1975'
 
--9. Cho biết các nhân viên sinh trước ngày 30/4/1975 hoặc ở Tp HCM hoặc làm việc tại phòng số 4
select * 
from NHANVIEN NV
where (NV.NGSINH between '1/1/1900' and '4/30/1975') or (NV.DCHI like N'%Tp HCM%') or NV.PHG = 4
 
--10. Vơi mỗi phòng ban, cho biết tên phòng ban và địa điểm phòng
select PB.TENPHG, DD.DIADIEM 
from PHONGBAN PB
inner join DIADIEM_PHG DD on PB.MAPHG =DD.MAPHG
 
--11.Tìm tên những người trưởng phòng của từng phòng ban 
select NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV as HOVATEN, PB.TENPHG
from NHANVIEN NV, PHONGBAN PB
where NV.MANV = PB.TRPHG
 
--12.Tìm TENDA, MADA, DDIEM_DA, PHONG, TENPHG, MAPHG, TRPHG, NG_NHAN_CHUC
select * from DEAN DA
inner join PHONGBAN PB on DA.PHONG = PB.MAPHG 
 
--13.Tìm tên địa chỉ của tất cả các nhân viên của phòng 'Nghiên cứu '
select NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV as HOVATEN, NV.DCHI
from NHANVIEN NV
where NV.PHG in (
				select PB.MAPHG 
				from PHONGBAN PB
				where PB.TENPHG like N'%Nghiên cứu%'
)
 
--14.Tìm tên những nữ nhân viên và tên người thân của họ
select NV.TENNV, TN.TENTN  
from NHANVIEN NV
inner join THANNHAN TN on NV.MANV = TN.MA_NVIEN
where NV.PHAI = N'Nữ'
 
--15.Với mọi đề án ở "Ha Noi", liệt kê các mã số đề án (MADA), mã số phòng ban chủ trì đề án (PHONG), họ tên trưởng phòng (HONV, TENLOT, TENNV) cũng như địa chỉ (DCHI) và ngày sinh (NGSINH) của người ấy. 
select DA.MADA, DA.PHONG, NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV as HOVATEN, NV.DCHI, NV.NGSINH 
from DEAN DA, PHONGBAN PB, NHANVIEN NV
where DA.PHONG = PB.MAPHG and DA.DDIEM_DA = N'Hà Nội' and NV.MANV = PB.TRPHG
 
--16.Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó
select NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV as HOVATEN, NV1.HONV + ' ' + NV1.TENLOT + ' ' + NV1.TENNV as HOVATEN_QL 
from NHANVIEN NV
inner join NHANVIEN NV1 on NV.MA_NQL = NV1.MANV
 
--17.Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên trưởng phòng của phòng ban mà nhân viên đó làm việc
select NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV as HOVATEN, PB.HONV + ' ' + PB.TENLOT + ' ' + PB.TENNV as HOTEN_TRPHG
from NHANVIEN NV
inner join (select *
			from PHONGBAN PB, NHANVIEN NV1
			where PB.TRPHG = NV1.MANV
			) PB on  PB.MAPHG = NV.PHG
 
--18. Tên những nhân viên phòng số 5 có tham gia vào đề án "San pham X" và nhân viên này do "Nguyen Thanh Tung" quản lý trực tiếp. 

select NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV as HOVATEN, NV.MANV, NV.PHG
from  
	NHANVIEN NV,
	(select PC.MA_NVIEN
	from PHANCONG PC, DEAN DA
	where DA.PHONG = 5 and DA.TENDA = 'San pham X' and DA.MADA = PC.MADA) NV1, 
	NHANVIEN NV_NQL
where NV.MA_NQL = NV_NQL.MANV and NV_NQL.HONV = N'Nguyễn' and NV_NQL.TENLOT = N'Thanh' and NV_NQL.TENNV = N'Tùng' and NV1.MA_NVIEN = NV.MANV
 
--19.Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) và tên các đề án mà nhân viên ấy tham gia nếu có. 
select NV.HONV + ' ' + NV.TENLOT + NV.TENNV as HOVATEN, TENDA.TENDA
from NHANVIEN NV, 
	(select PC.MA_NVIEN, PC.MADA, DA.TENDA
	from PHANCONG PC
	inner join DEAN DA on PC.MADA = DA.MADA) TENDA
where NV.MANV = TENDA.MA_NVIEN
 
--20. HO VA TEN NHUNG NGUOI NGHI HUU (NU 55, NAM 60)
select NV.HONV + ' ' + NV.TENLOT + ' ' +  NV.TENNV as HOTEN
from NHANVIEN NV
where (DATEDIFF(year, NV.NGSINH, GETDATE()) >= 55 and NV.PHAI = N'Nữ') or
 	  (DATEDIFF(year, NV.NGSINH, GETDATE()) >= 60 and NV.PHAI = N'Nam') 
 


--BAI THUC HANH 3
--1. Cho biet luong de an cua cong ty
select COUNT(*) as SL_DEAN
from DEAN DA
 
--2. Cho biet luong trung binh cua tat ca nhan vien nu
select AVG(NV.LUONG)
from NHANVIEN NV
where NV.PHAI = N'Nữ'
 
--3. Cho biet luong nhan vien co tuoi doi cao nhat
select NV.LUONG
from NHANVIEN NV, (select MIN(YEAR(NV1.NGSINH)) as MIN_NGSINH
				   from NHANVIEN NV1
					) as MIN_NGSINH
where YEAR(NV.NGSINH) = MIN_NGSINH
 
--4. Cho biet so than nhan cua nhan vien 'Dinh Ba Tien'
select COUNT(TN.TENTN) as SL_TN_DinhBaTien
from THANNHAN TN, NHANVIEN NV
where TN.MA_NVIEN = NV.MANV and NV.HONV = N'Đinh' and NV.TENLOT = N'Bá' and NV.TENNV = N'Tiên'
group by TN.MA_NVIEN 
 
--5. Cho biet so luong de an do phong nghien cuu chu tri
select COUNT(DA.MADA) as SL_DEAN
from PHONGBAN PB, DEAN DA
where DA.PHONG = PB.MAPHG and PB.TENPHG = N'Nghiên cứu'
 
--6.  Voi moi de an, liet ke ten de an (TENDA) va tong so gio lam viec mot tuan cua tat ca cac NV tham du de an do
select DA.TENDA, TG.Tong_ThoiGian 
from DEAN DA, (select PC.MADA, SUM(PC.THOIGIAN) as Tong_ThoiGian
			   from  PHANCONG PC
			   group by MADA
				) as TG
where DA.MADA = TG.MADA
 
--7. Voi moi de an, cho biet ten va so luong nhan vien tham gia de an do
select DA.TENDA, NV.Tong_NHANVIEN
from DEAN DA, (select PC.MADA, COUNT(PC.MA_NVIEN) as Tong_NHANVIEN
			   from PHANCONG PC
			   group by PC.MADA
				) as NV
where DA.MADA = NV.MADA
 
--8. Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.
select PB.TENPHG, PB_LUONG.AVG_LUONG 
from PHONGBAN PB, (select NV.PHG, AVG(NV.LUONG) as AVG_LUONG
				   from NHANVIEN NV
				   group by NV.PHG
				  ) as PB_LUONG
where PB.MAPHG = PB_LUONG.PHG and PB_LUONG.AVG_LUONG > 30000
 
--9. Với mỗi nhân viên có số thân nhân lớn hơn 2, cho biết họ và tên nhân viên và số lượng thân nhân của nhân viên đó.
select NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV as HOVATEN, TN.SL_ThanNhan
from NHANVIEN NV, (select TN.MA_NVIEN, COUNT(*) as SL_ThanNhan
				   from THANNHAN TN
				   group by TN.MA_NVIEN
				  ) as TN
where NV.MANV = TN.MA_NVIEN and TN.SL_ThanNhan > 2
 
--10. Với mỗi nhân viên, cho biết họ tên và số lượng đề án mà nhân viên đó tham gia.
select NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV as HOVATEN, DA.SL_DEAN
from NHANVIEN NV, (select PC.MA_NVIEN, COUNT(*) SL_DEAN
				   from PHANCONG PC
				   group by PC.MA_NVIEN
				  ) as DA
where NV.MANV = DA.MA_NVIEN
 
--11. Với mỗi nhân viên, cho biết số lượng nhân viên mà nhân viên đó quản lý trực tiếp.
select	NV.MA_NQL, COUNT(*) as SL_NHANVIEN
from NHANVIEN NV
where NV.MA_NQL is not null
group by NV.MA_NQL
 
--12. Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc trong phòng ban đó
select PB.TENPHG, PB_LUONG.AVG_LUONG 
from PHONGBAN PB, (select NV.PHG, AVG(NV.LUONG) as AVG_LUONG
				   from NHANVIEN NV
				   group by NV.PHG
				  ) as PB_LUONG
where PB.MAPHG = PB_LUONG.PHG
 
--13. Với các phòng ban có mức lương trung bình trên 40,000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.
select PB.TENPHG, PB1.AVG_LUONG, PB1.SL_NHANVIEN
from PHONGBAN PB, (select NV.PHG, AVG(NV.LUONG) as AVG_LUONG, COUNT(NV.MANV) as SL_NHANVIEN
				   from NHANVIEN NV
				   group by NV.PHG
				  ) as PB1
where PB.MAPHG = PB1.PHG and PB1.AVG_LUONG > 40000
 
--14. Cho biết số đề án diễn ra tại từng địa điểm.
select DA.DDIEM_DA, COUNT(*) as SL_DEAN
from DEAN DA
group by DA.DDIEM_DA
 
--15. Với mỗi đề án, cho biết tên đề án và số lượng công việc của đề án này.
select DA.TENDA, SL.SL_CongViec 
from DEAN DA, (select CV.MADA, MAX(CV.STT) as SL_CongViec
			   from CONGVIEC CV
			   group by CV.MADA
			  ) as SL
where DA.MADA = SL.MADA
 
--16. Với mỗi phòng ban, cho biết tên phòng ban, họ tên người trưởng phòng, số lượng đề án mà phòng ban đó chủ trì yêu cầu xếp giảm dần theo số lượng đề án.
select PB.TENPHG, NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV as HOVATEN, DA.SL_DA
from PHONGBAN PB, NHANVIEN NV, (select DA.PHONG, COUNT(*) as SL_DA 
								from DEAN DA
								group by DA.PHONG
								) as DA
where PB.TRPHG = NV.MANV and PB.MAPHG = DA.PHONG
order by DA.SL_DA desc
 
--17. Với mỗi công việc trong đề án có mã đề án 'Dao Tao', cho biết số lượng nhân viên được phân công
select PC.MADA, PC.STT, COUNT(PC.MA_NVIEN) as SL_NHANVIEN
from PHANCONG PC, (select CV.MADA, CV.STT
				   from CONGVIEC CV
				   where CV.TEN_CONG_VIEC like 'Dao tao%'
				  ) as CV
where PC.MADA = CV.MADA and PC.STT = CV.STT
group by PC.MADA, PC.STT
 


 
