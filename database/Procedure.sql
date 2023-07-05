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


CREATE OR ALTER PROC USP_GetAllAccommodations 
AS
	SELECT Id, Name, Address, Stars, Image,
			dbo.USF_GetReviewNum(Id) Reviews, 
			dbo.USF_GetAvgReview(Id) Points,
			dbo.USF_GetMinRoomPrice(Id) Price
	FROM HOTEL
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


CREATE OR ALTER PROC USP_GetHotelRoomType 
	@HotelId INT
AS
	IF NOT EXISTS (select * from HOTEL where Id = @HotelId)
	BEGIN
		RETURN 0
	END

	select * from ROOM_TYPE rt
	where rt.HotelId = @HotelId

	RETURN 1
GO

CREATE OR ALTER PROC USP_GetHotelRoomPicture 
	@HotelId INT,
	@RoomId INT
AS
	IF NOT EXISTS (select * from HOTEL where Id = @HotelId)
	BEGIN
		RETURN 0
	END

	select * from ROOM_PICTURE rp
	where rp.HotelId = @HotelId and rp.RoomTypeId = @RoomId

	RETURN 1
GO

CREATE OR ALTER PROC USP_GetAllHotel
AS
	SELECT * FROM HOTEL
GO


CREATE OR ALTER PROC USP_GetHotelById
	@Id INTEGER
AS
	SELECT * FROM HOTEL WHERE Id = @Id
GO


CREATE OR ALTER PROC USP_AddAccount
	@Id INTEGER,
	@MemberPoints INTEGER,
	@Username VARCHAR(50),
	@PasswordHash VARBINARY(100),
	@PasswordSalt VARBINARY(100),
	@RefreshToken VARCHAR(100),
	@TokenCreated DATETIME,
	@TokenExpires DATETIME
AS
	IF EXISTS (SELECT * FROM ACCOUNT WHERE Id=@Id)
	BEGIN
		PRINT N'Id tồn tại'
		RETURN 0
	END

	INSERT INTO ACCOUNT VALUES (@Id, @MemberPoints, @Username, @PasswordHash, @PasswordSalt, @RefreshToken, @TokenCreated, @TokenExpires)

	RETURN 1
GO

CREATE OR ALTER PROC USP_DeleteAccount
	@Id INTEGER
AS
	BEGIN TRY
		

		DELETE FROM ACCOUNT WHERE Id = @Id
		RETURN 0
	END TRY

	begin catch
		print N'Account deletion error'
		return 1
	end catch
GO


--CREATE OR ALTER FUNCTION USP_GetReviewNumAndPoints ()
--RETURNS @ReviewAndPoints TABLE (hotel_id INT)
--BEGIN
--	return 
--END
--GO

--exec USP_GetAllAccommodations
declare @res INT
--exec @res = USP_SearchByName @search_query = N'hotel'
--print @res