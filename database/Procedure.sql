USE [sunrise-hotel]
GO


CREATE OR ALTER FUNCTION USF_GetReviewNum (@HotelId INT)
RETURNS INT
BEGIN
	declare @Value INT
	SET @Value = (SELECT COUNT(*) FROM REVIEW WHERE HotelId = @HotelId)
    RETURN @Value
END
GO


CREATE OR ALTER FUNCTION USF_GetAvgReview (@HotelId INT)
RETURNS FLOAT
BEGIN
	declare @Value FLOAT
	SET @Value = (SELECT AVG(Points) FROM REVIEW WHERE HotelId = @HotelId)
	IF @Value IS NULL RETURN 0
    RETURN @Value
END
GO


CREATE OR ALTER FUNCTION USF_GetMinRoomPrice (@HotelId INT)
RETURNS FLOAT
BEGIN
	declare @Value FLOAT
	SET @Value = (SELECT MIN(Price) FROM ROOM_TYPE WHERE HotelId = @HotelId)
	IF @Value IS NULL RETURN 0
    RETURN @Value
END
GO


CREATE OR ALTER PROC USP_GetNextColumnId(
	@tablename SYSNAME,
	@columnname SYSNAME
)
AS
	DECLARE @IntVariable INT = 0;  
	DECLARE @SQLString NVARCHAR(MAX);  
	DECLARE @ParmDefinition NVARCHAR(500);
  
	SET @SQLString = 
		N'with cte as (select ' + @columnname + ' id, lead(' + @columnname + ') over (order by ' + @columnname + ') nextid from ' + @tablename + ')
		select @gapstartOUT = MIN(id) from cte
		where id < nextid - 1';
	SET @ParmDefinition = N'@gapstartOUT INTEGER OUTPUT';  
  
	EXECUTE sp_executesql @SQLString, @ParmDefinition, @gapstartOUT = @IntVariable OUTPUT;  

	IF (@IntVariable IS NULL)
	BEGIN
		DECLARE @SQL NVARCHAR(MAX);
		SET @SQL = N'select @IdOUT = count(' + @columnname + ') from ' + @tablename + '';
		SET @ParmDefinition = N'@IdOUT INTEGER OUTPUT';
		EXEC sp_executesql @SQL, @ParmDefinition, @IdOUT = @IntVariable OUTPUT;

		RETURN @IntVariable + 1;
	END

	RETURN @IntVariable + 1; 
GO



-- // check
GO
CREATE OR ALTER FUNCTION USF_GetServiceFee () -- CartItem
RETURNS INT
BEGIN
	RETURN 50000;
END
GO

GO
CREATE OR ALTER PROC USP_GetHotelRoomFacility 
	@Id INT
AS
	SELECT DISTINCT room.FacilityId as Id, const.Value as Value FROM ROOM_FACILITY room 
	JOIN FACILITY_CONST const ON room.FacilityId = const.Id
	WHERE room.HotelId = @Id
GO


CREATE OR ALTER PROC USP_GetHotelRoomService
	@Id INT
AS
	SELECT DISTINCT room.ServiceId as Id, const.Value as Value FROM ROOM_SERVICE room 
	JOIN SERVICE_CONST const ON room.ServiceId = const.Id
	WHERE room.HotelId = @Id
GO

CREATE OR ALTER PROC USP_GetHotelRoomPicture
	@Id INT
AS
	SELECT * FROM ROOM_PICTURE rp WHERE rp.HotelId = @Id
GO


CREATE OR ALTER PROC USP_GetHotelRoomType 
	@HotelId INT
AS
	select * from ROOM_TYPE rt
	where rt.HotelId = @HotelId
GO



CREATE OR ALTER PROC USP_GetRoomType 
	@HotelId INT,
	@Id INT
AS
	select * from ROOM_TYPE rt
	where rt.HotelId = @HotelId and Id = @Id
GO


CREATE OR ALTER PROC USP_GetRoomPicture 
	@HotelId INT,
	@RoomId INT
AS
	select * from ROOM_PICTURE rp
	where rp.HotelId = @HotelId and rp.RoomTypeId = @RoomId
GO

CREATE OR ALTER PROC USP_GetSingleRoomPicture 
	@HotelId INT,
	@RoomId INT,
	@PictureId INT
AS
	select * from ROOM_PICTURE rp
	where rp.HotelId = @HotelId and rp.RoomTypeId = @RoomId and rp.Id=@PictureId;
GO

CREATE OR ALTER PROC USP_GetRoomFacility
	@HotelId INT,
	@RoomId INT
AS
	SELECT room.FacilityId as Id, const.Value as Value FROM ROOM_FACILITY room 
	JOIN FACILITY_CONST const ON room.FacilityId = const.Id
	WHERE room.HotelId = @HotelId AND room.RoomId = @RoomId
GO

CREATE OR ALTER PROC USP_GetRoomService 
	@HotelId INT,
	@RoomId INT
AS
	SELECT room.ServiceId as Id, const.Value as Value FROM ROOM_SERVICE room 
	JOIN SERVICE_CONST const ON room.ServiceId = const.Id
	WHERE room.HotelId = @HotelId AND room.RoomId = @RoomId
GO


