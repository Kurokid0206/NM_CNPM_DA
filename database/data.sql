﻿--
-- Script was generated by Devart dbForge Studio 2019 for SQL Server, Version 5.8.127.0
-- Product Home Page: http://www.devart.com/dbforge/sql/studio
-- Script date 12/24/2021 8:54:07 PM
-- Target server version: 15.00.2000
-- Target connection string: Data Source=(local);Encrypt=False;Integrated Security=True;User ID="DESKTOP-UJGB2MI\OXI PC"
--



SET LANGUAGE 'English'
SET DATEFORMAT ymd
SET ARITHABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
SET NUMERIC_ROUNDABORT, IMPLICIT_TRANSACTIONS, XACT_ABORT OFF
GO

--
-- Backing up database qlKH
--
--
-- Create backup folder
--
IF OBJECT_ID('xp_create_subdir') IS NOT NULL
  EXEC xp_create_subdir N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup'
--
-- Backup database to the file with the name: <database_name>_<yyyy>_<mm>_<dd>_<hh>_<mi>.bak
--
DECLARE @db_name SYSNAME
SET @db_name = N'qlKH'

DECLARE @filepath NVARCHAR(4000)
SET @filepath =
/*define base part*/ N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\' + @db_name + '_' +
/*append date*/ REPLACE(CONVERT(NVARCHAR(10), GETDATE(), 102), '.', '_') + '_' +
/*append time*/ REPLACE(CONVERT(NVARCHAR(5), GETDATE(), 108), ':', '_') + '.bak'

DECLARE @SQL NVARCHAR(MAX)
SET @SQL = 
    N'BACKUP DATABASE ' + QUOTENAME(@db_name) + ' TO DISK = @filepath WITH INIT' + 
      CASE WHEN EXISTS(
                SELECT value
                FROM sys.configurations
                WHERE name = 'backup compression default'
          )
        THEN ', COMPRESSION'
        ELSE ''
      END

EXEC sys.sp_executesql @SQL, N'@filepath NVARCHAR(4000)', @filepath = @filepath
GO

USE qlKH
GO

IF DB_NAME() <> N'qlKH' SET NOEXEC ON
GO

--
-- Disabling DML triggers for dbo.KhoaHoc
--
--DISABLE TRIGGER ALL ON dbo.KhoaHoc
--GO

--
-- Disabling DML triggers for dbo.ThamGiaBuoiHoc
--
--DISABLE TRIGGER ALL ON dbo.ThamGiaBuoiHoc
--GO
--
-- Delete data from the table 'dbo.ThongTinNganHang'
--
TRUNCATE TABLE dbo.ThongTinNganHang
GO
--
-- Delete data from the table 'dbo.ThamGiaKH'
--
TRUNCATE TABLE dbo.ThamGiaKH
GO
--
-- Delete data from the table 'dbo.ThamGiaBuoiHoc'
--
TRUNCATE TABLE dbo.ThamGiaBuoiHoc
GO
--
-- Delete data from the table 'dbo.BangCap'
--
TRUNCATE TABLE dbo.BangCap
GO
--
-- Delete data from the table 'dbo.LichHoc'
--
DELETE dbo.LichHoc
GO
--
-- Delete data from the table 'dbo.KhoaHoc'
--
DELETE dbo.KhoaHoc
GO
--
-- Delete data from the table 'dbo.GiaoVien'
--
DELETE dbo.GiaoVien
GO
--
-- Delete data from the table 'dbo.NguoiDung'
--
DELETE dbo.NguoiDung
GO

