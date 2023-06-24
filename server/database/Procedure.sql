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

IF OBJECT_ID('USP_GetAllAccommodations') IS NOT NULL
	DROP PROC USP_GetAllAccommodations
GO
CREATE PROC USP_GetAllAccommodations 
AS
	SELECT hotel_id id, hotel_name as name, full_address as address, stars, 
			dbo.USF_GetReviewNum(hotel_id) reviews, 
			dbo.USF_GetAvgReview(hotel_id) points
	FROM HOTEL
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

exec USP_GetAllAccommodations

--print dbo.USF_GetReviewNum(2)