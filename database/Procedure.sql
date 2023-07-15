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


--drop function dbo.USF_GetNextAccountId

CREATE OR ALTER PROC USP_GetAllAccount
AS
	SELECT * FROM ACCOUNT
GO

CREATE OR ALTER PROC USP_GetNextAccountId(
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

		RETURN @IntVariable;
	END

	RETURN @IntVariable + 1; 
GO


CREATE OR ALTER PROC USP_AddAccount
	--@Id INTEGER,
	--@MemberPoint INTEGER,
	@Username VARCHAR(50),
	@PasswordHash VARCHAR(500),
	@PasswordSalt VARCHAR(500),
	@UserRole VARCHAR(50)
AS
	BEGIN TRY
		DECLARE @Id INT
		EXEC @Id = USP_GetNextAccountId 'ACCOUNT', 'Id'

		INSERT INTO ACCOUNT (Id, MemberPoint, Username, PasswordHash, PasswordSalt, UserRole) VALUES (@Id, 0, @Username, @PasswordHash, @PasswordSalt, @UserRole)
		RETURN 0
	END TRY

	BEGIN CATCH
		PRINT N'Account insertion error'
		RETURN 1
	END CATCH
GO

Select * from ACCOUNT


--declare @Test1 VARBINARY(100)
--SET @Test1 = CONVERT(VARBINARY(100), '0x9473FBCCBC01AF', 1)
--exec dbo.USP_AddAccount
--	@Username = 'hahaha31247', 
--	@PasswordHash = @Test1, 
--	@PasswordSalt = @Test1, 
--	@RefreshToken = 'VCL', 
--	@TokenCreated = '07-21-2023', 
--	@TokenExpires = '07-21-2026';
--GO

exec dbo.USP_AddAccount 
	@Username = 'string', 
	@PasswordHash = '02aae36cd942563781d4d6b585c6709bd98f3a956b02788441a44e36440a006783e3618ac5cfb3cca8e17ebde6b8fbe0bfb0ab86bcdb850cf25bffd1b880949f', 
	@PasswordSalt = '36587a5573c37d53a9260a5da14d1738d7214010210011532a4de41f9c214d37b23bdc7df6a7df45d344862a778b40fa9132b383f419ed432d96339362c136f58e4afe1281bc8671d09f8d225a2a07ab42a014456f32a735216b3a73e33dbe39ab8bbb7a560040d3c021c8c103b8f92dc96df68f70bf35cd4d0f3e681b48832d',
	@UserRole = "User"

select * from ACCOUNT
delete from ACCOUNT where Username like 'string'
--delete from ACCOUNT where Id in (3, 5)

--DECLARE @IntVariable INT = -10;
--DECLARE @SQL NVARCHAR(MAX)
--DECLARE @ParmDefinition NVARCHAR(500);
--SET @SQL = N'select @IdOUT = count(Id) from ACCOUNT';
--SET @ParmDefinition = N'@IdOUT INTEGER OUTPUT';
--EXEC sp_executesql @SQL, @ParmDefinition, @IdOUT = @IntVariable OUTPUT;
--IF (@IntVariable IS NULL)
--	PRINT N'Vờ lờ'
--ELSE
--	PRINT @IntVariable

--DECLARE @res INT
--exec @res = USP_GetNextAccountId 'ACCOUNT', 'Id'
--print @res

--select count (Id) from ACCOUNT

--GO
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
			PRINT N'Account Id existed'
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

--declare @Test1 VARBINARY(100)
--SET @Test1 = CONVERT(VARBINARY(100), '0x9473FBCCBC01AF', 1)
--exec dbo.USP_UpdateAccount 
--	@Id = 3,
--	@MemberPoint = 10,
--	@Username = 'xinchao', 
--	@PasswordHash = @Test1, 
--	@PasswordSalt = @Test1, 
--	@RefreshToken = 'VCL', 
--	@TokenCreated = '07-21-2023', 
--	@TokenExpires = '07-21-2026';
--GO


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


--exec dbo.USP_DeleteAccount @Id = 5
--select * from ACCOUNT


----CREATE OR ALTER FUNCTION USP_GetReviewNumAndPoints ()
----RETURNS @ReviewAndPoints TABLE (hotel_id INT)
----BEGIN
----	return 
----END
----GO



----exec USP_GetAllAccommodations
----exec @res = USP_SearchByName @search_query = N'hotel'
----print @res


--select * from ACCOUNT

--declare @res INT
--set @res = (select MAX(Id) from ACCOUNT)

----if exists (select @res = MAX(Id) from ACCOUNT)
--Go

--print dbo.USF_GetNextAccountId()

