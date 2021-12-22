USE qlKH
GO

CREATE PROC sp_GV_TaoKH 
	@MaGV varchar(10),
	@TenKH nvarchar(50), 
	@Lop int, 
	@SoBuoi int, 
	@SoHS int,
	@HocPhi int
AS
BEGIN TRAN
	BEGIN TRY
		declare @MaKH as varchar(10) = dbo.f_Auto_MaKH()
		insert into KhoaHoc(MaKH, TenKhoaHoc, Lop, SoBuoiDuKien, SoHocSinhToiThieu, MaGV, HocPhi) 
		values (@MaKH, @TenKH, @Lop, @SoBuoi, @SoHS, @MaGV, @HocPhi)

	END TRY
	BEGIN CATCH
		SELECT  ERROR_NUMBER() AS ErrorNumber,
				ERROR_SEVERITY() AS ErrorSeverity, 
				ERROR_STATE() AS ErrorState,  
				ERROR_PROCEDURE() AS ErrorProcedure,  
				ERROR_LINE() AS ErrorLine,  
				ERROR_MESSAGE() AS ErrorMessage; 
		IF @@TRANCOUNT > 0  
			ROLLBACK TRANSACTION
	END CATCH
IF @@TRANCOUNT > 0  
    COMMIT TRANSACTION; 

GO

CREATE PROC sp_TK_ThamGiaKH 
	@MaTK varchar(10),
	@MaKH varchar(10) 
AS
BEGIN TRAN
	BEGIN TRY
		declare @NgayTG as date = getdate()
		insert into ThamGiaKH(MaKH, MaTK, NgayThamGia, TinhTrangThanhToan)
		values(@MaKH, @MaTK, @NgayTG, N'Chưa Thanh Toán')
	END TRY
	BEGIN CATCH
		SELECT  ERROR_NUMBER() AS ErrorNumber,
				ERROR_SEVERITY() AS ErrorSeverity, 
				ERROR_STATE() AS ErrorState,  
				ERROR_PROCEDURE() AS ErrorProcedure,  
				ERROR_LINE() AS ErrorLine,  
				ERROR_MESSAGE() AS ErrorMessage; 
		IF @@TRANCOUNT > 0  
			ROLLBACK TRANSACTION
	END CATCH
IF @@TRANCOUNT > 0  
    COMMIT TRANSACTION; 

GO

CREATE PROC sp_TK_ThanhToan
	@MaTK varchar(10),
	@MaKH varchar(10),
	@TinhTrang bit
AS
BEGIN TRAN
	BEGIN TRY
		IF @TinhTrang = 1
			UPDATE ThamGiaKH
			SET TinhTrangThanhToan = N'Đã Thanh Toán'	
		ELSE UPDATE ThamGiaKH
			SET TinhTrangThanhToan = N'Chưa Thanh Toán'	
	END TRY
	BEGIN CATCH
		SELECT  ERROR_NUMBER() AS ErrorNumber,
				ERROR_SEVERITY() AS ErrorSeverity, 
				ERROR_STATE() AS ErrorState,  
				ERROR_PROCEDURE() AS ErrorProcedure,  
				ERROR_LINE() AS ErrorLine,  
				ERROR_MESSAGE() AS ErrorMessage; 
		IF @@TRANCOUNT > 0  
			ROLLBACK TRANSACTION
	END CATCH
IF @@TRANCOUNT > 0  
    COMMIT TRANSACTION; 

GO

create proc sp_TK_DangKyGV
	@MaTK varchar(10),
	@TenBang nvarchar(50),
	@NgayCapBang date,
	@NoiCapBang nvarchar(50)
AS
BEGIN TRAN
	BEGIN TRY
		declare @MaGV as varchar(10) = dbo.f_Auto_MaGV()
		insert into GiaoVien(MaGV, MaTK) values (@MaGV, @MaTK)
		declare @STT as int = (select count(*) from BangCap where MaGV = @MaGV) + 1
		insert into BangCap(MaGV, STT, NgayCap, NoiCap, TenBang) 
		values(@MaGV, @STT, @NgayCapBang, @NoiCapBang, @TenBang)
	END TRY
	BEGIN CATCH
		SELECT  ERROR_NUMBER() AS ErrorNumber,
				ERROR_SEVERITY() AS ErrorSeverity, 
				ERROR_STATE() AS ErrorState,  
				ERROR_PROCEDURE() AS ErrorProcedure,  
				ERROR_LINE() AS ErrorLine,  
				ERROR_MESSAGE() AS ErrorMessage; 
		IF @@TRANCOUNT > 0  
			ROLLBACK TRANSACTION
	END CATCH
IF @@TRANCOUNT > 0  
    COMMIT TRANSACTION; 

GO

CREATE PROC sp_GV_HuyKH
	@MaGV varchar(10),
	@MaKH varchar(10)