GO
CREATE OR ALTER PROC USP_GetAmenitiesId(
	@tablename SYSNAME,
	@valueString VARCHAR(MAX)
)
AS
	DECLARE @sql NVARCHAR(MAX) =
		N'select tb.Id from STRING_SPLIT(''' + @valueString + ''', '','') spl 
		join ' + @tablename + ' tb on spl.value like tb.Value;';
	EXEC sp_executesql @sql;
GO

--! Hotel ==================

CREATE OR ALTER PROC USP_GetAllHotel
AS
	SELECT Id, Name, Country, HotelType, ProvinceCity, 
			Address, Stars,
			dbo.USF_GetAvgReview(Id) Rating,
			Description, Image,
			dbo.USF_GetMinRoomPrice(Id) Price
	FROM HOTEL
GO

--! 
CREATE OR ALTER PROC USP_GetHotelById
	@Id INTEGER
AS
	IF (@Id = -1)
	BEGIN
		SELECT null;
	END

	SELECT Id, Name, Country, HotelType, ProvinceCity, 
			Address, Stars,
			dbo.USF_GetAvgReview(Id) Rating,
			Description, Image,
			dbo.USF_GetMinRoomPrice(Id) Price
	FROM HOTEL WHERE Id = @Id
GO


CREATE OR ALTER PROC USP_GetRecommendedHotel
	@Quantity INTEGER
AS
	SELECT TOP(@Quantity) Id, Name, Country, HotelType, ProvinceCity, 
			Address, Stars,
			dbo.USF_GetAvgReview(Id) Rating,
			Description, Image,
			dbo.USF_GetMinRoomPrice(Id) Price
	FROM HOTEL
	ORDER BY Rating DESC;
GO


CREATE OR ALTER PROC USP_AddHotel
	@AccountId INT,
	@Name NVARCHAR(100),
	@Country NVARCHAR(100),
	@HotelType VARCHAR(100),
	@ProvinceCity NVARCHAR(100),  
	@Address NVARCHAR(100),
	@Stars INT,
	@Description NVARCHAR(1000),
	@Image NVARCHAR(1000)
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM ACCOUNT WHERE Id = @AccountId AND UserRole = 'Partner')
	BEGIN
		RAISERROR ('Tài khoản không tồn tại hoặc không đủ quyền.', 11, 1);
		RETURN -2;
	END

	BEGIN TRAN
	BEGIN TRY
		DECLARE @Id INT
		EXEC @Id = USP_GetNextColumnId 'HOTEL', 'Id';
		
		INSERT INTO HOTEL VALUES (@Id, @Name, @Country, @HotelType, @ProvinceCity, @Address, @Stars, 0, @Description, @Image);
		UPDATE PERSONAL_DETAILS SET HotelId = @Id WHERE AccountId = @AccountId;
	END TRY

	BEGIN CATCH
		RAISERROR ('Lỗi trong quá trình thêm khách sạn.', 11, 1);
		ROLLBACK;
		RETURN -1;
	END CATCH

	COMMIT;
	RETURN @Id
END
GO

CREATE OR ALTER PROC USP_UpdateHotel -- // new check
	@Id INT,
	@Name NVARCHAR(100),
	@Country NVARCHAR(100),
	@HotelType VARCHAR(100),
	@ProvinceCity NVARCHAR(100),  
	@Address NVARCHAR(100),
	@Stars INT,
	@Description NVARCHAR(1000),
	@Image NVARCHAR(1000)
AS
BEGIN
	IF NOT EXISTS (SELECT Id FROM HOTEL WHERE Id = @Id)
	BEGIN
		RAISERROR ('Khách sạn không tồn tại.', 11, 1);
		RETURN -2;
	END

	BEGIN TRAN
	BEGIN TRY
		UPDATE HOTEL SET
			Name = @Name,
			Country = @Country,
			HotelType = @HotelType,
			ProvinceCity = @ProvinceCity,  
			Address = @Address,
			Stars = @Stars,
			Description = @Description,
			Image = @Image
		WHERE Id = @Id;
	END TRY

	BEGIN CATCH
		RAISERROR ('Lỗi trong quá trình thêm khách sạn.', 11, 1);
		ROLLBACK;
		RETURN -1;
	END CATCH

	COMMIT;
	RETURN 0
END
GO



CREATE OR ALTER PROC USP_GetAllAccount
AS
	SELECT * FROM ACCOUNT
GO

CREATE OR ALTER PROC USP_GetAccountDetailSocial (
	@Email VARCHAR(50),
	@FullName NVARCHAR(1000))
AS
	SELECT pd.*, acc.MemberPoint as Point, acc.UserRole as Role FROM 
	(SELECT * FROM PERSONAL_DETAILS WHERE EmailAddress = @Email AND FullName = @FullName) pd
	JOIN ACCOUNT acc ON pd.AccountId = acc.Id AND acc.PasswordHash = 'Social';
GO

GO
CREATE OR ALTER PROC USP_AddAccountSocial (
	@Id INT,
	@Email VARCHAR(50),
	@FullName NVARCHAR(100),
	@RefreshToken VARCHAR(200),
	@TokenCreated DATETIME,
	@TokenExpires DATETIME,
	@UserRole VARCHAR(50))
AS
	EXEC USP_AddAccount @Id, @Email, @FullName, 'Social', 'Social', @UserRole, @RefreshToken, @TokenCreated, @TokenExpires;
	RETURN @Id;
GO


CREATE OR ALTER PROC USP_GetAccountByUsername
	@Email VARCHAR(50)
AS
	SELECT acc.*, pd.FullName
	FROM (SELECT * FROM ACCOUNT where Email = @Email AND PasswordHash != 'Social') acc
	JOIN PERSONAL_DETAILS pd ON acc.Id = pd.AccountId;
GO


CREATE OR ALTER PROC USP_GetAccountById
	@Id INT
AS
	SELECT acc.*, pd.FullName
	FROM (SELECT * FROM ACCOUNT where Id = @Id) acc
	JOIN PERSONAL_DETAILS pd ON acc.Id = pd.AccountId;
GO

-- /NEW/ // check
CREATE OR ALTER PROC USP_GetHotelReviews
	@Id INT
AS
	SELECT rv.ReviewId as Id, pd.FullName as UserName, pd.Image as UserAvatar, rv.ReviewDate, rv.Points, rv.Content
	FROM (SELECT * FROM REVIEW WHERE HotelId = @Id) rv 
	LEFT JOIN PERSONAL_DETAILS pd ON rv.AccountId = pd.AccountId;
GO


CREATE OR ALTER PROC USP_AddAccount
	@Id INTEGER,
	--@MemberPoint INTEGER,
	@Email VARCHAR(50),
	@FullName NVARCHAR(100),
	@PasswordHash VARCHAR(500),
	@PasswordSalt VARCHAR(500),
	@UserRole VARCHAR(50),
	@RefreshToken VARCHAR(200),
	@TokenCreated DATETIME,
	@TokenExpires DATETIME
AS
BEGIN
	BEGIN TRAN

	BEGIN TRY
		INSERT INTO ACCOUNT VALUES (@Id, 0, 'Bronze', @Email, @PasswordHash, @PasswordSalt, @UserRole, @RefreshToken, @TokenCreated, @TokenExpires, 1)

		IF NOT EXISTS (SELECT AccountId FROM PERSONAL_DETAILS WHERE AccountId = @Id)
			INSERT INTO PERSONAL_DETAILS (AccountId, FullName, EmailAddress, PhoneNumber, DateOfBirth, Gender, Image, Rank, HotelId) 
				VALUES (@Id, @FullName, @Email, 'default', '01-01-2002', 'Male', 'https://rialloer.sirv.com/Sunrise-Continent/Users/focalos.png', 'Bronze', 0);
		ELSE
			UPDATE PERSONAL_DETAILS SET
				FullName = @FullName,
				EmailAddress = @Email,
				HotelId = 0
			WHERE AccountId = @Id;
	END TRY

	BEGIN CATCH
		ROLLBACK;
		RAISERROR('Account insertion error', 11, 1)
		RETURN -1
	END CATCH

	COMMIT;
	RETURN @Id;
END;
GO


GO
CREATE OR ALTER PROC USP_UpdateAccount
	@Id INTEGER,
	@MemberPoint INTEGER,
	@AccountRank VARCHAR(20),
	@Email VARCHAR(50),
	@PasswordHash VARCHAR(500),
	@PasswordSalt VARCHAR(500)
AS
	BEGIN TRY
		IF NOT EXISTS (SELECT * FROM ACCOUNT WHERE Id = @Id)
		BEGIN
			PRINT N'Tài khoản không tồn tại'
			RETURN 1
		END

		UPDATE ACCOUNT 
		SET
			MemberPoint = @MemberPoint,
			Email = @Email,
			AccountRank = @AccountRank,
			PasswordHash = @PasswordHash,
			PasswordSalt = @PasswordSalt
		WHERE Id = @Id
		RETURN 0
	END TRY

	BEGIN CATCH
		PRINT N'Account update error'
		RETURN 1
	END CATCH
GO


-- Email, password

--FullName NVARCHAR(1000),
--EmailAddress VARCHAR(100),
--PhoneNumber VARCHAR(20),
--DateOfBirth DATE,
--Gender NVARCHAR(100),
--Image VARCHAR(1000),

GO
CREATE OR ALTER PROC USP_UpdateAccountEmail -- // Check
	@AccountId INTEGER,
	@Email VARCHAR(50)
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM ACCOUNT WHERE Id = @AccountId)
	BEGIN
		RAISERROR(N'Tài khoản không tồn tại', 11, 1);
		RETURN -2;
	END

	IF EXISTS (SELECT Id FROM ACCOUNT WHERE Email = @Email AND Id != @AccountId)
	BEGIN
		RAISERROR(N'Email đã tồn tại', 11, 1);
		RETURN -3;
	END
	
	BEGIN TRAN

	BEGIN TRY
		UPDATE ACCOUNT SET Email = @Email WHERE Id = @AccountId;
		UPDATE PERSONAL_DETAILS SET EmailAddress = @Email WHERE AccountId = @AccountId;
	END TRY

	BEGIN CATCH
		RAISERROR(N'Tài khoản không tồn tại', 11, 1);
		ROLLBACK;
		RETURN -1;
	END CATCH

	COMMIT;
	RETURN 0;
END
GO

GO
CREATE OR ALTER PROC USP_UpdateAccountPersonalInfo -- // Check // newCheck
	@AccountId INTEGER,
	@FullName NVARCHAR(1000),
	@PhoneNumber VARCHAR(20),
	@DateOfBirth DATE,
	@Gender NVARCHAR(100),
	@Image VARCHAR(1000)
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM ACCOUNT WHERE Id = @AccountId)
	BEGIN
		RAISERROR(N'Tài khoản không tồn tại', 11, 1);
		RETURN -2;
	END
	
	BEGIN TRAN

	BEGIN TRY
		UPDATE PERSONAL_DETAILS SET 
			FullName = @FullName,
			PhoneNumber = @PhoneNumber,
			DateOfBirth = @DateOfBirth,
			Gender = @Gender,
			Image = @Image
		WHERE AccountId = @AccountId;
	END TRY

	BEGIN CATCH
		RAISERROR(N'Lỗi cập nhật thông tin cá nhân.', 11, 1);
		ROLLBACK;
		RETURN -1;
	END CATCH

	COMMIT;
	RETURN 0;
END
GO

GO
CREATE OR ALTER PROC USP_BanAccount -- // Check // newCheck
	@AccountId INTEGER
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM ACCOUNT WHERE Id = @AccountId)
	BEGIN
		RAISERROR(N'Tài khoản không tồn tại', 11, 1);
		RETURN -2;
	END
	
	BEGIN TRAN

	BEGIN TRY
		UPDATE ACCOUNT SET 
			Active = 0
		WHERE Id = @AccountId;
	END TRY

	BEGIN CATCH
		RAISERROR(N'Đã có lỗi trong quá trình khóa tài khoản, vui lòng thử lại sau.', 11, 1);
		ROLLBACK;
		RETURN -1;
	END CATCH

	COMMIT;
	RETURN 0;
END
GO

GO
CREATE OR ALTER PROC USP_DeleteAccount
	@Id INTEGER
AS
	BEGIN TRY
		

		DELETE FROM ACCOUNT WHERE Id = @Id
		RETURN 0
	END TRY

	BEGIN CATCH
		PRINT N'Account deletion error'
		RETURN 1
	END CATCH
GO

--TODOPROCEDURE XÓA NHỮNG THÔNG TIN CỦA KHÁCH SẠN TRỪ REVIEW VÀ HÓA ĐƠN BOOK

GO

CREATE OR ALTER PROCEDURE USP_DeleteHotelInformation
    @Id INT,
    @Result INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
        --! Xóa thông tin về các hình ảnh của phòng
        DELETE FROM ROOM_PICTURE
        WHERE HotelId = @Id;

        --! Xóa thông tin về các tiện nghi của phòng
        DELETE FROM ROOM_FACILITY
        WHERE HotelId = @Id;

        --! Xóa thông tin về các dịch vụ của phòng
        DELETE FROM ROOM_SERVICE
        WHERE HotelId = @Id;

        --! Xóa thông tin về các loại phòng
        DELETE FROM ROOM_TYPE
        WHERE HotelId = @Id;

        --! Xóa thông tin về khách sạn
        DELETE FROM HOTEL
        WHERE Id = @Id;

        COMMIT;
        SET @Result = 1; -- Trả về kết quả 1 khi xóa thành công
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SET @Result = 0; -- Trả về kết quả 0 khi xảy ra lỗi
    END CATCH;
END
GO


--
GO
CREATE OR ALTER FUNCTION USF_GetNextRoomId ( -- // new check
	@HotelId INT)
RETURNS INT
BEGIN
	declare @Result INT;
	with cte as (select Id id, lead(Id) over (order by Id) nextid from [dbo].[ROOM_TYPE] where HotelId = @HotelId)
	select @Result = Min(id) from cte where id < nextid - 1;

	if (@Result is null)
		select @Result = count(Id) from [dbo].[ROOM_TYPE] where HotelId = @HotelId

	return @Result + 1;
END;
GO

--// new check
CREATE OR ALTER PROCEDURE USP_AddRoomType
    @HotelId INT,
    @Name NVARCHAR(100),
    @Vacancy INT,
    @Size FLOAT,
    @Price FLOAT,
    @RoomInfo NVARCHAR(1000),
    @RoomView NVARCHAR(1000),
    @BedType VARCHAR(100)
AS
BEGIN
	IF NOT EXISTS (SELECT Id FROM HOTEL WHERE Id = @HotelId)
	BEGIN
		RAISERROR('Id khách sạn không tồn tại.', 11, 1)
		RETURN -2
	END

	BEGIN TRAN
    BEGIN TRY
		DECLARE @MyId INT = [dbo].USF_GetNextRoomId(@HotelId);

        INSERT INTO ROOM_TYPE (HotelId, Id, Name, Vacancy, Size, Price, RoomInfo, RoomView, BedType)
        VALUES (@HotelId, @MyId, @Name, @Vacancy, @Size, dbo.USF_GetServiceFee() + @Price, @RoomInfo, @RoomView, @BedType)

    END TRY

    BEGIN CATCH
		RAISERROR('Lỗi thêm phòng khách sạn.', 11, 1)
		ROLLBACK;
		RETURN -1
    END CATCH;

	COMMIT;
	RETURN @MyId
END
GO

--!Xóa loại phòng
CREATE OR ALTER PROCEDURE USP_DeleteRoomType
    @HotelId INT,
    @Id INT
AS
BEGIN

	BEGIN TRAN
    BEGIN TRY
        DELETE FROM ROOM_TYPE
        WHERE HotelId = @HotelId AND Id = @Id

    END TRY
    BEGIN CATCH
		RAISERROR('Lỗi xóa phòng khách sạn.', 11, 1)
		ROLLBACK;
        RETURN -1; -- thất bại
    END CATCH;
    
	COMMIT;
	RETURN 0; -- thành công
END
GO

--!Sửa thông tin loại phòng
CREATE OR ALTER PROCEDURE USP_UpdateRoomType
    @HotelId INT,
    @Id INT,
    @Name NVARCHAR(100),
    @Vacancy INT,
    @Size FLOAT,
    @Price FLOAT,
    @RoomInfo NVARCHAR(1000),
    @RoomView NVARCHAR(1000),
    @BedType VARCHAR(100)
AS
BEGIN
    --SET NOCOUNT ON;

    BEGIN TRY

        UPDATE ROOM_TYPE
        SET Name = @Name, Vacancy = @Vacancy, Size = @Size, Price = @Price, RoomInfo = @RoomInfo, RoomView = @RoomView, BedType = @BedType
        WHERE HotelId = @HotelId AND Id = @Id

        RETURN 0; -- thành công
	END TRY

    BEGIN CATCH
        RETURN -1; -- thất bại
    END CATCH;
END
GO

--todo PROCEDURE CRUD ẢNH PHÒNG
--! THÊM ẢNH
CREATE OR ALTER PROCEDURE USP_AddRoomPicture
    @HotelId INT,
    @RoomTypeId INT,
    @Id INT,
    @PictureLink VARCHAR(1000)
AS
BEGIN
	
	BEGIN TRAN
    BEGIN TRY
        -- Thêm ảnh phòng mới
        INSERT INTO ROOM_PICTURE (HotelId, RoomTypeId, Id, PictureLink)
        VALUES (@HotelId, @RoomTypeId, @Id, @PictureLink);
		
    END TRY

    BEGIN CATCH
		RAISERROR('Lỗi thêm ảnh phòng khách sạn.', 11, 1)
		ROLLBACK;
        RETURN -1;
    END CATCH;

	COMMIT;
	RETURN 0;
END
GO

--!SỬA ẢNH
CREATE OR ALTER PROCEDURE USP_UpdateRoomPicture
    @HotelId INT,
    @RoomTypeId INT,
    @Id INT,
    @PictureLink VARCHAR(1000)
AS
BEGIN
    --SET NOCOUNT ON;

    BEGIN TRY
        -- Cập nhật thông tin ảnh phòng
        UPDATE ROOM_PICTURE
        SET PictureLink = @PictureLink
        WHERE HotelId = @HotelId
        AND RoomTypeId = @RoomTypeId
        AND Id = @Id;

        RETURN 0; -- Trả về kết quả 1 khi cập nhật thành công
    END TRY
    BEGIN CATCH
        RETURN -1; -- Trả về kết quả 0 khi xảy ra lỗi
    END CATCH;
END
GO

--!XÓA ẢNH
CREATE OR ALTER PROCEDURE USP_DeleteRoomPicture
    @HotelId INT,
    @RoomTypeId INT,
    @Id INT
AS
BEGIN
    BEGIN TRY
        -- Xóa ảnh phòng
        DELETE FROM ROOM_PICTURE
        WHERE HotelId = @HotelId
        AND RoomTypeId = @RoomTypeId
        AND Id = @Id;

        RETURN 0; -- Trả về kết quả 1 khi xóa thành công
    END TRY
    BEGIN CATCH
        RETURN -1; -- Trả về kết quả 0 khi xảy ra lỗi
    END CATCH;
END
GO

--TODO PROCEDURE CRUD CƠ SỞ VẬT CHẤT PHÒNG
--! THÊM 

GO
CREATE OR ALTER PROCEDURE USP_AddRoomFacilityList ( -- // new check
    @HotelId INT,
    @RoomId INT,
    @Facility NVARCHAR(1000))
AS
BEGIN

	BEGIN TRAN
    BEGIN TRY
        INSERT INTO [dbo].[ROOM_FACILITY] (HotelId, RoomId, FacilityId)
		SELECT @HotelId, @RoomId, fc.Id  FROM STRING_SPLIT(@Facility, ',') ins
		JOIN FACILITY_CONST fc ON ins.value = fc.Value
        
    END TRY

    BEGIN CATCH
		RAISERROR('Lỗi thêm nhiều facility vào room_type', 11, 1)
		ROLLBACK;
        RETURN -1;
    END CATCH;

	COMMIT;
	RETURN 0;
END
GO

GO
CREATE OR ALTER PROCEDURE USP_AddRoomServiceList ( -- // new check
    @HotelId INT,
    @RoomId INT,
    @Service NVARCHAR(1000))
AS
BEGIN

	BEGIN TRAN
    BEGIN TRY
        INSERT INTO [dbo].[ROOM_SERVICE] (HotelId, RoomId, ServiceId)
		SELECT @HotelId, @RoomId, sc.Id  FROM STRING_SPLIT(@Service, ',') ins
		JOIN SERVICE_CONST sc ON ins.value = sc.Value
        
    END TRY

    BEGIN CATCH
		RAISERROR('Lỗi thêm nhiều service vào room_type', 11, 1)
		ROLLBACK;
        RETURN -1;
    END CATCH;

	COMMIT;
	RETURN 0;
END
GO

CREATE OR ALTER PROCEDURE USP_AddRoomFacility
    @HotelId INT,
    @RoomId INT,
    @FacilityId INT
AS
BEGIN
    --SET NOCOUNT ON;

    BEGIN TRY
        -- Thêm cơ sở vật chất phòng mới
        INSERT INTO ROOM_FACILITY (HotelId, RoomId, FacilityId)
        VALUES (@HotelId, @RoomId, @FacilityId);

        RETURN 0; -- Trả về kết quả 0 khi thêm thành công
    END TRY

    BEGIN CATCH
        RETURN -1; -- Trả về kết quả -1 khi xảy ra lỗi
    END CATCH;
END
GO

--!XÓA
CREATE OR ALTER PROCEDURE USP_DeleteRoomFacility
    @HotelId INT,
    @RoomId INT,
    @FacilityId INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
		IF NOT EXISTS (SELECT * FROM ROOM_FACILITY
			WHERE HotelId = @HotelId
			AND RoomId = @RoomId
			AND FacilityId = @FacilityId)
		BEGIN
			ROLLBACK;
			RETURN -1;
		END

        -- Xóa cơ sở vật chất phòng
        DELETE FROM ROOM_FACILITY
        WHERE HotelId = @HotelId
        AND RoomId = @RoomId
        AND FacilityId = @FacilityId;

        COMMIT;
        RETURN 0; -- Trả về kết quả 1 khi xóa thành công
    END TRY

    BEGIN CATCH
        ROLLBACK;
        RETURN -1; -- Trả về kết quả 0 khi xảy ra lỗi
    END CATCH;
END
GO

--!SỬA 
CREATE OR ALTER PROCEDURE USP_UpdateRoomFacility
    @HotelId INT,
    @RoomId INT,
    @FacilityId INT,
    @NewFacilityId INT,
    @Result INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Cập nhật cơ sở vật chất phòng
        UPDATE ROOM_FACILITY
        SET FacilityId = @NewFacilityId
        WHERE HotelId = @HotelId
        AND RoomId = @RoomId
        AND FacilityId = @FacilityId;

        COMMIT;
        SET @Result = 1; -- Trả về kết quả 1 khi cập nhật thành công
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SET @Result = 0; -- Trả về kết quả 0 khi xảy ra lỗi
    END CATCH;
END
GO

--TODO PROCEDURE CRUD DỊCH VỤ PHÒNG
--!THÊM
CREATE OR ALTER PROCEDURE USP_AddRoomService
    @HotelId INT,
    @RoomId INT,
    @ServiceId INT
AS
BEGIN
    --SET NOCOUNT ON;

    BEGIN TRY
        -- Thêm dịch vụ phòng mới
        INSERT INTO ROOM_SERVICE (HotelId, RoomId, ServiceId)
        VALUES (@HotelId, @RoomId, @ServiceId);

        RETURN 0; -- Trả về kết quả 1 khi thêm thành công
    END TRY
    BEGIN CATCH
        RETURN -1; -- Trả về kết quả 0 khi xảy ra lỗi
    END CATCH;
END
GO 

--!XÓA
CREATE OR ALTER PROCEDURE USP_DeleteRoomService
    @HotelId INT,
    @RoomId INT,
    @ServiceId INT,
    @Result INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Xóa dịch vụ phòng
        DELETE FROM ROOM_SERVICE
        WHERE HotelId = @HotelId
        AND RoomId = @RoomId
        AND ServiceId = @ServiceId;

        COMMIT;
        SET @Result = 1; -- Trả về kết quả 1 khi xóa thành công
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SET @Result = 0; -- Trả về kết quả 0 khi xảy ra lỗi
    END CATCH;
END
GO 

--!SỬA
CREATE OR ALTER PROCEDURE USP_UpdateRoomService
    @HotelId INT,
    @RoomId INT,
    @ServiceId INT,
    @NewServiceId INT,
    @Result INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Cập nhật dịch vụ phòng
        UPDATE ROOM_SERVICE
        SET ServiceId = @NewServiceId
        WHERE HotelId = @HotelId
        AND RoomId = @RoomId
        AND ServiceId = @ServiceId;

        COMMIT;
        SET @Result = 1; -- Trả về kết quả 1 khi cập nhật thành công
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SET @Result = 0; -- Trả về kết quả 0 khi xảy ra lỗi
    END CATCH;
END
GO

--TODO PROC CRUD REVIEW
--!THÊM
CREATE OR ALTER PROCEDURE USP_AddReview
    @AccountId INT,
    @HotelId INT,
    @Points FLOAT,
    @Content NVARCHAR(1000),
    @Result INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Thêm review mới
        INSERT INTO REVIEW (AccountId, HotelId, Points, Content)
        VALUES (@AccountId, @HotelId, @Points, @Content);

        COMMIT;
        SET @Result = 1; -- Trả về kết quả 1 khi thêm thành công
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SET @Result = 0; -- Trả về kết quả 0 khi xảy ra lỗi
    END CATCH;
END;
GO

--!XÓA
CREATE OR ALTER PROCEDURE USP_DeleteReview
    @AccountId INT,
    @HotelId INT,
    @Result INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Xóa review
        DELETE FROM REVIEW
        WHERE AccountId = @AccountId AND HotelId = @HotelId;

        COMMIT;
        SET @Result = 1; -- Trả về kết quả 1 khi xóa thành công
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SET @Result = 0; -- Trả về kết quả 0 khi xảy ra lỗi
    END CATCH;
END;
GO

--!SỬA
CREATE OR ALTER PROCEDURE USP_UpdateReview
    @AccountId INT,
    @HotelId INT,
    @Points FLOAT,
    @Content NVARCHAR(1000),
    @Result INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Cập nhật review
        UPDATE REVIEW
        SET Points = @Points, Content = @Content
        WHERE AccountId = @AccountId AND HotelId = @HotelId;

        COMMIT;
        SET @Result = 1; -- Trả về kết quả 1 khi cập nhật thành công
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SET @Result = 0; -- Trả về kết quả 0 khi xảy ra lỗi
        THROW; -- Ném lỗi để xử lý tại mức cao hơn
    END CATCH;
END;
GO

--TODO PROC CRUD ẢNH CỦA REVIEW
--!THÊM
CREATE OR ALTER PROCEDURE USP_AddReviewImage
    @ReviewId INT,
    @ImageLink VARCHAR(1000)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Thêm REVIEW_IMAGE mới
        INSERT INTO REVIEW_IMAGE (ReviewId, ImageLink)
        VALUES (@ReviewId , @ImageLink);

    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1; -- Trả về kết quả -1 khi xảy ra lỗi
    END CATCH;

	COMMIT;
    RETURN 0; -- Trả về kết quả 0 khi thêm thành công
END
GO

--!XÓA
CREATE OR ALTER PROCEDURE USP_DeleteReviewImage
    @ReviewId INT,
    @HotelId INT,
    @ImageId INT,
    @Result INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Xóa REVIEW_IMAGE
        DELETE FROM REVIEW_IMAGE
        WHERE ReviewId = @ReviewId;

    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1; -- Trả về kết quả -1 khi xảy ra lỗi
    END CATCH;

	COMMIT;
    RETURN 0; -- Trả về kết quả 0 khi thêm thành công
END
GO

--!SỬA
CREATE OR ALTER PROCEDURE USP_UpdateReviewImage
    @ReviewId INT,
    @HotelId INT,
    @ImageId INT,
    @NewImageLink VARCHAR(1000),
    @Result INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Cập nhật thông tin REVIEW_IMAGE
        UPDATE REVIEW_IMAGE
        SET ImageLink = @NewImageLink
        WHERE ReviewId = @ReviewId;

    END TRY
    
	BEGIN CATCH
        ROLLBACK;
        RETURN -1; -- Trả về kết quả -1 khi xảy ra lỗi
    END CATCH;

	COMMIT;
    RETURN 0; -- Trả về kết quả 0 khi thêm thành công
END
GO


-- VOUCHER -- // new check
CREATE OR ALTER PROCEDURE USP_AddVoucher
    @Name NVARCHAR(500),
    @Value FLOAT,
    @Point INT,
	@AccountRank VARCHAR(20),
	@Quantity INT
AS
BEGIN

	IF (@Point < 1) OR (@Value > 1 OR @Value <= 0 OR @Quantity <= 0)
	OR (@AccountRank not in (select RankName from POINT_RANK))
	BEGIN
		RAISERROR('Sai dữ liệu hạng hoặc giá trị voucher', 11, 1);
		RETURN -2;
	END

	BEGIN TRAN
	BEGIN TRY

		DECLARE @Id INT;
		EXEC @Id = USP_GetNextColumnId 'VOUCHER', 'VoucherId'

		INSERT INTO VOUCHER (VoucherId, Name, Value, Point, AccountRank, Quantity)
		VALUES (@Id, @Name, @Value, @Point, @AccountRank, @Quantity)
	END TRY

	BEGIN CATCH
		ROLLBACK;
		RAISERROR('Lỗi tạo voucher', 11, 1);
		RETURN -1; -- Thất bại
	END CATCH

	COMMIT;
	RETURN @Id;
END
GO

--! XÓA 
CREATE OR ALTER PROCEDURE USP_DeleteVoucher
    @VoucherId INT
AS
BEGIN
	BEGIN TRAN

	BEGIN TRY
		DELETE FROM VOUCHER
		WHERE VoucherId = @VoucherId
	END TRY

	BEGIN CATCH
		ROLLBACK;
		RAISERROR('Lỗi xóa voucher', 11, 1);
		RETURN -1; -- Thất bại
	END CATCH

	COMMIT;
	RETURN 0;
END
GO

--! SỬA
CREATE OR ALTER PROCEDURE USP_UpdateVoucher
    @VoucherId INT,
    @Name NVARCHAR(500),
    @Value FLOAT,
	@Point INT,
	@AccountRank VARCHAR(20),
	@Quantity INT
AS
BEGIN
	BEGIN TRAN

	BEGIN TRY
		UPDATE VOUCHER
		SET Name = @Name,
			Value = @Value,
			Point = @Point,
			AccountRank = @AccountRank,
			Quantity = @Quantity
		WHERE VoucherId = @VoucherId
	END TRY

	BEGIN CATCH
		ROLLBACK;
		RAISERROR('Lỗi cập nhật voucher', 11, 1);
		RETURN -1; -- Thất bại
	END CATCH

	COMMIT;
	RETURN 0;
END
GO

--!Mới 2.0

--!XÓA booking //
CREATE OR ALTER PROCEDURE USP_DeleteBooking
    @BookingId INT
AS
BEGIN
    BEGIN TRANSACTION;

	BEGIN TRY
		-- Xóa đơn đặt chỗ
		DELETE FROM BOOKING_ACCOUNT
		WHERE BookingId = @BookingId;
	END TRY

	BEGIN CATCH
		RAISERROR(N'Không thể xóa Booking.', 11, 1)
		ROLLBACK;
		RETURN -1;
	END CATCH

    COMMIT;
	RETURN 0;
END;
GO

--!sửa booking //
CREATE OR ALTER PROCEDURE USP_UpdateBooking
	@BookingId INT,
    @AccountId INTEGER,
    @HotelId INTEGER,
    @RoomTypeId INTEGER,
    @CheckIn DATE,
    @CheckOut DATE,
    @NumberOfRoom INTEGER
AS
BEGIN
    BEGIN TRY
        UPDATE BOOKING_ACCOUNT
        SET AccountId = @AccountId,
			HotelId = @HotelId,
			RoomTypeId = @RoomTypeId,
			CheckIn = @CheckIn,
            CheckOut = @CheckOut,
			NumberOfRoom = @NumberOfRoom
		WHERE BookingId = @BookingId;
    END TRY

    BEGIN CATCH
		RAISERROR(N'Cập nhật khách sạn thất bại.', 11, 1);
        RETURN -1; -- Gán giá trị trả về là -1 (thất bại)
    END CATCH

    RETURN 0;  -- Gán giá trị trả về là 0 (thành công)
END
GO

--TODO PROCE XEM LỊCH SỬ CÁC ĐƠN BOOKING CỦA TÀI KHOẢN //
CREATE OR ALTER PROCEDURE USP_ViewBookingHistory
    @AccountId INT
AS
BEGIN
    SELECT BA.*, OD.OrderId FROM BOOKING_ACCOUNT BA
	JOIN ORDER_DETAIL OD ON OD.BookingId = BA.BookingId
	JOIN ACCOUNT_ORDER AO ON AO.OrderId = OD.OrderId
    WHERE BA.AccountId = @AccountId AND (AO.Paid = 1);
END;
GO


CREATE OR ALTER PROCEDURE USP_GetAllUserOrder -- // 
	@AccountId INT
AS
BEGIN
	SELECT * FROM ACCOUNT_ORDER WHERE AccountId = @AccountId;
END
GO


CREATE OR ALTER PROCEDURE USP_GetAllVoucher
AS
BEGIN
	SELECT 0 as AccountId, vc.* FROM VOUCHER vc;
END
GO


CREATE OR ALTER PROCEDURE USP_GetVoucherById
	@VoucherId INT
AS
BEGIN
	SELECT * FROM VOUCHER WHERE VoucherId = @VoucherId;
END
GO

--! Update
GO
CREATE OR ALTER FUNCTION USF_GetVoucherByRank (@Rank VARCHAR(20))
RETURNS TABLE
AS
	RETURN SELECT * FROM VOUCHER 
		WHERE AccountRank IN (SELECT p2.RankName FROM POINT_RANK p1
						JOIN POINT_RANK p2 ON p1.RankValue >= p2.RankValue
						WHERE p1.RankName like (@Rank))
GO

-- // Check
CREATE OR ALTER PROCEDURE USP_GetUserVoucher
	@AccountId INT,
	@Rank VARCHAR(20) = null
AS
BEGIN
	IF (@Rank IS NULL)
	BEGIN
		SELECT vb.AccountId, vc.VoucherId, vc.Name, vc.Value, vc.Point, vc.AccountRank, vb.Quantity 
		FROM (SELECT * FROM VOUCHER_BAG WHERE AccountId = @AccountId) vb
		JOIN VOUCHER vc ON vb.VoucherId = vc.VoucherId;
	END
	ELSE
	BEGIN
		SELECT ISNULL(VB.AccountId, 0) as AccountId, VC.*, ISNULL(VB.Quantity, 0) as Quantity 
		FROM (SELECT VoucherId, Name, Value, Point, AccountRank FROM VOUCHER WHERE AccountRank like @Rank) VC
		LEFT JOIN (SELECT * FROM VOUCHER_BAG WHERE AccountId = @AccountId) VB ON VC.VoucherId = VB.VoucherId;
	END
END
GO

CREATE OR ALTER PROCEDURE USP_GetUserPointStatistic
	@AccountId INT
AS
BEGIN
	SELECT * FROM POINT_HISTORY WHERE AccountId = @AccountId;
END
GO

GO
CREATE OR ALTER FUNCTION USF_GetTotalPointSpent (@AccountId INT)
RETURNS INT
BEGIN
	DECLARE @TotalSpent INT;
	SELECT @TotalSpent = SUM(p.Value) FROM POINT_HISTORY p 
	WHERE p.Value > 0 AND p.AccountId = @AccountId;
	RETURN @TotalSpent;
END
GO

GO
CREATE OR ALTER FUNCTION USF_GetAccountRank (@AccountId INT)
RETURNS VARCHAR(20)
BEGIN
	DECLARE @Rank VARCHAR(20) = 'Bronze';

	SELECT TOP(1) @Rank = RankName from POINT_RANK 
	WHERE RankValue <= dbo.USF_GetTotalPointSpent(@AccountId)
	ORDER BY RankValue DESC;

	RETURN @Rank;
END
GO

GO
CREATE OR ALTER PROC USP_UpdateAccountRank (
	@AccountId INT)
AS
BEGIN
	DECLARE @Rank VARCHAR(20) = dbo.USF_GetAccountRank (@AccountId);
	
	BEGIN TRAN

	BEGIN TRY
		UPDATE ACCOUNT SET AccountRank = @Rank WHERE Id = @AccountId;
		UPDATE PERSONAL_DETAILS SET Rank = @Rank WHERE AccountId = @AccountId;
	END TRY

	BEGIN CATCH
		ROLLBACK;
		RAISERROR(N'Cập nhật hạng tài khoản thất bại.', 11, 1);
		RETURN -1;
	END CATCH
	
	COMMIT;
	RETURN 0;
END
GO

--TODO proc đổi điểm // Check --// WARNING
CREATE OR ALTER PROCEDURE USP_RedeemVoucher
    @AccountId INT,
    @VoucherId INT,
    @Number INT = 1,
	@DateRecorded VARCHAR(30)
AS
BEGIN
	DECLARE @VoucherValue INT;
	DECLARE @CurrentPoints INT;
	DECLARE @Quantity INT;
	
	-- Kiểm tra xem tài khoản và voucher có tồn tại không
	IF NOT EXISTS (SELECT TOP(1) Id FROM ACCOUNT WHERE Id = @AccountId)
		OR NOT EXISTS (SELECT TOP(1) VoucherId FROM VOUCHER WHERE VoucherId = @VoucherId)
	BEGIN
		RAISERROR(N'Tài khoản hoặc voucher không tồn tại', 11, 1)-- Trả về giá trị -1 nếu tài khoản hoặc voucher không tồn tại
		RETURN -2;
	END

	DECLARE @RankName VARCHAR(20);
	SELECT @RankName = AccountRank FROM VOUCHER WHERE VoucherId = @VoucherId;
	IF NOT (@RankName IN (SELECT p2.RankName FROM POINT_RANK p1
						JOIN POINT_RANK p2 ON p1.RankValue >= p2.RankValue
						WHERE p1.RankName like (SELECT TOP(1) AccountRank FROM ACCOUNT WHERE Id = @AccountId)))
	BEGIN
		RAISERROR(N'Tài khoản không đủ quyền đổi voucher này', 11, 1)
		RETURN -3;
	END

	-- Lấy giá trị voucher cần đổi và số điểm hiện tại của tài khoản
	SELECT @VoucherValue = Point FROM VOUCHER WHERE VoucherId = @VoucherId;
	SELECT @CurrentPoints = MemberPoint FROM ACCOUNT WHERE Id = @AccountId;

	IF (@DateRecorded IS NULL) SET @DateRecorded = FORMAT(GETDATE(), 'yyyy-MM-dd HH:mm:ss.fffffff');

	IF NOT EXISTS (SELECT * FROM VOUCHER WHERE VoucherId=@VoucherId AND Quantity > @Number)
	BEGIN
		RAISERROR(N'Số lượng voucher còn lại không đủ.', 11, 1)
		RETURN -4;
	END

	-- Kiểm tra xem tài khoản có đủ điểm để đổi voucher không
	IF (@CurrentPoints < (@VoucherValue * @Number))
	BEGIN
		RAISERROR(N'Tài khoản không đủ điểm để đổi voucher này', 11, 1)
		RETURN -5; -- Trả về giá trị -4 nếu tài khoản không đủ điểm để đổi voucher
	END
	ELSE
	BEGIN
		BEGIN TRAN -- Bắt đầu giao dịch
		--SET TRAN ISOLATION LEVEL READ COMMITTED;

		BEGIN TRY
			-- Cập nhật số lượng voucher trong túi voucher của tài khoản
			SELECT @Quantity = Quantity FROM VOUCHER_BAG WHERE AccountId = @AccountId AND VoucherId = @VoucherId;

			IF (@Quantity IS NULL)
				INSERT INTO VOUCHER_BAG (AccountId, VoucherId, Quantity) VALUES (@AccountId, @VoucherId, @Number);
			ELSE
				UPDATE VOUCHER_BAG SET Quantity = @Quantity + @Number WHERE AccountId = @AccountId AND VoucherId = @VoucherId;

			-- Cập nhật điểm của tài khoản
			UPDATE ACCOUNT SET MemberPoint = @CurrentPoints - (@VoucherValue * @Number) WHERE Id = @AccountId;
			UPDATE VOUCHER SET Quantity = Quantity - @Number WHERE VoucherId = @VoucherId;

			-- Lưu lịch sử sử dụng điểm vào bảng POINT_HISTORY
			INSERT INTO POINT_HISTORY (AccountId, Value, RecordedTime) VALUES (@AccountId, -(@VoucherValue * @Number), @DateRecorded);
		END TRY

		BEGIN CATCH
			RAISERROR(N'Đổi voucher thất bại', 11, 1)
			ROLLBACK;
			RETURN -1;
		END CATCH

		COMMIT TRANSACTION; -- Kết thúc giao dịch
		-- Trả về giá trị 0 để biểu thị thành công
		RETURN 0;
	END
END
GO

GO
--todo proc tính điểm từ giao dịch và lưu thay đổi điểm 
CREATE OR ALTER PROCEDURE USP_UpdateMemberPoints --// WARNING!!!!!!
    @AccountId INTEGER,
    @TotalPay INT,
	@DateRecorded VARCHAR(30),
    @ExchangeRate INT = 1
AS
BEGIN
	DECLARE @VietNamDongRate INT = 1000;
    
    BEGIN TRANSACTION; -- Bắt đầu giao dịch
	BEGIN TRY
		-- Tính điểm tích lũy từ giao dịch (tỉ lệ [điểm] = [giá trị total] * @ExangeRate(%) )
		DECLARE @EarnedPoints FLOAT = @TotalPay * @ExchangeRate / 100 / @VietNamDongRate;

		-- Cộng điểm tích lũy từ giao dịch vào tài khoản
		UPDATE ACCOUNT SET MemberPoint = MemberPoint + CAST(@EarnedPoints as INT) WHERE Id = @AccountId;

		-- Ghi lại lịch sử điểm vào bảng POINT_HISTORY
		INSERT INTO POINT_HISTORY (AccountId, Value, RecordedTime) VALUES (@AccountId, @EarnedPoints, @DateRecorded);
	END TRY

	BEGIN CATCH
		RAISERROR(N'Lỗi tính điểm.', 11, 1);
		ROLLBACK; -- Xảy ra lỗi, rollback giao dịch
		RETURN -1; -- Gán giá trị trả về là -1 nếu thất bại
	END CATCH
		
	COMMIT TRANSACTION; -- Kết thúc giao dịch
	RETURN 0; -- Gán giá trị trả về là 0 nếu quá trình thành công
END
GO

-- //
GO
CREATE OR ALTER FUNCTION USF_GetRoomAvailability (
    @HotelId INTEGER,
    @RoomTypeId INTEGER,
	@CheckIn DATE,
	@CheckOut DATE)
RETURNS INT
BEGIN
	DECLARE @Vacancy INT;
	SELECT @Vacancy = Vacancy FROM ROOM_TYPE WHERE HotelId = @HotelId AND Id = @RoomTypeId;

	DECLARE @BookedRoom INT;
	SELECT @BookedRoom = ISNULL(SUM(NumberOfRoom), 0) FROM BOOKING_ACCOUNT 
	WHERE HotelId = @HotelId AND RoomTypeId = @RoomTypeId
	AND NOT (DATEDIFF(DAY, CheckOut, GETDATE()) > 0)
	AND NOT ((DATEDIFF(DAY, @CheckIn, CheckIn) >= DATEDIFF(DAY, @CheckIn, @CheckOut))
	OR (-DATEDIFF(DAY, @CheckIn, CheckIn) >= DATEDIFF(DAY, CheckIn, CheckOut)));

	DECLARE @SpareRoom INT = @Vacancy - @BookedRoom;

	RETURN @SpareRoom;
END
GO


-- //
GO
CREATE OR ALTER FUNCTION USF_CheckRoomAvailability (
    @HotelId INTEGER,
    @RoomTypeId INTEGER,
	@NumberOfRoom INTEGER,
	@CheckIn DATE,
	@CheckOut DATE)
RETURNS BIT
BEGIN
	DECLARE @Vacancy INT;
	SELECT @Vacancy = Vacancy FROM ROOM_TYPE WHERE HotelId = @HotelId AND Id = @RoomTypeId;

	IF (@NumberOfRoom > @Vacancy OR @NumberOfRoom < 0)
		RETURN 0;

	DECLARE @SpareRoom INT = dbo.USF_GetRoomAvailability(@HotelId, @RoomTypeId, @CheckIn, @CheckOut);

	IF (@SpareRoom < @NumberOfRoom)
		RETURN 0;
	RETURN 1;
END
GO


-- //
GO
CREATE OR ALTER PROC USP_GetRoomWithAvailableNum
	@HotelId INTEGER,
	@CheckIn DATE,
	@CheckOut DATE
AS
	SELECT RT.HotelId, RT.Id, RT.Name, 
		dbo.USF_GetRoomAvailability(@HotelId, RT.Id, @CheckIn, @CheckOut) as Vacancy,
		RT.Size, RT.Price, RT.RoomInfo, RT.RoomView, RT.BedType
		FROM ROOM_TYPE RT
	WHERE RT.HotelId = @HotelId
GO



GO
CREATE OR ALTER FUNCTION USF_CheckHotelAvailability ( -- //new check
    @HotelId INTEGER,
	@NumberOfRoom INTEGER,
	@CheckIn DATE,
	@CheckOut DATE)
RETURNS BIT
BEGIN
	IF (1 IN (SELECT dbo.USF_CheckRoomAvailability(@HotelId, Id, @NumberOfRoom, @CheckIn, @CheckOut) val FROM ROOM_TYPE WHERE HotelId = @HotelId))
		RETURN 1
	RETURN 0
END
GO

GO
CREATE OR ALTER FUNCTION USF_CheckHotelFacility ( -- //new check
    @HotelId INTEGER,
	@CheckValue VARCHAR(1000) = null)
RETURNS BIT
BEGIN
	IF (@CheckValue IS NULL) RETURN 1
	DECLARE @Count INT;
	SELECT @Count = COUNT(value) FROM STRING_SPLIT(@CheckValue, ',');

	IF @Count IN (SELECT COUNT(rf.RoomId) FROM ROOM_FACILITY rf
		JOIN FACILITY_CONST fc ON rf.FacilityId = fc.Id
		WHERE HotelId = @HotelId
		AND fc.Value IN (SELECT value FROM STRING_SPLIT(@CheckValue, ','))
		GROUP BY RoomId)
		RETURN 1
	RETURN 0
END
GO


GO
CREATE OR ALTER FUNCTION USF_CheckHotelService ( -- //new check
    @HotelId INTEGER,
	@CheckValue VARCHAR(1000) = null)
RETURNS BIT
BEGIN
	IF (@CheckValue IS NULL) RETURN 1
	DECLARE @Count INT;
	SELECT @Count = COUNT(value) FROM STRING_SPLIT(@CheckValue, ',');

	IF @Count IN (SELECT COUNT(rs.RoomId) FROM ROOM_SERVICE rs
		JOIN SERVICE_CONST rc ON rs.ServiceId = rc.Id
		WHERE HotelId = @HotelId
		AND rc.Value IN (SELECT value FROM STRING_SPLIT(@CheckValue, ','))
		GROUP BY RoomId)
		RETURN 1
	RETURN 0
END
GO


GO
CREATE OR ALTER PROC USP_FindHotelByName (-- //new check
	-- Search
	@Location NVARCHAR(100) = N'',
	@RoomType NVARCHAR(100) = N'',
	@StartDate DATE = '01-01-2022',
	@EndDate DATE = '01-02-2022',
	@MinBudget float = 1,
	@MaxBudget float = 10000000000.0,
	@Rooms int = 1,
	@Adult int = 1,
	@Children int = 0,
	-- Filter
	@HotelType VARCHAR(500) = null,
	@BedType VARCHAR(100) = null,
	@GuestRating INT = 0,
	@Facilities VARCHAR(1000) = null,
	@Service VARCHAR(100) = null,
	@SortingCol VARCHAR(50) = 'Rating',
	@SortType VARCHAR(5) = 'DESC')
AS
BEGIN
	SELECT hoteTable.* from (SELECT distinct h.Id, h.Name, Country, HotelType, ProvinceCity, 
			Address, Stars,
			dbo.USF_GetAvgReview(h.Id) as Rating,
			Description, Image,
			dbo.USF_GetMinRoomPrice(h.Id) as Price
	FROM HOTEL h inner join ROOM_TYPE rt on h.Id = rt.HotelId
	WHERE (h.ProvinceCity COLLATE Latin1_General_CI_AI like '%' + @Location + '%' COLLATE Latin1_General_CI_AI or
		  h.Country COLLATE Latin1_General_CI_AI like '%' + @Location + '%' COLLATE Latin1_General_CI_AI or
	      h.Name COLLATE Latin1_General_CI_AI like '%' + @Location + '%' COLLATE Latin1_General_CI_AI) and
		  dbo.USF_GetMinRoomPrice(h.Id) <= @MaxBudget and 
		  dbo.USF_GetMinRoomPrice(h.Id) >= @MinBudget and
		  rt.Name COLLATE SQL_Latin1_General_CP1_CI_AI like '%' + @RoomType + '%' COLLATE SQL_Latin1_General_CP1_CI_AI and
	      dbo.USF_CheckHotelAvailability(h.Id, @Rooms, @StartDate, @EndDate) = 1
		  AND (h.HotelType IN (SELECT value FROM STRING_SPLIT(@HotelType, ',')) OR @HotelType IS NULL)
		  AND (rt.BedType IN (SELECT value FROM STRING_SPLIT(@BedType, ',')) OR @BedType IS NULL)
		  AND dbo.USF_GetAvgReview(h.Id) >= @GuestRating
		  AND dbo.USF_CheckHotelFacility(h.Id, @Facilities) = 1
		  AND dbo.USF_CheckHotelService(h.Id, @Service) = 1
		  ) hoteTable 
	ORDER BY 
		CASE WHEN @SortingCol = 'Rating' THEN Rating END DESC,
		CASE WHEN @SortingCol = 'Price' AND @SortType ='ASC' THEN Price END ,
		CASE WHEN @SortingCol = 'Price' AND @SortType ='DESC' THEN Price END DESC
END
GO


GO
CREATE OR ALTER PROC USP_FindAccountByName (-- //new check
	-- Search
	@Name NVARCHAR(200) = N'',
	-- Filter
	@Role NVARCHAR(500) = NULL,
	@Gender NVARCHAR(200) = NULL,
	-- sort
	@SortingCol VARCHAR(50) = 'FullName',
	@SortType VARCHAR(5) = 'ASC')
AS
BEGIN
	SELECT * 
	FROM ACCOUNT acc JOIN PERSONAL_DETAILS pd ON acc.Id = pd.AccountId
	JOIN POINT_RANK pr ON pd.Rank = pr.RankName
	WHERE (pd.FullName COLLATE Latin1_General_CI_AI like '%' + @Name + '%' COLLATE Latin1_General_CI_AI OR
		  pd.EmailAddress COLLATE Latin1_General_CI_AI like '%' + @Name + '%' COLLATE Latin1_General_CI_AI) 
		  AND (acc.UserRole IN (SELECT value FROM STRING_SPLIT(@Role, ',')) OR @Role IS NULL)
		  AND (pd.Gender IN (SELECT value FROM STRING_SPLIT(@Gender, ',')) OR @Gender IS NULL)
	ORDER BY 
		CASE WHEN @SortingCol = 'FullName' AND @SortType ='ASC' THEN pd.FullName END,
		CASE WHEN @SortingCol = 'FullName' AND @SortType ='DESC' THEN pd.FullName END DESC,
		CASE WHEN @SortingCol = 'DateOfBirth' AND @SortType ='ASC' THEN pd.DateOfBirth END,
		CASE WHEN @SortingCol = 'DateOfBirth' AND @SortType ='DESC' THEN pd.DateOfBirth END DESC,
		CASE WHEN @SortingCol = 'Rank' AND @SortType ='ASC' THEN pr.RankValue END,
		CASE WHEN @SortingCol = 'Rank' AND @SortType ='DESC' THEN pr.RankValue END DESC
END
GO

--! thêm booking //
CREATE OR ALTER PROCEDURE USP_AddBooking
    @AccountId INTEGER,
    @HotelId INTEGER,
    @RoomTypeId INTEGER,
    @CheckIn DATE,
    @CheckOut DATE,
    @NumberOfRoom INTEGER
AS
BEGIN

	BEGIN TRAN
	BEGIN TRY
	
		DECLARE @BookingId INT;
		EXEC @BookingId = USP_GetNextColumnId 'BOOKING_ACCOUNT', 'BookingId'

		INSERT INTO BOOKING_ACCOUNT (BookingId, AccountId, HotelId, RoomTypeId, CheckIn, CheckOut, NumberOfRoom)
		VALUES (@BookingId, @AccountId, @HotelId, @RoomTypeId, @CheckIn, @CheckOut, @NumberOfRoom);
	END TRY

	BEGIN CATCH
		RAISERROR(N'Thêm đơn đặt phòng thất bại', 11, 1);
		ROLLBACK;
		RETURN -1; -- (thất bại)
	END CATCH

	COMMIT TRAN;
	RETURN @BookingId; -- (thành công)
END
GO


GO --//new check
CREATE OR ALTER FUNCTION USF_CheckAccountOrder (
    @AccountId INT,
    @CheckAccountId INT,
	@HotelId INT)
RETURNS BIT
BEGIN
	DECLARE @UserRole VARCHAR(50);
	SELECT @UserRole = UserRole FROM ACCOUNT WHERE Id = @AccountId;

	IF (@UserRole = 'Admin')
		RETURN 1;
	ELSE IF (@UserRole = 'User')
	BEGIN
		RETURN CASE WHEN @AccountId = @CheckAccountId THEN 1 ELSE 0 END;
	END

	DECLARE @AccHotel INT = 0;
	SELECT @AccHotel = CASE WHEN @HotelId = pd.HotelId THEN 1 ELSE 0 END 
	FROM PERSONAL_DETAILS pd WHERE AccountId = @AccountId;

	RETURN @AccHotel;
END;
GO

-- //
GO
CREATE OR ALTER PROC USP_GetAllAccountOrder (
	@AccountId INT)
AS
BEGIN
	SELECT BA.RoomTypeId, BA.HotelId, H.Name as HotelName, H.Country, H.HotelType, H.ProvinceCity, H.Address, H.Stars, H.Rating, H.Image,
			AO.OrderId, AO.AccountId, AO.FullName, AO.Nation, AO.DateOfBirth, 
			AO.Email, AO.PhoneNumber, AO.SpecialNeeds, AO.Notes, AO.VoucherId, 
			AO.Total, AO.Paid, BA.CheckIn, BA.CheckOut, BA.NumberOfRoom, 
			RT.Name as RoomName, RT.Vacancy, RT.RoomInfo, RT.RoomView, RT.BedType
	FROM ACCOUNT_ORDER AO LEFT JOIN ORDER_DETAIL OD ON AO.OrderId = OD.OrderId
							LEFT JOIN BOOKING_ACCOUNT BA ON BA.BookingId = OD.BookingId
							LEFT JOIN HOTEL H ON H.Id = BA.HotelId
							LEFT JOIN ROOM_TYPE RT ON RT.Id = BA.RoomTypeId and RT.HotelId = BA.HotelId
	WHERE dbo.USF_CheckAccountOrder(@AccountId, AO.AccountId, BA.HotelId) = 1;
END
GO


-- //
GO
CREATE OR ALTER PROC USP_GetUnconfirmOrder (
	@AccountId INT)
AS
	SELECT * FROM ACCOUNT_ORDER AO WHERE AO.AccountId = @AccountId AND (Paid = 0);
GO

GO
CREATE OR ALTER PROC USP_GetOrderHistory (
	@AccountId INT)
AS
	SELECT * FROM ACCOUNT_ORDER AO WHERE AO.AccountId = @AccountId AND (Paid = 1);
GO

-- //
GO
CREATE OR ALTER PROC USP_AddEmptyOrder (
	@AccountId INT)
AS
BEGIN
	BEGIN TRAN

	BEGIN TRY
		DECLARE @OrderId INT;
		EXEC @OrderId = USP_GetNextColumnId 'ACCOUNT_ORDER', 'OrderId ';

		INSERT INTO ACCOUNT_ORDER (OrderId, AccountId, FullName, Nation, DateOfBirth, Email, PhoneNumber, SpecialNeeds, Notes, VoucherId, Total, Paid, CreatedAt) VALUES 
			(@OrderId, @AccountId, N'default', N'default', '01-01-2000', 'default', 'default', 'default', 'default', 0, 0, 0, GETDATE());
	END TRY

	BEGIN CATCH
		RAISERROR(N'Tạo đơn thất bại.', 11, 1);
		ROLLBACK;
		RETURN -1;
	END CATCH

	COMMIT;
	RETURN @OrderId;
END;
GO
-- //
GO
CREATE OR ALTER PROC USP_AddFullOrder (
	@AccountId INT,
	@FullName NVARCHAR(200), -- Thông tin thêm
	@Nation NVARCHAR(50),
	@DateOfBirth DATE,
	@Email VARCHAR(200),
	@PhoneNumber VARCHAR(20),
	@SpecialNeeds NVARCHAR(500),
	@Notes NVARCHAR(500),
	@Total INT,
	@DateRecorded VARCHAR(30),
	@SessionId VARCHAR(200)
)
AS
BEGIN
	BEGIN TRAN

	BEGIN TRY
		DECLARE @OrderId INT;
		EXEC @OrderId = USP_GetNextColumnId 'ACCOUNT_ORDER', 'OrderId ';

		IF (@DateRecorded IS NULL) SET @DateRecorded = FORMAT(GETDATE(), 'yyyy-MM-dd HH:mm:ss.fffffff');

		INSERT INTO ACCOUNT_ORDER (OrderId, AccountId, FullName, Nation, DateOfBirth, Email, PhoneNumber, SpecialNeeds, Notes, VoucherId, Total, Paid, CreatedAt, SessionId) VALUES 
			(@OrderId, @AccountId, @FullName, @Nation, @DateOfBirth, @Email, @PhoneNumber, @SpecialNeeds, @Notes, 0, @Total, 0, @DateRecorded, @SessionId);
	END TRY

	BEGIN CATCH
		RAISERROR(N'Tạo đơn thất bại.', 11, 1);
		ROLLBACK;
		RETURN -1;
	END CATCH

	COMMIT;
	RETURN @OrderId;
END;
GO

-- //
GO
CREATE OR ALTER PROC USP_AddBookingToOrder (
	@AccountId INT,
	@BookingId INT)
AS
BEGIN
	BEGIN TRAN

	BEGIN TRY
		
		DECLARE @OrderId INT;
		SELECT @OrderId = OrderId FROM ACCOUNT_ORDER AO WHERE AO.AccountId = @AccountId AND (Paid = 0)
		IF (@OrderId IS NULL)
			EXEC @OrderId = USP_AddEmptyOrder @AccountId;

		IF NOT EXISTS (SELECT * FROM ORDER_DETAIL WHERE OrderId = @OrderId AND BookingId = @BookingId)
			INSERT INTO ORDER_DETAIL (OrderId, BookingId) VALUES (@OrderId, @BookingId);
	END TRY

	BEGIN CATCH
		RAISERROR(N'Thêm lịch đặt khách sạn vào đơn thất bại.', 11, 1);
		ROLLBACK;
		RETURN -1;
	END CATCH

	COMMIT;
	RETURN @OrderId;
END;
GO

-- //
GO
CREATE OR ALTER PROC USP_AddBookingByOrderId (
	@OrderId INT,
	@BookingId INT)
AS
BEGIN
	BEGIN TRAN

	BEGIN TRY

		IF NOT EXISTS (SELECT * FROM ORDER_DETAIL WHERE OrderId = @OrderId AND BookingId = @BookingId)
			INSERT INTO ORDER_DETAIL (OrderId, BookingId) VALUES (@OrderId, @BookingId);
	END TRY

	BEGIN CATCH
		RAISERROR(N'Thêm lịch đặt khách sạn vào đơn thất bại.', 11, 1);
		ROLLBACK;
		RETURN -1;
	END CATCH

	COMMIT;
	RETURN 1;
END;
GO

-- //
GO
CREATE OR ALTER FUNCTION USF_GetCartItem (@AccountId INT) -- CartItem
RETURNS TABLE
AS
RETURN
	SELECT BA.* FROM BOOKING_ACCOUNT BA 
	JOIN ORDER_DETAIL OD ON OD.BookingId = BA.BookingId
	JOIN ACCOUNT_ORDER AO ON AO.OrderId = OD.OrderId
	WHERE AO.AccountId = @AccountId AND (AO.Paid = 0);
GO


-- // check
GO
CREATE OR ALTER FUNCTION USF_GetBookingTotalById (@BookingId INT)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT = 0;
	SELECT @Result = (RT.Price) * BA.NumberOfRoom 
	FROM (SELECT * FROM BOOKING_ACCOUNT WHERE BookingId = @BookingId) BA 
	JOIN ROOM_TYPE RT ON RT.HotelId = BA.HotelId AND RT.Id = BA.RoomTypeId;

	RETURN @Result;
END
GO


-- //
GO
CREATE OR ALTER FUNCTION USF_GetOrderTotal (@OrderId INT)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT = 0;
	SELECT @Result = SUM(dbo.USF_GetBookingTotalById(OD.BookingId)) FROM ORDER_DETAIL OD
	WHERE OD.OrderId = @OrderId;

	RETURN @Result;
END
GO

-- //
GO
CREATE OR ALTER PROC USP_UpdateVoucherAndTotal
	@OrderId INT,
	@AccountId INT,
	@VoucherId INTEGER,
	@MultipleConfirm BIT = 0,
	@DateRecorded VARCHAR(30)
AS
BEGIN
	IF (@OrderId IS NULL OR @OrderId <= 0)
	BEGIN
		SELECT @OrderId = OrderId FROM ACCOUNT_ORDER WHERE AccountId = @AccountId AND Paid = 0
		ORDER BY CreatedAt DESC
		IF (@OrderId IS NULL) RETURN -1;
	END

	IF NOT EXISTS (SELECT OrderId FROM ACCOUNT_ORDER WHERE OrderId = @OrderId AND AccountId = @AccountId)
	BEGIN
		RAISERROR(N'Tài khoản không tồn tại đơn đặt hàng.', 11, 1);
		RETURN -1;
	END

	IF ((SELECT TOP(1) Paid FROM ACCOUNT_ORDER WHERE OrderId = @OrderId) = 1)
	BEGIN
		RAISERROR(N'Đơn đặt hàng đã được xác nhận.', 11, 1);
		RETURN -1;
	END

	DECLARE @Quantity INT;
	-- Kiểm tra số lượng voucher trong túi.
	IF (@VoucherId IS NOT NULL AND @VoucherId > 0)
	BEGIN
		SELECT @Quantity = Quantity FROM VOUCHER_BAG WHERE AccountId = @AccountId AND VoucherId = @VoucherId;
		IF (@Quantity IS NULL)
		BEGIN
			RAISERROR(N'Số lượng voucher trong túi không hợp lệ.', 11, 1);
			RETURN -1;
		END
	END

	BEGIN TRAN
	--SET TRAN ISOLATION LEVEL SERIALIZABLE

	BEGIN TRY
		DECLARE @Discount FLOAT = 0;
		SELECT @Discount = Value FROM VOUCHER WHERE VoucherId = @VoucherId;
		DECLARE @Total INT = dbo.USF_GetOrderTotal(@OrderId);

		IF ((@VoucherId IS NOT NULL OR @MultipleConfirm = 0) AND @VoucherId > 0)
		BEGIN
			-- Giảm số lượng voucher trong túi.
			IF (@Quantity = 1)
				DELETE FROM VOUCHER_BAG WHERE AccountId = @AccountId AND VoucherId = @VoucherId;
			ELSE
				UPDATE VOUCHER_BAG SET Quantity = @Quantity - 1 WHERE AccountId = @AccountId AND VoucherId = @VoucherId;
		END

		UPDATE ACCOUNT_ORDER
		SET
			VoucherId = @VoucherId,
			Total = @Total - CAST(@Total * @Discount AS FLOAT),
			Paid = 0
		WHERE OrderId = @OrderId;

		-- Cập nhật điểm thành viên.
		EXEC USP_UpdateMemberPoints @AccountId, @Total, @DateRecorded;
	END TRY

	BEGIN CATCH
		RAISERROR(N'Thanh toán đơn hàng thất bại', 11, 1);
		ROLLBACK;
		RETURN -1;
	END CATCH

	COMMIT;
	RETURN 0;
END;
GO

GO
CREATE OR ALTER PROCEDURE USP_ConfirmPaid (@SessionId VARCHAR(200))
AS
BEGIN
	UPDATE ACCOUNT_ORDER
		SET
			Paid = 1
	WHERE SessionId = @SessionId;
END
GO


CREATE OR ALTER FUNCTION USF_GetAccountId (@Email VARCHAR(50))
RETURNS INT
BEGIN
	DECLARE @Id INT;
	SELECT @Id = Id FROM ACCOUNT WHERE Email = @Email;
	RETURN @Id;
END

-- //
GO
CREATE OR ALTER PROC USP_GetCartItem (
	@AccountId INT)
AS
	SELECT * FROM dbo.USF_GetCartItem(@AccountId);
GO

-- //
GO
CREATE OR ALTER PROC USP_GetOrderItem (
	@OrderId INT)
AS
	SELECT AO.OrderId, BA.* FROM BOOKING_ACCOUNT BA 
	JOIN ORDER_DETAIL OD ON BA.BookingId = OD.BookingId
	JOIN (SELECT * FROM ACCOUNT_ORDER WHERE OrderId = @OrderId) AO ON AO.OrderId = OD.OrderId;
GO

-- 
GO
CREATE OR ALTER PROC USP_GetAccountDetailById
	@AccountId INTEGER
AS
	SELECT pd.*, acc.MemberPoint as Point, acc.UserRole as Role
	FROM (SELECT * FROM PERSONAL_DETAILS WHERE AccountId = @AccountId) pd
	JOIN ACCOUNT acc on pd.AccountId = acc.Id;
GO

--! proc lấy thông tin chi tiết tài khoản // Check
CREATE OR ALTER PROC USP_GetAccountDetailByEmail
	@Email NVARCHAR(200)
AS
	SELECT pd.*, acc.MemberPoint as Point, acc.UserRole as Role
	FROM (SELECT * FROM PERSONAL_DETAILS WHERE EmailAddress = @Email) pd
	JOIN ACCOUNT acc on pd.AccountId = acc.Id;
GO

-- // new check
GO
CREATE OR ALTER FUNCTION USF_CalculateHotelRevenueByMonth (
    @HotelId INT,
    @Year INT,
    @Month INT)
RETURNS BIGINT
BEGIN
	DECLARE @TotalRevenue BIGINT = 0;
	DECLARE @Fee INT = 50000;

    DECLARE @StartDate DATE = CAST(STR(@Month) + '-01-' + STR(@Year) as date);
	DECLARE @EndDate DATE = EOMONTH(@StartDate);

    SELECT @TotalRevenue += (rt.Price - @Fee) * ba.NumberOfRoom
	FROM (SELECT * FROM ACCOUNT_ORDER WHERE 
		DATEDIFF(DAY, @StartDate, CreatedAt) >= 0 AND 
		DATEDIFF(DAY, CreatedAt, @EndDate) >= 0) ao 
	JOIN ORDER_DETAIL od ON ao.OrderId = od.OrderId
	JOIN (SELECT BookingId, NumberOfRoom, RoomTypeId FROM BOOKING_ACCOUNT WHERE HotelId = @HotelId) ba ON ba.BookingId = od.BookingId
	JOIN (SELECT Id, Price FROM ROOM_TYPE WHERE HotelId = @HotelId) rt ON rt.Id = ba.RoomTypeId

	RETURN @TotalRevenue;
END;
GO

-- // new check
GO
CREATE OR ALTER PROCEDURE USP_CalculateHotelYearlyRevenue (
    @HotelId INT,
    @Year INT = null)
AS
BEGIN
	IF (@Year IS NULL) SET @Year = CAST(YEAR(GETDATE()) AS INT);

	DECLARE @table TABLE(Months INT);
	INSERT INTO @table (Months) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);

	SELECT Months, 
		dbo.USF_CalculateHotelRevenueByMonth(@HotelId, @Year, Months) AS ThisYear,
		dbo.USF_CalculateHotelRevenueByMonth(@HotelId, @Year - 1, Months) AS LastYear
	FROM @table;
END
GO


GO -- // new check 2
CREATE OR ALTER FUNCTION USP_CalculateHotelOneDayRevenue (
    @HotelId INT,
    @Date DATE = NULL)
RETURNS BIGINT
BEGIN
	IF (@Date IS NULL) SET @Date = GETDATE();

	DECLARE @TotalRevenue BIGINT = 0;
	DECLARE @Fee INT = 50000;

	SELECT @TotalRevenue += (rt.Price - @Fee) * ba.NumberOfRoom
	FROM (SELECT * FROM ACCOUNT_ORDER WHERE DATEDIFF(DAY, @Date, CreatedAt) = 0) ao 
	JOIN ORDER_DETAIL od ON ao.OrderId = od.OrderId
	JOIN (SELECT BookingId, NumberOfRoom, RoomTypeId FROM BOOKING_ACCOUNT WHERE HotelId = @HotelId) ba ON ba.BookingId = od.BookingId
	JOIN (SELECT Id, Price FROM ROOM_TYPE WHERE HotelId = @HotelId) rt ON rt.Id = ba.RoomTypeId;

	RETURN @TotalRevenue;
END
GO


GO -- // new check 2
CREATE OR ALTER PROCEDURE USP_CalculateHotelWeeklyRevenue (
    @HotelId INT,
    @Date DATE = NULL)
AS
BEGIN
	DECLARE @Table TABLE (dayInWeek INT)
	INSERT INTO @Table VALUES (1),(2),(3),(4),(5),(6),(7);

	IF (@Date IS NULL) SET @Date = GETDATE();
	DECLARE @StartDate DATE = DATEADD(DAY, 1 - DATEPART(WEEKDAY, @Date), @Date); -- Sunday the week before

	select DayInWeek,
		dbo.USP_CalculateHotelOneDayRevenue(@HotelId, DATEADD(DAY, DayInWeek, @StartDate)) as ThisWeek,
		dbo.USP_CalculateHotelOneDayRevenue(@HotelId, DATEADD(DAY, DayInWeek - 7, @StartDate)) as LastWeek
	from @Table
END
GO


GO -- // new check 2
CREATE OR ALTER PROCEDURE USP_GetHotelWeeklyReview (
    @HotelId INT,
    @Date DATE = NULL)
AS
BEGIN
	IF (@Date IS NULL) SET @Date = GETDATE();
	DECLARE @StartDate DATE = DATEADD(DAY, 2 - DATEPART(WEEKDAY, @Date), @Date); -- Sunday the week before
	DECLARE @EndDate DATE = DATEADD(DAY, 6, @StartDate); -- Sunday this week

	SELECT COUNT(ReviewId) FROM REVIEW WHERE 
	HotelId = @HotelId AND
	DATEDIFF(DAY, @StartDate, ReviewDate) >= 0 AND
	DATEDIFF(DAY, ReviewDate, @EndDate) >= 0;
END
GO


GO -- // new check 2
CREATE OR ALTER PROCEDURE USP_GetHotelWeeklyOrder (
    @HotelId INT,
    @Date DATE = NULL)
AS
BEGIN
	IF (@Date IS NULL) SET @Date = GETDATE();
	DECLARE @StartDate DATE = DATEADD(DAY, 2 - DATEPART(WEEKDAY, @Date), @Date); -- Sunday the week before
	DECLARE @EndDate DATE = DATEADD(DAY, 6, @StartDate); -- Sunday this week

	SELECT COUNT(ao.OrderId) FROM (SELECT * FROM BOOKING_ACCOUNT WHERE HotelId = @HotelId) ba
	JOIN ORDER_DETAIL od ON od.BookingId = ba.BookingId
	JOIN ACCOUNT_ORDER ao ON od.OrderId = ao.OrderId
	WHERE DATEDIFF(DAY, @StartDate, ao.CreatedAt) >= 0 AND DATEDIFF(DAY, ao.CreatedAt, @EndDate) >= 0;

	SELECT @StartDate, @EndDate;
END
GO

-- // check --

--! Func tính điểm input tổng số tiền và số thứ tự của đơn đặt phòng
CREATE OR ALTER FUNCTION USF_CaculateBonusPoint(@Total INT, @Times INT)
RETURNS INT
BEGIN
	DECLARE @Point INT = 0;
	IF @Times >= 15 AND @Times < 50
	SET @Point = @Total * 0.01 / 1000;
	ELSE IF @Times > 50
	SET @Point = @Total * 0.02 / 1000;
	RETURN @Point;
END

GO
--! Proc tính diểm thành viên dựa trên số lần đặt cùng một loại phòng của khách sạn.
CREATE OR ALTER PROC USP_GetBookingLengthBonusPoint (
	@AccountId INT,
	@BookingId INT,
	@HotelId INT)
AS
	DECLARE @Total INT = dbo.USF_GetBookingTotalById(@BookingId);

	DECLARE @Times INT = (SELECT COUNT(BA.BookingId) FROM BOOKING_ACCOUNT BA 
		WHERE BA.AccountId = @AccountId AND BA.HotelId = @HotelId);

	DECLARE @Point INT
	EXECUTE @Point = dbo.USF_CaculateBonusPoint @Total, @Times;
	RETURN @Point
	
GO


--!proc tính doanh thu khách sạn theo quý
GO
CREATE OR ALTER PROCEDURE CalculateHotelRevenueByQuarter
    @Year INT,
    @Quarter INT,
    @HotelId INT,
    @TotalRevenue INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StartDate DATE, @EndDate DATE;

    -- Tính ngày bắt đầu của quý
    SET @StartDate = DATEFROMPARTS(@Year, (@Quarter - 1) * 3 + 1, 1);

    -- Tính ngày cuối cùng của quý
    SET @EndDate = DATEADD(DAY, -1, DATEADD(MONTH, 3, @StartDate));

    SELECT @TotalRevenue = COALESCE(SUM(Total), -1)
    FROM ACCOUNT_ORDER AO
    JOIN ORDER_DETAIL OD ON AO.OrderId = OD.OrderId
    JOIN BOOKING_ACCOUNT BA ON OD.BookingId = BA.BookingId
    WHERE AO.Paid = 1
        AND BA.CheckIn >= @StartDate
        AND BA.CheckIn <= @EndDate
        AND BA.HotelId = @HotelId;

    IF @TotalRevenue IS NULL
        SET @TotalRevenue = -1;
    
    RETURN @TotalRevenue;
END;
GO


--!proc tính diểm thành viên dựa trên số ngày cư trú 
GO
CREATE OR ALTER PROCEDURE CalculatePointsForMember
    @BookingId INT
AS
BEGIN
    DECLARE @NumberOfDays INT;
    DECLARE @RoomPrice FLOAT;
    DECLARE @C FLOAT;
    DECLARE @PointsEarned FLOAT;

    -- Lấy số ngày lưu trú từ đơn booking
    SELECT @NumberOfDays = DATEDIFF(DAY, CheckIn, CheckOut) FROM BOOKING_ACCOUNT WHERE BookingId = @BookingId;

    -- Kiểm tra xem @BookingId có tồn tại hay không
    IF @NumberOfDays IS NULL
    BEGIN
        -- Trả về -1 nếu @BookingId không tồn tại
        SELECT -1 AS PointsEarned;
        RETURN;
    END

    -- Lấy giá phòng từ ROOM_TYPE
    SELECT @RoomPrice = Price FROM ROOM_TYPE WHERE Id = (SELECT RoomTypeId FROM BOOKING_ACCOUNT WHERE BookingId = @BookingId);

    -- Tính giá trị c dựa trên giá phòng
    IF @RoomPrice < 1000000
        SET @C = 0.005 * (@RoomPrice / 1000); -- 0.5% của giá phòng
    ELSE
        SET @C = 0.01 * (@RoomPrice / 1000);  -- 1% của giá phòng

    -- Tính số điểm nhận được dựa trên số ngày lưu trú và giá trị c
    IF @NumberOfDays < 5
        SET @PointsEarned = 0;
    ELSE IF @NumberOfDays >= 5 AND @NumberOfDays < 10
        SET @PointsEarned = 1 * @C;
    ELSE IF @NumberOfDays >= 10 AND @NumberOfDays < 15
        SET @PointsEarned = 2 * @C;
    ELSE IF @NumberOfDays >= 15
        SET @PointsEarned = (((@NumberOfDays - 15) / 5) + 1) * (0.01 * (@RoomPrice / 1000))* 0.012;

    -- Return số điểm nhận được
    SELECT @PointsEarned;
END