--
-- Inserting data into table dbo.NguoiDung
--
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000000', 'Eea319', 'F630IXD8', N'Trần Chí Kiên', '2005-05-17', 'rmfz953@example.com', '0646425785')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000001', 'Huy381', '15C3QTEO', N'Huỳnh Hoài Thương', '1986-12-09', 'StuartZ.Kinder@nowhe', '0896765387')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000002', 'Sen074', '358Q6347', N'Phan Yến Nhi', '1991-04-15', 'oalcovyz_lfjc@exampl', '0396015727')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000003', 'Kek169', '1840861X', N'Lý Cát Tường', '1980-03-08', 'Blank23@example.com', '0145755371')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000004', 'Dab367', '428X67RT', N'Huỳnh Vân Khánh', '1989-04-26', 'CruzL.Crowell236@exa', '0359668013')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000005', 'Jew386', '5ZH6H87A', N'Hoàng Yến Nhi', '2007-03-04', 'Hatfield@example.com', '0304082334')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000006', 'Qip216', 'AHUX95D7', N'Huỳnh Tuyết Nhung', '1989-01-07', 'Natisha.PArmenta@now', '0762322395')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000007', 'Yev918', '0I99B7KY', N'Lê Thanh Hà', '1996-12-12', 'Acker@example.com', '0916087596')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000008', 'Rir615', 'NM29278Y', N'Huỳnh Gia Khánh', '1993-05-09', 'ValadezM13@example.c', '0426354476')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000009', 'Yaf612', '8MLX2AN3', N'Hoàng Gia Hân', '1998-10-31', 'Jeffries44@nowhere.c', '0616750813')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000010', 'Var333', '5W2CYLCJ', N'Dương Mai Ngọc', '2000-06-13', 'qwqb5085@example.com', '0169083368')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000011', 'Uou650', 'W7F90167', N'Bùi Hiền Châu', '1981-09-04', 'Cory.Slagle@example.', '0765015179')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000012', 'Kit947', 'SEP7R14O', N'Võ Tùng Quân', '1991-11-21', 'Adalberto.G_Moses726', '0777521719')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000013', 'Gib133', '7E621NCT', N'Phạm Khánh Châu', '2003-01-29', 'Meek@nowhere.com', '0962334161')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000014', 'Kuv491', 'I256539F', N'Võ Mạnh Hùng', '1998-12-19', 'Everette.D.Alvarez@n', '0877719958')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000015', 'Fio556', '90N5I757', N'Lê Gia Huy', '1980-01-01', 'Akins@example.com', '0120221155')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000016', 'Oij931', '538M7B4H', N'Nguyễn Hoài An', '1991-06-12', 'AideLeal@example.com', '0609822077')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000017', 'Mea038', 'E42379OT', N'Nguyễn Minh Quang', '2004-10-20', 'OrvalAllan88@example', '0112702664')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000018', 'Yuo057', 'LYXM4M59', N'Dương Quang Khải', '1999-07-11', 'zegimng4678@example.', '0593038327')
INSERT dbo.NguoiDung(MaTK, TenDN, MatKhauDN, HoTen, NgaySinh, Email, SDT) VALUES (N'TK00000019', 'Uuo609', 'Y5T38F49', N'Bùi Kim Ngân', '1986-06-25', 'Quezada283@example.c', '0211598312')
GO

--
-- Inserting data into table dbo.GiaoVien
--
INSERT dbo.GiaoVien(MaGV, MaTK) VALUES ('GV00000000', 'TK00000007')
INSERT dbo.GiaoVien(MaGV, MaTK) VALUES ('GV00000001', 'TK00000019')
INSERT dbo.GiaoVien(MaGV, MaTK) VALUES ('GV00000002', 'TK00000000')
INSERT dbo.GiaoVien(MaGV, MaTK) VALUES ('GV00000003', 'TK00000017')
INSERT dbo.GiaoVien(MaGV, MaTK) VALUES ('GV00000004', 'TK00000009')
INSERT dbo.GiaoVien(MaGV, MaTK) VALUES ('GV00000005', 'TK00000013')
INSERT dbo.GiaoVien(MaGV, MaTK) VALUES ('GV00000006', 'TK00000002')
INSERT dbo.GiaoVien(MaGV, MaTK) VALUES ('GV00000007', 'TK00000008')
INSERT dbo.GiaoVien(MaGV, MaTK) VALUES ('GV00000008', 'TK00000011')
INSERT dbo.GiaoVien(MaGV, MaTK) VALUES ('GV00000009', 'TK00000010')
GO

