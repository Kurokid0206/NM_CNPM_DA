/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 15.2 		*/
/*  Created On : 27-Nov-2021 2:10:33 PM 				*/
/*  DBMS       : SQL Server 2012 						*/
/* ---------------------------------------------------- */
USE MASTER
GO

IF DB_ID('qlKH') IS NOT NULL
BEGIN
	DROP DATABASE qlKH
END

CREATE DATABASE qlKH
GO
USE qlKH
GO

/* Drop Foreign Key Constraints */

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_BangCap_GiaoVien]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [BangCap] DROP CONSTRAINT [FK_BangCap_GiaoVien]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_GiaoVien_NguoiDung]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [GiaoVien] DROP CONSTRAINT [FK_GiaoVien_NguoiDung]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_KhoaHoc_GiaoVien]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [KhoaHoc] DROP CONSTRAINT [FK_KhoaHoc_GiaoVien]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_LichHoc_KhoaHoc]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [LichHoc] DROP CONSTRAINT [FK_LichHoc_KhoaHoc]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_ThamGiaBuoiHoc_LichHoc]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [ThamGiaBuoiHoc] DROP CONSTRAINT [FK_ThamGiaBuoiHoc_LichHoc]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_ThamGiaBuoiHoc_NguoiDung]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [ThamGiaBuoiHoc] DROP CONSTRAINT [FK_ThamGiaBuoiHoc_NguoiDung]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_ThamGiaKH_KhoaHoc]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [ThamGiaKH] DROP CONSTRAINT [FK_ThamGiaKH_KhoaHoc]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_ThamGiaKH_NguoiDung]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [ThamGiaKH] DROP CONSTRAINT [FK_ThamGiaKH_NguoiDung]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_ThongTinNganHang_NguoiDung]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [ThongTinNganHang] DROP CONSTRAINT [FK_ThongTinNganHang_NguoiDung]
GO

/* Drop Tables */

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[BangCap]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [BangCap]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[GiaoVien]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [GiaoVien]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[KhoaHoc]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [KhoaHoc]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[LichHoc]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [LichHoc]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[NguoiDung]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [NguoiDung]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[ThamGiaBuoiHoc]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [ThamGiaBuoiHoc]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[ThamGiaKH]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [ThamGiaKH]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[ThongTinNganHang]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [ThongTinNganHang]
GO

/* Create Tables */

CREATE TABLE [BangCap]
(
	[MaGV] varchar(10) NOT NULL,
	[STT] int NOT NULL,
	[TenBang] nvarchar(50) NULL,
	[NgayCap] date NULL,
	[NoiCap] nvarchar(50) NULL
)
GO

CREATE TABLE [GiaoVien]
(
	[MaGV] varchar(10) NOT NULL,
	[DanhGiaGV] float NULL,
	[MaTK] varchar(10) NULL
)
GO

CREATE TABLE [KhoaHoc]
(
	[MaKH] varchar(10) NOT NULL,
	[TenKhoaHoc] nvarchar(50) NULL,
	[Lop] int NULL,
	[SoBuoiDuKien] int NULL,
	[SoHocSinhToiThieu] int NULL,
	[MaGV] varchar(10) NULL,
	[DanhGiaKH] float NULL,
	[HocPhi] int NULL
)
GO

CREATE TABLE [LichHoc]
(
	[MaKH] varchar(10) NOT NULL,
	[STT] int NOT NULL,
	[Ngay] date NULL,
	[ThoiGian] time(7) NULL,
	[MoTa] nvarchar(100) NULL
)
GO

CREATE TABLE [NguoiDung]
(
	[MaTK] varchar(10) NOT NULL,
	[TenDN] varchar(50) NULL,
	[MatKhauDN] varchar(50) NULL,
	[HoTen] nvarchar(50) NULL,
	[NgaySinh] date NULL,
	[Email] varchar(50) NULL,
	[SDT] varchar(20) NULL
)
GO

CREATE TABLE [ThamGiaBuoiHoc]
(
	[MaKH] varchar(10) NOT NULL,
	[STT] int NOT NULL,
	[MaTK] varchar(10) NOT NULL,
	[DanhGiaBuoiHoc] float NULL
)
GO

