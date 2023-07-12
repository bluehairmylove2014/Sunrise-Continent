USE MASTER
GO

IF DB_ID('SunriseServer') IS NOT NULL
	DROP DATABASE SunriseServer
GO

CREATE DATABASE SunriseServer
GO

USE SunriseServer
GO


--!Hotel và Room
CREATE TABLE HOTEL
(
	Id INTEGER,
	Name NVARCHAR(100),
	HotelType VARCHAR(20),
	Country NVARCHAR(20), -- not null
	ProvinceCity NVARCHAR(20), -- not null
	Address NVARCHAR(100),
	Stars INT,
	Rating FLOAT,
	Description NVARCHAR(1000),
	Image NVARCHAR(1000),

	PRIMARY KEY (Id)
)

-- NEW
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
	Facilites NVARCHAR(1000),
	RoomServices VARCHAR(200),
	Smoking NVARCHAR(100),

	PRIMARY KEY (HotelId, Id)
)

-- NEW
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
	PictureId INTEGER,
	PictureLink VARCHAR(1000),

	PRIMARY KEY (HotelId, RoomTypeId, PictureId)
)

--! Acco và payment method
CREATE TABLE ACCOUNT
(
	Id INTEGER,
    MemberPoint INTEGER,
        
    Username VARCHAR(50),
    PasswordHash VARCHAR(500),
    PasswordSalt VARCHAR(500),

	PRIMARY KEY (Id)
)

CREATE TABLE PERSONAL_DETAILS
(
	AccountId INTEGER,
	FullName NVARCHAR(1000),
	EmailAddress VARCHAR(100),
	PhoneNumber VARCHAR(20),
	DateOfBirth DATE,
	Gender NVARCHAR(100),

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
	AccountId INTEGER,
	HotelId INTEGER,
	RoomTypeId INTEGER,
	CheckIn DATE,
	CheckOut DATE,
	NumberOfRoom INTEGER,

	PRIMARY KEY (AccountId, HotelId, RoomTypeId, CheckIn)
)


CREATE TABLE CATEGORY
(
	Name NVARCHAR(50),
	SubCategory NVARCHAR(50),

	PRIMARY KEY (Name, SubCategory)
)

CREATE TABLE REVIEW
(
	AccountId INTEGER,
	HotelId INTEGER,
	Points FLOAT,
	Content NVARCHAR(1000),

	-- review chung cho khách sạn, có j sau này thêm thông tin phòng ở + các tiêu chí khác dô sau.
	-- mỗi người đc 1 lần review, nếu review lại sẽ là chỉnh sửa. V cho nó dễ sài

	PRIMARY KEY (AccountId, HotelId)
)

CREATE TABLE REVIEW_IMAGE
(
	AccountId INTEGER,
	HotelId INTEGER,
	ImageId INT,
	ImageLink VARCHAR(1000),


	PRIMARY KEY (HotelId, AccountId, ImageId)
)

-------------------------------------------------
--!Room 
ALTER TABLE ROOM_TYPE
ADD
	CONSTRAINT FK_ROOM_TYPE_HOTEL
	FOREIGN KEY(HotelId)
	REFERENCES HOTEL


ALTER TABLE ROOM_FACILITY
ADD
	CONSTRAINT FK_ROOM_FACILITY_ROOM_TYPE
	FOREIGN KEY(HotelId, RoomId)
	REFERENCES ROOM_TYPE


ALTER TABLE ROOM_FACILITY
ADD
	CONSTRAINT FK_ROOM_FACILITY_FACILITY_CONST
	FOREIGN KEY(FacilityId)
	REFERENCES FACILITY_CONST
--=================================
ALTER TABLE ROOM_SERVICE
ADD
	CONSTRAINT FK_ROOM_SERVICE_ROOM_TYPE
	FOREIGN KEY(HotelId, RoomId)
	REFERENCES ROOM_TYPE
ALTER TABLE ROOM_SERVICE
ADD
	CONSTRAINT FK_ROOM_SERVICE_SERVICE_CONST
	FOREIGN KEY(ServiceId)
	REFERENCES SERVICE_CONST
--=================================

ALTER TABLE ROOM_PICTURE
ADD
	CONSTRAINT FK_ROOM_PICTURE_ROOM_TYPE
	FOREIGN KEY(HotelId, RoomTypeId)
	REFERENCES ROOM_TYPE

--!Account
ALTER TABLE PERSONAL_DETAILS
ADD
	CONSTRAINT FK_PERSONAL_DETAILS_ACCOUNT
	FOREIGN KEY(AccountId)
	REFERENCES ACCOUNT
	ON DELETE CASCADE
	
ALTER TABLE PAYMENT_METHOD
ADD
	CONSTRAINT FK_PAYMENT_METHOD_ACCOUNT
	FOREIGN KEY(AccountId)
	REFERENCES ACCOUNT

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


--! đánh giá
ALTER TABLE REVIEW
ADD
	CONSTRAINT FK_REVIEW_HOTEL
	FOREIGN KEY(HotelId)
	REFERENCES HOTEL
	ON DELETE CASCADE

ALTER TABLE REVIEW
ADD
	CONSTRAINT FK_REVIEW_ACCOUNT
	FOREIGN KEY(AccountId)
	REFERENCES ACCOUNT
	ON DELETE CASCADE

ALTER TABLE REVIEW_IMAGE
ADD
	CONSTRAINT FK_REVIEW_REVIEW_IMAGE
	FOREIGN KEY(AccountId, HotelId)
	REFERENCES REVIEW
	ON DELETE CASCADE
-------------------------------------------------

--!add account
--INSERT INTO ACCOUNT VALUES (1, 'abc@gmail.com', 'abc123', 100);
--INSERT INTO ACCOUNT VALUES (2, 'bibizero@gmail.com', 'abc123', 45);
--INSERT INTO ACCOUNT VALUES (3, 'meme13@gmail.com', 'abc123', 20);
--INSERT INTO ACCOUNT VALUES (4, 'titanic9@gmail.com', 'abc123', 120);
--INSERT INTO ACCOUNT VALUES (5, 'gaianime@gmail.com', 'abc123', 60);