--
-- Inserting data into table dbo.KhoaHoc
--
INSERT dbo.KhoaHoc(MaKH, TenKhoaHoc, Lop, SoBuoiDuKien, SoHocSinhToiThieu, MaGV, HocPhi) VALUES ('KH00000000', N'Giải tích 1', 4, 15, 20, 'GV00000002', 715000)
INSERT dbo.KhoaHoc(MaKH, TenKhoaHoc, Lop, SoBuoiDuKien, SoHocSinhToiThieu, MaGV, HocPhi) VALUES ('KH00000001', N'Phân tích Hệ thống Nghiệp vụ', 1, 16, 23, 'GV00000002', 515000)
INSERT dbo.KhoaHoc(MaKH, TenKhoaHoc, Lop, SoBuoiDuKien, SoHocSinhToiThieu, MaGV, HocPhi) VALUES ('KH00000002', N'Phân tích và thiết kế giải thuật', 1, 17, 24, 'GV00000007', 100000)
INSERT dbo.KhoaHoc(MaKH, TenKhoaHoc, Lop, SoBuoiDuKien, SoHocSinhToiThieu, MaGV, HocPhi) VALUES ('KH00000003', N'Kiến trúc phần mềm', 6, 18, 20, 'GV00000001', 560000)
INSERT dbo.KhoaHoc(MaKH, TenKhoaHoc, Lop, SoBuoiDuKien, SoHocSinhToiThieu, MaGV, HocPhi) VALUES ('KH00000004', N'Tiếng Anh ứng dụng quốc tế 3', 8, 19, 23, 'GV00000009', 425000)
INSERT dbo.KhoaHoc(MaKH, TenKhoaHoc, Lop, SoBuoiDuKien, SoHocSinhToiThieu, MaGV, HocPhi) VALUES ('KH00000005', N'Hệ thống thông tin doanh nghiệp và thương mại điện', 7, 20, 22, 'GV00000005', 635000)
INSERT dbo.KhoaHoc(MaKH, TenKhoaHoc, Lop, SoBuoiDuKien, SoHocSinhToiThieu, MaGV, HocPhi) VALUES ('KH00000006', N'Quản lý chất lượng phần mềm', 1, 15, 24, 'GV00000009', 885000)
INSERT dbo.KhoaHoc(MaKH, TenKhoaHoc, Lop, SoBuoiDuKien, SoHocSinhToiThieu, MaGV, HocPhi) VALUES ('KH00000007', N'Công nghệ mạng', 11, 16, 22, 'GV00000007', 915000)
INSERT dbo.KhoaHoc(MaKH, TenKhoaHoc, Lop, SoBuoiDuKien, SoHocSinhToiThieu, MaGV, HocPhi) VALUES ('KH00000008', N'Kỹ thuật lập trình nâng cao', 10, 17, 21, 'GV00000008', 105000)
INSERT dbo.KhoaHoc(MaKH, TenKhoaHoc, Lop, SoBuoiDuKien, SoHocSinhToiThieu, MaGV, HocPhi) VALUES ('KH00000009', N'Nhập môn lập trình', 1, 18, 20, 'GV00000006', 120000)
INSERT dbo.KhoaHoc(MaKH, TenKhoaHoc, Lop, SoBuoiDuKien, SoHocSinhToiThieu, MaGV, HocPhi) VALUES ('KH00000010', N'Cơ sở dữ liệu', 2, 19, 22, 'GV00000008', 315000)
INSERT dbo.KhoaHoc(MaKH, TenKhoaHoc, Lop, SoBuoiDuKien, SoHocSinhToiThieu, MaGV, HocPhi) VALUES ('KH00000011', N'Toán rời rạc', 12, 20, 25, 'GV00000002', 175000)
INSERT dbo.KhoaHoc(MaKH, TenKhoaHoc, Lop, SoBuoiDuKien, SoHocSinhToiThieu, MaGV, HocPhi) VALUES ('KH00000012', N'Hệ quản trị CSDL', 3, 15, 25, 'GV00000006', 930000)
INSERT dbo.KhoaHoc(MaKH, TenKhoaHoc, Lop, SoBuoiDuKien, SoHocSinhToiThieu, MaGV, HocPhi) VALUES ('KH00000013', N'Tiếng Anh ứng dụng quốc tế 4', 9, 16, 22, 'GV00000000', 715000)
INSERT dbo.KhoaHoc(MaKH, TenKhoaHoc, Lop, SoBuoiDuKien, SoHocSinhToiThieu, MaGV, HocPhi) VALUES ('KH00000014', N'Khai thác dữ liệu', 9, 17, 20, 'GV00000009', 125000)
GO

