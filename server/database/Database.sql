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

--! đánh giá
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

--!add hotel 
INSERT INTO HOTEL VALUES(1, N'Triple E Hotel Metro Ben Thanh', N'Việt Nam', N'Hồ Chí Minh',
	 N'Phường Nguyễn Thái Bình 146- 148 Đường Ký Con, District 1, Ho Chi Minh City, Vietnam',
	 3, 8.8, 
	 N'Tọa lạc ở Thành phố Hồ Chí Minh, cách Bảo tàng Mỹ thuật 300 m, Triple E Hotel Metro Ben Thanh cung cấp chỗ nghỉ 3 sao với trung tâm thể dục.Khách sạn 3 sao này cung cấp WiFi miễn phí, dịch vụ phòng và dịch vụ lễ tân 24 giờ. Nhân viên tại đây có thể thu xếp dịch vụ đưa đón cho khách.');

INSERT INTO HOTEL VALUES(2, N'Nexus House Thao Dien', N'Việt Nam', N'Hồ Chí Minh',
	N'8/9 Võ Trường Toản, An Phú, Quận 2, TP. Hồ Chí Minh, Việt Nam',
 	0, 9.5,
	N'Located 6.3 km from Vietnam History Museum, Nexus House Thao Dien offers a garden, a terrace and air-conditioned accommodation with a balcony and free WiFi.');

INSERT INTO HOTEL VALUES(3, N'Landmark Plus Luxury - Vinhomes Central Park', N'Việt Nam', N'Hồ Chí Minh', 
	N'Phường Nguyễn Thái Bình 146- 148 Đường Ký Con, District 1, Ho Chi Minh City, Vietnam',
	0, 8.1, 
	N'Tọa lạc tại Thành phố Hồ Chí Minh, Landmark Plus Luxury - Vinhomes Central Park cung cấp chỗ nghỉ với hồ bơi ngoài trời, khu vườn, sảnh khách chung, sân hiên, quầy bar và tầm nhìn ra thành phố.');

--!add room type 

--todo Triple E Hotel Metro Ben Thanh
INSERT INTO ROOM_TYPE VALUES(1, 1, N'Suite Deluxe', 5, 32, 4950000,
	N'Suite này có 1 giường đôi cực lớn, 1 giường sofa, TV màn hình phẳng, máy điều hòa và ấm đun nước điện,minibar',
	N'Hướng nhìn sân trong',
	N'Bàn làm việc,Két an toàn,TV màn hình phẳng,Dịch vụ báo thức,Khăn tắm,Giường xếp,Tủ lạnh,Minibar,Ấm đun nước điện,Điện thoại,Điều hòa không khí,Giá treo quần áo,Nước rửa tay',
	N'Không hút thuốc');

INSERT INTO ROOM_TYPE VALUES(1, 2, N'Suite Nhìn Ra Thành Phố', 3, 32, 5670000,
	N'Suite này có 1 giường đôi cực lớn, 1 giường sofa, TV màn hình phẳng, máy điều hòa và ấm đun nước điện,minibar',
	N'Nhìn ra địa danh nổi tiếng,Nhìn ra thành phố',
	N'Bàn làm việc,Két an toàn,TV màn hình phẳng,Dịch vụ báo thức,Khăn tắm,Giường xếp,Tủ lạnh,Minibar,Ấm đun nước điện,Điện thoại,Điều hòa không khí,Giá treo quần áo,Nước rửa tay',
	N'Không hút thuốc');

INSERT INTO ROOM_TYPE VALUES(1, 3, N'Suite Junior', 10, 28, 3150000,
	N'Suite này có 1 giường đôi cực lớn, 1 giường sofa, TV màn hình phẳng, máy điều hòa và ấm đun nước điện,minibar',
	N'Nhìn ra thành phố',
	N'Bàn làm việc,Két an toàn,TV màn hình phẳng,Dịch vụ báo thức,Khăn tắm,Giường xếp,Tủ lạnh,Minibar,Ấm đun nước điện,Điện thoại,Điều hòa không khí,Giá treo quần áo,Nước rửa tay',
	N'Không hút thuốc');

--todo Nexus House Thao Dien
INSERT INTO ROOM_TYPE VALUES(2, 4, N'Studio Nhìn Ra Vườn', 7, 35, 1870000,
	N'Studio này có 1 giường đôi lớn, có ban công, lối vào riêng và ghế sofa.',
	N'Ban công,Nhìn ra vườn',
	N'Bếp,Tủ lạnh,Lò vi sóng,Đồ bếp,Ấm đun nước điện,Máy giặt,Bàn ghế ngoài trời,Lò nướng,Bếp nấu,Bàn làm việc,TV màn hình phẳng,Lò nướng,Đồng hồ báo thức',
	N'Không hút thuốc');

