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

--!Hotel và Room
CREATE TABLE HOTEL
(
	hotel_id INTEGER,
	hotel_name NVARCHAR(100),
	country NVARCHAR(20), -- not null
	province_city NVARCHAR(20), -- not null
	full_address NVARCHAR(100),
	stars INT,
	rating FLOAT,
	hotel_description NVARCHAR(1000),
	PRIMARY KEY (hotel_id)
)


CREATE TABLE ROOM_TYPE
(
	hotel_id INTEGER,
	room_type_id INTEGER,
	room_type_name NVARCHAR(100),
	vacancy INTEGER,
	size FLOAT,
	price FLOAT,
	room_info NVARCHAR(1000),
	room_view NVARCHAR(1000),
	facilities NVARCHAR(1000),
	Smoking NVARCHAR(100),
	PRIMARY KEY (hotel_id, room_type_id)
)


CREATE TABLE ROOM_PICTURE
(
	hotel_id INTEGER,
	room_type_id INTEGER,
	picture_link VARCHAR(100),

	PRIMARY KEY (hotel_id, room_type_id, picture_link)
)

--! Acco và payment method
CREATE TABLE ACCOUNT
(
	account_id INTEGER,
	account_email VARCHAR(50),
	account_password VARCHAR(50),
	member_points INTEGER,
	PRIMARY KEY (account_id)
)

CREATE TABLE PERSONAL_DETAILS
(
	account_id INTEGER,
	full_name NVARCHAR(1000),
	email_adress NVARCHAR(100),
	phone_number NVARCHAR(100),
	date_of_birth DATE,
	gender NVARCHAR(100),
	PRIMARY KEY (account_id)
)

CREATE TABLE PAYMENT_METHOD
(
	account_id INTEGER,
	cardholder NVARCHAR(1000),
	card_numver NVARCHAR(100),
	expir_date NVARCHAR(10),
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

CREATE TABLE REVIEW
(
	hotel_id INTEGER,
	account_id INTEGER,
	points FLOAT,
	review NVARCHAR(1000),

	-- review chung cho khách sạn, có j sau này thêm thông tin phòng ở + các tiêu chí khác dô sau.
	-- mỗi người đc 1 lần review, nếu review lại sẽ là chỉnh sửa. V cho nó dễ sài

	PRIMARY KEY (hotel_id, account_id)
)

-------------------------------------------------
--!Room 
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
--!Account
ALTER TABLE PERSONAL_DETAILS
ADD
	CONSTRAINT FK_PERSONAL_DETAILS_ACCOUNT
	FOREIGN KEY(account_id)
	REFERENCES ACCOUNT

ALTER TABLE PAYMENT_METHOD
ADD
	CONSTRAINT FK_PAYMENT_METHOD_ACCOUNT
	FOREIGN KEY(account_id)
	REFERENCES ACCOUNT

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

-- đánh giá
ALTER TABLE REVIEW
ADD
	CONSTRAINT FK_REVIEW_HOTEL
	FOREIGN KEY(hotel_id)
	REFERENCES HOTEL

ALTER TABLE REVIEW
ADD
	CONSTRAINT FK_REVIEW_ACCOUNT
	FOREIGN KEY(account_id)
	REFERENCES ACCOUNT

-------------------------------------------------

--!add account
INSERT INTO ACCOUNT VALUES (1, 'abc@gmail.com', 'abc123', 100);
INSERT INTO ACCOUNT VALUES (2, 'bibizero@gmail.com', 'abc123', 45);
INSERT INTO ACCOUNT VALUES (3, 'meme13@gmail.com', 'abc123', 20);
INSERT INTO ACCOUNT VALUES (4, 'titanic9@gmail.com', 'abc123', 120);
INSERT INTO ACCOUNT VALUES (5, 'gaianime@gmail.com', 'abc123', 60);

--!add personal information
INSERT INTO PERSONAL_DETAILS VALUES (1, N'Trần Văn A', 'abc@gmail.com', '0966188620', '1990-01-01', N'Nam');
INSERT INTO PERSONAL_DETAILS VALUES (2, N'Nguyễn Văn B', 'bibizero@gmail.com', '0966188621', '1999-02-01', N'Nữ');
INSERT INTO PERSONAL_DETAILS VALUES (3, N'Ngô Bá K', 'meme13@gmail.com', '0966188622', '1980-01-03', N'Nam');
INSERT INTO PERSONAL_DETAILS VALUES (4, N'Lê C', 'titanic9@gmail.com', '0966188623', '1990-01-05', N'Nữ');
INSERT INTO PERSONAL_DETAILS VALUES (5, N'Trần D', 'gaianime@gmail.com', '0966188624', '1990-01-06', N'Nam');

--!add hotel and room upcoming sau :))


-- INSERT INTO HOTEL VALUES (1, N'Khách sạn 1', N'Việt Nam', N'Tp. Hồ Chí Minh', 3)
-- INSERT INTO HOTEL VALUES (2, N'Khách sạn 2', N'Việt Nam', N'Tp. Hồ Chí Minh', 3)
-- INSERT INTO HOTEL VALUES (3, N'Khách sạn 3', N'Việt Nam', N'Tp. Hồ Chí Minh', 3)


-- INSERT INTO ROOM_TYPE VALUES (1, 1, N'Phòng vip 1', 10, 300000, N'Phòng vip view biển')
-- INSERT INTO ROOM_TYPE VALUES (1, 2, N'Phòng vip 2', 10, 200000, N'Phòng vip view núi')

-- INSERT INTO ROOM_TYPE VALUES (2, 1, N'Phòng nhỏ 1', 10, 80000, N'Phòng không vip view không núi')

-- INSERT INTO ROOM_PICTURE VALUES (1, 1, 'hanoi.com')


-- INSERT INTO ACCOUNT VALUES (1, 'cuong31247@gmail.com', '123456', 0)
-- INSERT INTO ACCOUNT VALUES (2, 'lvdat20@clc.fitus.edu.vn', '123456', 0)


-- INSERT INTO BOOKING_ACCOUNT VALUES (1, 2, 1, '2023-06-21', '2023-06-22', 1)

select * from HOTEL
