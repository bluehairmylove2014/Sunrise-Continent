USE SunriseDatabase
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



-- //
GO
CREATE OR ALTER FUNCTION USF_GetServiceFee () -- CartItem
RETURNS INT
BEGIN
	RETURN 50000;
END
GO


CREATE OR ALTER PROC USP_SearchByName 
	@search_query NVARCHAR(100)
AS
	IF NOT EXISTS (select * from HOTEL where Description like (N'%' + @search_query + N'%'))
	BEGIN
		RETURN 0
	END

	SELECT Id, Name, Address, Stars, Image,
			dbo.USF_GetReviewNum(Id) Reviews, 
			dbo.USF_GetAvgReview(Id) Points,
			dbo.USF_GetMinRoomPrice(Id) Price
	FROM HOTEL
	WHERE Description like (N'%' + @search_query + N'%')

	RETURN 1
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


-- =================
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
	--@Id INT,
	@Name NVARCHAR(100),
	@Country NVARCHAR(100),
	@HotelType NVARCHAR(100),
	@ProvinceCity VARCHAR(100),  
	@Address NVARCHAR(100),
	@Stars INT,
	@Rating FLOAT,
	@Description NVARCHAR(1000),
	@Image NVARCHAR(1000)
AS
	BEGIN TRY
		DECLARE @Id INT
		EXEC @Id = USP_GetNextColumnId 'HOTEL', 'Id';
		
		INSERT INTO HOTEL VALUES (@Id, @Name, @Country, @HotelType, @ProvinceCity, @Address, @Stars, @Rating, @Description, @Image)
		RETURN @Id
	END TRY

	BEGIN CATCH
		PRINT N'Hotel insertion error'
		RETURN -1
	END CATCH
GO



CREATE OR ALTER PROC USP_GetAllAccount
AS
	SELECT * FROM ACCOUNT
GO


CREATE OR ALTER PROC USP_GetAccountByUsername
	@Email VARCHAR(50)
AS
	SELECT ACC.Id,
		ACC.MemberPoint,
		ACC.Email,
		PD.FullName,
		ACC.PasswordHash,
		ACC.PasswordSalt,
		ACC.UserRole,
		ACC.RefreshToken,
		ACC.TokenCreated,
		ACC.TokenExpires
	FROM (SELECT * FROM ACCOUNT where Email = @Email) ACC
	JOIN PERSONAL_DETAILS PD ON ACC.Id = PD.AccountId;
GO


CREATE OR ALTER PROC USP_GetAccountById
	@Id INT
AS
	SELECT ACC.Id,
		ACC.MemberPoint,
		ACC.Email,
		PD.FullName,
		ACC.PasswordHash,
		ACC.PasswordSalt,
		ACC.UserRole,
		ACC.RefreshToken,
		ACC.TokenCreated,
		ACC.TokenExpires
	FROM (SELECT * FROM ACCOUNT where Id = @Id) ACC
	JOIN PERSONAL_DETAILS PD ON ACC.Id = PD.AccountId;
GO


CREATE OR ALTER PROC USP_GetHotelReviews
	@Id INT
AS
	SELECT * FROM REVIEW where HotelId = @Id;
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
		INSERT INTO ACCOUNT VALUES (@Id, 0, 'Bronze', @Email, @PasswordHash, @PasswordSalt, @UserRole, @RefreshToken, @TokenCreated, @TokenExpires)

		INSERT INTO PERSONAL_DETAILS (AccountId, FullName, EmailAddress, PhoneNumber, DateOfBirth, Gender, Image, Rank) 
			VALUES (@Id, @FullName, @Email, 'default', '01-01-2002', 'Male', 'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', 'Bronze')
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
	@AccountRank VARCHAR(10),
	@Email VARCHAR(50),
	@PasswordHash VARCHAR(500),
	@PasswordSalt VARCHAR(500)
	--@UserRole VARCHAR(50),
 --   @RefreshToken VARCHAR(200),
 --   @TokenCreated DATETIME,
 --   @TokenExpires DATETIME
AS
	BEGIN TRY
		IF NOT EXISTS (SELECT * FROM ACCOUNT WHERE Id = @Id)
		BEGIN
			PRINT N'Account Id not existed'
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