----!add personal information
--INSERT INTO PERSONAL_DETAILS VALUES (1, N'Trần Văn A', 'abc@gmail.com', '0966188620', '1990-01-01', N'Nam');
--INSERT INTO PERSONAL_DETAILS VALUES (2, N'Nguyễn Văn B', 'bibizero@gmail.com', '0966188621', '1999-02-01', N'Nữ');
--INSERT INTO PERSONAL_DETAILS VALUES (3, N'Ngô Bá K', 'meme13@gmail.com', '0966188622', '1980-01-03', N'Nam');
--INSERT INTO PERSONAL_DETAILS VALUES (4, N'Lê C', 'titanic9@gmail.com', '0966188623', '1990-01-05', N'Nữ');
--INSERT INTO PERSONAL_DETAILS VALUES (5, N'Trần D', 'gaianime@gmail.com', '0966188624', '1990-01-06', N'Nam');

--!add hotel 
INSERT INTO HOTEL VALUES(1, N'Triple E Hotel Metro Ben Thanh', 'HOTEL', N'Việt Nam', N'Hồ Chí Minh',
	 N'Phường Nguyễn Thái Bình 146- 148 Đường Ký Con, District 1, Ho Chi Minh City, Vietnam',
	 3, 8.8, 
	 N'Tọa lạc ở Thành phố Hồ Chí Minh, cách Bảo tàng Mỹ thuật 300 m, Triple E Hotel Metro Ben Thanh cung cấp chỗ nghỉ 3 sao với trung tâm thể dục.Khách sạn 3 sao này cung cấp WiFi miễn phí, dịch vụ phòng và dịch vụ lễ tân 24 giờ. Nhân viên tại đây có thể thu xếp dịch vụ đưa đón cho khách.',
	 N'temp 1');

INSERT INTO HOTEL VALUES(2, N'Nexus House Thao Dien', 'HOTEL', N'Việt Nam', N'Hồ Chí Minh',
	N'8/9 Võ Trường Toản, An Phú, Quận 2, TP. Hồ Chí Minh, Việt Nam',
 	0, 9.5,
	N'Located 6.3 km from Vietnam History Museum, Nexus House Thao Dien offers a garden, a terrace and air-conditioned accommodation with a balcony and free WiFi.',
	N'temp 2');

INSERT INTO HOTEL VALUES(3, N'Landmark Plus Luxury - Vinhomes Central Park', 'HOTEL', N'Việt Nam', N'Hồ Chí Minh', 
	N'Phường Nguyễn Thái Bình 146- 148 Đường Ký Con, District 1, Ho Chi Minh City, Vietnam',
	0, 8.1, 
	N'Tọa lạc tại Thành phố Hồ Chí Minh, Landmark Plus Luxury - Vinhomes Central Park cung cấp chỗ nghỉ với hồ bơi ngoài trời, khu vườn, sảnh khách chung, sân hiên, quầy bar và tầm nhìn ra thành phố.',
	N'temp 3');

INSERT INTO HOTEL VALUES(4, N'Musketeers Guest House', 'HOTEL', N'Việt Nam', N'Hà Nội', 
	N'21 Ngõ 67 Tô Ngọc Vân Quảng An, Quận Tây Hồ, Hà Nội, Việt Nam',
	0, 9.7, 
	N'Located in Hanoi, 3.2 km from West Lake, Musketeers Guest House provides accommodation with a shared lounge, free private parking, a terrace and a bar. Among the facilities at this property are a 24-hour front desk and a concierge service, along with free WiFi throughout the property. Guests can enjoy garden views.',
	N'temp 4');

INSERT INTO HOTEL VALUES(5, N'Cristina Boutique Hotel', 'HOTEL', N'Việt Nam', N'Hà Nội', 
	N'4A Ngõ Phất Lộc, Quận Hoàn Kiếm, Hà Nội, Việt Nam',
	3, 9.1, 
	N'Situated conveniently in the centre of Hanoi, Cristina Boutique Hotel features 3-star accommodation close to Hanoi Old City Gate and Thang Long Water Puppet Theater. This 3-star hotel has air-conditioned rooms with a private bathroom. The accommodation offers a 24-hour front desk, airport transfers, room service and free WiFi.',
	N'temp 5');

INSERT INTO HOTEL VALUES(6, N'SMARANA Hanoi HERITAGE', 'HOTEL', N'Việt Nam', N'Hà Nội', 
	N'Phường Dịch Vọng Hầu, Quận Cầu Giấy Số 5, Ngõ 82/1 Dịch Vọng Hậu, Cau Giay, Hà Nội, Việt Nam',
	5, 9.7, 
	N'Tọa lạc tại thành phố Hà Nội, cách Bảo tàng Dân tộc học Việt Nam 2,4 km, SMARANA Hanoi HERITAGE có dịch vụ tiền sảnh, phòng nghỉ không hút thuốc, sân hiên, WiFi miễn phí trong toàn bộ khuôn viên và nhà hàng. Khách sạn 5 sao này cung cấp dịch vụ phòng, dịch vụ lễ tân 24 giờ, dịch vụ đưa đón sân bay và dịch vụ cho thuê xe đạp.',
	N'temp 6');

INSERT INTO HOTEL VALUES(7, N'An Hiên Homestay Hội An', 'HOTEL', N'Việt Nam', N'Hội An', 
	N'164 Lý Thái Tổ, phường Cẩm Châu, Cẩm Châu, Hội An, Việt Nam',
	0, 9.6, 
	N'Located in Hoi An, 1.2 km from Hoi An Historic Museum and 1.6 km from Assembly Hall of Chaozhou Chinese Congregation, An Hiên Homestay Hội An provides accommodation with free WiFi, air conditioning, free bikes and a garden.',
	N'temp 7');

INSERT INTO HOTEL VALUES(8, N'iHome Hoi An', 'HOTEL', N'Việt Nam', N'Hội An', 
	N'54 Nguyễn Tri Phương, Cẩm Nam, Hội An, Việt Nam',
	3, 9.2, 
	N'Tọa lạc tại thành phố Hội An, cách Hội quán Triều Châu 600 m, iHome Hoi An cung cấp chỗ nghỉ với trung tâm thể dục, chỗ đỗ xe riêng miễn phí, sân hiên và quầy bar. Khách sạn 3 sao này có dịch vụ phòng và lễ tân 24 giờ. Sân golf Montgomerie Links và CLB chơi golf Montgomerie Links Vietnam đều nằm trong bán kính 15 km từ khách sạn.',
	N'temp 8');

