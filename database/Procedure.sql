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

CREATE OR ALTER PROC USP_FindHotelByName
	@String NVARCHAR(50)
AS
	SELECT Id, Name, Country, HotelType, ProvinceCity, 
			Address, Stars,
			dbo.USF_GetAvgReview(Id) Rating,
			Description, Image,
			dbo.USF_GetMinRoomPrice(Id) Price
	FROM HOTEL
	WHERE Name like '%' + @String + '%'
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
	@Username VARCHAR(50)
AS
	SELECT * FROM ACCOUNT where Username like @Username
GO


CREATE OR ALTER PROC USP_GetAccountById
	@Id INT
AS
	IF (@Id = -1)
	BEGIN
		SELECT null;
	END

	SELECT * FROM ACCOUNT where Id = @Id;
GO


CREATE OR ALTER PROC USP_GetHotelReviews
	@Id INT
AS
	SELECT * FROM REVIEW where HotelId = @Id;
GO


CREATE OR ALTER PROC USP_AddAccount
	--@Id INTEGER,
	--@MemberPoint INTEGER,
	@Username VARCHAR(50),
	@PasswordHash VARCHAR(500),
	@PasswordSalt VARCHAR(500),
	@UserRole VARCHAR(50),
	@RefreshToken VARCHAR(200),
	@TokenCreated DATETIME,
	@TokenExpires DATETIME
AS
	BEGIN TRY
		DECLARE @Id INT
		EXEC @Id = dbo.USP_GetNextColumnId 'ACCOUNT', 'Id'

		INSERT INTO ACCOUNT VALUES (@Id, 0, 'Bronze', @Username, @PasswordHash, @PasswordSalt, @UserRole, @RefreshToken, @TokenCreated, @TokenExpires)
		RETURN @Id
	END TRY

	BEGIN CATCH
		PRINT N'Account insertion error'
		RETURN -1
	END CATCH
GO


GO
CREATE OR ALTER PROC USP_UpdateAccount
	@Id INTEGER,
	@MemberPoint INTEGER,
	@AccountRank VARCHAR(10),
	@Username VARCHAR(50),
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
			Username = @Username,
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
        VALUES (@HotelId, @Id, @Name, @Vacancy, @Size, @Price, @RoomInfo, @RoomView, @BedType)

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

--todo liên quan đến booking có thông tin voucher 

--!XÓA
CREATE OR ALTER PROCEDURE USP_DeleteBooking
    @AccountId INT,
    @HotelId INT,
    @RoomTypeId INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    -- Xóa đơn đặt chỗ
    DELETE FROM BOOKING_ACCOUNT
    WHERE AccountId = @AccountId AND HotelId = @HotelId AND RoomTypeId = @RoomTypeId;

    COMMIT;
END;
GO

--!sửa 
CREATE OR ALTER PROCEDURE USP_UpdateBooking
    @AccountId INTEGER,
    @HotelId INTEGER,
    @RoomTypeId INTEGER,
    @CheckIn DATE,
    @CheckOut DATE,
    @NumberOfRoom INTEGER,
    @VoucherId INTEGER,
    @Total INT,
    @Paid BIT
AS
BEGIN
    BEGIN TRY
        UPDATE BOOKING_ACCOUNT
        SET CheckOut = @CheckOut,
            NumberOfRoom = @NumberOfRoom,
            VoucherId = @VoucherId,
            Total = @Total,
			Paid = @Paid
        WHERE AccountId = @AccountId
        AND HotelId = @HotelId
        AND RoomTypeId = @RoomTypeId
        AND CheckIn = @CheckIn;
    END TRY

    BEGIN CATCH
        RETURN -1; -- Gán giá trị trả về là -1 (thất bại)
    END CATCH

    RETURN 0;  -- Gán giá trị trả về là 0 (thành công)
END
GO

--TODO PROCE XEM LỊCH SỬ CÁC ĐƠN BOOKING CỦA TÀI KHOẢN 
CREATE OR ALTER PROCEDURE USP_ViewBookingHistory
    @AccountId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * FROM BOOKING_ACCOUNT BA
    WHERE BA.AccountId = @AccountId AND (Paid = 1);
END;
GO


--todo PROC CRUD VOUCHER
--! THÊM
CREATE OR ALTER PROCEDURE USP_AddVoucher
    @Name NVARCHAR(500),
    @Value INT,
    @Point INT,
	@UserRank VARCHAR(10)
AS
BEGIN
	BEGIN TRY
		IF (@Value < 1) OR (@Point < 1)
		OR (@UserRank not in (select RankName from POINT_RANK))
		BEGIN
			RETURN -1;
		END

		DECLARE @Id INT;
		EXEC @Id = USP_GetNextColumnId 'VOUCHER', 'VoucherId'

		INSERT INTO VOUCHER (VoucherId, Name, Value, Point, UserRank)
		VALUES (@Id, @Name, @Value, @Point, @UserRank)

		RETURN 0;
	END TRY

	BEGIN CATCH
			RETURN -1; -- Thất bại
	END CATCH

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
	@UserRank VARCHAR(10)
AS
BEGIN
	BEGIN TRY
		UPDATE VOUCHER
		SET Name = @Name,
			Value = @Value,
			Point = @Point,
			UserRank = @UserRank
		WHERE VoucherId = @VoucherId

		RETURN 0;
	END TRY

	BEGIN CATCH
		RETURN -1;
	END CATCH