--
-- Inserting data into table dbo.LichHoc
--
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (1, N'KH00000013', '2022-03-11', '09:30:00', N'Bài 8')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (1, N'KH00000004', '2022-08-25', '19:00:00', N'Bài 9')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (1, N'KH00000012', '2022-12-25', '19:00:00', N'Bài 3')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (1, N'KH00000001', '2022-07-02', '14:00:00', N'Bài 1')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (1, N'KH00000009', '2022-07-31', '19:30:00', N'Bài 2')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (2, N'KH00000013', '2022-06-16', '07:00:00', N'Bài 8')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (1, N'KH00000002', '2022-12-09', '14:00:00', N'Bài 5')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (1, N'KH00000006', '2022-01-14', '07:30:00', N'Bài 7')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (1, N'KH00000003', '2022-03-10', '14:00:00', N'Bài 7')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (1, N'KH00000010', '2022-12-23', '12:00:00', N'Bài 6')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (1, N'KH00000000', '2022-06-04', '12:30:00', N'Bài 8')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (1, N'KH00000007', '2022-04-22', '12:30:00', N'Bài 6')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (1, N'KH00000014', '2022-06-09', '09:30:00', N'Bài 3')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (2, N'KH00000010', '2022-02-23', '12:00:00', N'Bài 9')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (2, N'KH00000007', '2022-11-28', '12:30:00', N'Bài 4')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (1, N'KH00000011', '2022-05-13', '14:30:00', N'Bài 5')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (2, N'KH00000011', '2022-11-29', '12:30:00', N'Bài 7')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (1, N'KH00000008', '2022-11-05', '09:00:00', N'Bài 4')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (2, N'KH00000004', '2022-07-28', '09:00:00', N'Bài 3')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (1, N'KH00000005', '2022-12-28', '14:30:00', N'Bài 6')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (2, N'KH00000001', '2022-11-13', '19:00:00', N'Bài 5')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (2, N'KH00000008', '2022-01-01', '09:00:00', N'Bài 8')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (2, N'KH00000005', '2022-08-23', '14:30:00', N'Bài 9')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (2, N'KH00000012', '2022-04-19', '17:00:00', N'Bài 5')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (2, N'KH00000002', '2022-08-12', '07:30:00', N'Bài 2')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (2, N'KH00000009', '2022-06-06', '14:30:00', N'Bài 9')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (2, N'KH00000014', '2022-03-03', '07:30:00', N'Bài 9')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (2, N'KH00000003', '2022-03-31', '14:00:00', N'Bài 1')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (2, N'KH00000006', '2022-06-22', '19:30:00', N'Bài 9')
INSERT dbo.LichHoc(STT, MaKH, Ngay, ThoiGian, MoTa) VALUES (2, N'KH00000000', '2022-04-13', '17:30:00', N'Bài 6')
GO

--
-- Inserting data into table dbo.BangCap
--
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (1, N'GV00000008', N'Bằng Sư Phạm Công Nghệ Thông Tin', '1971-03-09', N'Khoa Kỹ thuật và Công nghệ')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (2, N'GV00000001', N'Chứng Chỉ Sư Phạm Công Nghệ Thông Tin', '1973-10-06', N'Khoa Quốc tế')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (1, N'GV00000006', N'Chứng Chỉ Sư Phạm Văn', '2006-07-05', N'Trường Đại học Nông Lâm')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (1, N'GV00000004', N'Chứng Chỉ Sư Phạm Ngoại Ngữ', '1995-10-02', N'Trường Đại học Khoa học Tự nhiên')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (1, N'GV00000009', N'Bằng Sư Phạm Công Nghệ Thông Tin', '2010-11-23', N'Khoa Sau đại học')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (2, N'GV00000007', N'Chứng Chỉ Sư Phạm Văn', '1981-01-23', N'Khoa Quản trị Kinh doanh')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (1, N'GV00000002', N'Bằng Sư Phạm Toán', '2010-09-09', N'Trường Đại học Quốc tế')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (0, N'GV00000000', N'Chứng Chỉ Sư Phạm Toán', '1987-09-03', N'Trường Đại học Sư phạm')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (2, N'GV00000003', N'Chứng Chỉ Sư Phạm Toán', '1970-03-05', N'Trường Đại học Công nghệ Thông tin và Truyền thông')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (2, N'GV00000005', N'Chứng Chỉ Sư Phạm Công Nghệ Thông Tin', '2016-11-27', N'Trường Đại học Ngoại ngữ')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (1, N'GV00000001', N'Bằng Sư Phạm Ngoại Ngữ', '1995-06-13', N'Trường Đại học Công nghệ Thông tin')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (2, N'GV00000008', N'Bằng Sư Phạm Toán', '1970-01-05', N'Trường Đại học Khoa học Xã hội và Nhân văn')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (2, N'GV00000009', N'Bằng Sư Phạm Ngoại Ngữ', '1992-06-12', N'Trường Đại học Sư phạm')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (1, N'GV00000005', N'Bằng Sư Phạm Văn', '1970-01-01', N'Khoa Quốc tế')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (1, N'GV00000007', N'Bằng Sư Phạm Ngoại Ngữ', '1990-01-15', N'Khoa Giáo dục thể chất')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (2, N'GV00000006', N'Bằng Sư Phạm Toán', '1983-01-19', N'Phân hiệu Đại học Quốc gia Thành phố Hồ Chí Minh t')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (2, N'GV00000002', N'Bằng Sư Phạm Toán', '1983-11-02', N'Trường Đại học Y Dược')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (2, N'GV00000004', N'Bằng Sư Phạm Toán', '1972-07-30', N'Trường Đại học Khoa học')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (1, N'GV00000000', N'Bằng Sư Phạm Tin Học', '1981-12-12', N'Trường Đại học Ngoại ngữ')
INSERT dbo.BangCap(STT, MaGV, TenBang, NgayCap, NoiCap) VALUES (1, N'GV00000003', N'Bằng Sư Phạm Công Nghệ Thông Tin', '1970-03-24', N'Trường Đại học Công nghệ')
GO