CREATE TABLE [ThamGiaKH]
(
	[MaKH] varchar(10) NOT NULL,
	[MaTK] varchar(10) NOT NULL,
	[NgayThamGia] date NOT NULL,
	[TinhTrangThanhToan] nvarchar(50) NULL
)
GO

CREATE TABLE [ThongTinNganHang]
(
	[MaTK] varchar(10) NOT NULL,
	[SoTaiKhoan] varchar(20) NOT NULL,
	[TenNganHang] nvarchar(50) NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [BangCap] 
 ADD CONSTRAINT [PK_BangCap]
	PRIMARY KEY CLUSTERED ([MaGV] ASC,[STT] ASC)
GO

ALTER TABLE [GiaoVien] 
 ADD CONSTRAINT [PK_GiaoVien]
	PRIMARY KEY CLUSTERED ([MaGV] ASC)
GO

ALTER TABLE [KhoaHoc] 
 ADD CONSTRAINT [PK_KhoaHoc]
	PRIMARY KEY CLUSTERED ([MaKH] ASC)
GO

ALTER TABLE [LichHoc] 
 ADD CONSTRAINT [PK_LichHoc]
	PRIMARY KEY CLUSTERED ([MaKH] ASC,[STT] ASC)
GO

ALTER TABLE [NguoiDung] 
 ADD CONSTRAINT [PK_MaTK]
	PRIMARY KEY CLUSTERED ([MaTK] ASC)
GO

ALTER TABLE [NguoiDung] 
 ADD CONSTRAINT [U_Username] UNIQUE NONCLUSTERED ([TenDN] ASC)
GO

ALTER TABLE [ThamGiaBuoiHoc] 
 ADD CONSTRAINT [PK_ThamGiaBuoiHoc]
	PRIMARY KEY CLUSTERED ([MaTK] ASC, [MaKH] ASC,[STT] ASC)
GO

ALTER TABLE [ThamGiaKH] 
 ADD CONSTRAINT [PK_ThamGiaKH]
	PRIMARY KEY CLUSTERED ([MaTK] ASC,[MaKH] ASC,[NgayThamGia] ASC)
GO

ALTER TABLE [ThongTinNganHang] 
 ADD CONSTRAINT [PK_Table1]
	PRIMARY KEY CLUSTERED ([MaTK] ASC,[SoTaiKhoan] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [BangCap] ADD CONSTRAINT [FK_BangCap_GiaoVien]
	FOREIGN KEY ([MaGV]) REFERENCES [GiaoVien] ([MaGV]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [GiaoVien] ADD CONSTRAINT [FK_GiaoVien_NguoiDung]
	FOREIGN KEY ([MaTK]) REFERENCES [NguoiDung] ([MaTK]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [KhoaHoc] ADD CONSTRAINT [FK_KhoaHoc_GiaoVien]
	FOREIGN KEY ([MaGV]) REFERENCES [GiaoVien] ([MaGV]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [LichHoc] ADD CONSTRAINT [FK_LichHoc_KhoaHoc]
	FOREIGN KEY ([MaKH]) REFERENCES [KhoaHoc] ([MaKH]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [ThamGiaBuoiHoc] ADD CONSTRAINT [FK_ThamGiaBuoiHoc_LichHoc]
	FOREIGN KEY ([MaKH],[STT]) REFERENCES [LichHoc] ([MaKH],[STT]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [ThamGiaBuoiHoc] ADD CONSTRAINT [FK_ThamGiaBuoiHoc_NguoiDung]
	FOREIGN KEY ([MaTK]) REFERENCES [NguoiDung] ([MaTK]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [ThamGiaKH] ADD CONSTRAINT [FK_ThamGiaKH_KhoaHoc]
	FOREIGN KEY ([MaKH]) REFERENCES [KhoaHoc] ([MaKH]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [ThamGiaKH] ADD CONSTRAINT [FK_ThamGiaKH_NguoiDung]
	FOREIGN KEY ([MaTK]) REFERENCES [NguoiDung] ([MaTK]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [ThongTinNganHang] ADD CONSTRAINT [FK_ThongTinNganHang_NguoiDung]
	FOREIGN KEY ([MaTK]) REFERENCES [NguoiDung] ([MaTK]) ON DELETE No Action ON UPDATE No Action
GO