AS
BEGIN TRAN
	BEGIN TRY
		declare @Ngay as date = getdate()
		declare @NgayBD as date = (select Ngay from LichHoc where MaKH = @MaKH and STT = 1)
		if DATEDIFF(wk, @Ngay, @NgayBD) < 2 return
		else
		begin	
			delete from KhoaHoc where MaKH = @MaKH
			delete from ThamGiaKH where MaKH = @MaKH
		end
	END TRY
	BEGIN CATCH
		SELECT  ERROR_NUMBER() AS ErrorNumber,
				ERROR_SEVERITY() AS ErrorSeverity, 
				ERROR_STATE() AS ErrorState,  
				ERROR_PROCEDURE() AS ErrorProcedure,  
				ERROR_LINE() AS ErrorLine,  
				ERROR_MESSAGE() AS ErrorMessage; 
		IF @@TRANCOUNT > 0  
			ROLLBACK TRANSACTION
	END CATCH
IF @@TRANCOUNT > 0  
    COMMIT TRANSACTION; 

GO
	--Tạo tài khoản
CREATE PROC sp_signUp
	@tendn VARCHAR(50), 
	@mk VARCHAR(50),
	@hoten NVARCHAR(50), 
	@ngaysinh DATE, 
	@email VARCHAR(50), 
	@sdt VARCHAR(20)
AS
  BEGIN TRAN
  BEGIN TRY
    IF EXISTS (SELECT *
        FROM nguoidung
        WHERE tendn = @tendn)
      RAISERROR (N'Tên đăng nhập đã tồn tại', 16, 1)
    ELSE
      DECLARE @matk VARCHAR(10)
    set @matk=dbo.f_Auto_MaTK()
    INSERT INTO NGUOIDUNG
      VALUES (@matk, @tendn, @mk, @hoten, @ngaysinh, @email, @sdt)

  END TRY
  BEGIN CATCH
    SELECT
      ERROR_NUMBER() AS ErrorNumber
     ,ERROR_SEVERITY() AS ErrorSeverity
     ,ERROR_STATE() AS ErrorState
     ,ERROR_PROCEDURE() AS ErrorProcedure
     ,ERROR_LINE() AS ErrorLine
     ,ERROR_MESSAGE() AS ErrorMessage;
    IF @@TRANCOUNT > 0
      ROLLBACK TRANSACTION
  END CATCH
  IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO


--Đăng nhập
CREATE PROC sp_signIn @tendn VARCHAR(50), @mk VARCHAR(50), @matk VARCHAR(10) OUTPUT
AS
  BEGIN TRAN
  BEGIN TRY

    SELECT
      @matk = (SELECT
          MaTK
        FROM nguoidung
        WHERE tendn = @tendn
        AND matkhaudn = @mk)

    IF @matk IS NULL
      RAISERROR (N'Sai tài khoản hoặc mật khẩu', 16, 1)

  END TRY
  BEGIN CATCH
    SELECT
      ERROR_NUMBER() AS ErrorNumber
     ,ERROR_SEVERITY() AS ErrorSeverity
     ,ERROR_STATE() AS ErrorState
     ,ERROR_PROCEDURE() AS ErrorProcedure
     ,ERROR_LINE() AS ErrorLine
     ,ERROR_MESSAGE() AS ErrorMessage;
    IF @@TRANCOUNT > 0
      ROLLBACK TRANSACTION
  END CATCH
  IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO


--Lên lịch học
CREATE PROC sp_GV_LenLich @MaKH varchar(10), @Ngay date, @ThoiGian time, @MoTa nvarchar(100)
AS
  BEGIN TRAN
  BEGIN TRY
    declare @STT as int = 0
	set @STT = (select count(*) from LichHoc where MaKH = @MaKH) + 1
	insert into LichHoc values(@MaKH, @STT, @Ngay, @ThoiGian, @MoTa)
  END TRY
  BEGIN CATCH
    SELECT
      ERROR_NUMBER() AS ErrorNumber
     ,ERROR_SEVERITY() AS ErrorSeverity
     ,ERROR_STATE() AS ErrorState
     ,ERROR_PROCEDURE() AS ErrorProcedure
     ,ERROR_LINE() AS ErrorLine
     ,ERROR_MESSAGE() AS ErrorMessage;
    IF @@TRANCOUNT > 0
      ROLLBACK TRANSACTION
  END CATCH
  IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO

--Sửa lịch học
CREATE PROC sp_GV_SuaLich @MaKH varchar(10), @STT int, @Ngay date, @ThoiGian time
AS
  BEGIN TRAN
  BEGIN TRY
    declare @NgayHoc as date = (select Ngay from LichHoc where MaKH = @MaKH and STT = @STT)
	if DATEDIFF(day, GETDATE(), @NgayHoc) <= 3 return
	update LichHoc
	set Ngay = @Ngay where MaKH = @MaKH and STT = @STT
	update LichHoc
	set ThoiGian = @ThoiGian where MaKH = @MaKH and STT = @STT
  END TRY
  BEGIN CATCH
    SELECT
      ERROR_NUMBER() AS ErrorNumber
     ,ERROR_SEVERITY() AS ErrorSeverity
     ,ERROR_STATE() AS ErrorState
     ,ERROR_PROCEDURE() AS ErrorProcedure
     ,ERROR_LINE() AS ErrorLine
     ,ERROR_MESSAGE() AS ErrorMessage;
    IF @@TRANCOUNT > 0
      ROLLBACK TRANSACTION
  END CATCH
  IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO

--Tìm khóa học - 19120674
CREATE PROC sp_findCourses @keyword NVARCHAR(50)
AS
  BEGIN TRAN
  BEGIN TRY
    SELECT
      *
    FROM KhoaHoc
    WHERE TenKhoaHoc LIKE '%' + @keyword + '%'
  END TRY
  BEGIN CATCH
    SELECT
      ERROR_NUMBER() AS ErrorNumber
     ,ERROR_SEVERITY() AS ErrorSeverity
     ,ERROR_STATE() AS ErrorState
     ,ERROR_PROCEDURE() AS ErrorProcedure
     ,ERROR_LINE() AS ErrorLine
     ,ERROR_MESSAGE() AS ErrorMessage;
    IF @@TRANCOUNT > 0
      ROLLBACK TRANSACTION
  END CATCH
  IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO

--tham gia buổi học
CREATE PROC sp_joinLesson @matk VARCHAR(10), @makh VARCHAR(10), @stt INT
AS
  BEGIN TRAN
  BEGIN TRY
    INSERT INTO ThamGiaBuoiHoc(MaTK, MaKH, STT)
      VALUES (@matk, @makh, @stt)

  END TRY
  BEGIN CATCH
    SELECT
      ERROR_NUMBER() AS ErrorNumber
     ,ERROR_SEVERITY() AS ErrorSeverity
     ,ERROR_STATE() AS ErrorState
     ,ERROR_PROCEDURE() AS ErrorProcedure
     ,ERROR_LINE() AS ErrorLine
     ,ERROR_MESSAGE() AS ErrorMessage;
    IF @@TRANCOUNT > 0
      ROLLBACK TRANSACTION
  END CATCH
  IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO

--Đánh giá buổi học - 19120674
CREATE PROC sp_rateLesson @matk VARCHAR(10), @makh VARCHAR(10), @stt INT, @rate FLOAT
AS
  BEGIN TRAN
  BEGIN TRY
    UPDATE ThamGiaBuoiHoc
    SET danhgiabuoihoc = @rate
    WHERE @matk = matk
    AND @makh = makh
    AND @stt = stt

  END TRY
  BEGIN CATCH
    SELECT
      ERROR_NUMBER() AS ErrorNumber
     ,ERROR_SEVERITY() AS ErrorSeverity
     ,ERROR_STATE() AS ErrorState
     ,ERROR_PROCEDURE() AS ErrorProcedure
     ,ERROR_LINE() AS ErrorLine
     ,ERROR_MESSAGE() AS ErrorMessage;
    IF @@TRANCOUNT > 0
      ROLLBACK TRANSACTION
  END CATCH
  IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO

create proc sp_GV_XemKH @MaGV varchar(8)
AS
  BEGIN TRAN
  BEGIN TRY
    SELECT * FROM KhoaHoc WHERE MaGV = @MaGV
  END TRY
  BEGIN CATCH
    SELECT
      ERROR_NUMBER() AS ErrorNumber
     ,ERROR_SEVERITY() AS ErrorSeverity
     ,ERROR_STATE() AS ErrorState
     ,ERROR_PROCEDURE() AS ErrorProcedure
     ,ERROR_LINE() AS ErrorLine
     ,ERROR_MESSAGE() AS ErrorMessage;
    IF @@TRANCOUNT > 0
      ROLLBACK TRANSACTION
  END CATCH
  IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO
	

create proc sp_User_XemKH @MaTK varchar(8)
AS
  BEGIN TRAN
  BEGIN TRY
    SELECT kh.MaKH,kh.TenKhoaHoc FROM ThamGiaKH tg JOIN KhoaHoc kh on tg.MaKH=kh.MaKH WHERE MaTK = @MaTK
  END TRY
  BEGIN CATCH
    SELECT
      ERROR_NUMBER() AS ErrorNumber
     ,ERROR_SEVERITY() AS ErrorSeverity
     ,ERROR_STATE() AS ErrorState
     ,ERROR_PROCEDURE() AS ErrorProcedure
     ,ERROR_LINE() AS ErrorLine
     ,ERROR_MESSAGE() AS ErrorMessage;
    IF @@TRANCOUNT > 0
      ROLLBACK TRANSACTION
  END CATCH
  IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO
--exec sp_User_XemKH '001'
--drop proc sp_User_XemKH