--TODO PROCEDURE CRUD LOẠI PHÒNG

--!Thêm loại phòng
CREATE OR ALTER PROCEDURE USP_AddRoomType
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

        INSERT INTO ROOM_TYPE (HotelId, Id, Name, Vacancy, Size, Price, RoomInfo, RoomView, BedType)
        VALUES (@HotelId, @Id, @Name, @Vacancy, @Size, dbo.USF_GetServiceFee() + @Price, @RoomInfo, @RoomView, @BedType)

		RETURN 0
    END TRY

    BEGIN CATCH
		RETURN -1
    END CATCH;
END
GO

--!Xóa loại phòng
CREATE OR ALTER PROCEDURE USP_DeleteRoomType
    @HotelId INT,
    @Id INT
AS
BEGIN

    BEGIN TRY
        DELETE FROM ROOM_TYPE
        WHERE HotelId = @HotelId AND Id = @Id

        RETURN 0; -- thành công
    END TRY
    BEGIN CATCH
        RETURN -1; -- thất bại
    END CATCH;
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
	--SET NOCOUNT ON;

    BEGIN TRY
        -- Thêm ảnh phòng mới
        INSERT INTO ROOM_PICTURE (HotelId, RoomTypeId, Id, PictureLink)
        VALUES (@HotelId, @RoomTypeId, @Id, @PictureLink);

		RETURN 0; -- Trả về kết quả 1 khi thêm thành công
    END TRY

    BEGIN CATCH
        RETURN -1; -- Trả về kết quả 0 khi xảy ra lỗi
    END CATCH;
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
    @AccountId INT,
    @HotelId INT,
    @ImageId INT,
    @ImageLink VARCHAR(1000),
    @Result INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Thêm REVIEW_IMAGE mới
        INSERT INTO REVIEW_IMAGE (AccountId, HotelId, ImageId, ImageLink)
        VALUES (@AccountId, @HotelId, @ImageId, @ImageLink);

        COMMIT;
        SET @Result = 1; -- Trả về kết quả 1 khi thêm thành công
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SET @Result = 0; -- Trả về kết quả 0 khi xảy ra lỗi
    END CATCH;
END
GO

--!XÓA
CREATE OR ALTER PROCEDURE USP_DeleteReviewImage
    @AccountId INT,
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
        WHERE AccountId = @AccountId
        AND HotelId = @HotelId
        AND ImageId = @ImageId;

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
CREATE OR ALTER PROCEDURE USP_UpdateReviewImage
    @AccountId INT,
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
        WHERE AccountId = @AccountId
        AND HotelId = @HotelId
        AND ImageId = @ImageId;

        COMMIT;
        SET @Result = 1; -- Trả về kết quả 1 khi cập nhật thành công
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SET @Result = 0; -- Trả về kết quả 0 khi xảy ra lỗi
    END CATCH;
END
GO


--todo PROC CRUD VOUCHER
--! THÊM
CREATE OR ALTER PROCEDURE USP_AddVoucher
    @Name NVARCHAR(500),
    @Value INT,
    @Point INT,
	@AccountRank VARCHAR(10)
AS
BEGIN
	BEGIN TRY
		IF (@Value < 1) OR (@Point < 1)
		OR (@AccountRank not in (select RankName from POINT_RANK))
		BEGIN
			RETURN -1;
		END

		DECLARE @Id INT;
		EXEC @Id = USP_GetNextColumnId 'VOUCHER', 'VoucherId'

		INSERT INTO VOUCHER (VoucherId, Name, Value, Point, AccountRank)
		VALUES (@Id, @Name, @Value, @Point, @AccountRank)
	END TRY

	BEGIN CATCH
			RETURN -1; -- Thất bại
	END CATCH

	RETURN @Id;
END
GO

--! XÓA 
CREATE OR ALTER PROCEDURE USP_DeleteVoucher
    @VoucherId INT
AS
BEGIN
	BEGIN TRY
		DELETE FROM VOUCHER
		WHERE VoucherId = @VoucherId

		RETURN 0;
	END TRY

	BEGIN CATCH
		RETURN -1;
	END CATCH