--
-- Inserting data into table dbo.ThamGiaBuoiHoc
--
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000003', 1, N'TK00000006', 7.44)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000003', 1, N'TK00000008', 4.94)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000008', 1, N'TK00000017', 9.68)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000001', 1, N'TK00000003', 1.95)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000003', 1, N'TK00000007', 8.28)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000007', 1, N'TK00000009', 2.29)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000002', 1, N'TK00000004', 10)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000010', 1, N'TK00000007', 3.37)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000006', 1, N'TK00000005', 10)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000001', 1, N'TK00000002', 1.6)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000014', 1, N'TK00000012', 0.54)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000004', 1, N'TK00000018', 8.15)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000001', 1, N'TK00000001', 2.91)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000010', 1, N'TK00000013', 6.11)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000005', 1, N'TK00000019', 3.3)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000000', 1, N'TK00000008', 3.07)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000007', 1, N'TK00000014', 6.21)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000008', 1, N'TK00000016', 9.89)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000009', 1, N'TK00000002', 5.62)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000004', 1, N'TK00000000', 10)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000010', 1, N'TK00000008', 5.33)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000004', 1, N'TK00000017', 4.13)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000010', 1, N'TK00000009', 4.98)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000011', 1, N'TK00000015', 6.52)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000009', 1, N'TK00000004', 4.06)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000000', 1, N'TK00000010', 10)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000009', 1, N'TK00000003', 1.32)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000000', 1, N'TK00000009', 7.47)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000013', 1, N'TK00000004', 0.49)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000012', 1, N'TK00000001', 6.91)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000013', 1, N'TK00000003', 10)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000013', 1, N'TK00000005', 2.13)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000007', 1, N'TK00000010', 1.99)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000005', 1, N'TK00000018', 3.13)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000002', 1, N'TK00000005', 1.1)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000014', 1, N'TK00000011', 10)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000011', 1, N'TK00000016', 4.19)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000007', 1, N'TK00000011', 6.23)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000013', 1, N'TK00000000', 0.53)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000007', 1, N'TK00000013', 10)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000001', 1, N'TK00000019', 4.14)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000006', 1, N'TK00000006', 0.28)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000010', 1, N'TK00000012', 0.08)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000002', 1, N'TK00000006', 6.03)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000011', 1, N'TK00000014', 0.07)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000012', 1, N'TK00000000', 3.76)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000011', 2, N'TK00000015', 8.44)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000004', 1, N'TK00000001', 2.19)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000006', 1, N'TK00000007', 1.49)
INSERT dbo.ThamGiaBuoiHoc(MaKH, STT, MaTK, DanhGiaBuoiHoc) VALUES (N'KH00000012', 1, N'TK00000002', 2.01)
GO

