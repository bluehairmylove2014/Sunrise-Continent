USE SunriseServer
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
			Address, Stars, Rating, Description, Image,
			dbo.USF_GetMinRoomPrice(Id) Price
			--dbo.USF_GetReviewNum(Id) Reviews, 
			--dbo.USF_GetAvgReview(Id) Rating,
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
			Address, Stars, Rating, Description, Image,
			dbo.USF_GetMinRoomPrice(Id) Price
			--dbo.USF_GetReviewNum(Id) Reviews, 
			--dbo.USF_GetAvgReview(Id) Rating,
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

		INSERT INTO ACCOUNT VALUES (@Id, 0, @Username, @PasswordHash, @PasswordSalt, @UserRole, @RefreshToken, @TokenCreated, @TokenExpires)
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
	@Username VARCHAR(50),
	@PasswordHash VARCHAR(500),
	@PasswordSalt VARCHAR(500)
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
--! thêm
CREATE PROCEDURE dbo.AddBooking
    @AccountId INTEGER,
    @HotelId INTEGER,
    @RoomTypeId INTEGER,
    @CheckIn DATE,
    @CheckOut DATE,
    @NumberOfRoom INTEGER,
    @VoucherId INTEGER,
    @Total INT,
    @ReturnValue INT OUT
AS
BEGIN
    SET @ReturnValue = 0; -- Mặc định trả về là 0 (thất bại)

    BEGIN TRY
        INSERT INTO BOOKING_ACCOUNT (AccountId, HotelId, RoomTypeId, CheckIn, CheckOut, NumberOfRoom, VoucherId, Total)
        VALUES (@AccountId, @HotelId, @RoomTypeId, @CheckIn, @CheckOut, @NumberOfRoom, @VoucherId, @Total);
        
        SET @ReturnValue = 1; -- Gán giá trị trả về là 1 (thành công)
    END TRY
    BEGIN CATCH
        SET @ReturnValue = 0; -- Gán giá trị trả về là 0 (thất bại)
    END CATCH
    RETURN @ReturnValue; -- Trả về giá trị kết quả của stored procedure
END

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
CREATE PROCEDURE dbo.UpdateBooking
    @AccountId INTEGER,
    @HotelId INTEGER,
    @RoomTypeId INTEGER,
    @CheckIn DATE,
    @CheckOut DATE,
    @NumberOfRoom INTEGER,
    @VoucherId INTEGER,
    @Total INT,
    @ReturnValue INT OUT
AS
BEGIN
    SET @ReturnValue = 0; -- Mặc định trả về là 0 (thất bại)

    BEGIN TRY
        UPDATE BOOKING_ACCOUNT
        SET CheckOut = @CheckOut,
            NumberOfRoom = @NumberOfRoom,
            VoucherId = @VoucherId,
            Total = @Total
        WHERE AccountId = @AccountId
        AND HotelId = @HotelId
        AND RoomTypeId = @RoomTypeId
        AND CheckIn = @CheckIn;
        
        SET @ReturnValue = 1; -- Gán giá trị trả về là 1 (thành công)
    END TRY
    BEGIN CATCH
        SET @ReturnValue = 0; -- Gán giá trị trả về là 0 (thất bại)
    END CATCH
    RETURN @ReturnValue; -- Trả về giá trị kết quả của stored procedure
END

--TODO PROCE XEM LỊCH SỬ CÁC ĐƠN BOOKING CỦA TÀI KHOẢN 
CREATE OR ALTER PROCEDURE dbo.USP_ViewBookingHistory
    @AccountId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM BOOKING_ACCOUNT BA
    WHERE BA.AccountId = @AccountId;
END;
GO

--todo PROC CRUD VOUCHER
--! THÊM
CREATE PROCEDURE dbo.AddVoucher
    @VoucherId INT,
    @Name NVARCHAR(500),
    @Value INT
    @Point INT
AS
BEGIN
    INSERT INTO VOUCHER (VoucherId, Name, Value)
    VALUES (@VoucherId, @Name, @Value,@Point)

    IF @@ROWCOUNT > 0
        RETURN 1; -- Thành công
    ELSE
        RETURN 0; -- Thất bại
END

--! XÓA 
CREATE PROCEDURE dbo.DeleteVoucher
    @VoucherId INT
AS
BEGIN
    DELETE FROM VOUCHER
    WHERE VoucherId = @VoucherId

    IF @@ROWCOUNT > 0
        RETURN 1; -- Thành công
    ELSE
        RETURN 0; -- Thất bại
