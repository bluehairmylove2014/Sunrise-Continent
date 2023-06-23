USE MASTER
GO

IF DB_ID('Sunrise_continent_db') IS NOT NULL
	DROP DATABASE Sunrise_continent_db
GO

CREATE DATABASE Sunrise_continent_db
GO

USE Sunrise_continent_db
GO


--CREATE TABLE HOTEL_LOCATION
--(
--	country NVARCHAR(20),
--	province_city NVARCHAR(20),

--	PRIMARY KEY (country, province_city)
--)


CREATE TABLE HOTEL
(
	hotel_id INTEGER,
	hotel_name NVARCHAR(100),
	country NVARCHAR(20), -- not null
	province_city NVARCHAR(20), -- not null
	stars INTEGER,

	PRIMARY KEY (hotel_id)
)


CREATE TABLE ROOM_TYPE
(
	hotel_id INTEGER,
	room_type_id INTEGER,
	room_type_name NVARCHAR(100),
	vacancy INTEGER,
	price FLOAT,
	more_info NVARCHAR(100),

	PRIMARY KEY (hotel_id, room_type_id)
)


CREATE TABLE ROOM_PICTURE
(
	hotel_id INTEGER,
	room_type_id INTEGER,
	picture_link VARCHAR(100),

	PRIMARY KEY (hotel_id, room_type_id, picture_link)
)


CREATE TABLE ACCOUNT
(
	account_id INTEGER,
	account_email VARCHAR(50),
	account_password VARCHAR(50),
	member_points INTEGER,

	PRIMARY KEY (account_id)
)


CREATE TABLE BOOKING_ACCOUNT
(
	account_id INTEGER,
	hotel_id INTEGER,
	room_type INTEGER,
	check_in DATE,
	check_out DATE,
	num_of_room INTEGER,

	PRIMARY KEY (hotel_id, room_type, check_in)
)


CREATE TABLE CATEGORY
(
	category_name NVARCHAR(50),
	sub_category NVARCHAR(50),

	PRIMARY KEY (category_name, sub_category)
)

-------------------------------------------------

ALTER TABLE ROOM_TYPE
ADD
	CONSTRAINT FK_ROOM_TYPE_HOTEL
	FOREIGN KEY(hotel_id)
	REFERENCES HOTEL

ALTER TABLE ROOM_PICTURE
ADD
	CONSTRAINT FK_ROOM_PICTURE_ROOM_TYPE
	FOREIGN KEY(hotel_id, room_type_id)
	REFERENCES ROOM_TYPE

ALTER TABLE BOOKING_ACCOUNT
ADD
	CONSTRAINT FK_BOOKING_ACCOUNT_ROOM_TYPE
	FOREIGN KEY(hotel_id, room_type)
	REFERENCES ROOM_TYPE

ALTER TABLE BOOKING_ACCOUNT
ADD
	CONSTRAINT FK_BOOKING_ACCOUNT_ACCOUNT
	FOREIGN KEY(account_id)
	REFERENCES ACCOUNT

-------------------------------------------------


INSERT INTO HOTEL VALUES (1, N'Khách sạn 1', N'Việt Nam', N'Tp. Hồ Chí Minh', 3)
INSERT INTO HOTEL VALUES (2, N'Khách sạn 2', N'Việt Nam', N'Tp. Hồ Chí Minh', 3)
INSERT INTO HOTEL VALUES (3, N'Khách sạn 3', N'Việt Nam', N'Tp. Hồ Chí Minh', 3)


INSERT INTO ROOM_TYPE VALUES (1, 1, N'Phòng vip 1', 10, 300000, N'Phòng vip view biển')
INSERT INTO ROOM_TYPE VALUES (1, 2, N'Phòng vip 2', 10, 200000, N'Phòng vip view núi')

INSERT INTO ROOM_TYPE VALUES (2, 1, N'Phòng nhỏ 1', 10, 80000, N'Phòng không vip view không núi')

INSERT INTO ROOM_PICTURE VALUES (1, 1, 'hanoi.com')


INSERT INTO ACCOUNT VALUES (1, 'cuong31247@gmail.com', '123456', 0)
INSERT INTO ACCOUNT VALUES (2, 'lvdat20@clc.fitus.edu.vn', '123456', 0)


INSERT INTO BOOKING_ACCOUNT VALUES (1, 2, 1, '2023-06-21', '2023-06-22', 1)

select * from HOTEL