--
-- Inserting data into table dbo.ThamGiaKH
--
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000013', N'TK00000014', '2019-02-25', N'Chưa Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000004', N'TK00000005', '2013-12-13', N'Đã Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000012', N'TK00000012', '2013-12-14', N'Đã Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000001', N'TK00000002', '2019-02-23', N'Chưa Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000009', N'TK00000009', '1987-05-29', N'Đã Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000013', N'TK00000013', '2019-02-25', N'Chưa Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000002', N'TK00000002', '1994-10-06', N'Đã Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000006', N'TK00000006', '2004-08-28', N'Chưa Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000003', N'TK00000003', '2004-08-27', N'Chưa Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000010', N'TK00000010', '1970-02-25', N'Chưa Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000000', N'TK00000000', '1982-03-17', N'Đã Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000007', N'TK00000007', '1970-02-24', N'Đã Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000014', N'TK00000015', '1975-05-09', N'Chưa Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000010', N'TK00000011', '1970-02-25', N'Đã Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000007', N'TK00000008', '1970-02-24', N'Đã Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000011', N'TK00000012', '2019-02-24', N'Đã Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000011', N'TK00000011', '2019-02-24', N'Đã Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000008', N'TK00000008', '1975-05-08', N'Chưa Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000004', N'TK00000004', '2013-12-13', N'Đã Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000005', N'TK00000006', '2009-11-08', N'Đã Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000001', N'TK00000001', '2019-02-23', N'Đã Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000008', N'TK00000009', '1975-05-08', N'Chưa Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000005', N'TK00000005', '2009-11-08', N'Đã Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000012', N'TK00000013', '2013-12-14', N'Đã Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000002', N'TK00000003', '1994-10-06', N'Chưa Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000009', N'TK00000010', '1987-05-29', N'Chưa Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000014', N'TK00000014', '1975-05-09', N'Chưa Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000003', N'TK00000004', '2004-08-27', N'Chưa Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000006', N'TK00000007', '2004-08-28', N'Đã Thanh Toán')
INSERT dbo.ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan) VALUES (N'KH00000000', N'TK00000001', '1982-03-17', N'Đã Thanh Toán')
GO

--
-- Inserting data into table dbo.ThongTinNganHang
--
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'05021086377957', N'TK00000018', N'Xăng dầu Petrolimex')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'0307248767865', N'TK00000011', N'Ngân hàng Phát triển Việt Nam')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'00185786548572', N'TK00000006', N'Phương Đông')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'04194053055962', N'TK00000014', N'Ngân hàng TMCP Nam Á')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'06817997840604', N'TK00000009', N'Quân đội')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'0919411026300', N'TK00000007', N'NH TMCP Phát triển Nhà Tp HCM')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'05227264505875', N'TK00000002', N'Ngoại thương Việt Nam')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'01056368424304', N'TK00000000', N'Sài Gòn Công Thương')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'08462434873524', N'TK00000003', N'Công Thương Việt Nam')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'0130721356458', N'TK00000005', N'Ngân hàng Nông nghiệp và Phát triển Nông thôn VN')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'02980214001209', N'TK00000001', N'Sài Gòn Thương Tín')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'00833658059651', N'TK00000008', N'Ngân hàng TMCP Việt Á')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'0569501067875', N'TK00000019', N'Ngân hàng An Bình')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'0470802137549', N'TK00000015', N'Kỹ Thương Việt Nam')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'0684575997379', N'TK00000017', N'Quốc Dân')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'0970639346562', N'TK00000016', N'NH TMCP Quốc tế Việt Nam')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'0875231635730', N'TK00000012', N'Bảo Việt')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'0159659331881', N'TK00000004', N'Ngân hàng Bản Việt')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'0198723439625', N'TK00000010', N'Đại chúng Việt Nam')
INSERT dbo.ThongTinNganHang(SoTaiKhoan, MaTK, TenNganHang) VALUES (N'0957199425478', N'TK00000013', N'Ngân hàng Đông Nam Á')
GO

--
-- Enabling DML triggers for dbo.KhoaHoc
--
ENABLE TRIGGER ALL ON dbo.KhoaHoc
GO

--
-- Enabling DML triggers for dbo.ThamGiaBuoiHoc
--
ENABLE TRIGGER ALL ON dbo.ThamGiaBuoiHoc
GO

--
-- Set NOEXEC to off
--

SET NOEXEC OFF
GO