END
GO

--! SỬA
CREATE OR ALTER PROCEDURE USP_UpdateVoucher
    @VoucherId INT,
    @Name NVARCHAR(500),
    @Value INT,
	@Point INT,
	@AccountRank VARCHAR(10)
AS
BEGIN
	BEGIN TRY
		UPDATE VOUCHER
		SET Name = @Name,
			Value = @Value,
			Point = @Point,
			AccountRank = @AccountRank
		WHERE VoucherId = @VoucherId

		RETURN 0;
	END TRY

	BEGIN CATCH
		RETURN -1;
	END CATCH
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
	SELECT * FROM VOUCHER;
END
GO


CREATE OR ALTER PROCEDURE USP_GetVoucherById
	@VoucherId INT
AS
BEGIN
	SELECT * FROM VOUCHER WHERE VoucherId = @VoucherId;
END
GO

CREATE OR ALTER PROCEDURE USP_GetUserVoucher
	@AccountId INT
AS
BEGIN
	SELECT VB.AccountId, VC.*, VB.Quantity FROM VOUCHER_BAG VB JOIN VOUCHER VC ON VB.VoucherId = VC.VoucherId
	WHERE AccountId = @AccountId;
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
	SELECT @TotalSpent = -SUM(p.Value) FROM POINT_HISTORY p 
	WHERE p.Value < 0 AND p.AccountId = @AccountId;
	RETURN @TotalSpent;
END
GO

GO
CREATE OR ALTER FUNCTION USF_GetAccountRank (@AccountId INT)
RETURNS VARCHAR(10)
BEGIN
	DECLARE @Rank VARCHAR(10) = 'Bronze';

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
	DECLARE @Rank VARCHAR(10) = dbo.USF_GetAccountRank (@AccountId);
	
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

--TODO proc đổi điểm
CREATE OR ALTER PROCEDURE USP_RedeemVoucher
    @AccountId INT,
    @VoucherId INT
AS
BEGIN
	DECLARE @VoucherValue INT;
	DECLARE @CurrentPoints INT;
	DECLARE @Quantity INT;
	
	-- Kiểm tra xem tài khoản và voucher có tồn tại không
	IF NOT EXISTS (SELECT TOP(1) Id FROM ACCOUNT WHERE Id = @AccountId)
		OR NOT EXISTS (SELECT TOP(1) VoucherId FROM VOUCHER WHERE VoucherId = @VoucherId)
	BEGIN
		-- Trả về giá trị 0 nếu tài khoản hoặc voucher không tồn tại
		RETURN -1;
	END

	DECLARE @RankName VARCHAR(10);
	SELECT @RankName = AccountRank FROM VOUCHER WHERE VoucherId = @VoucherId;
	IF NOT (@RankName IN (SELECT p2.RankName FROM POINT_RANK p1
						JOIN POINT_RANK p2 ON p1.RankValue >= p2.RankValue
						WHERE p1.RankName like (SELECT TOP(1) AccountRank FROM ACCOUNT WHERE Id = @AccountId)))
	BEGIN
		RAISERROR(N'Tài khoản không đủ quyền đổi voucher này', 11, 1)
		RETURN -1;
	END

	-- Lấy giá trị voucher cần đổi và số điểm hiện tại của tài khoản
	SELECT @VoucherValue = Point FROM VOUCHER WHERE VoucherId = @VoucherId;
	SELECT @CurrentPoints = MemberPoint FROM ACCOUNT WHERE Id = @AccountId;

	-- Kiểm tra xem tài khoản có đủ điểm để đổi voucher không
	IF (@CurrentPoints < @VoucherValue)
	BEGIN
		RAISERROR(N'Tài khoản không đủ điểm để đổi voucher này', 11, 1)
		RETURN -1; -- Trả về giá trị -1 nếu tài khoản không đủ điểm để đổi voucher
	END
	ELSE
	BEGIN
		BEGIN TRAN -- Bắt đầu giao dịch
		--SET TRAN ISOLATION LEVEL READ COMMITTED;

		BEGIN TRY
			-- Cập nhật số lượng voucher trong túi voucher của tài khoản
			SELECT @Quantity = Quantity FROM VOUCHER_BAG WHERE AccountId = @AccountId AND VoucherId = @VoucherId;

			IF (@Quantity IS NULL)
				INSERT INTO VOUCHER_BAG (AccountId, VoucherId, Quantity) VALUES (@AccountId, @VoucherId, 1);
			ELSE
				UPDATE VOUCHER_BAG SET Quantity = @Quantity + 1 WHERE AccountId = @AccountId AND VoucherId = @VoucherId;

			-- Cập nhật điểm của tài khoản
			UPDATE ACCOUNT SET MemberPoint = @CurrentPoints - @VoucherValue WHERE Id = @AccountId;

			-- Lưu lịch sử sử dụng điểm vào bảng POINT_HISTORY
			INSERT INTO POINT_HISTORY (AccountId, Value, RecordedTime) VALUES (@AccountId, -@VoucherValue, GETDATE());
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
CREATE OR ALTER PROCEDURE USP_UpdateMemberPoints
    @AccountId INTEGER,
    @TotalPay INT,
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
		INSERT INTO POINT_HISTORY (AccountId, Value, RecordedTime) VALUES (@AccountId, @EarnedPoints, GETDATE());
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
CREATE OR ALTER PROC USP_FindHotelByName
	@Location NVARCHAR(50),
	@RoomType NVARCHAR(50),
	@StartDate DATE,
	@EndDate DATE,
	@MinBudget float,
	@MaxBudget float,
	@Rooms int,
	@Adult int,
	@Children int