INSERT INTO HOTEL VALUES(9, N'Florida Nha Trang Hotel', 'HOTEL', N'Việt Nam', N'Nha Trang', 
	N'66 Quang Trung, Nha Trang, Việt Nam',
	5, 8.4, 
	N'Tọa lạc tại thành phố Nha Trang, cách Bãi biển Nha Trang 1,5 km, Florida Nha Trang Hotel cung cấp chỗ nghỉ với hồ bơi ngoài trời, chỗ đỗ xe riêng miễn phí, trung tâm thể dục và sảnh khách chung. Khách sạn 5 sao này có CLB trẻ em, dịch vụ phòng, WiFi miễn phí, sân hiên và tầm nhìn ra thành phố. Du khách có thể dùng bữa tại nhà hàng hoặc nhâm nhi đồ uống ở quầy bar.',
	N'temp 9');

INSERT INTO HOTEL VALUES(10, N'Crown Hotel Nha Trang', 'HOTEL', N'Việt Nam', N'Nha Trang', 
	N'19 Dã Tượng, Nha Trang, Việt Nam',
	4, 8.1, 
	N'Tọa lạc tại thành phố Nha Trang, cách Bãi biển Nha Trang 300 m, Crown Hotel Nha Trang cung cấp chỗ nghỉ với trung tâm thể dục, chỗ đỗ xe riêng miễn phí, sảnh khách chung và nhà hàng. Khách sạn 4 sao này có dịch vụ tiền sảnh, bàn đặt tour, lễ tân 24 giờ, dịch vụ đưa đón sân bay, dịch vụ phòng và WiFi miễn phí.',
	N'temp 10');

--!add room type 


INSERT INTO FACILITY_CONST VALUES (1, 'SWIMMING_POOL')
INSERT INTO FACILITY_CONST VALUES (2, 'INTERNET')
INSERT INTO FACILITY_CONST VALUES (3, 'PARKING')
INSERT INTO FACILITY_CONST VALUES (4, 'AIRPORT_SHUTTLE')
INSERT INTO FACILITY_CONST VALUES (5, 'GYM')
INSERT INTO FACILITY_CONST VALUES (6, 'RECEPTION_24H')
INSERT INTO FACILITY_CONST VALUES (7, 'FAMILY_FRIENDLY')
INSERT INTO FACILITY_CONST VALUES (8, 'NON_SMOKING')
INSERT INTO FACILITY_CONST VALUES (9, 'SPA_SAUNA')
INSERT INTO FACILITY_CONST VALUES (10, 'RESTAURANT')
INSERT INTO FACILITY_CONST VALUES (11, 'SMOKING_AREA')
INSERT INTO FACILITY_CONST VALUES (12, 'PETS_ALLOWED')
INSERT INTO FACILITY_CONST VALUES (13, 'NIGHT_CLUB')
INSERT INTO FACILITY_CONST VALUES (14, 'DISABLED_FACILITIES')
INSERT INTO FACILITY_CONST VALUES (15, 'WORK_FACILITIES')
INSERT INTO FACILITY_CONST VALUES (16, 'GOLF_COURSE')


INSERT INTO SERVICE_CONST VALUES (1, 'BREAKFAST_INCLUDED')
INSERT INTO SERVICE_CONST VALUES (2, 'DINNER_INCLUDED')
INSERT INTO SERVICE_CONST VALUES (3, 'FREE_SNACKS')
INSERT INTO SERVICE_CONST VALUES (4, 'LUNCH_INCLUDED')
INSERT INTO SERVICE_CONST VALUES (5, 'AFTERNOON_TEA')


--todo Triple E Hotel Metro Ben Thanh
INSERT INTO ROOM_TYPE VALUES(1, 1, N'Suite Deluxe', 5, 32, 4950000,
	N'Suite này có 1 giường đôi cực lớn, 1 giường sofa, TV màn hình phẳng, máy điều hòa và ấm đun nước điện,minibar',
	N'Hướng nhìn sân trong',
	'DOUBLE',
	N'Bàn làm việc,Két an toàn,TV màn hình phẳng,Dịch vụ báo thức,Khăn tắm,Giường xếp,Tủ lạnh,Minibar,Ấm đun nước điện,Điện thoại,Điều hòa không khí,Giá treo quần áo,Nước rửa tay',
	'BREAKFAST_INCLUDED',
	N'Không hút thuốc');

INSERT INTO ROOM_TYPE VALUES(1, 2, N'Suite Nhìn Ra Thành Phố', 3, 32, 5670000,
	N'Suite này có 1 giường đôi cực lớn, 1 giường sofa, TV màn hình phẳng, máy điều hòa và ấm đun nước điện,minibar',
	N'Nhìn ra địa danh nổi tiếng,Nhìn ra thành phố',
	'DOUBLE',
	N'Bàn làm việc,Két an toàn,TV màn hình phẳng,Dịch vụ báo thức,Khăn tắm,Giường xếp,Tủ lạnh,Minibar,Ấm đun nước điện,Điện thoại,Điều hòa không khí,Giá treo quần áo,Nước rửa tay',
	'BREAKFAST_INCLUDED',
	N'Không hút thuốc');

INSERT INTO ROOM_TYPE VALUES(1, 3, N'Suite Junior', 10, 28, 3150000,
	N'Suite này có 1 giường đôi cực lớn, 1 giường sofa, TV màn hình phẳng, máy điều hòa và ấm đun nước điện,minibar',
	N'Nhìn ra thành phố',
	'DOUBLE',
	N'Bàn làm việc,Két an toàn,TV màn hình phẳng,Dịch vụ báo thức,Khăn tắm,Giường xếp,Tủ lạnh,Minibar,Ấm đun nước điện,Điện thoại,Điều hòa không khí,Giá treo quần áo,Nước rửa tay',
	'BREAKFAST_INCLUDED',
	N'Không hút thuốc');

