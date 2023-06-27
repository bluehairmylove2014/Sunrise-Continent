USE Sunrise_continent_db
GO

IF OBJECT_ID('USF_GetReviewNum') IS NOT NULL
	DROP FUNCTION USF_GetReviewNum
GO
CREATE FUNCTION USF_GetReviewNum (@hotel_id INT)
RETURNS INT
BEGIN
	declare @Value INT
	SET @Value = (SELECT COUNT(*) FROM REVIEW WHERE hotel_id = @hotel_id)
    RETURN @Value
END
GO

IF OBJECT_ID('USF_GetAvgReview') IS NOT NULL
	DROP FUNCTION USF_GetAvgReview
GO
CREATE FUNCTION USF_GetAvgReview (@hotel_id INT)
RETURNS FLOAT
BEGIN
	declare @Value FLOAT
	SET @Value = (SELECT AVG(points) FROM REVIEW WHERE hotel_id = @hotel_id)
	IF @Value IS NULL RETURN 0
    RETURN @Value
END
GO

IF OBJECT_ID('USF_GetMinRoomPrice') IS NOT NULL
	DROP FUNCTION USF_GetMinRoomPrice
GO
CREATE FUNCTION USF_GetMinRoomPrice (@hotel_id INT)
RETURNS FLOAT
BEGIN
	declare @Value FLOAT
	SET @Value = (SELECT MIN(price) FROM ROOM_TYPE WHERE hotel_id = @hotel_id)
	IF @Value IS NULL RETURN 0
    RETURN @Value
END
GO

IF OBJECT_ID('USP_GetAllAccommodations') IS NOT NULL
	DROP PROC USP_GetAllAccommodations
GO
CREATE PROC USP_GetAllAccommodations 
AS
	SELECT hotel_id id, hotel_name as name, full_address as address, stars,
			preview_img as preview,
			dbo.USF_GetReviewNum(hotel_id) reviews, 
			dbo.USF_GetAvgReview(hotel_id) points,
			dbo.USF_GetMinRoomPrice(hotel_id) price
	FROM HOTEL
GO

IF OBJECT_ID('USP_SearchByName') IS NOT NULL
	DROP PROC USP_SearchByName
GO
CREATE PROC USP_SearchByName 
	@search_query NVARCHAR(100)
AS
	IF NOT EXISTS (select * from HOTEL where hotel_description like (N'%' + @search_query + N'%'))
	BEGIN
		RETURN 0
	END

	SELECT hotel_id id, hotel_name as name, full_address as address, stars,
			preview_img as preview,
			dbo.USF_GetReviewNum(hotel_id) reviews, 
			dbo.USF_GetAvgReview(hotel_id) points,
			dbo.USF_GetMinRoomPrice(hotel_id) price
	FROM HOTEL
	WHERE hotel_description like (N'%' + @search_query + N'%')

	RETURN 1
GO

IF OBJECT_ID('USP_GetHotelRoomType') IS NOT NULL
	DROP PROC USP_GetHotelRoomType
GO
CREATE PROC USP_GetHotelRoomType 
	@hotel_id INT
AS
	IF NOT EXISTS (select * from HOTEL where hotel_id = @hotel_id)
	BEGIN
		RETURN 0
	END

	select * from ROOM_TYPE rt
	where rt.hotel_id = @hotel_id

	RETURN 1
GO

IF OBJECT_ID('USP_GetHotelRoomPicture') IS NOT NULL
	DROP PROC USP_GetHotelRoomPicture
GO
CREATE PROC USP_GetHotelRoomPicture 
	@hotel_id INT,
	@room_id INT
AS
	IF NOT EXISTS (select * from HOTEL where hotel_id = @hotel_id)
	BEGIN
		RETURN 0
	END

	select * from ROOM_PICTURE rp
	where rp.hotel_id = @hotel_id and rp.room_type_id = @room_id

	RETURN 1
GO

--IF OBJECT_ID('USF_GetReviewNumAndPoints') IS NOT NULL
--	DROP FUNCTION USP_GetReviewNumAndPoints
--GO
--CREATE FUNCTION USP_GetReviewNumAndPoints ()
--RETURNS @ReviewAndPoints TABLE (hotel_id INT)
--BEGIN
--	return 
--END
--GO

--exec USP_GetAllAccommodations
declare @res INT
--exec @res = USP_SearchByName @search_query = N'hotel'
--print @res


--exec @res = USP_GetHotelRoomType @hotel_id = 2
--print @res

exec @res = USP_GetHotelRoomPicture @hotel_id = 2, @room_id = 1
print @res

--print dbo.USF_GetReviewNum(2)