AS
	SELECT h.Id, h.Name, Country, HotelType, ProvinceCity, 
			Address, Stars,
			dbo.USF_GetAvgReview(h.Id) Rating,
			Description, Image,
			dbo.USF_GetMinRoomPrice(h.Id) Price
	FROM HOTEL h inner join ROOM_TYPE rt on h.Id = rt.HotelId
	WHERE (h.ProvinceCity COLLATE Latin1_General_CI_AI like '%' + @Location + '%' COLLATE Latin1_General_CI_AI or
		  h.Country COLLATE Latin1_General_CI_AI like '%' + @Location + '%' COLLATE Latin1_General_CI_AI or
	      h.Name COLLATE Latin1_General_CI_AI like '%' + @Location + '%' COLLATE Latin1_General_CI_AI) and
		  dbo.USF_GetMinRoomPrice(h.Id) <= @MaxBudget and 
		  dbo.USF_GetMinRoomPrice(h.Id) >= @MinBudget and
	      dbo.USF_CheckRoomAvailability(rt.HotelId, rt.Id, @Rooms, @StartDate, @EndDate) = 1 and
		  rt.Name COLLATE SQL_Latin1_General_CP1_CI_AI like '%' + @RoomType + '%' COLLATE SQL_Latin1_General_CP1_CI_AI  
	GROUP BY h.Id, h.Name, Country, HotelType, ProvinceCity, 
			Address, Stars,
			Description, Image
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


-- //
GO
CREATE OR ALTER PROC USP_GetAllAccountOrder (
	@AccountId INT)
AS
	SELECT * FROM ACCOUNT_ORDER AO WHERE AO.AccountId = @AccountId;
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
	@Notes NVARCHAR(500))
AS
BEGIN
	BEGIN TRAN

	BEGIN TRY
		DECLARE @OrderId INT;
		EXEC @OrderId = USP_GetNextColumnId 'ACCOUNT_ORDER', 'OrderId ';

		INSERT INTO ACCOUNT_ORDER (OrderId, AccountId, FullName, Nation, DateOfBirth, Email, PhoneNumber, SpecialNeeds, Notes, VoucherId, Total, Paid, CreatedAt) VALUES 
			(@OrderId, @AccountId, @FullName, @Nation, @DateOfBirth, @Email, @PhoneNumber, @SpecialNeeds, @Notes, 0, 0, 0, GETDATE());
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