--! add room facilities
INSERT INTO ROOM_FACILITY VALUES (1, 1, 1)
INSERT INTO ROOM_FACILITY VALUES (1, 1, 2)
INSERT INTO ROOM_FACILITY VALUES (1, 1, 3)
INSERT INTO ROOM_FACILITY VALUES (1, 1, 4)
INSERT INTO ROOM_FACILITY VALUES (1, 1, 5)
INSERT INTO ROOM_FACILITY VALUES (1, 1, 6)
INSERT INTO ROOM_FACILITY VALUES (1, 1, 7)
INSERT INTO ROOM_FACILITY VALUES (1, 1, 8)
INSERT INTO ROOM_FACILITY VALUES (1, 1, 9)

INSERT INTO ROOM_FACILITY VALUES (1, 2, 1)
INSERT INTO ROOM_FACILITY VALUES (1, 2, 2)
INSERT INTO ROOM_FACILITY VALUES (1, 2, 3)
INSERT INTO ROOM_FACILITY VALUES (1, 2, 4)
INSERT INTO ROOM_FACILITY VALUES (1, 2, 5)
INSERT INTO ROOM_FACILITY VALUES (1, 2, 9)

INSERT INTO ROOM_FACILITY VALUES (1, 3, 1)
INSERT INTO ROOM_FACILITY VALUES (1, 3, 2)
INSERT INTO ROOM_FACILITY VALUES (1, 3, 3)
INSERT INTO ROOM_FACILITY VALUES (1, 3, 4)
INSERT INTO ROOM_FACILITY VALUES (1, 3, 5)
INSERT INTO ROOM_FACILITY VALUES (1, 3, 12)

--! add room services
INSERT INTO ROOM_SERVICE VALUES (1, 1, 1)
INSERT INTO ROOM_SERVICE VALUES (1, 2, 2)
INSERT INTO ROOM_SERVICE VALUES (1, 3, 1)