END
GO

--!Mới 1.5

CREATE OR ALTER PROCEDURE USP_GetAllVoucher
AS
BEGIN
	SELECT * FROM VOUCHER;
END
GO

CREATE OR ALTER PROCEDURE USP_GetUserVoucher
	@AccountId INT
AS
BEGIN
	SELECT * FROM VOUCHER_BAG WHERE AccountId = @AccountId;
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
CREATE OR ALTER FUNCTION USF_GetUserRank (@AccountId INT)
RETURNS VARCHAR(10)
BEGIN
	DECLARE @Rank VARCHAR(10) = 'Bronze';

	SELECT TOP(1) @Rank = RankName from POINT_RANK 
	WHERE RankValue < dbo.USF_GetTotalPointSpent(@AccountId)
	ORDER BY RankValue DESC;

	RETURN @Rank;
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
	SELECT @RankName = UserRank FROM VOUCHER WHERE VoucherId = @VoucherId;
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

CREATE OR ALTER FUNCTION USF_CheckRoomAvailability (
    @HotelId INTEGER,
    @RoomTypeId INTEGER,
	@NumberOfRoom INTEGER)
RETURNS BIT
BEGIN
	DECLARE @SpareRoom INT;
	DECLARE @BookedRoom INT;
	SELECT @BookedRoom = Count(NumberOfRoom) FROM BOOKING_ACCOUNT WHERE HotelId = @HotelId AND RoomTypeId = @RoomTypeId
	SELECT @SpareRoom = Vacancy - @BookedRoom FROM ROOM_TYPE WHERE HotelId = @HotelId AND Id = @RoomTypeId;

	IF (@SpareRoom < @NumberOfRoom)
		RETURN 0;
	RETURN 1;
END
GO

--! thêm booking
CREATE OR ALTER PROCEDURE USP_AddBooking -- Confirm booking
    @AccountId INTEGER,
    @HotelId INTEGER,
    @RoomTypeId INTEGER,
    @CheckIn DATE,
    @CheckOut DATE,
    @NumberOfRoom INTEGER,
    @VoucherId INTEGER
AS
BEGIN
	DECLARE @Quantity INT;

	-- Kiểm tra số lượng voucher trong túi.
	IF (@VoucherId IS NOT NULL OR @VoucherId > 0)
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

		IF (@VoucherId IS NOT NULL OR @VoucherId > 0)
		BEGIN
			-- Giảm số lượng voucher trong túi.
			IF (@Quantity = 1)
				DELETE FROM VOUCHER_BAG WHERE AccountId = @AccountId AND VoucherId = @VoucherId;
			ELSE
				UPDATE VOUCHER_BAG SET Quantity = @Quantity - 1 WHERE AccountId = @AccountId AND VoucherId = @VoucherId;

			SELECT @Discount = Value FROM VOUCHER WHERE VoucherId = @VoucherId;
		END

		DECLARE @Total INT
		SELECT @Total = Price * @NumberOfRoom FROM ROOM_TYPE WHERE HotelId = @HotelId AND Id = @RoomTypeId;

		INSERT INTO BOOKING_ACCOUNT (AccountId, HotelId, RoomTypeId, CheckIn, CheckOut, NumberOfRoom, VoucherId, Total, Paid, CreatedAt)
		VALUES (@AccountId, @HotelId, @RoomTypeId, @CheckIn, @CheckOut, @NumberOfRoom, @VoucherId, @Total - @Discount, 0, GETDATE());
        
		-- Cập nhật điểm thành viên.
		EXEC USP_UpdateMemberPoints @AccountId, @Total;
	END TRY

	BEGIN CATCH
		RAISERROR(N'Đặt phòng thất bại', 11, 1);
		ROLLBACK;
		RETURN -1; -- (thất bại)
	END CATCH

	COMMIT TRAN;
	RETURN 0; -- (thành công)
END
GO

GO
CREATE OR ALTER FUNCTION USF_GetCartItem (@AccountId INT)
RETURNS TABLE
AS
RETURN
	SELECT * FROM BOOKING_ACCOUNT BA WHERE BA.AccountId = @AccountId AND (Paid = 0);
GO

GO
CREATE OR ALTER FUNCTION USF_GetCartTotal (@AccountId INT)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT = 0;
	SELECT @Result = SUM(Total) FROM dbo.USF_GetCartItem(@AccountId);
	RETURN @Result;
END
GO

GO
CREATE OR ALTER PROC USP_ConfirmBooking
	@AccountId INT,
	@Total INT
AS
	DECLARE @Check INT;
	SELECT @Check = @Total - dbo.USF_GetCartTotal(@AccountId);

	IF (@Check < 0)
	BEGIN
		RAISERROR(N'Không đủ tiền thanh toán', 11, 1);
		RETURN -1;
	END

	BEGIN TRAN
	
	BEGIN TRY
		UPDATE BOOKING_ACCOUNT SET Paid = 1 
		WHERE AccountId = @AccountId AND Paid = 0;
	END TRY

	BEGIN CATCH
		RAISERROR(N'Thanh toán giỏ hàng thất bại', 11, 1);
		ROLLBACK;
		RETURN -1;
	END CATCH

	COMMIT;
	RETURN 0;
GO