INSERT INTO ROOM_TYPE VALUES(2, 5, N'Căn Hộ Có Ban Công', 5, 40,2380000,
	N'Căn hộ này có 1 giường đôi lớn,1 giường sofa, có ban công, nhà bếp',
	N'Ban công,Nhìn ra thành phố',
	N'Bếp,Tủ lạnh,Lò vi sóng,Đồ bếp,Ấm đun nước điện,Máy giặt,Bàn ghế ngoài trời,Lò nướng,Bếp nấu,Bàn làm việc,TV màn hình phẳng,Lò nướng,Đồng hồ báo thức',
	N'Không hút thuốc');

INSERT INTO ROOM_TYPE VALUES(2, 6, N'Căn Hộ Studio', 5, 40,2422500,
	N'Căn hộ này có 1 giường đôi lớn,1 giường sofa, có ban công,lối vào riêng,nhà bếp',
	N'Ban công,Nhìn ra thành phố',
	N'Bếp,Tủ lạnh,Lò vi sóng,Đồ bếp,Ấm đun nước điện,Máy giặt,Bàn ghế ngoài trời,Lò nướng,Bếp nấu,Bàn làm việc,TV màn hình phẳng,Lò nướng,Đồng hồ báo thức',
	N'Không hút thuốc');

--todo Landmark Plus Luxury - Vinhomes Central Park
INSERT INTO ROOM_TYPE VALUES(3, 7, N'Căn hộ Deluxe', 10, 55,2475000,
	N'Căn hộ này có 1 giường đôi lớn, ban công, TV truyền hình cáp và đồ bếp.',
	N'Ban công,Sân hiên,Nhìn ra vườn,Nhìn ra hồ bơi,Nhìn ra địa danh nổi tiếng,Nhìn ra thành phố,Nhìn ra sông,Hướng nhìn sân trong,Sân trong',
	N'Bếp,Ghế cao dành cho trẻ em,Tủ lạnh,Lò vi sóng,Đồ bếp,Minibar,Ấm đun nước điện,Bàn ghế ngoài trời,Khu vực ăn uống ngoài trời,Bếp nấu,Máy nướng bánh mỳ,Khu vực phòng ăn,Bàn ăn,Bàn làm việc,TV màn hình phẳng,Đồng hồ báo thức,Bàn ghế ngoài trời,Bàn ủi,Quạt máy,Tiện nghi ủi,Khu vực tiếp khách,Lò vi sóng,Hồ bơi riêng',
	N'Không hút thuốc');

INSERT INTO ROOM_TYPE VALUES(3, 8, N'Căn Hộ Có Ban Công', 20, 55,2500000,
	N'Căn hộ này có 1 giường đôi lớn,  ban công, sàn lát gạch/đá cẩm thạch và hồ bơi riêng.',
	N'Ban công,Sân hiên,Nhìn ra vườn,Nhìn ra hồ bơi,Nhìn ra địa danh nổi tiếng,Nhìn ra thành phố,Nhìn ra sông,Hướng nhìn sân trong,Sân trong',
	N'Bếp,Ghế cao dành cho trẻ em,Tủ lạnh,Lò vi sóng,Đồ bếp,Minibar,Ấm đun nước điện,Bàn ghế ngoài trời,Khu vực ăn uống ngoài trời,Bếp nấu,Máy nướng bánh mỳ,Khu vực phòng ăn,Bàn ăn,Bàn làm việc,TV màn hình phẳng,Đồng hồ báo thức,Bàn ghế ngoài trời,Bàn ủi,Quạt máy,Tiện nghi ủi,Khu vực tiếp khách,Lò vi sóng,Hồ bơi riêng',
	N'Không hút thuốc');

INSERT INTO ROOM_TYPE VALUES(3, 9, N'Căn Hộ 2 Phòng Ngủ', 8, 79,3240000,
	N'Căn hộ này có 2 giường đôi lớn,ban công, lối vào riêng và bếp nấu ăn.',
	N'Ban công,Sân hiên,Nhìn ra vườn,Nhìn ra hồ bơi,Nhìn ra địa danh nổi tiếng,Nhìn ra thành phố,Nhìn ra sông,Hướng nhìn sân trong,Sân trong',
	N'Bếp,Ghế cao dành cho trẻ em,Tủ lạnh,Lò vi sóng,Đồ bếp,Minibar,Ấm đun nước điện,Bàn ghế ngoài trời,Khu vực ăn uống ngoài trời,Bếp nấu,Máy nướng bánh mỳ,Khu vực phòng ăn,Bàn ăn,Bàn làm việc,TV màn hình phẳng,Đồng hồ báo thức,Bàn ghế ngoài trời,Bàn ủi,Quạt máy,Tiện nghi ủi,Khu vực tiếp khách,Lò vi sóng,Hồ bơi riêng',
	N'Không hút thuốc');

--! add room picture 
--todo Triple E Hotel Metro Ben Thanh