-- //
GO
CREATE OR ALTER FUNCTION USF_GetBookingTotalById (@BookingId INT)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT = 0;
	SELECT @Result = (RT.Price + dbo.USF_GetServiceFee()) * BA.NumberOfRoom 
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
CREATE OR ALTER PROC USP_ConfirmOrder
	@OrderId INT,
	@AccountId INT,
	@VoucherId INTEGER
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
	BEGIN TRY
		DECLARE @Discount INT = 0;
		SELECT @Discount = Value FROM VOUCHER WHERE VoucherId = @VoucherId;
		DECLARE @Total INT = dbo.USF_GetOrderTotal(@OrderId);

		IF (@VoucherId IS NOT NULL AND @VoucherId > 0)
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
			Total = @Total - @Discount,
			Paid = 1
		WHERE OrderId = @OrderId;

		-- Cập nhật điểm thành viên.
		EXEC USP_UpdateMemberPoints @AccountId, @Total;
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

-- ++
GO
CREATE OR ALTER PROC USP_ConfirmOrderWithTotal
	@OrderId INT,
	@AccountId INT,
	@VoucherId INT,
	@Total INT
AS
BEGIN
	-- Kiểm tra số tiền thanh toán.
	DECLARE @Discount INT = 0;
	DECLARE @Check INT = dbo.USF_GetOrderTotal(@OrderId);
	SELECT @Discount = Value FROM VOUCHER WHERE VoucherId = @VoucherId;

	IF (@Total + @Discount - @Check < 0)
	BEGIN
		RAISERROR(N'Không đủ tiền thanh toán', 11, 1);
		RETURN -1;
	END

	EXEC USP_ConfirmOrder @OrderId, @AccountId, @VoucherId;
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


--! proc lấy danh sách toàn bộ account
CREATE OR ALTER PROC USP_GetAccountDetailList	
AS
	SELECT * FROM PERSONAL_DETAILS
GO
--! proc lấy thông tin chi tiết tài khoản
CREATE OR ALTER PROC USP_GetAccountDetail
	@AccountId INTEGER
AS
	SELECT * FROM PERSONAL_DETAILS
	WHERE AccountId = @AccountId
GO

--! proc lấy thông tin chi tiết tài khoản
CREATE OR ALTER PROC USP_GetAccountDetailByEmail
	@Email NVARCHAR(200)
AS
	SELECT * FROM PERSONAL_DETAILS
	WHERE EmailAddress = @Email
GO

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
--! Proc lấy điểm bonus
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

GO
--! proc tính doanh thu của khách sạn theo tháng
CREATE OR ALTER  PROCEDURE CalculateHotelRevenueByMonth
    @Year INT,
    @Month INT,
    @HotelId INT,
    @TotalRevenue INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StartDate DATE, @EndDate DATE;

    -- Tính ngày bắt đầu của tháng
    SET @StartDate = DATEFROMPARTS(@Year, @Month, 1);

    -- Tính số ngày của tháng đó
    SET @EndDate = DATEADD(DAY, -1, DATEADD(MONTH, 1, @StartDate));

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

--!proc tính doanh thu khách sạn trong năm
GO
CREATE OR ALTER PROCEDURE CalculateHotelRevenueByYear
    @Year INT,
    @HotelId INT,
    @TotalRevenue INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StartDate DATE, @EndDate DATE;

    -- Tính ngày bắt đầu của năm
    SET @StartDate = DATEFROMPARTS(@Year, 1, 1);

    -- Tính ngày cuối cùng của năm
    SET @EndDate = DATEADD(DAY, -1, DATEADD(YEAR, 1, @StartDate));

    -- Tính doanh thu
    SELECT @TotalRevenue = SUM(Total)
    FROM ACCOUNT_ORDER AO
    JOIN ORDER_DETAIL OD ON AO.OrderId = OD.OrderId
    JOIN BOOKING_ACCOUNT BA ON OD.BookingId = BA.BookingId
    WHERE AO.Paid = 1
        AND BA.CheckIn >= @StartDate
        AND BA.CheckIn <= @EndDate
        AND BA.HotelId = @HotelId;

    IF @TotalRevenue IS NULL
        SET @TotalRevenue = -1;

    -- Trả về kết quả
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