END
--! SỬA
CREATE PROCEDURE dbo.UpdateVoucher
    @VoucherId INT,
    @Name NVARCHAR(500),
    @Value INT
AS
BEGIN
    UPDATE VOUCHER
    SET Name = @Name,
        Value = @Value
        Point = @Point

    WHERE VoucherId = @VoucherId

    IF @@ROWCOUNT > 0
        RETURN 1; -- Thành công
    ELSE
        RETURN 0; -- Thất bại
END

--TODO proc đổi điểm
CREATE PROCEDURE dbo.RedeemVoucher
    @AccountId INT,
    @VoucherId INT
AS
BEGIN
    DECLARE @VoucherValue INT;
    DECLARE @CurrentPoints INT;
    DECLARE @Quantity INT;

    -- Kiểm tra xem tài khoản và voucher có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM ACCOUNT WHERE Id = @AccountId)
        OR NOT EXISTS (SELECT 1 FROM VOUCHER WHERE VoucherId = @VoucherId)
    BEGIN
        -- Trả về giá trị 0 nếu tài khoản hoặc voucher không tồn tại
        RETURN 0;
    END

    -- Lấy giá trị voucher cần đổi và số điểm hiện tại của tài khoản
    SELECT @VoucherValue = Point FROM VOUCHER WHERE VoucherId = @VoucherId;
    SELECT @CurrentPoints = MemberPoint FROM ACCOUNT WHERE Id = @AccountId;

    -- Kiểm tra xem tài khoản có đủ điểm để đổi voucher không
    IF @CurrentPoints >= @VoucherValue
    BEGIN
        BEGIN TRANSACTION; -- Bắt đầu giao dịch

        -- Trừ điểm hoặc thêm điểm vào tài khoản
        IF @VoucherValue > 0
            SET @VoucherValue = -@VoucherValue; 
        UPDATE ACCOUNT SET MemberPoint = @CurrentPoints + @VoucherValue WHERE Id = @AccountId;

        -- Lưu lịch sử sử dụng điểm vào bảng POINT_HISTORY
        INSERT INTO POINT_HISTORY (AccountId, Value) VALUES (@AccountId, @VoucherValue);

        -- Cập nhật số lượng voucher trong túi voucher của tài khoản
        SELECT @Quantity = ISNULL(Quantity, 0) FROM VOUCHER_BAG WHERE AccountId = @AccountId AND VoucherId = @VoucherId;
        IF @Quantity > 0
        BEGIN
            UPDATE VOUCHER_BAG SET Quantity = @Quantity + 1 WHERE AccountId = @AccountId AND VoucherId = @VoucherId;
        END
        ELSE
        BEGIN
            INSERT INTO VOUCHER_BAG (AccountId, VoucherId, Quantity) VALUES (@AccountId, @VoucherId, 1);
        END

        COMMIT TRANSACTION; -- Kết thúc giao dịch
        -- Trả về giá trị 1 để biểu thị thành công
        RETURN 1;
    END
    ELSE
    BEGIN
        -- Trả về giá trị 0 nếu tài khoản không đủ điểm để đổi voucher
        RETURN 0;
    END
END

--todo proc tính điểm từ giao dịch và lưu thay đổi điểm 
CREATE PROCEDURE dbo.CalculateMemberPoints
    @AccountId INTEGER,
    @Total INT,
    @ReturnValue INT OUT
AS
BEGIN
    DECLARE @EarnedPoints INT;
    
    -- Tính điểm tích lũy từ giao dịch (tỉ lệ 1 điểm / 100000 giá trị total)
    SET @EarnedPoints = @Total / 100000;

    BEGIN TRY
        BEGIN TRANSACTION; -- Bắt đầu giao dịch

        -- Cộng điểm tích lũy từ giao dịch vào tài khoản
        UPDATE ACCOUNT SET MemberPoint = MemberPoint + @EarnedPoints WHERE Id = @AccountId;

        -- Ghi lại lịch sử điểm vào bảng POINT_HISTORY
        INSERT INTO POINT_HISTORY (AccountId, Value) VALUES (@AccountId, @EarnedPoints);

        COMMIT TRANSACTION; -- Kết thúc giao dịch

        -- Gán giá trị trả về là 1 nếu quá trình thành công
        SET @ReturnValue = 1;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION; -- Xảy ra lỗi, rollback giao dịch
        SET @ReturnValue = 0; -- Gán giá trị trả về là 0 nếu thất bại
    END CATCH

    -- Trả về giá trị kết quả của stored procedure
    RETURN @ReturnValue;
END


