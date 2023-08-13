﻿USE MASTER
GO

DROP DATABASE IF EXISTS [sunrise-hotel];
GO

CREATE DATABASE [sunrise-hotel]
GO

USE [sunrise-hotel]
GO

--!Hotel 
CREATE TABLE HOTEL
(
	Id INT,
	Name NVARCHAR(100),
	Country NVARCHAR(100),
	HotelType VARCHAR(100),
	ProvinceCity NVARCHAR(100),  
	Address NVARCHAR(100),
	Stars INT,
	Rating FLOAT,
	Description NVARCHAR(1000),
	Image NVARCHAR(1000),

	PRIMARY KEY (Id)
)


--!ROOM TYPE 
CREATE TABLE ROOM_TYPE
(
	HotelId INTEGER,
	Id INTEGER,
	Name NVARCHAR(100),
	Vacancy INTEGER,
	Size FLOAT,
	Price FLOAT,
	RoomInfo NVARCHAR(1000),
	RoomView NVARCHAR(1000),
	BedType VARCHAR(100),

	PRIMARY KEY (HotelId, Id)
)

--! MORE INFOR ABOUT ROOM TYPE
CREATE TABLE FACILITY_CONST
(
	Id INT,
	Value VARCHAR(100),

	PRIMARY KEY (Id)
)

CREATE TABLE SERVICE_CONST
(
	Id INT,
	Value VARCHAR(100),

	PRIMARY KEY (Id)
)

CREATE TABLE ROOM_FACILITY
(
	HotelId INT,
	RoomId INT,
	FacilityId INT,

	PRIMARY KEY (HotelId, RoomId, FacilityId)
)

CREATE TABLE ROOM_SERVICE
(
	HotelId INT,
	RoomId INT,
	ServiceId INT,

	PRIMARY KEY (HotelId, RoomId, ServiceId)
)


CREATE TABLE ROOM_PICTURE
(
	HotelId INTEGER,
	RoomTypeId INTEGER,
	Id INTEGER,
	PictureLink VARCHAR(1000),

	PRIMARY KEY (HotelId, RoomTypeId, Id)
)

--! voucher
CREATE TABLE VOUCHER
(
	VoucherId INT,
	Name NVARCHAR(500),
	Value FLOAT, --!% giam
	Point INT,
	AccountRank VARCHAR(20),
	
	PRIMARY KEY (VoucherId)
)

--! Inventory
CREATE TABLE VOUCHER_BAG
(
	AccountId INT,
	VoucherId INT,
	Quantity INT,

	PRIMARY KEY(AccountId,VoucherId)
)

--! Acco và payment method
CREATE TABLE ACCOUNT
(
	Id INTEGER,
    MemberPoint INTEGER,
	AccountRank VARCHAR(20),
        
    Email VARCHAR(50),
    PasswordHash VARCHAR(500),
    PasswordSalt VARCHAR(500),
    UserRole VARCHAR(50),
    RefreshToken VARCHAR(200),
    TokenCreated DATETIME,
    TokenExpires DATETIME,

    PRIMARY KEY (Id)
)

--! bảng lịch sử gd điểm 
CREATE TABLE POINT_RANK
(
	RankName VARCHAR(20),
	RankValue INT,

	PRIMARY KEY(RankName, RankValue)
)

CREATE TABLE POINT_HISTORY
(
	AccountId INT,
	Value INT,
	RecordedTime VARCHAR(30),

	PRIMARY KEY(AccountId, RecordedTime)
)

CREATE TABLE PERSONAL_DETAILS
(
	AccountId INTEGER,
	FullName NVARCHAR(1000),
	EmailAddress VARCHAR(100),
	PhoneNumber VARCHAR(20),
	DateOfBirth DATE,
	Gender NVARCHAR(100),
	Image VARCHAR(1000),
	Rank VARCHAR(20),

	PRIMARY KEY (AccountId)
)

CREATE TABLE PAYMENT_METHOD
(
	AccountId INTEGER,
	MethodId INTEGER,
	CardHolder NVARCHAR(1000),
	CardNumber VARCHAR(20),
	ExpiryDate DATE,

	PRIMARY KEY (AccountId, MethodId)
)

CREATE TABLE BOOKING_ACCOUNT
(
	BookingId INT,
	AccountId INT,
	HotelId INT,
	RoomTypeId INT,
	CheckIn DATE,
	CheckOut DATE,
	NumberOfRoom INT,

	PRIMARY KEY (BookingId)
)

CREATE TABLE ACCOUNT_ORDER
(
	OrderId INT,
	AccountId INT,

	FullName NVARCHAR(200),
	Nation NVARCHAR(50),
	DateOfBirth DATE,
	Email VARCHAR(200),
	PhoneNumber VARCHAR(20),
	SpecialNeeds NVARCHAR(500),
	Notes NVARCHAR(500),

	VoucherId INT,
	Total INT,
	Paid BIT, -- 1 = True, 0 = False
	CreatedAt VARCHAR(30),
	--OrderStatus VARCHAR(10),

	PRIMARY KEY (OrderId)
)

CREATE TABLE ORDER_DETAIL
(
	OrderId INT,
	BookingId INT,
	
	PRIMARY KEY (OrderId, BookingId)
)

CREATE TABLE REVIEW
(
	ReviewId BIGINT,
	AccountId INT,
	HotelId INT,
	ReviewDate DATETIME,
	Points FLOAT,
	Content NVARCHAR(1000),

	PRIMARY KEY (ReviewId)
)