----todo Nexus House Thao Dien
--INSERT INTO ROOM_TYPE VALUES(2, 1, N'Studio Nhìn Ra Vườn', 7, 35, 1870000,
--	N'Studio này có 1 giường đôi lớn, có ban công, lối vào riêng và ghế sofa.',
--	N'Ban công,Nhìn ra vườn',
--	'DOUBLE',
--	N'Bếp,Tủ lạnh,Lò vi sóng,Đồ bếp,Ấm đun nước điện,Máy giặt,Bàn ghế ngoài trời,Lò nướng,Bếp nấu,Bàn làm việc,TV màn hình phẳng,Lò nướng,Đồng hồ báo thức',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(2, 2, N'Căn Hộ Có Ban Công', 5, 40,2380000,
--	N'Căn hộ này có 1 giường đôi lớn,1 giường sofa, có ban công, nhà bếp',
--	N'Ban công,Nhìn ra thành phố',
--	'DOUBLE',
--	N'Bếp,Tủ lạnh,Lò vi sóng,Đồ bếp,Ấm đun nước điện,Máy giặt,Bàn ghế ngoài trời,Lò nướng,Bếp nấu,Bàn làm việc,TV màn hình phẳng,Lò nướng,Đồng hồ báo thức',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(2, 3, N'Căn Hộ Studio', 5, 40,2422500,
--	N'Căn hộ này có 1 giường đôi lớn,1 giường sofa, có ban công,lối vào riêng,nhà bếp',
--	N'Ban công,Nhìn ra thành phố',
--	'DOUBLE',
--	N'Bếp,Tủ lạnh,Lò vi sóng,Đồ bếp,Ấm đun nước điện,Máy giặt,Bàn ghế ngoài trời,Lò nướng,Bếp nấu,Bàn làm việc,TV màn hình phẳng,Lò nướng,Đồng hồ báo thức',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

----todo Landmark Plus Luxury - Vinhomes Central Park
--INSERT INTO ROOM_TYPE VALUES(3, 1, N'Căn hộ Deluxe', 10, 55,2475000,
--	N'Căn hộ này có 1 giường đôi lớn, ban công, TV truyền hình cáp và đồ bếp.',
--	N'Ban công,Sân hiên,Nhìn ra vườn,Nhìn ra hồ bơi,Nhìn ra địa danh nổi tiếng,Nhìn ra thành phố,Nhìn ra sông,Hướng nhìn sân trong,Sân trong',
--	'DOUBLE',
--	N'Bếp,Ghế cao dành cho trẻ em,Tủ lạnh,Lò vi sóng,Đồ bếp,Minibar,Ấm đun nước điện,Bàn ghế ngoài trời,Khu vực ăn uống ngoài trời,Bếp nấu,Máy nướng bánh mỳ,Khu vực phòng ăn,Bàn ăn,Bàn làm việc,TV màn hình phẳng,Đồng hồ báo thức,Bàn ghế ngoài trời,Bàn ủi,Quạt máy,Tiện nghi ủi,Khu vực tiếp khách,Lò vi sóng,Hồ bơi riêng',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(3, 2, N'Căn Hộ Có Ban Công', 20, 55,2500000,
--	N'Căn hộ này có 1 giường đôi lớn,  ban công, sàn lát gạch/đá cẩm thạch và hồ bơi riêng.',
--	N'Ban công,Sân hiên,Nhìn ra vườn,Nhìn ra hồ bơi,Nhìn ra địa danh nổi tiếng,Nhìn ra thành phố,Nhìn ra sông,Hướng nhìn sân trong,Sân trong',
--	'DOUBLE',
--	N'Bếp,Ghế cao dành cho trẻ em,Tủ lạnh,Lò vi sóng,Đồ bếp,Minibar,Ấm đun nước điện,Bàn ghế ngoài trời,Khu vực ăn uống ngoài trời,Bếp nấu,Máy nướng bánh mỳ,Khu vực phòng ăn,Bàn ăn,Bàn làm việc,TV màn hình phẳng,Đồng hồ báo thức,Bàn ghế ngoài trời,Bàn ủi,Quạt máy,Tiện nghi ủi,Khu vực tiếp khách,Lò vi sóng,Hồ bơi riêng',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(3, 3, N'Căn Hộ 2 Phòng Ngủ', 8, 79,3240000,
--	N'Căn hộ này có 2 giường đôi lớn,ban công, lối vào riêng và bếp nấu ăn.',
--	N'Ban công,Sân hiên,Nhìn ra vườn,Nhìn ra hồ bơi,Nhìn ra địa danh nổi tiếng,Nhìn ra thành phố,Nhìn ra sông,Hướng nhìn sân trong,Sân trong',
--	'DOUBLE',
--	N'Bếp,Ghế cao dành cho trẻ em,Tủ lạnh,Lò vi sóng,Đồ bếp,Minibar,Ấm đun nước điện,Bàn ghế ngoài trời,Khu vực ăn uống ngoài trời,Bếp nấu,Máy nướng bánh mỳ,Khu vực phòng ăn,Bàn ăn,Bàn làm việc,TV màn hình phẳng,Đồng hồ báo thức,Bàn ghế ngoài trời,Bàn ủi,Quạt máy,Tiện nghi ủi,Khu vực tiếp khách,Lò vi sóng,Hồ bơi riêng',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

----todo Musketeers Guest House
--INSERT INTO ROOM_TYPE VALUES(4, 1, N'Phòng 2 Giường Đơn', 10, 15,2620000 ,
--	N'Phòng gồm 2 giường đơn, có ấm đun nước điện và máy lạnh.',
--	N'Nhìn ra vườn',
--	'DOUBLE',
--	N'Sàn lát gỗ,Ấm đun nước điện,Máy điều hòa độc lập cho từng phòng,Bàn ủi,Khăn tắm,Tủ hoặc phòng để quần áo,Điều hòa không khí,Nước rửa tay,Giá treo quần áo',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(4, 2, N'Phòng Deluxe Giường Đôi', 12, 20,3000000 ,
--	N'Phòng gồm 1 giường đôi, có ấm đun nước điện và máy lạnh,TV truyền hình cáp.',
--	N'Nhìn ra vườn',
--	'DOUBLE',
--	N'Sàn lát gỗ,TV màn hình phẳng,Ấm đun nước điện,Máy điều hòa độc lập cho từng phòng,Bàn ủi,Khăn tắm,Tủ hoặc phòng để quần áo,Điều hòa không khí,Nước rửa tay,Giá treo quần áo',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(4, 3, N'Giường Tầng Trong Phòng Ngủ Tập Thể Cho Nam Và Nữ', 10, 28,2620000 ,
--	N'Phòng gồm 4 giường tầng, có ấm đun nước điện và máy lạnh.',
--	N'Nhìn ra vườn',
--	'DOUBLE',
--	N'Sàn lát gỗ,Ấm đun nước điện,Máy điều hòa độc lập cho từng phòng,Bàn ủi,Khăn tắm,Tủ hoặc phòng để quần áo,Điều hòa không khí,Nước rửa tay,Giá treo quần áo',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

----todo Cristina Boutique Hotel
--INSERT INTO ROOM_TYPE VALUES(5, 1, N'Phòng Tiêu Chuẩn Giường Đôi', 10, 15,1600000,
--	N'Phòng gồm 1 giường đôi, có ấm đun nước điện và máy lạnh.',
--	N'Nhìn ra thành phố',
--	'DOUBLE',
--	N'Két an toàn,Sàn lát gỗ,Ấm đun nước điện,Điện thoại,Khăn tắm,Tủ hoặc phòng để quần áo,Điều hòa không khí,Giá treo quần áo',
--	'BREAKFAST_INCLUDED',
--	N'Cho phép hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(5, 2, N'Phòng Deluxe Giường Đôi/2 Giường Đơn Có Ban Công', 7, 28,2150000,
--	N'Phòng gồm 1 giường đôi/2 giường đơn, có ấm đun nước điện và máy lạnh.',
--	N'Nhìn ra thành phố,Ban Công,Sân hiên',
--	'DOUBLE',
--	N'Két an toàn,Sàn lát gỗ,Ấm đun nước điện,Điện thoại,Khăn tắm,Tủ hoặc phòng để quần áo,Điều hòa không khí,Giá treo quần áo',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(5, 3, N'Phòng Gia Đình Có Ban Công', 5, 30,2350000,
--	N'Phòng gồm 1 giường đôi và 1 giường đơn, có ấm đun nước điện và máy lạnh.',
--	N'Nhìn ra thành phố,Ban Công,Sân hiên',
--	'DOUBLE',
--	N'Két an toàn,Sàn lát gỗ,Ấm đun nước điện,Điện thoại,Khăn tắm,Tủ hoặc phòng để quần áo,Điều hòa không khí,Giá treo quần áo',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

----TODO SMARANA Hanoi HERITAGE
--INSERT INTO ROOM_TYPE VALUES(6, 1, N'Phòng Deluxe Có Giường Cỡ King', 5, 28,3688470 ,
--	N'Phòng gồm 1 giường đôi Có khu vực ghế ngồi, máy điều hòa và bếp nhỏ.',
--	N'Hướng nhìn sân trong',
--	'DOUBLE',
--	N'Bếp nhỏ,Tủ lạnh,Máy pha trà/cà phê,Minibar,Ấm đun nước điện,Két an toàn,TV màn hình phẳng,Dịch vụ báo thức,Bàn ủi,Khăn tắm Xe lăn có thể đi đến mọi nơi trong toàn bộ khuôn viên',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(6, 2, N'Suite có giường cỡ King với ban công', 4, 42,5532705,
--	N'Phòng gồm 1 giường đôi có ban công, máy pha trà/cà phê và ấm đun nước điện.',
--	N'Ban công,Nhìn ra thành phố',
--	'DOUBLE',
--	N'Bếp nhỏ,Tủ lạnh,Máy pha trà/cà phê,Minibar,Ấm đun nước điện,Két an toàn,TV màn hình phẳng,Dịch vụ báo thức,Bàn ủi,Khăn tắm Xe lăn có thể đi đến mọi nơi trong toàn bộ khuôn viên',
--	'BREAKFAST_INCLUDED',
--	N'Cho phép hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(6, 3, N'Suite Hạng Tổng Thống', 3, 45, 6036300,
--	N'Phòng gồm 1 giường đôi có ban công, hệ thống cách âm và ấm đun nước điện.',
--	N'Ban công,Nhìn ra thành phố',
--	'DOUBLE',
--	N'Bếp nhỏ,Tủ lạnh,Máy pha trà/cà phê,Minibar,Ấm đun nước điện,Két an toàn,TV màn hình phẳng,Dịch vụ báo thức,Bàn ủi,Khăn tắm Xe lăn có thể đi đến mọi nơi trong toàn bộ khuôn viên',
--	'BREAKFAST_INCLUDED',
--	N'Cho phép hút thuốc');

----todo An Hiên Homestay Hội An
--INSERT INTO ROOM_TYPE VALUES(7, 1, N'Phòng Deluxe cho 3 Người', 3, 30, 870000,
--	N'This triple room has a electric kettle, tile/marble floor and bathrobe.',
--	N'Sân vườn',
--	'DOUBLE',
--	N'Tủ lạnh,Ấm đun nước điện,Bàn ủi,Máy sấy quần áo,Khăn tắm,Tủ hoặc phòng để quần áo,Điều hòa không khí,Giá treo quần áo',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(7, 2, N'Phòng Tiêu Chuẩn Có Giường Cỡ King', 3, 20,550000,
--	N'Phòng giường đôi này có ban công, máy điều hòa và sàn lát gạch/đá cẩm thạch.',
--	N'Ban công',
--	'DOUBLE',
--	N'Tủ lạnh,Ấm đun nước điện,Bàn ủi,Máy sấy quần áo,Khăn tắm,Tủ hoặc phòng để quần áo,Điều hòa không khí,Giá treo quần áo',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(7, 3, N'Phòng Superior Giường Đôi', 3, 25, 600000,
--	N'This double room has a tumble dryer, tile/marble floor and electric kettle.',
--	N'Sân vườn',
--	'DOUBLE',
--	N'Tủ lạnh,Ấm đun nước điện,Bàn ủi,Máy sấy quần áo,Khăn tắm,Tủ hoặc phòng để quần áo,Điều hòa không khí,Giá treo quần áo',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

----todo iHome Hoi An
--INSERT INTO ROOM_TYPE VALUES(8, 1, N'Phòng Giường Đôi Nhìn Ra Hồ Bơi', 4, 30,950000,
--	N'Phòng giường đôi này có ban công, máy điều hòa và ấm đun nước điện.',
--	N'Ban công,Tầm nhìn ra khung cảnh',
--	'DOUBLE',
--	N'Minibar,TV màn hình phẳng,Ấm đun nước điện,Dịch vụ báo thức,Bàn ủi,Điều hòa không khí,Giá treo quần áo',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(8, 2, N'Phòng Deluxe Giường Đôi Có Ban Công', 5, 30,850000,
--	N'Phòng Giường Đôi này có ban công, ấm đun nước điện và máy điều hòa.',
--	N'Ban công,Tầm nhìn ra khung cảnh',
--	'DOUBLE',
--	N'Minibar,TV màn hình phẳng,Ấm đun nước điện,Dịch vụ báo thức,Bàn ủi,Điều hòa không khí,Giá treo quần áo',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(8, 3, N'Phòng 2 giường đơn có ban công', 4, 30,850000,
--	N'Phòng 2 Giường Đơn này có ban công, ấm đun nước điện và máy điều hòa.',
--	N'Ban công,Tầm nhìn ra khung cảnh',
--	'DOUBLE',
--	N'Minibar,TV màn hình phẳng,Ấm đun nước điện,Dịch vụ báo thức,Bàn ủi,Điều hòa không khí,Giá treo quần áo',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

----todo Florida Nha Trang Hotel
--INSERT INTO ROOM_TYPE VALUES(9, 1, N'Suite', 4, 60,4200000,
--	N'Phòng giường đôi này có ấm đun nước điện, bể sục, minibar và đồ nội thất được làm hoàn toàn bằng gỗ tự nhiên.Bao gồm: - Trái cây hằng ngày.',
--	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
--	'DOUBLE',
--	N'Bàn làm việc,Két an toàn,TV màn hình phẳng,Đồng hồ báo thức,Bàn ủi,Tiện nghi ủi,Khu vực tiếp khách,Dịch vụ streaming (như là Netflix),Lối vào riêng,Giường sofa,Máy sấy quần áo,Truyền hình cáp,Điều hòa không khí,Giá treo quần áo,Két an toàn cỡ laptop,Thiết bị báo carbon monoxide,Bàn ăn',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(9, 2, N'Senior Deluxe', 4, 45,2400000 ,
--	N'Phòng giường đôi này có ban công, áo choàng tắm, TV truyền hình cáp và đồ nội thất được làm hoàn toàn bằng gỗ tự nhiên.',
--	N'Nhìn ra núi,Nhìn ra biển,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
--	'DOUBLE',
--	N'Bàn làm việc,Két an toàn,TV màn hình phẳng,Đồng hồ báo thức,Bàn ủi,Tiện nghi ủi,Khu vực tiếp khách,Dịch vụ streaming (như là Netflix),Lối vào riêng,Giường sofa,Máy sấy quần áo,Truyền hình cáp,Điều hòa không khí,Giá treo quần áo,Két an toàn cỡ laptop,Thiết bị báo carbon monoxide,Bàn ăn',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(9, 3, N'Phòng Deluxe Giường Đôi/2 Giường Đơn Nhìn Ra Thành Phố', 10,28,1550000,
--	N'Phòng giường đôi/2 giường đơn này có áo choàng tắm, minibar, hệ thống cách âm, TV màn hình phẳng và đồ nội thất được làm hoàn toàn bằng gỗ tự nhiên.',
--	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
--	'DOUBLE',
--	N'Bàn làm việc,Két an toàn,TV màn hình phẳng,Đồng hồ báo thức,Bàn ủi,Tiện nghi ủi,Khu vực tiếp khách,Dịch vụ streaming (như là Netflix),Lối vào riêng,Giường sofa,Máy sấy quần áo,Truyền hình cáp,Điều hòa không khí,Giá treo quần áo,Két an toàn cỡ laptop,Thiết bị báo carbon monoxide,Bàn ăn',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

----todo Crown Hotel Nha Trang
--INSERT INTO ROOM_TYPE VALUES(10, 1, N'Phòng Deluxe Có Giường Cỡ King', 4, 26,2100000,
--	N'Phòng Giường Đôi này có ban công, khu vực ghế ngồi và TV truyền hình cáp.',
--	N'Ban công,Sân hiên,Nhìn ra biển',
--	'DOUBLE',
--	N'Bàn làm việc,Két an toàn,TV màn hình phẳng,Giá phơi quần áo,Khăn tắm,Khu vực tiếp khách,Tủ lạnh,Minibar, Ấm đun nước điện,Hệ thống sưởi,Điện thoại,Phòng thay quần áo,Truyền hình cáp,Tủ hoặc phòng để quần áo,Điều hòa không khí,Khu vực phòng ăn',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(10, 2, N'Phòng 2 Giường Đơn Nhìn Ra Biển', 5, 26,1650000,
--	N'Phòng 2 Giường Đơn này có ban công, khu vực ăn uống và ấm đun nước điện.',
--	N'Ban công,Sân hiên,Nhìn ra biển',
--	'DOUBLE',
--	N'Bàn làm việc,Két an toàn,TV màn hình phẳng,Giá phơi quần áo,Khăn tắm,Khu vực tiếp khách,Tủ lạnh,Minibar, Ấm đun nước điện,Hệ thống sưởi,Điện thoại,Phòng thay quần áo,Truyền hình cáp,Tủ hoặc phòng để quần áo,Điều hòa không khí,Khu vực phòng ăn',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');

--INSERT INTO ROOM_TYPE VALUES(10, 3, N'Phòng Superior Giường Đôi/2 Giường Đơn Nhìn Ra Thành Phố', 6, 24,1275000,
--	N'Phòng Giường Đôi/2 Giường Đơn có ban công, khu vực ghế ngồi và TV truyền hình vệ tinh.',
--	N'Ban công,Sân hiên,Nhìn ra thành phố',
--	'DOUBLE',
--	N'Bàn làm việc,Két an toàn,TV màn hình phẳng,Giá phơi quần áo,Khăn tắm,Khu vực tiếp khách,Tủ lạnh,Minibar, Ấm đun nước điện,Hệ thống sưởi,Điện thoại,Phòng thay quần áo,Truyền hình cáp,Tủ hoặc phòng để quần áo,Điều hòa không khí,Khu vực phòng ăn',
--	'BREAKFAST_INCLUDED',
--	N'Không hút thuốc');



--! add room picture 
--todo Triple E Hotel Metro Ben Thanh
INSERT INTO ROOM_PICTURE VALUES(1,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Deluxe1.jpg');
INSERT INTO ROOM_PICTURE VALUES(1,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Deluxe2.jpg');
INSERT INTO ROOM_PICTURE VALUES(1,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Deluxe3.jpg');

INSERT INTO ROOM_PICTURE VALUES(1,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%911.jpg');
INSERT INTO ROOM_PICTURE VALUES(1,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%912.jpg');
INSERT INTO ROOM_PICTURE VALUES(1,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%913.jpg');

INSERT INTO ROOM_PICTURE VALUES(1,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Junior1.jpg');
INSERT INTO ROOM_PICTURE VALUES(1,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Junior2.jpg');
INSERT INTO ROOM_PICTURE VALUES(1,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Junior3.jpg');

----TODO Nexus House Thao Dien
--INSERT INTO ROOM_PICTURE VALUES(2,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/Studio%20Nh%C3%ACn%20Ra%20V%C6%B0%E1%BB%9Dn1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(2,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/Studio%20Nh%C3%ACn%20Ra%20V%C6%B0%E1%BB%9Dn2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(2,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/Studio%20Nh%C3%ACn%20Ra%20V%C6%B0%E1%BB%9Dn3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(2,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/C%C4%83n%20H%E1%BB%99%20C%C3%B3%20Ban%20C%C3%B4ng1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(2,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/C%C4%83n%20H%E1%BB%99%20C%C3%B3%20Ban%20C%C3%B4ng2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(2,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/C%C4%83n%20H%E1%BB%99%20C%C3%B3%20Ban%20C%C3%B4ng3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(2,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/C%C4%83n%20H%E1%BB%99%20Studio1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(2,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/C%C4%83n%20H%E1%BB%99%20Studio2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(2,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/C%C4%83n%20H%E1%BB%99%20Studio3.jpg');

----todo Landmark Plus Luxury - Vinhomes Central Park
--INSERT INTO ROOM_PICTURE VALUES(3,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20h%E1%BB%99%20Deluxe1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(3,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20h%E1%BB%99%20Deluxe2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(3,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20h%E1%BB%99%20Deluxe3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(3,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20H%E1%BB%99%20C%C3%B3%20Ban%20C%C3%B4ng1.1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(3,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20H%E1%BB%99%20C%C3%B3%20Ban%20C%C3%B4ng2.2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(3,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20H%E1%BB%99%20C%C3%B3%20Ban%20C%C3%B4ng3.3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(3,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20H%E1%BB%99%202%20Ph%C3%B2ng%20Ng%E1%BB%A71.jpg');
--INSERT INTO ROOM_PICTURE VALUES(3,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20H%E1%BB%99%202%20Ph%C3%B2ng%20Ng%E1%BB%A72.jpg');
--INSERT INTO ROOM_PICTURE VALUES(3,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20H%E1%BB%99%202%20Ph%C3%B2ng%20Ng%E1%BB%A73.jpg');

----todo Musketeers Guest House
--INSERT INTO ROOM_PICTURE VALUES(4,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Ph%C3%B2ng%202%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(4,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Ph%C3%B2ng%202%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(4,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Ph%C3%B2ng%202%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(4,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(4,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(4,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(4,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Gi%C6%B0%E1%BB%9Dng%20T%E1%BA%A7ng%20Trong%20Ph%C3%B2ng%20Ng%E1%BB%A7%20T%E1%BA%ADp%20Th%E1%BB%831.jpg');
--INSERT INTO ROOM_PICTURE VALUES(4,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Gi%C6%B0%E1%BB%9Dng%20T%E1%BA%A7ng%20Trong%20Ph%C3%B2ng%20Ng%E1%BB%A7%20T%E1%BA%ADp%20Th%E1%BB%832.jpg');
--INSERT INTO ROOM_PICTURE VALUES(4,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Gi%C6%B0%E1%BB%9Dng%20T%E1%BA%A7ng%20Trong%20Ph%C3%B2ng%20Ng%E1%BB%A7%20T%E1%BA%ADp%20Th%E1%BB%833.jpg');

----todo Cristina Boutique Hotel
--INSERT INTO ROOM_PICTURE VALUES(5,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Ph%C3%B2ng%20Ti%C3%AAu%20Chu%E1%BA%A9n%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(5,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Ph%C3%B2ng%20Ti%C3%AAu%20Chu%E1%BA%A9n%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(5,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Ph%C3%B2ng%20Ti%C3%AAu%20Chu%E1%BA%A9n%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(5,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20C%C3%B3%20Ban%20C%C3%B4ng1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(5,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20C%C3%B3%20Ban%20C%C3%B4ng2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(5,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20C%C3%B3%20Ban%20C%C3%B4ng3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(5,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Ph%C3%B2ng%20Gia%20%C4%90%C3%ACnh%20C%C3%B3%20Ban%20C%C3%B4ng1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(5,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Ph%C3%B2ng%20Gia%20%C4%90%C3%ACnh%20C%C3%B3%20Ban%20C%C3%B4ng2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(5,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Ph%C3%B2ng%20Gia%20%C4%90%C3%ACnh%20C%C3%B3%20Ban%20C%C3%B4ng3.jpg');

----TODO SMARANA Hanoi HERITAGE
--INSERT INTO ROOM_PICTURE VALUES(6,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Ph%C3%B2ng%20Deluxe%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(6,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Ph%C3%B2ng%20Deluxe%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(6,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Ph%C3%B2ng%20Deluxe%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(6,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Suite%20co%CC%81%20gi%C6%B0%C6%A1%CC%80ng%20c%C6%A1%CC%83%20King%20v%E1%BB%9Bi%20ban%20c%C3%B4ng1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(6,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Suite%20co%CC%81%20gi%C6%B0%C6%A1%CC%80ng%20c%C6%A1%CC%83%20King%20v%E1%BB%9Bi%20ban%20c%C3%B4ng2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(6,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Suite%20co%CC%81%20gi%C6%B0%C6%A1%CC%80ng%20c%C6%A1%CC%83%20King%20v%E1%BB%9Bi%20ban%20c%C3%B4ng3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(6,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Suite%20H%E1%BA%A1ng%20T%E1%BB%95ng%20Th%E1%BB%91ng1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(6,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Suite%20H%E1%BA%A1ng%20T%E1%BB%95ng%20Th%E1%BB%91ng2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(6,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Suite%20H%E1%BA%A1ng%20T%E1%BB%95ng%20Th%E1%BB%91ng3.jpg');

----todo An Hiên Homestay Hội An
--INSERT INTO ROOM_PICTURE VALUES(7,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Deluxe%20cho%203%20Ng%C6%B0%E1%BB%9Di1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(7,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Deluxe%20cho%203%20Ng%C6%B0%E1%BB%9Di2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(7,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Deluxe%20cho%203%20Ng%C6%B0%E1%BB%9Di3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(7,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Pho%CC%80ng%20Ti%C3%AAu%20Chu%C3%A2%CC%89n%20Co%CC%81%20Gi%C6%B0%C6%A1%CC%80ng%20C%C6%A1%CC%83%20King1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(7,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Pho%CC%80ng%20Ti%C3%AAu%20Chu%C3%A2%CC%89n%20Co%CC%81%20Gi%C6%B0%C6%A1%CC%80ng%20C%C6%A1%CC%83%20King2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(7,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Pho%CC%80ng%20Ti%C3%AAu%20Chu%C3%A2%CC%89n%20Co%CC%81%20Gi%C6%B0%C6%A1%CC%80ng%20C%C6%A1%CC%83%20King3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(7,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Superior%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(7,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Superior%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(7,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Superior%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i3.jpg');

----todo iHome Hoi An
--INSERT INTO ROOM_PICTURE VALUES(8,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i%20Nh%C3%ACn%20Ra%20H%E1%BB%93%20B%C6%A1i1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(8,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i%20Nh%C3%ACn%20Ra%20H%E1%BB%93%20B%C6%A1i2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(8,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i%20Nh%C3%ACn%20Ra%20H%E1%BB%93%20B%C6%A1i3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(8,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i%20C%C3%B3%20Ban%20C%C3%B4ng1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(8,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i%20C%C3%B3%20Ban%20C%C3%B4ng2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(8,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i%20C%C3%B3%20Ban%20C%C3%B4ng3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(8,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%202%20gi%C6%B0%E1%BB%9Dng%20%C4%91%C6%A1n%20co%CC%81%20ban%20c%C3%B4ng1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(8,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%202%20gi%C6%B0%E1%BB%9Dng%20%C4%91%C6%A1n%20co%CC%81%20ban%20c%C3%B4ng2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(8,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%202%20gi%C6%B0%E1%BB%9Dng%20%C4%91%C6%A1n%20co%CC%81%20ban%20c%C3%B4ng3.jpg');

----todo Florida Nha Trang Hotel
--INSERT INTO ROOM_PICTURE VALUES(9,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Suite1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(9,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Suite2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(9,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Suite3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(9,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Senior%20Deluxe1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(9,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Senior%20Deluxe2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(9,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Senior%20Deluxe3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(9,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%911.jpg');
--INSERT INTO ROOM_PICTURE VALUES(9,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%912.jpg');
--INSERT INTO ROOM_PICTURE VALUES(9,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%913.jpg');

----todo Crown Hotel Nha Trang
--INSERT INTO ROOM_PICTURE VALUES(10,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%20Deluxe%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King1.1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(10,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%20Deluxe%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King1.2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(10,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%20Deluxe%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King1.3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(10,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%202%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Bi%E1%BB%83n1.jpg');
--INSERT INTO ROOM_PICTURE VALUES(10,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%202%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Bi%E1%BB%83n2.jpg');
--INSERT INTO ROOM_PICTURE VALUES(10,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%202%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Bi%E1%BB%83n3.jpg');

--INSERT INTO ROOM_PICTURE VALUES(10,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%20Superior%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%911.jpg');
--INSERT INTO ROOM_PICTURE VALUES(10,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%20Superior%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%912.jpg');
--INSERT INTO ROOM_PICTURE VALUES(10,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%20Superior%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%913.jpg');