CREATE TABLE REVIEW_IMAGE
(
	ReviewId BIGINT,
	ImageLink VARCHAR(1000),

	PRIMARY KEY (ReviewId)
)


-------------------------------------------------
--!HOTEL


--!Room 
ALTER TABLE ROOM_TYPE
ADD
	CONSTRAINT FK_ROOM_TYPE_HOTEL
	FOREIGN KEY(HotelId)
	REFERENCES HOTEL

--!FACILITY
ALTER TABLE ROOM_FACILITY
ADD
	CONSTRAINT FK_ROOM_FACILITY_ROOM_TYPE
	FOREIGN KEY(HotelId, RoomId)
	REFERENCES ROOM_TYPE
	ON DELETE CASCADE


ALTER TABLE ROOM_FACILITY
ADD
	CONSTRAINT FK_ROOM_FACILITY_FACILITY_CONST
	FOREIGN KEY(FacilityId)
	REFERENCES FACILITY_CONST
	ON DELETE CASCADE
--=================================

--! SERVICE
ALTER TABLE ROOM_SERVICE
ADD
	CONSTRAINT FK_ROOM_SERVICE_ROOM_TYPE
	FOREIGN KEY(HotelId, RoomId)
	REFERENCES ROOM_TYPE
	ON DELETE CASCADE

ALTER TABLE ROOM_SERVICE
ADD
	CONSTRAINT FK_ROOM_SERVICE_SERVICE_CONST
	FOREIGN KEY(ServiceId)
	REFERENCES SERVICE_CONST
	ON DELETE CASCADE
--=================================

ALTER TABLE ROOM_PICTURE
ADD
	CONSTRAINT FK_ROOM_PICTURE_ROOM_TYPE
	FOREIGN KEY(HotelId, RoomTypeId)
	REFERENCES ROOM_TYPE
	ON DELETE CASCADE

--!Account
--ALTER TABLE PERSONAL_DETAILS
--ADD
--	CONSTRAINT FK_PERSONAL_DETAILS_ACCOUNT
--	FOREIGN KEY(AccountId)
--	REFERENCES ACCOUNT
--	ON DELETE CASCADE
	
ALTER TABLE PAYMENT_METHOD
ADD
	CONSTRAINT FK_PAYMENT_METHOD_ACCOUNT
	FOREIGN KEY(AccountId)
	REFERENCES ACCOUNT

--! BOOKING - ORDER
ALTER TABLE BOOKING_ACCOUNT
ADD
	CONSTRAINT FK_BOOKING_ACCOUNT_ACCOUNT
	FOREIGN KEY(AccountId)
	REFERENCES ACCOUNT

ALTER TABLE BOOKING_ACCOUNT
ADD
	CONSTRAINT FK_BOOKING_ACCOUNT_ROOM_TYPE
	FOREIGN KEY(HotelId, RoomTypeId)
	REFERENCES ROOM_TYPE
	ON DELETE CASCADE

ALTER TABLE ACCOUNT_ORDER
ADD
	CONSTRAINT FK_ACCOUNT_ORDER_ACCOUNT
	FOREIGN KEY(AccountId)
	REFERENCES ACCOUNT
	ON DELETE CASCADE

ALTER TABLE ORDER_DETAIL
ADD
	CONSTRAINT FK_ORDER_DETAIL_ACCOUNT_ORDER
	FOREIGN KEY(OrderId)
	REFERENCES ACCOUNT_ORDER
	ON DELETE CASCADE

ALTER TABLE ORDER_DETAIL
ADD
	CONSTRAINT FK_ORDER_DETAIL_BOOKING_ACCOUNT
	FOREIGN KEY(BookingId)
	REFERENCES BOOKING_ACCOUNT
	ON DELETE CASCADE

--! VOUCHER
--ALTER TABLE ACCOUNT
--ADD
--	CONSTRAINT FK_ACCOUNT_POINT_RANK
--	FOREIGN KEY(AccountRank)
--	REFERENCES POINT_RANK
--	ON DELETE SET NULL

--ALTER TABLE ACCOUNT_ORDER
--ADD
--	CONSTRAINT FK_ACCOUNT_ORDER_VOUCHER
--	FOREIGN KEY(VoucherId)
--	REFERENCES VOUCHER

ALTER TABLE VOUCHER_BAG
ADD
	CONSTRAINT FK_VOUCHER_BAG_ACCOUNT
	FOREIGN KEY(AccountId)
	REFERENCES ACCOUNT

ALTER TABLE VOUCHER_BAG
ADD
	CONSTRAINT FK_VOUCHER_BAG_VOUCHER
	FOREIGN KEY(VoucherId)
	REFERENCES VOUCHER

ALTER TABLE POINT_HISTORY
ADD
	CONSTRAINT FK_POINT_HISTORY_ACCOUNT
	FOREIGN KEY(AccountId)
	REFERENCES ACCOUNT


--! đánh giá
ALTER TABLE REVIEW
ADD
	CONSTRAINT FK_REVIEW_HOTEL
	FOREIGN KEY(HotelId)
	REFERENCES HOTEL
	ON DELETE CASCADE

--ALTER TABLE REVIEW
--ADD
--	CONSTRAINT FK_REVIEW_ACCOUNT
--	FOREIGN KEY(AccountId)
--	REFERENCES ACCOUNT
--	ON DELETE CASCADE

--ALTER TABLE REVIEW_IMAGE
--ADD
--	CONSTRAINT FK_REVIEW_REVIEW_IMAGE
--	FOREIGN KEY(AccountId, HotelId)
--	REFERENCES REVIEW
--	ON DELETE CASCADE
-------------------------------------------------



