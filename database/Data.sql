USE [sunrise-hotel]
GO

--!add account
--!PASSWORD all 123
INSERT INTO ACCOUNT (Id, MemberPoint, AccountRank, Email, PasswordHash, PasswordSalt, UserRole, RefreshToken, TokenCreated, TokenExpires)
VALUES	
(1, 0, 'Bronze', 'lydat@gmail.com', '00ba0af9630c9eccf44741a603ccbb32b238c0ecd7141200c1641e2756328d4c3f1d94c7af70efd2b0af3c3ef2aff4f519290b2a29d0605a046283be6526c406', '0c7aeca9679f1de913b12d341f1ca586b4defaf7503651003354a5f8c8519265889436a9bb39085eb8df092d6bd2dca144e9a2e57df70d17ecbf1dd1c276576ad425b415d9f09c3cf3f319bacead74282a6b7bf60de2f7d97a2b9fbab5022f65a7d56efc4a3015bcbe31f7ff152ca3ea5ee527516a5a06fff4039d6ac09e9fe6', 'User', 'zJ7lpuRkqAGuiAYgRC+WQIZejkentkhE08e+s2eTOY9fbSto5X6GirvmmLzyQcbAkTXypnVNhYRBCXU8ocEeYw==', '2023-08-09 20:03:58.000', '2023-08-16 20:03:58.000'),
(2, 0, 'Bronze', 'pdat@gmail.com', '1b9c6d61d183e699774df08fee179b5751fd1c1241407f7a0914669c0907393ce9f49b6cbf41bb4bd7d134f9b285bc804f1741360a19543535bae867b7c750fb', '1432927fae5e4b8e421b97be56fabe0854c081cf1ac5fdaa719fcefbec6a14f7d919fc6e9eabb143f4895714e76413ec606e7e4c0774578ef3d70f6cc9e210bcaaf4cfc8590fa85158e338b572a1ea167783d4cc03e894e3995b7ed91c32e2a18537e01d905a41d89dcc8aafe9cc341985a25f0719cb1ee9e150a96db6e7ee56', 'User', 'nk/TmDwMY7JByDIXK+W6GhGPXfhbchlqZ2gne4DdsWHn6QqCHgRxIJ8j4V4nTfsdyZGtZ3vpHsEI82NY41zEAA==', '2023-08-09 20:06:42.000', '2023-08-16 20:06:42.000'),
(3, 0, 'Bronze', 'cuong457@gmail.com', 'ceae4c3043f6c58da07969a59afd02c3564250fae49ef5efc98158ef65c1ceca5f2ede0728044a6a23148fc8abfa0b252c81e92e71f080092a9d8e541bddde92', 'fdf3c9599cf9d981c2df2629557cebfb952c14fb66753a07e6d81706787d4c54f1e08958968a69ee5de89b0c5373010902b08776a69c86996d3fbda6d12aa54af1cf470960c6e3313c7c0c69fe5249c272fea9d958a859ea63158bb81e9d1439f3a4860860494caf8e569069d64d26acf3a162480e7b31c21249a9d0a2c7d874', 'User', 'ZqpZt9FF7o1JqL4Pyqm+xqb5ld4o/r05Un3RbyXVtDM2Q+X2v1R/94OEWrofC9fVwkcPDyapIqJPsj08afrhYw==', '2023-08-09 20:07:51.000', '2023-08-16 20:07:51.000'),
(4, 0, 'Bronze', 'hahaha@gmail.com', 'd9f32996fe0dfa426245c93e7b4fb51fcddbfccc8813ff8d014d97b81727505dfb7522442bdde8bbfc8b6db5bfdb132d610cdeb2ce4271f187d9c66dd1ec41cd', '966e8aa101ab756bcbd472761a2328f86282234bb31378c3d6f32b7d3ed42141e90f93dabedce0ce8882dccac6e2273db18eb245dc4d83a679be074992472665697f19ca5cbc53639bddfc2695e78ef0b2602ff5724be676c6c00dd7b28cf5394114b1c18efe7823b64e8154c783eb1cc2b24b77e541455e9f01a0ff5cd275a7', 'User', 'yxxXPrTmh/L981F23IBHrXUsLfgFjCCDbtMlwYo9ixj3DYT/sikgkXgfKNvOGJ5WXcdJ+sNXopbEdZG3FJbHCw==', '2023-08-09 20:08:41.000', '2023-08-16 20:08:41.000'),
(5, 0, 'Bronze', 'lydatadmin@gmail.com', 'b4c676c2a3ad96d16eb1c23070fc12b4a3478aa7c03e68900de8e128d74d33a85833452082a303dd62724e40d26671211171916da878a28406dffe30970f1bc6', '78e6ec95334ccafc5f24401f1bafda9630dea41464453ad6e8d8a36798096b0ffdf37aa4ed0593d10c60e852c9ad4790c8a963cd1adc50627fab1614c4c51209fadc3f774c9e9a8580169dbf67a5ca4171244ffc2183caaef114557dd3c54aa2ff733d2c5aebf366e3df083bf30471c984460469c78b45dac16da61b8f01d835', 'User', 'GyqcQo1/q7SVt6UScAIcE3JvLyZ9qRUplvpP0b/ois/AOLgQHMfN4N8HKe5OqsjdYE9C15u11WUaRTqOgUB2eA==', '2023-08-09 20:09:05.000', '2023-08-16 20:09:05.000'),
(6, 0, 'Bronze', 'cuong@gmail.com', '63927922e816797646afdb67a26598edc3d8e6a7b4eafb8ac0b36ddadd69a88843f7b8f1fc1a2ee6f15ac5ba0de867e3389d0ff13ebda5642437dcc4f5c27dfe', 'cc97f6039c4ccc0cf944c9facab11a534f8152b300de76f70dd307e9479e080febe982ff831a7df759ae81c8e03f8307e33de5e1420e94ef56eadde1d8e2f49267b19b56d6a5d0fc5152c94441da96427fc131232abd7470062b389c0905836361d7df0fa54e7721aa9ea8dada7c9964d0585d55ac94c4da26491c014f271c0f', 'User', 'W0Q20ryEsowpc2Zb51yStSA3I37I84srULomm+e0qgiZfOwDWEipfF0hP2bb96UW6JfHauKfX33uFYjjJAAnBA==', '2023-08-09 20:09:59.000', '2023-08-16 20:09:59.000');

----!add personal information
INSERT INTO PERSONAL_DETAILS (AccountId, FullName, EmailAddress, PhoneNumber, DateOfBirth, Gender, Image, Rank) VALUES 
(1, N'Lý Văn Đạt', 'lydat@gmail.com', 'default', '2002-01-01', 'Male', 'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', 'Bronze'),
(2, N'Phan Phúc Đạt', 'pdat@gmail.com', 'default', '2002-01-01', 'Male', 'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', 'Bronze'),
(3, N'Cường Phạm', 'cuong457@gmail.com', 'default', '2002-01-01', 'Male', 'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', 'Bronze'),
(4, N'Cường Phạm', 'hahaha@gmail.com', 'default', '2002-01-01', 'Male', 'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', 'Bronze'),
(5, N'Lý Văn Đạt', 'lydatadmin@gmail.com', 'default', '2002-01-01', 'Male', 'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', 'Bronze'),
(6, N'Phạm Nguyễn Cao Cường', 'cuong@gmail.com', 'default', '2002-01-01', 'Male', 'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', 'Bronze');

--!add Rank
INSERT INTO POINT_RANK (RankName, RankValue) VALUES 
	('Diamond', 5000),
	('Gold', 1000),
	('Silver', 500),
	('Bronze', 100);

INSERT INTO VOUCHER (VoucherId, Name, Value, Point, AccountRank) VALUES 
	(1, 'Voucher 50k', 50000, 50, 'Bronze'),
	(2, 'Voucher 100k', 100000, 100, 'Bronze'),
	(3, 'Voucher 200k', 200000, 200, 'Silver'),
	(4, 'Voucher 500k', 500000, 500, 'Gold'),
	(5, 'Voucher 1Tr', 1000000, 1000, 'Diamond');

--!add hotel 
INSERT INTO HOTEL VALUES(1, N'Triple E Hotel Metro Ben Thanh',N'Việt Nam','HOTEL',N'Hồ Chí Minh City',
	 N'Phường Nguyễn Thái Bình 146- 148 Đường Ký Con, District 1, Ho Chi Minh City, Vietnam',
	 3, 8.8, 
	 N'Tọa lạc ở Thành phố Hồ Chí Minh, cách Bảo tàng Mỹ thuật 300 m, Triple E Hotel Metro Ben Thanh cung cấp chỗ nghỉ 3 sao với trung tâm thể dục.Khách sạn 3 sao này cung cấp WiFi miễn phí, dịch vụ phòng và dịch vụ lễ tân 24 giờ. Nhân viên tại đây có thể thu xếp dịch vụ đưa đón cho khách.',
	 N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Triple%20E%20Hotel%20Metro%20Ben%20Thanh.jpg');

INSERT INTO HOTEL VALUES(2, N'Nexus House Thao Dien',N'Việt Nam','HOMESTAY',N'Hồ Chí Minh City',
	N'8/9 Võ Trường Toản, An Phú, Quận 2, TP. Hồ Chí Minh, Việt Nam',
 	0, 9.5,
	N'Located 6.3 km from Vietnam History Museum, Nexus House Thao Dien offers a garden, a terrace and air-conditioned accommodation with a balcony and free WiFi.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/Studio%20Nh%C3%ACn%20Ra%20V%C6%B0%E1%BB%9Dn1.jpg');

INSERT INTO HOTEL VALUES(3, N'Landmark Plus Luxury - Vinhomes Central Park',N'Việt Nam','SINGLE_APARTMENT',N'Hồ Chí Minh City', 
	N'Phường Nguyễn Thái Bình 146- 148 Đường Ký Con, District 1, Ho Chi Minh City, Vietnam',
	0, 8.1, 
	N'Tọa lạc tại Thành phố Hồ Chí Minh, Landmark Plus Luxury - Vinhomes Central Park cung cấp chỗ nghỉ với hồ bơi ngoài trời, khu vườn, sảnh khách chung, sân hiên, quầy bar và tầm nhìn ra thành phố.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/landmark.jpg');

INSERT INTO HOTEL VALUES(4, N'Musketeers Guest House',N'Việt Nam','HOTEL',N'Hà Nội', 
	N'21 Ngõ 67 Tô Ngọc Vân Quảng An, Quận Tây Hồ, Hà Nội, Việt Nam',
	0, 9.7, 
	N'Located in Hanoi, 3.2 km from West Lake, Musketeers Guest House provides accommodation with a shared lounge, free private parking, a terrace and a bar. Among the facilities at this property are a 24-hour front desk and a concierge service, along with free WiFi throughout the property. Guests can enjoy garden views.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i1.jpg');

INSERT INTO HOTEL VALUES(5, N'Cristina Boutique Hotel',N'Việt Nam','HOTEL',N'Hà Nội', 
	N'4A Ngõ Phất Lộc, Quận Hoàn Kiếm, Hà Nội, Việt Nam',
	3, 9.1, 
	N'Situated conveniently in the centre of Hanoi, Cristina Boutique Hotel features 3-star accommodation close to Hanoi Old City Gate and Thang Long Water Puppet Theater. This 3-star hotel has air-conditioned rooms with a private bathroom. The accommodation offers a 24-hour front desk, airport transfers, room service and free WiFi.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20C%C3%B3%20Ban%20C%C3%B4ng1.jpg');

INSERT INTO HOTEL VALUES(6, N'SMARANA Hanoi HERITAGE',N'Việt Nam','HOTEL',N'Hà Nội', 
	N'Phường Dịch Vọng Hầu, Quận Cầu Giấy Số 5, Ngõ 82/1 Dịch Vọng Hậu, Cau Giay, Hà Nội, Việt Nam',
	5, 9.7, 
	N'Tọa lạc tại thành phố Hà Nội, cách Bảo tàng Dân tộc học Việt Nam 2,4 km, SMARANA Hanoi HERITAGE có dịch vụ tiền sảnh, phòng nghỉ không hút thuốc, sân hiên, WiFi miễn phí trong toàn bộ khuôn viên và nhà hàng. Khách sạn 5 sao này cung cấp dịch vụ phòng, dịch vụ lễ tân 24 giờ, dịch vụ đưa đón sân bay và dịch vụ cho thuê xe đạp.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/smarana-hanoi-heritage.jpg');

INSERT INTO HOTEL VALUES(7, N'An Hiên Homestay Hội An',N'Việt Nam','HOMESTAY',N'Hội An', 
	N'164 Lý Thái Tổ, phường Cẩm Châu, Cẩm Châu, Hội An, Việt Nam',
	0, 9.6, 
	N'Located in Hoi An, 1.2 km from Hoi An Historic Museum and 1.6 km from Assembly Hall of Chaozhou Chinese Congregation, An Hiên Homestay Hội An provides accommodation with free WiFi, air conditioning, free bikes and a garden.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An.jpg');

INSERT INTO HOTEL VALUES(8, N'iHome Hoi An',N'Việt Nam','HOTEL',N'Hội An', 
	N'54 Nguyễn Tri Phương, Cẩm Nam, Hội An, Việt Nam',
	3, 9.2, 
	N'Tọa lạc tại thành phố Hội An, cách Hội quán Triều Châu 600 m, iHome Hoi An cung cấp chỗ nghỉ với trung tâm thể dục, chỗ đỗ xe riêng miễn phí, sân hiên và quầy bar. Khách sạn 3 sao này có dịch vụ phòng và lễ tân 24 giờ. Sân golf Montgomerie Links và CLB chơi golf Montgomerie Links Vietnam đều nằm trong bán kính 15 km từ khách sạn.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/iHome%20Hoi%20An.jpg');

INSERT INTO HOTEL VALUES(9, N'Florida Nha Trang Hotel',N'Việt Nam','HOTEL',N'Nha Trang', 
	N'66 Quang Trung, Nha Trang, Việt Nam',
	5, 8.4, 
	N'Tọa lạc tại thành phố Nha Trang, cách Bãi biển Nha Trang 1,5 km, Florida Nha Trang Hotel cung cấp chỗ nghỉ với hồ bơi ngoài trời, chỗ đỗ xe riêng miễn phí, trung tâm thể dục và sảnh khách chung. Khách sạn 5 sao này có CLB trẻ em, dịch vụ phòng, WiFi miễn phí, sân hiên và tầm nhìn ra thành phố. Du khách có thể dùng bữa tại nhà hàng hoặc nhâm nhi đồ uống ở quầy bar.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Florida%20Nha%20Trang%20Hotel/Florida%20hotel.jpg');

INSERT INTO HOTEL VALUES(10, N'Crown Hotel Nha Trang',N'Việt Nam','HOTEL',N'Nha Trang', 
	N'19 Dã Tượng, Nha Trang, Việt Nam',
	4, 8.1, 
	N'Tọa lạc tại thành phố Nha Trang, cách Bãi biển Nha Trang 300 m, Crown Hotel Nha Trang cung cấp chỗ nghỉ với trung tâm thể dục, chỗ đỗ xe riêng miễn phí, sảnh khách chung và nhà hàng. Khách sạn 4 sao này có dịch vụ tiền sảnh, bàn đặt tour, lễ tân 24 giờ, dịch vụ đưa đón sân bay, dịch vụ phòng và WiFi miễn phí.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Crown%20Hotel%20Nha%20Trang.jpg');

INSERT INTO HOTEL VALUES(11, N'Fati Botique Hotel Vũng Tàu', N'Việt Nam', 'HOTEL', N'Vũng Tàu',
	N'112/3 Trần Phú Tòa nhà Fati Boutique, 112/3 Trần Phú, Phường 5, Vũng Tàu, Việt Nam',
 	4, 0,
	N'Tọa lạc tại thành phố Vũng Tàu, cách Bãi Dâu vài bước chân, Fati Boutique Hotel cung cấp chỗ nghỉ với hồ bơi ngoài trời, chỗ đỗ xe riêng miễn phí, khu vườn, sân hiên và WiFi miễn phí.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Fati%20Boutique%20Hotel/335467546.jpg');

INSERT INTO HOTEL VALUES(12, N'Halios Luxury Hotel Hạ Long', N'Việt Nam', 'HOTEL', N'Quảng Ninh',
	N'38 Nguyễn Du, Hồng Gai, Thành phố Hạ Long, Quảng Ninh, Việt Nam',
 	5, 0,
	N'Tọa lạc tại thành phố Vũng Tàu, cách Bãi Dâu vài bước chân, Fati Boutique Hotel cung cấp chỗ nghỉ với hồ bơi ngoài trời, chỗ đỗ xe riêng miễn phí, khu vườn, sân hiên và WiFi miễn phí.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Fati%20Boutique%20Hotel/335467546.jpg');

INSERT INTO HOTEL VALUES(13, N'Mi Nhon Em Hotel Muine Phan Thiết', N'Việt Nam', 'HOTEL', N'Bình Thuận',
	N' 202 Nguyễn Đình Chiểu Kp 2, Ham Tien Village, Hòa Bình, Tp. Phan Thiết, Bình Thuận, Việt Nam',
 	3, 0,
	N'Nằm ở thành phố Phan Thiết, cách Bãi biển Hàm Tiến vài bước chân, Mi Nhon Em Hotel Muine cung cấp chỗ nghỉ với xe đạp cho khách sử dụng miễn phí, chỗ đỗ xe riêng miễn phí, hồ bơi ngoài trời và khu vườn.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Fati%20Boutique%20Hotel/335467546.jpg');

INSERT INTO HOTEL VALUES(14, N'DeLaSol Sapa Hotel', N'Việt Nam', 'HOTEL', N'Lào Cai',
	N'16 Mường Hoa 16, Sa Pa, Việt Nam',
 	4, 0,
	N'Tọa lạc tại thành phố Vũng Tàu, cách Bãi Dâu vài bước chân, Fati Boutique Hotel cung cấp chỗ nghỉ với hồ bơi ngoài trời, chỗ đỗ xe riêng miễn phí, khu vườn, sân hiên và WiFi miễn phí.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Fati%20Boutique%20Hotel/335467546.jpg');

INSERT INTO HOTEL VALUES(15, N'Pistachio Sapa Hotel', N'Việt Nam', 'HOTEL', N'Lào Cai',
	N'Số 5, Thác Bạc Street, Sapa, Lào Cai, Sa Pa, Việt Nam',
 	4, 0,
	N'Nằm ở thị xã Sa Pa, cách Ga cáp treo Fansipan Legend 4,6 km, Pistachio Hotel Sapa cung cấp chỗ nghỉ với hồ bơi ngoài trời, chỗ đỗ xe riêng miễn phí, trung tâm thể dục và sảnh khách chung.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Pistachio%20Hotel%20Sapa/200762189.jpg');

INSERT INTO HOTEL VALUES(16, N'Star City Riverside By Haviland Hotel', N'Việt Nam', 'HOTEL', N'Đà Nẵng',
	N'147-149 Trần Hưng Đạo, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Việt Nam',
 	5, 0,
	N'Nằm bên bờ Sông Hàn, Star City Riverside By Haviland cung cấp không gian sinh hoạt hiện đại với tầm nhìn ra toàn cảnh thành phố Đà Nẵng.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Star%20City%20Riverside%20Hotel%20By%20Haviland/428612339.jpg');

INSERT INTO HOTEL VALUES(17, N'Na Hostel Hue', N'Việt Nam', 'HOTEL', N'Huế',
	N'69 Võ Thị Sáu, Huế, Việt Nam',
 	2, 9.4,
	N'Featuring 2-star accommodation, Na Hostel Hue is located in Hue, 1.3 km from Trang Tien Bridge and 2 km from Dong Ba Market. With a terrace, the 2-star hotel has air-conditioned rooms with free WiFi. The accommodation provides airport transfers, while a bicycle rental service is also available.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Na%20Hostel%20Hue/Na%20Hostel%20Hue.jpg');

INSERT INTO HOTEL VALUES(18, N'The Chum Boutique', N'Việt Nam', 'HOTEL', N'Huế',
	N'5 Trương Định, Huế, Việt Nam',
 	3, 9.1,
	N'The Chum Boutique cung cấp phòng nghỉ tại thành phố Huế, cách Tử Cấm Thành 2,8 km và Hồ Tịnh Tâm 3,3 km. Chỗ nghỉ này nằm gần một số điểm tham quan nổi tiếng, cách Bảo tàng Hồ Chí Minh 1,1 km, Nhà thờ Dòng Chúa Cứu Thế 1,7 km và Cung An Định 1,8 km. Ngoài WiFi miễn phí, chỗ nghỉ còn có sân hiên cũng như phòng xông hơi khô.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/The%20Chum%20Boutique/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i%20C%C3%B3%20B%E1%BB%93n%20T%E1%BA%AFm1.jpg');

INSERT INTO HOTEL VALUES(19, N'Art Garden Dalat', N'Việt Nam', 'HOTEL', N'Đà Lạt',
	N'79 Đường Đào Duy Từ, Đà Lạt, Việt Nam',
 	0, 8.1,
	N'Art Garden Dalat features city views, free WiFi and free private parking, located in Da Lat, 3.9 km from Truc Lam Temple. There is a private bathroom with shower in every unit, along with bathrobes, slippers and a hair dryer.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Art%20Garden%20Dalat/Ph%C3%B2ng%20Gia%20%C4%90%C3%ACnh1.jpg');

INSERT INTO HOTEL VALUES(20, N'Đà Lạt Thanh Xuân Hotel', N'Việt Nam', 'HOTEL', N'Đà Lạt',
	N'126 Đường Tô Hiến Thành, Đà Lạt, Việt Nam',
 	4, 8.3,
	N'Tọa lạc tại thành phố Đà Lạt, cách Công viên Yersin 1,6 km, Đà Lạt Thanh Xuân Hotel cung cấp chỗ nghỉ với sân hiên, chỗ đỗ xe riêng miễn phí và nhà hàng. Khách sạn 4 sao này có dịch vụ tiền sảnh, bàn đặt tour, dịch vụ phòng, lễ tân 24 giờ và dịch vụ thu đổi ngoại tệ cho khách.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel.jpg');

--!add room Facility
INSERT INTO FACILITY_CONST VALUES(1,'SWIMMING_POOL');
INSERT INTO FACILITY_CONST VALUES(2,'INTERNET');
INSERT INTO FACILITY_CONST VALUES(3,'PARKING');
INSERT INTO FACILITY_CONST VALUES(4,'AIRPORT_SHUTTLE');
INSERT INTO FACILITY_CONST VALUES(5,'GYM');
INSERT INTO FACILITY_CONST VALUES(6,'RECEPTION_24H');
INSERT INTO FACILITY_CONST VALUES(7,'FAMILY_FRIENDLY');
INSERT INTO FACILITY_CONST VALUES(8,'NON_SMOKING');
INSERT INTO FACILITY_CONST VALUES(9,'SPA_SAUNA');
INSERT INTO FACILITY_CONST VALUES(10,'RESTAURANT');
INSERT INTO FACILITY_CONST VALUES(11,'SMOKING_AREA');
INSERT INTO FACILITY_CONST VALUES(12,'PETS_ALLOWED');
INSERT INTO FACILITY_CONST VALUES(13,'NIGHT_CLUB');
INSERT INTO FACILITY_CONST VALUES(14,'DISABLED_FACILITIES');
INSERT INTO FACILITY_CONST VALUES(15,'WORK_FACILITIES');
INSERT INTO FACILITY_CONST VALUES(16,'GOLF_COURSE');

--!add room service
INSERT INTO SERVICE_CONST VALUES(1,'BREAKFAST_INCLUDED');
INSERT INTO SERVICE_CONST VALUES(2,'DINNER_INCLUDED');
INSERT INTO SERVICE_CONST VALUES(3,'FREE_SNACKS');
INSERT INTO SERVICE_CONST VALUES(4,'LUNCH_INCLUDED');
INSERT INTO SERVICE_CONST VALUES(5,'AFTERNOON_TEA');

--todo Triple E Hotel Metro Ben Thanh
INSERT INTO ROOM_TYPE VALUES(1, 1, N'Suite Deluxe', 5, 32, 4950000,
	N'Suite này có 1 giường đôi cực lớn, 1 giường sofa, TV màn hình phẳng, máy điều hòa và ấm đun nước điện,minibar',
	N'Hướng nhìn sân trong',
	'LARGE_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(1, 2, N'Suite Nhìn Ra Thành Phố', 3, 32, 5670000,
	N'Suite này có 1 giường đôi cực lớn, 1 giường sofa, TV màn hình phẳng, máy điều hòa và ấm đun nước điện,minibar',
	N'Nhìn ra địa danh nổi tiếng,Nhìn ra thành phố',
	'LARGE_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(1, 3, N'Suite Junior', 10, 28, 3150000,
	N'Suite này có 1 giường đôi cực lớn, 1 giường sofa, TV màn hình phẳng, máy điều hòa và ấm đun nước điện,minibar',
	N'Nhìn ra thành phố',
	'LARGE_DOUBLE');

--! add room facilities

INSERT INTO ROOM_FACILITY VALUES (1, 1, 2);
INSERT INTO ROOM_FACILITY VALUES (1, 1, 4);
INSERT INTO ROOM_FACILITY VALUES (1, 1, 5);
INSERT INTO ROOM_FACILITY VALUES (1, 1, 6);
INSERT INTO ROOM_FACILITY VALUES (1, 1, 8);
INSERT INTO ROOM_FACILITY VALUES (1, 1, 15);

INSERT INTO ROOM_FACILITY VALUES (1, 2, 2);
INSERT INTO ROOM_FACILITY VALUES (1, 2, 4);
INSERT INTO ROOM_FACILITY VALUES (1, 2, 5);
INSERT INTO ROOM_FACILITY VALUES (1, 2, 6);
INSERT INTO ROOM_FACILITY VALUES (1, 2, 8);
INSERT INTO ROOM_FACILITY VALUES (1, 2, 15);

INSERT INTO ROOM_FACILITY VALUES (1, 3, 2);
INSERT INTO ROOM_FACILITY VALUES (1, 3, 4);
INSERT INTO ROOM_FACILITY VALUES (1, 3, 5);
INSERT INTO ROOM_FACILITY VALUES (1, 3, 6);
INSERT INTO ROOM_FACILITY VALUES (1, 3, 8);
INSERT INTO ROOM_FACILITY VALUES (1, 3, 15);

--! add room services
INSERT INTO ROOM_SERVICE VALUES (1, 1, 1);
INSERT INTO ROOM_SERVICE VALUES (1, 1, 3);

INSERT INTO ROOM_SERVICE VALUES (1, 2, 1);
INSERT INTO ROOM_SERVICE VALUES (1, 2, 3);
INSERT INTO ROOM_SERVICE VALUES (1, 2, 5);

INSERT INTO ROOM_SERVICE VALUES (1, 3, 1);

----todo Nexus House Thao Dien
INSERT INTO ROOM_TYPE VALUES(2, 1, N'Studio Nhìn Ra Vườn', 7, 35, 1870000,
	N'Studio này có 1 giường đôi lớn, có ban công, lối vào riêng và ghế sofa.',
	N'Ban công,Nhìn ra vườn',
	'LARGE_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(2, 2, N'Căn Hộ Có Ban Công', 5, 40,2380000,
	N'Căn hộ này có 1 giường đôi lớn,1 giường sofa, có ban công, nhà bếp',
	N'Ban công,Nhìn ra thành phố',
	'LARGE_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(2, 3, N'Căn Hộ Studio', 5, 40,2422500,
	N'Căn hộ này có 1 giường đôi lớn,1 giường sofa, có ban công,lối vào riêng,nhà bếp',
	N'Ban công,Nhìn ra thành phố',
	'LARGE_DOUBLE');

--!add room failiti
INSERT INTO ROOM_FACILITY VALUES(2,1,2);
INSERT INTO ROOM_FACILITY VALUES(2,1,3);
INSERT INTO ROOM_FACILITY VALUES(2,1,7);
INSERT INTO ROOM_FACILITY VALUES(2,1,8);
INSERT INTO ROOM_FACILITY VALUES(2,1,15);

INSERT INTO ROOM_FACILITY VALUES(2,2,2);
INSERT INTO ROOM_FACILITY VALUES(2,2,3);
INSERT INTO ROOM_FACILITY VALUES(2,2,7);
INSERT INTO ROOM_FACILITY VALUES(2,2,8);
INSERT INTO ROOM_FACILITY VALUES(2,2,15);

INSERT INTO ROOM_FACILITY VALUES(2,3,2);
INSERT INTO ROOM_FACILITY VALUES(2,3,3);
INSERT INTO ROOM_FACILITY VALUES(2,3,7);
INSERT INTO ROOM_FACILITY VALUES(2,3,8);
INSERT INTO ROOM_FACILITY VALUES(2,3,15);


--!add room service 
INSERT INTO ROOM_SERVICE VALUES(2,1,5);

INSERT INTO ROOM_SERVICE VALUES(2,2,5);

INSERT INTO ROOM_SERVICE VALUES(2,3,5);

----todo Landmark Plus Luxury - Vinhomes Central Park
INSERT INTO ROOM_TYPE VALUES(3, 1, N'Căn hộ Deluxe', 10, 55,2475000,
	N'Căn hộ này có 1 giường đôi lớn, ban công, TV truyền hình cáp và đồ bếp.',
	N'Ban công,Sân hiên,Nhìn ra vườn,Nhìn ra hồ bơi,Nhìn ra địa danh nổi tiếng,Nhìn ra thành phố,Nhìn ra sông,Hướng nhìn sân trong,Sân trong',
	'LARGE_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(3, 2, N'Căn Hộ Có Ban Công', 20, 55,2500000,
	N'Căn hộ này có 1 giường đôi lớn,  ban công, sàn lát gạch/đá cẩm thạch và hồ bơi riêng.',
	N'Ban công,Sân hiên,Nhìn ra vườn,Nhìn ra hồ bơi,Nhìn ra địa danh nổi tiếng,Nhìn ra thành phố,Nhìn ra sông,Hướng nhìn sân trong,Sân trong',
	'LARGE_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(3, 3, N'Căn Hộ 2 Phòng Ngủ', 8, 79,3240000,
	N'Căn hộ này có 2 giường đôi lớn,ban công, lối vào riêng và bếp nấu ăn.',
	N'Ban công,Sân hiên,Nhìn ra vườn,Nhìn ra hồ bơi,Nhìn ra địa danh nổi tiếng,Nhìn ra thành phố,Nhìn ra sông,Hướng nhìn sân trong,Sân trong',
	'LARGE_DOUBLE');

--!ADD ROOM FACILITIES

INSERT INTO ROOM_FACILITY VALUES(3,1,2);
INSERT INTO ROOM_FACILITY VALUES(3,1,3);
INSERT INTO ROOM_FACILITY VALUES(3,1,4);
INSERT INTO ROOM_FACILITY VALUES(3,1,5);
INSERT INTO ROOM_FACILITY VALUES(3,1,7);
INSERT INTO ROOM_FACILITY VALUES(3,1,8);
INSERT INTO ROOM_FACILITY VALUES(3,1,9);
INSERT INTO ROOM_FACILITY VALUES(3,1,11);
INSERT INTO ROOM_FACILITY VALUES(3,1,12);
INSERT INTO ROOM_FACILITY VALUES(3,1,13);
INSERT INTO ROOM_FACILITY VALUES(3,1,14);
INSERT INTO ROOM_FACILITY VALUES(3,1,15);
INSERT INTO ROOM_FACILITY VALUES(3,1,16);


INSERT INTO ROOM_FACILITY VALUES(3,2,2);
INSERT INTO ROOM_FACILITY VALUES(3,2,3);
INSERT INTO ROOM_FACILITY VALUES(3,2,4);
INSERT INTO ROOM_FACILITY VALUES(3,2,5);
INSERT INTO ROOM_FACILITY VALUES(3,2,7);
INSERT INTO ROOM_FACILITY VALUES(3,2,8);
INSERT INTO ROOM_FACILITY VALUES(3,2,9);
INSERT INTO ROOM_FACILITY VALUES(3,2,11);
INSERT INTO ROOM_FACILITY VALUES(3,2,12);
INSERT INTO ROOM_FACILITY VALUES(3,2,13);
INSERT INTO ROOM_FACILITY VALUES(3,2,14);
INSERT INTO ROOM_FACILITY VALUES(3,2,15);
INSERT INTO ROOM_FACILITY VALUES(3,2,16);


INSERT INTO ROOM_FACILITY VALUES(3,3,2);
INSERT INTO ROOM_FACILITY VALUES(3,3,3);
INSERT INTO ROOM_FACILITY VALUES(3,3,4);
INSERT INTO ROOM_FACILITY VALUES(3,3,5);
INSERT INTO ROOM_FACILITY VALUES(3,3,7);
INSERT INTO ROOM_FACILITY VALUES(3,3,8);
INSERT INTO ROOM_FACILITY VALUES(3,3,9);
INSERT INTO ROOM_FACILITY VALUES(3,3,11);
INSERT INTO ROOM_FACILITY VALUES(3,3,12);
INSERT INTO ROOM_FACILITY VALUES(3,3,13);
INSERT INTO ROOM_FACILITY VALUES(3,3,14);
INSERT INTO ROOM_FACILITY VALUES(3,3,15);
INSERT INTO ROOM_FACILITY VALUES(3,3,16);

--!ADD ROOM SERVICES
INSERT INTO ROOM_SERVICE VALUES(3,1,5);

INSERT INTO ROOM_SERVICE VALUES(3,2,5);

INSERT INTO ROOM_SERVICE VALUES(3,3,5);

----todo Musketeers Guest House
INSERT INTO ROOM_TYPE VALUES(4, 1, N'Phòng 2 Giường Đơn', 10, 15,2620000 ,
	N'Phòng gồm 2 giường đơn, có ấm đun nước điện và máy lạnh.',
	N'Nhìn ra vườn',
	'SINGLE_OR_TWIN');

INSERT INTO ROOM_TYPE VALUES(4, 2, N'Phòng Deluxe Giường Đôi', 12, 20,3000000 ,
	N'Phòng gồm 1 giường đôi, có ấm đun nước điện và máy lạnh,TV truyền hình cáp.',
	N'Nhìn ra vườn',
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(4, 3, N'Giường Tầng Trong Phòng Ngủ Tập Thể Cho Nam Và Nữ', 10, 28,2620000 ,
	N'Phòng gồm 4 giường tầng, có ấm đun nước điện và máy lạnh.',
	N'Nhìn ra vườn',
	'BUNK');

--!ADD ROOM FACUILITY
INSERT INTO ROOM_FACILITY VALUES(4,1,2);
INSERT INTO ROOM_FACILITY VALUES(4,1,3);
INSERT INTO ROOM_FACILITY VALUES(4,1,6);
INSERT INTO ROOM_FACILITY VALUES(4,1,8);
INSERT INTO ROOM_FACILITY VALUES(4,1,13);

INSERT INTO ROOM_FACILITY VALUES(4,2,2);
INSERT INTO ROOM_FACILITY VALUES(4,2,3);
INSERT INTO ROOM_FACILITY VALUES(4,2,6);
INSERT INTO ROOM_FACILITY VALUES(4,2,8);
INSERT INTO ROOM_FACILITY VALUES(4,2,13);

INSERT INTO ROOM_FACILITY VALUES(4,3,2);
INSERT INTO ROOM_FACILITY VALUES(4,3,3);
INSERT INTO ROOM_FACILITY VALUES(4,3,6);
INSERT INTO ROOM_FACILITY VALUES(4,3,8);
INSERT INTO ROOM_FACILITY VALUES(4,3,13);

--!ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(4,1,1);

INSERT INTO ROOM_SERVICE VALUES(4,2,1);

INSERT INTO ROOM_SERVICE VALUES(4,3,1);

----todo Cristina Boutique Hotel
INSERT INTO ROOM_TYPE VALUES(5, 1, N'Phòng Tiêu Chuẩn Giường Đôi', 10, 15,1600000,
	N'Phòng gồm 1 giường đôi, có ấm đun nước điện và máy lạnh.',
	N'Nhìn ra thành phố',
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(5, 2, N'Phòng Deluxe Giường Đôi/2 Giường Đơn Có Ban Công', 7, 28,2150000,
	N'Phòng gồm 1 giường đôi/2 giường đơn, có ấm đun nước điện và máy lạnh.',
	N'Nhìn ra thành phố,Ban Công,Sân hiên',
	'SINGLE_OR_TWIN');

INSERT INTO ROOM_TYPE VALUES(5, 3, N'Phòng Gia Đình Có Ban Công', 5, 30,2350000,
	N'Phòng gồm 1 giường đôi và 1 giường đơn, có ấm đun nước điện và máy lạnh.',
	N'Nhìn ra thành phố,Ban Công,Sân hiên',
	'SINGLE_OR_TWIN');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(5,1,2);
INSERT INTO ROOM_FACILITY VALUES(5,1,4);
INSERT INTO ROOM_FACILITY VALUES(5,1,6);
INSERT INTO ROOM_FACILITY VALUES(5,1,7);
INSERT INTO ROOM_FACILITY VALUES(5,1,8);

INSERT INTO ROOM_FACILITY VALUES(5,2,2);
INSERT INTO ROOM_FACILITY VALUES(5,2,4);
INSERT INTO ROOM_FACILITY VALUES(5,2,6);
INSERT INTO ROOM_FACILITY VALUES(5,2,7);
INSERT INTO ROOM_FACILITY VALUES(5,2,8);

INSERT INTO ROOM_FACILITY VALUES(5,3,2);
INSERT INTO ROOM_FACILITY VALUES(5,3,4);
INSERT INTO ROOM_FACILITY VALUES(5,3,6);
INSERT INTO ROOM_FACILITY VALUES(5,3,7);
INSERT INTO ROOM_FACILITY VALUES(5,3,8);


--!ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(5,1,1);

INSERT INTO ROOM_SERVICE VALUES(5,2,1);

INSERT INTO ROOM_SERVICE VALUES(5,3,1);



----TODO SMARANA Hanoi HERITAGE
INSERT INTO ROOM_TYPE VALUES(6, 1, N'Phòng Deluxe Có Giường Cỡ King', 5, 28,3688470 ,
	N'Phòng gồm 1 giường đôi Có khu vực ghế ngồi, máy điều hòa và bếp nhỏ.',
	N'Hướng nhìn sân trong',
	'LARGE_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(6, 2, N'Suite có giường cỡ King với ban công', 4, 42,5532705,
	N'Phòng gồm 1 giường đôi có ban công, máy pha trà/cà phê và ấm đun nước điện.',
	N'Ban công,Nhìn ra thành phố',
	'LARGE_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(6, 3, N'Suite Hạng Tổng Thống', 3, 45, 6036300,
	N'Phòng gồm 1 giường đôi có ban công, hệ thống cách âm và ấm đun nước điện.',
	N'Ban công,Nhìn ra thành phố',
	'LARGE_DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(6,1,2);
INSERT INTO ROOM_FACILITY VALUES(6,1,3);
INSERT INTO ROOM_FACILITY VALUES(6,1,4);
INSERT INTO ROOM_FACILITY VALUES(6,1,6);
INSERT INTO ROOM_FACILITY VALUES(6,1,8);
INSERT INTO ROOM_FACILITY VALUES(6,1,10);
INSERT INTO ROOM_FACILITY VALUES(6,1,11);
INSERT INTO ROOM_FACILITY VALUES(6,1,13);
INSERT INTO ROOM_FACILITY VALUES(6,1,14);
INSERT INTO ROOM_FACILITY VALUES(6,1,15);

INSERT INTO ROOM_FACILITY VALUES(6,2,2);
INSERT INTO ROOM_FACILITY VALUES(6,2,3);
INSERT INTO ROOM_FACILITY VALUES(6,2,4);
INSERT INTO ROOM_FACILITY VALUES(6,2,6);
INSERT INTO ROOM_FACILITY VALUES(6,2,8);
INSERT INTO ROOM_FACILITY VALUES(6,2,10);
INSERT INTO ROOM_FACILITY VALUES(6,2,11);
INSERT INTO ROOM_FACILITY VALUES(6,2,13);
INSERT INTO ROOM_FACILITY VALUES(6,2,14);
INSERT INTO ROOM_FACILITY VALUES(6,2,15);

INSERT INTO ROOM_FACILITY VALUES(6,3,2);
INSERT INTO ROOM_FACILITY VALUES(6,3,3);
INSERT INTO ROOM_FACILITY VALUES(6,3,4);
INSERT INTO ROOM_FACILITY VALUES(6,3,6);
INSERT INTO ROOM_FACILITY VALUES(6,3,8);
INSERT INTO ROOM_FACILITY VALUES(6,3,10);
INSERT INTO ROOM_FACILITY VALUES(6,3,11);
INSERT INTO ROOM_FACILITY VALUES(6,3,13);
INSERT INTO ROOM_FACILITY VALUES(6,3,14);
INSERT INTO ROOM_FACILITY VALUES(6,3,15);

--!ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(6,1,1);
INSERT INTO ROOM_SERVICE VALUES(6,1,2);
INSERT INTO ROOM_SERVICE VALUES(6,1,3);
INSERT INTO ROOM_SERVICE VALUES(6,1,4);
INSERT INTO ROOM_SERVICE VALUES(6,1,5);

INSERT INTO ROOM_SERVICE VALUES(6,2,1);
INSERT INTO ROOM_SERVICE VALUES(6,2,2);
INSERT INTO ROOM_SERVICE VALUES(6,2,3);
INSERT INTO ROOM_SERVICE VALUES(6,2,4);
INSERT INTO ROOM_SERVICE VALUES(6,2,5);

INSERT INTO ROOM_SERVICE VALUES(6,3,1);
INSERT INTO ROOM_SERVICE VALUES(6,3,2);
INSERT INTO ROOM_SERVICE VALUES(6,3,3);
INSERT INTO ROOM_SERVICE VALUES(6,3,4);
INSERT INTO ROOM_SERVICE VALUES(6,3,5);

----todo An Hiên Homestay Hội An
INSERT INTO ROOM_TYPE VALUES(7, 1, N'Phòng Deluxe cho 3 Người', 3, 30, 870000,
	N'This triple room has a electric kettle, tile/marble floor and bathrobe.',
	N'Sân vườn',
	'LARGE_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(7, 2, N'Phòng Tiêu Chuẩn Có Giường Cỡ King', 3, 20,550000,
	N'Phòng giường đôi này có ban công, máy điều hòa và sàn lát gạch/đá cẩm thạch.',
	N'Ban công',
	'LARGE_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(7, 3, N'Phòng Superior Giường Đôi', 3, 25, 600000,
	N'This double room has a tumble dryer, tile/marble floor and electric kettle.',
	N'Sân vườn',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(7,1,2);
INSERT INTO ROOM_FACILITY VALUES(7,1,3);
INSERT INTO ROOM_FACILITY VALUES(7,1,4);
INSERT INTO ROOM_FACILITY VALUES(7,1,7);
INSERT INTO ROOM_FACILITY VALUES(7,1,8);
INSERT INTO ROOM_FACILITY VALUES(7,1,15);

INSERT INTO ROOM_FACILITY VALUES(7,2,2);
INSERT INTO ROOM_FACILITY VALUES(7,2,3);
INSERT INTO ROOM_FACILITY VALUES(7,2,4);
INSERT INTO ROOM_FACILITY VALUES(7,2,7);
INSERT INTO ROOM_FACILITY VALUES(7,2,8);
INSERT INTO ROOM_FACILITY VALUES(7,2,15);

INSERT INTO ROOM_FACILITY VALUES(7,3,2);
INSERT INTO ROOM_FACILITY VALUES(7,3,3);
INSERT INTO ROOM_FACILITY VALUES(7,3,4);
INSERT INTO ROOM_FACILITY VALUES(7,3,7);
INSERT INTO ROOM_FACILITY VALUES(7,3,8);
INSERT INTO ROOM_FACILITY VALUES(7,3,15);


--!ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(7,1,1);

INSERT INTO ROOM_SERVICE VALUES(7,2,1);

INSERT INTO ROOM_SERVICE VALUES(7,3,1);



----todo iHome Hoi An
INSERT INTO ROOM_TYPE VALUES(8, 1, N'Phòng Giường Đôi Nhìn Ra Hồ Bơi', 4, 30,950000,
	N'Phòng giường đôi này có ban công, máy điều hòa và ấm đun nước điện.',
	N'Ban công,Tầm nhìn ra khung cảnh',
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(8, 2, N'Phòng Deluxe Giường Đôi Có Ban Công', 5, 30,850000,
	N'Phòng Giường Đôi này có ban công, ấm đun nước điện và máy điều hòa.',
	N'Ban công,Tầm nhìn ra khung cảnh',
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(8, 3, N'Phòng 2 giường đơn có ban công', 4, 30,850000,
	N'Phòng 2 Giường Đơn này có ban công, ấm đun nước điện và máy điều hòa.',
	N'Ban công,Tầm nhìn ra khung cảnh',
	'SINGLE_OR_TWIN');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(8,1,1);
INSERT INTO ROOM_FACILITY VALUES(8,1,2);
INSERT INTO ROOM_FACILITY VALUES(8,1,3);
INSERT INTO ROOM_FACILITY VALUES(8,1,4);
INSERT INTO ROOM_FACILITY VALUES(8,1,6);
INSERT INTO ROOM_FACILITY VALUES(8,1,7);
INSERT INTO ROOM_FACILITY VALUES(8,1,8);
INSERT INTO ROOM_FACILITY VALUES(8,1,9);
INSERT INTO ROOM_FACILITY VALUES(8,1,13);
INSERT INTO ROOM_FACILITY VALUES(8,1,15);

INSERT INTO ROOM_FACILITY VALUES(8,2,1);
INSERT INTO ROOM_FACILITY VALUES(8,2,2);
INSERT INTO ROOM_FACILITY VALUES(8,2,3);
INSERT INTO ROOM_FACILITY VALUES(8,2,4);
INSERT INTO ROOM_FACILITY VALUES(8,2,6);
INSERT INTO ROOM_FACILITY VALUES(8,2,7);
INSERT INTO ROOM_FACILITY VALUES(8,2,8);
INSERT INTO ROOM_FACILITY VALUES(8,2,9);
INSERT INTO ROOM_FACILITY VALUES(8,2,13);
INSERT INTO ROOM_FACILITY VALUES(8,2,15);

INSERT INTO ROOM_FACILITY VALUES(8,3,1);
INSERT INTO ROOM_FACILITY VALUES(8,3,2);
INSERT INTO ROOM_FACILITY VALUES(8,3,3);
INSERT INTO ROOM_FACILITY VALUES(8,3,4);
INSERT INTO ROOM_FACILITY VALUES(8,3,6);
INSERT INTO ROOM_FACILITY VALUES(8,3,7);
INSERT INTO ROOM_FACILITY VALUES(8,3,8);
INSERT INTO ROOM_FACILITY VALUES(8,3,9);
INSERT INTO ROOM_FACILITY VALUES(8,3,13);
INSERT INTO ROOM_FACILITY VALUES(8,3,15);

--!ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(8,1,1);

INSERT INTO ROOM_SERVICE VALUES(8,2,1);

INSERT INTO ROOM_SERVICE VALUES(8,3,1);


----todo Florida Nha Trang Hotel
INSERT INTO ROOM_TYPE VALUES(9, 1, N'Suite', 4, 60,4200000,
	N'Phòng giường đôi này có ấm đun nước điện, bể sục, minibar và đồ nội thất được làm hoàn toàn bằng gỗ tự nhiên.Bao gồm: - Trái cây hằng ngày.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
	'LARGE_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(9, 2, N'Senior Deluxe', 4, 45,2400000 ,
	N'Phòng giường đôi này có ban công, áo choàng tắm, TV truyền hình cáp và đồ nội thất được làm hoàn toàn bằng gỗ tự nhiên.',
	N'Nhìn ra núi,Nhìn ra biển,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(9, 3, N'Phòng Deluxe Giường Đôi/2 Giường Đơn Nhìn Ra Thành Phố', 10,28,1550000,
	N'Phòng giường đôi/2 giường đơn này có áo choàng tắm, minibar, hệ thống cách âm, TV màn hình phẳng và đồ nội thất được làm hoàn toàn bằng gỗ tự nhiên.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
	'SINGLE_OR_TWIN');
--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(9,1,1);
INSERT INTO ROOM_FACILITY VALUES(9,1,2);
INSERT INTO ROOM_FACILITY VALUES(9,1,3);
INSERT INTO ROOM_FACILITY VALUES(9,1,4);
INSERT INTO ROOM_FACILITY VALUES(9,1,5);
INSERT INTO ROOM_FACILITY VALUES(9,1,6);
INSERT INTO ROOM_FACILITY VALUES(9,1,7);
INSERT INTO ROOM_FACILITY VALUES(9,1,8);
INSERT INTO ROOM_FACILITY VALUES(9,1,9);
INSERT INTO ROOM_FACILITY VALUES(9,1,10);
INSERT INTO ROOM_FACILITY VALUES(9,1,11);
INSERT INTO ROOM_FACILITY VALUES(9,1,13);
INSERT INTO ROOM_FACILITY VALUES(9,1,14);
INSERT INTO ROOM_FACILITY VALUES(9,1,15);

INSERT INTO ROOM_FACILITY VALUES(9,2,1);
INSERT INTO ROOM_FACILITY VALUES(9,2,2);
INSERT INTO ROOM_FACILITY VALUES(9,2,3);
INSERT INTO ROOM_FACILITY VALUES(9,2,4);
INSERT INTO ROOM_FACILITY VALUES(9,2,5);
INSERT INTO ROOM_FACILITY VALUES(9,2,6);
INSERT INTO ROOM_FACILITY VALUES(9,2,7);
INSERT INTO ROOM_FACILITY VALUES(9,2,8);
INSERT INTO ROOM_FACILITY VALUES(9,2,9);
INSERT INTO ROOM_FACILITY VALUES(9,2,10);
INSERT INTO ROOM_FACILITY VALUES(9,2,11);
INSERT INTO ROOM_FACILITY VALUES(9,2,13);
INSERT INTO ROOM_FACILITY VALUES(9,2,14);
INSERT INTO ROOM_FACILITY VALUES(9,2,15);

INSERT INTO ROOM_FACILITY VALUES(9,3,1);
INSERT INTO ROOM_FACILITY VALUES(9,3,2);
INSERT INTO ROOM_FACILITY VALUES(9,3,3);
INSERT INTO ROOM_FACILITY VALUES(9,3,4);
INSERT INTO ROOM_FACILITY VALUES(9,3,5);
INSERT INTO ROOM_FACILITY VALUES(9,3,6);
INSERT INTO ROOM_FACILITY VALUES(9,3,7);
INSERT INTO ROOM_FACILITY VALUES(9,3,8);
INSERT INTO ROOM_FACILITY VALUES(9,3,9);
INSERT INTO ROOM_FACILITY VALUES(9,3,10);
INSERT INTO ROOM_FACILITY VALUES(9,3,11);
INSERT INTO ROOM_FACILITY VALUES(9,3,13);
INSERT INTO ROOM_FACILITY VALUES(9,3,14);
INSERT INTO ROOM_FACILITY VALUES(9,3,15);
--!ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(9,1,1);
INSERT INTO ROOM_SERVICE VALUES(9,1,2);
INSERT INTO ROOM_SERVICE VALUES(9,1,3);

INSERT INTO ROOM_SERVICE VALUES(9,2,1);
INSERT INTO ROOM_SERVICE VALUES(9,2,2);
INSERT INTO ROOM_SERVICE VALUES(9,2,3);

INSERT INTO ROOM_SERVICE VALUES(9,3,1);
INSERT INTO ROOM_SERVICE VALUES(9,3,2);
INSERT INTO ROOM_SERVICE VALUES(9,3,3);


----todo Crown Hotel Nha Trang
INSERT INTO ROOM_TYPE VALUES(10, 1, N'Phòng Deluxe Có Giường Cỡ King', 4, 26,2100000,
	N'Phòng Giường Đôi này có ban công, khu vực ghế ngồi và TV truyền hình cáp.',
	N'Ban công,Sân hiên,Nhìn ra biển',
	'LARGE_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(10, 2, N'Phòng 2 Giường Đơn Nhìn Ra Biển', 5, 26,1650000,
	N'Phòng 2 Giường Đơn này có ban công, khu vực ăn uống và ấm đun nước điện.',
	N'Ban công,Sân hiên,Nhìn ra biển',
	'SINGLE_OR_TWIN');

INSERT INTO ROOM_TYPE VALUES(10, 3, N'Phòng Superior Giường Đôi/2 Giường Đơn Nhìn Ra Thành Phố', 6, 24,1275000,
	N'Phòng Giường Đôi/2 Giường Đơn có ban công, khu vực ghế ngồi và TV truyền hình vệ tinh.',
	N'Ban công,Sân hiên,Nhìn ra thành phố',
	'SINGLE_OR_TWIN');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(10,1,1);
INSERT INTO ROOM_FACILITY VALUES(10,1,2);
INSERT INTO ROOM_FACILITY VALUES(10,1,3);
INSERT INTO ROOM_FACILITY VALUES(10,1,4);
INSERT INTO ROOM_FACILITY VALUES(10,1,5);
INSERT INTO ROOM_FACILITY VALUES(10,1,6);
INSERT INTO ROOM_FACILITY VALUES(10,1,7);
INSERT INTO ROOM_FACILITY VALUES(10,1,8);
INSERT INTO ROOM_FACILITY VALUES(10,1,10);
INSERT INTO ROOM_FACILITY VALUES(10,1,11);
INSERT INTO ROOM_FACILITY VALUES(10,1,15);

--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(10,1,1);

INSERT INTO ROOM_SERVICE VALUES(10,2,1);

INSERT INTO ROOM_SERVICE VALUES(10,3,1);


----todo Fati Botique Hotel Vũng Tàu
INSERT INTO ROOM_TYPE VALUES(11, 1, N'Suite Deluxe Gia Đình', 2, 60,4300000,
	N'Phòng giường tầng này có ấm đun nước điện, tủ lạnh mini, nước lọc',
	N'Nhìn ra thành phố, Nhìn ra địa danh nổi tiếng',
	'BUNK');
INSERT INTO ROOM_TYPE VALUES(11, 2, N'Suite Royal Nhìn ra Biển', 2, 70,4800000,
	N'Phòng giường đôi này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Nhìn ra biển, Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
	'DOUBLE');
INSERT INTO ROOM_TYPE VALUES(11, 3, N'Suite President Nhìn ra Thành Phố', 3, 80,5300000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(11,1,1);
INSERT INTO ROOM_FACILITY VALUES(11,1,2);
INSERT INTO ROOM_FACILITY VALUES(11,1,3);

INSERT INTO ROOM_FACILITY VALUES(11,2,4);
INSERT INTO ROOM_FACILITY VALUES(11,2,5);
INSERT INTO ROOM_FACILITY VALUES(11,2,6);

INSERT INTO ROOM_FACILITY VALUES(11,3,7);
INSERT INTO ROOM_FACILITY VALUES(11,3,6);

--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(11,1,2);
INSERT INTO ROOM_SERVICE VALUES(11,1,4);

INSERT INTO ROOM_SERVICE VALUES(11,2,3);

INSERT INTO ROOM_SERVICE VALUES(11,3,5);
INSERT INTO ROOM_SERVICE VALUES(11,3,4);

----todo Halios Luxury Halong Hotel
INSERT INTO ROOM_TYPE VALUES(12, 1, N'Suite Deluxe Giường Đôi / 2 Giường Đơn', 2, 60,4200000,
	N'Phòng giường tầng này có ấm đun nước điện, tủ lạnh mini, nước lọc',
	N'Nhìn ra thành phố, Nhìn ra địa danh nổi tiếng',
	'SINGLE_OR_TWIN');
INSERT INTO ROOM_TYPE VALUES(12, 2, N'Suite có Giường cỡ King và Bồn Tắm Spa', 2, 70,4700000,
	N'Phòng giường đôi này có ấm đun nước điện, sofa, bàn ghế trang điểm, Bồn tắm spa, máy sấy.',
	N'Nhìn ra biển, Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
	'DOUBLE');
INSERT INTO ROOM_TYPE VALUES(12, 3, N'Suite', 3, 80,5100000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(12,1,1);
INSERT INTO ROOM_FACILITY VALUES(12,1,2);
INSERT INTO ROOM_FACILITY VALUES(12,1,3);

INSERT INTO ROOM_FACILITY VALUES(12,2,4);
INSERT INTO ROOM_FACILITY VALUES(12,2,5);
INSERT INTO ROOM_FACILITY VALUES(12,2,6);

INSERT INTO ROOM_FACILITY VALUES(12,3,7);
INSERT INTO ROOM_FACILITY VALUES(12,3,6);

--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(12,1,2);
INSERT INTO ROOM_SERVICE VALUES(12,1,4);

INSERT INTO ROOM_SERVICE VALUES(12,2,3);

INSERT INTO ROOM_SERVICE VALUES(12,3,5);
INSERT INTO ROOM_SERVICE VALUES(12,3,4);

----todo Mi Nhon Em Hotel Muine Phan Thiết
INSERT INTO ROOM_TYPE VALUES(13, 1, N'Suite Junior', 2, 60,4200000,
	N'Phòng giường tầng này có ấm đun nước điện, tủ lạnh mini, nước lọc',
	N'Nhìn ra thành phố, Nhìn ra địa danh nổi tiếng',
	'BUNK');
INSERT INTO ROOM_TYPE VALUES(13, 2, N'Suite Senior Nhìn ra biển', 2, 70,4500000,
	N'Phòng giường lớn này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Nhìn ra biển, Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
	'LARGE');
INSERT INTO ROOM_TYPE VALUES(13, 3, N'Suite Gia Đình Có Cửa Thông Nhìn ra Biển', 3, 80,5200000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(13,1,11);
INSERT INTO ROOM_FACILITY VALUES(13,1,4);
INSERT INTO ROOM_FACILITY VALUES(13,1,7);

INSERT INTO ROOM_FACILITY VALUES(13,2,2);
INSERT INTO ROOM_FACILITY VALUES(13,2,5);
INSERT INTO ROOM_FACILITY VALUES(13,2,9);

INSERT INTO ROOM_FACILITY VALUES(13,3,7);
INSERT INTO ROOM_FACILITY VALUES(13,3,6);
INSERT INTO ROOM_FACILITY VALUES(13,3,9);
INSERT INTO ROOM_FACILITY VALUES(13,3,12);

--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(13,1,2);

INSERT INTO ROOM_SERVICE VALUES(13,2,4);
INSERT INTO ROOM_SERVICE VALUES(13,2,3);

INSERT INTO ROOM_SERVICE VALUES(13,3,5);
INSERT INTO ROOM_SERVICE VALUES(13,3,4);

----todo DelaSol Sapa Hotel
INSERT INTO ROOM_TYPE VALUES(14, 1, N'Suite President có Ban công', 2, 60,4500000,
	N'Phòng một giường lớn này có ấm đun nước điện, Smart TV,bếp điện từ, minibar, đồ nội thất.',
	N'Ban công,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
	'LARGE');
INSERT INTO ROOM_TYPE VALUES(14, 2, N'Suite Royal có Ban công', 2, 45,4800000,
	N'Phòng giường đôi này có ấm đun nước điện, két sắt, bể sục, minibar và bàn trang điểm',
	N'Ban công, Nhìn ra thành biển, Nhìn ra địa thành phố',
	'DOUBLE');
INSERT INTO ROOM_TYPE VALUES(14, 3, N'Suite Luxury 3 Người', 3, 80,5500000,
	N'Phòng giường đôi lớn này có ấm đun nước điện, sofa, điều hòa, minibar và đẩy đủ đồ nội thất..',
	N'Nhìn ra núi, Nhìn ra rừng, Nhìn ra địa danh nổi tiếng',
	'LARGE_DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(14,1,12);
INSERT INTO ROOM_FACILITY VALUES(14,1,13);
INSERT INTO ROOM_FACILITY VALUES(14,1,3);
INSERT INTO ROOM_FACILITY VALUES(14,1,7);

INSERT INTO ROOM_FACILITY VALUES(14,2,4);
INSERT INTO ROOM_FACILITY VALUES(14,2,5);
INSERT INTO ROOM_FACILITY VALUES(14,2,6);

INSERT INTO ROOM_FACILITY VALUES(14,3,7);
INSERT INTO ROOM_FACILITY VALUES(14,3,10);
INSERT INTO ROOM_FACILITY VALUES(14,3,11);
INSERT INTO ROOM_FACILITY VALUES(14,3,16);

--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(14,1,1);

INSERT INTO ROOM_SERVICE VALUES(14,2,4);
INSERT INTO ROOM_SERVICE VALUES(14,2,3);

INSERT INTO ROOM_SERVICE VALUES(14,3,1);
INSERT INTO ROOM_SERVICE VALUES(14,3,4);
INSERT INTO ROOM_SERVICE VALUES(14,3,5);

----todo Pistachio Sapa Hotel
INSERT INTO ROOM_TYPE VALUES(15, 1, N'Suite Junior', 2, 60,4200000,
	N'Phòng giường tầng này có ấm đun nước điện, tủ lạnh mini, nước lọc',
	N'Nhìn ra thành phố, Nhìn ra địa danh nổi tiếng',
	'BUNK');
INSERT INTO ROOM_TYPE VALUES(15, 2, N'Phòng Giường Đôi Có Ban Công', 2, 70,4500000,
	N'Phòng giường đôi này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Ban công, Nhìn ra biển, Nhìn ra thành phố',
	'DOUBLE');
INSERT INTO ROOM_TYPE VALUES(15, 3, N'Suite Panorama', 3, 80,5200000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(15,1,1);
INSERT INTO ROOM_FACILITY VALUES(15,1,2);
INSERT INTO ROOM_FACILITY VALUES(15,1,9);

INSERT INTO ROOM_FACILITY VALUES(15,2,4);
INSERT INTO ROOM_FACILITY VALUES(15,2,6);
INSERT INTO ROOM_FACILITY VALUES(15,2,8);

INSERT INTO ROOM_FACILITY VALUES(15,3,7);
INSERT INTO ROOM_FACILITY VALUES(15,3,10);

--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(15,1,2);
INSERT INTO ROOM_SERVICE VALUES(15,1,4);

INSERT INTO ROOM_SERVICE VALUES(15,2,3);

INSERT INTO ROOM_SERVICE VALUES(15,3,5);
INSERT INTO ROOM_SERVICE VALUES(15,3,4);

----todo Star city Riverside by Haviland Hotel
INSERT INTO ROOM_TYPE VALUES(16, 1, N'Suite Junior Giường Tầng Nhìn Ra Biển', 2, 60,4200000,
	N'Phòng giường tầng này có ấm đun nước điện, tủ lạnh mini, nước lọc',
	N'Nhìn ra biển, Nhìn ra địa danh nổi tiếng',
	'BUNK');
INSERT INTO ROOM_TYPE VALUES(16, 2, N'Phòng Excutive 2 Người', 2, 70,4500000,
	N'Phòng giường đôi này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Nhìn ra biển, Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
	'DOUBLE');
INSERT INTO ROOM_TYPE VALUES(16, 3, N'Phòng Superior 4 Người', 3, 80,5200000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Ban công rộng,Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
	'LARGE_DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(16,1,1);
INSERT INTO ROOM_FACILITY VALUES(16,1,3);
INSERT INTO ROOM_FACILITY VALUES(16,1,4);

INSERT INTO ROOM_FACILITY VALUES(16,2,5);
INSERT INTO ROOM_FACILITY VALUES(16,2,7);
INSERT INTO ROOM_FACILITY VALUES(16,2,12);

INSERT INTO ROOM_FACILITY VALUES(16,3,11);
INSERT INTO ROOM_FACILITY VALUES(16,3,12);

--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(16,1,2);
INSERT INTO ROOM_SERVICE VALUES(16,1,4);

INSERT INTO ROOM_SERVICE VALUES(16,2,3);

INSERT INTO ROOM_SERVICE VALUES(16,3,1);
INSERT INTO ROOM_SERVICE VALUES(16,3,4);


----todo Na Hostel Hue
INSERT INTO ROOM_TYPE VALUES(17, 1, N'Phòng Có Giường Cỡ King', 3, 24,1650000,
	N'This double room features air conditioning, an electric kettle, a flat-screen TV and city views. The unit offers 1 bed.',
	N'Nhìn ra thành phố',
	'LARGE_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(17, 2, N'Phòng Deluxe Giường Đôi', 5, 24,1650000,
	N'The spacious double room features air conditioning, a wardrobe, as well as a private bathroom boasting a shower and a hairdryer. The unit has 2 beds.',
	N'Nhìn ra thành phố',
	'SINGLE_OR_TWIN');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(17,1,2);
INSERT INTO ROOM_FACILITY VALUES(17,1,3);
INSERT INTO ROOM_FACILITY VALUES(17,1,4);
INSERT INTO ROOM_FACILITY VALUES(17,1,8);
INSERT INTO ROOM_FACILITY VALUES(17,1,11);

INSERT INTO ROOM_FACILITY VALUES(17,2,2);
INSERT INTO ROOM_FACILITY VALUES(17,2,3);
INSERT INTO ROOM_FACILITY VALUES(17,2,4);
INSERT INTO ROOM_FACILITY VALUES(17,2,8);
INSERT INTO ROOM_FACILITY VALUES(17,2,11);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(17,1,1);
INSERT INTO ROOM_SERVICE VALUES(17,2,1);

----todo The Chum Boutique
INSERT INTO ROOM_TYPE VALUES(18, 1, N'Phòng Duplex 4 Người', 1, 40,2768000,
	N'Offering free toiletries and bathrobes, this quadruple room includes a private bathroom with a shower, a hairdryer and slippers. The quadruple room offers air conditioning, soundproof walls, a safe deposit box, a flat-screen TV, as well as city views. The unit has 2 beds.',
	N'Nhìn ra thành phố',
	'LARGE_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(18, 2, N'Phòng Deluxe Giường Đôi Có Bồn Tắm', 3, 30, 1960000,
	N'The spacious double room features air conditioning, soundproof walls, as well as a private bathroom boasting a bath and a shower. This double room provides a safe deposit box, a flat-screen TV and city views. The unit has 1 bed.',
	N'Nhìn ra thành phố',
	'LARGE_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(18, 3, N'Phòng Giường Đôi', 5, 25,1872000,
	N'Featuring free toiletries and bathrobes, this double room includes a private bathroom with a shower, a hairdryer and slippers. The double room features air conditioning, soundproof walls, a safe deposit box, a flat-screen TV, as well as city views. The unit has 1 bed.',
	N'Nhìn ra thành phố',
	'LARGE_DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(18,1,2);
INSERT INTO ROOM_FACILITY VALUES(18,1,3);
INSERT INTO ROOM_FACILITY VALUES(18,1,4);
INSERT INTO ROOM_FACILITY VALUES(18,1,7);
INSERT INTO ROOM_FACILITY VALUES(18,1,8);

INSERT INTO ROOM_FACILITY VALUES(18,2,2);
INSERT INTO ROOM_FACILITY VALUES(18,2,3);
INSERT INTO ROOM_FACILITY VALUES(18,2,4);
INSERT INTO ROOM_FACILITY VALUES(18,2,7);
INSERT INTO ROOM_FACILITY VALUES(18,2,8);

INSERT INTO ROOM_FACILITY VALUES(18,3,2);
INSERT INTO ROOM_FACILITY VALUES(18,3,3);
INSERT INTO ROOM_FACILITY VALUES(18,3,4);
INSERT INTO ROOM_FACILITY VALUES(18,3,7);
INSERT INTO ROOM_FACILITY VALUES(18,3,8);

--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(18,1,1);
INSERT INTO ROOM_SERVICE VALUES(18,2,1);
INSERT INTO ROOM_SERVICE VALUES(18,3,1);

----todo Art Garden Dalat
INSERT INTO ROOM_TYPE VALUES(19, 1, N'Phòng Gia Đình', 1, 25,1637500,
	N'Offering free toiletries and bathrobes, this family room includes a private bathroom with a shower, a hairdryer and slippers. The family room features a dining area, a wardrobe, an electric kettle as well as a balcony with city views. The unit offers 3 beds.',
	N'Ban công,Nhìn ra thành phố',
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(19, 2, N'Phòng Giường Đôi', 3, 15,1450000,
	N'Providing free toiletries and bathrobes, this double room includes a private bathroom with a shower, a hairdryer and slippers. The double room features a dining area, a wardrobe, an electric kettle as well as a balcony with city views. The unit offers 1 bed.',
	N'Ban công,Nhìn ra thành phố',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(19,1,2);
INSERT INTO ROOM_FACILITY VALUES(19,1,3);
INSERT INTO ROOM_FACILITY VALUES(19,1,7);
INSERT INTO ROOM_FACILITY VALUES(19,1,8);

INSERT INTO ROOM_FACILITY VALUES(19,2,2);
INSERT INTO ROOM_FACILITY VALUES(19,2,3);
INSERT INTO ROOM_FACILITY VALUES(19,2,7);
INSERT INTO ROOM_FACILITY VALUES(19,2,8);

--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(19,1,1);
INSERT INTO ROOM_SERVICE VALUES(19,2,1);

----todo Đà Lạt Thanh Xuân Hotel
INSERT INTO ROOM_TYPE VALUES(20, 1, N'Phòng Gia đình nhìn ra Núi', 2, 30,1892500,
	N'Phòng gia đình này được bố trí phòng tắm riêng với buồng tắm đứng, máy sấy tóc, dép và đồ vệ sinh cá nhân miễn phí. Phòng gia đình có tiện nghi BBQ, TV màn hình phẳng, tầm nhìn ra núi cũng như rượu vang/rượu sâm panh cho khách. Căn này được trang bị 2 giường.',
	N'Nhìn ra núi',
	'SINGLE_OR_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(20, 2, N'Phòng Có Giường Cỡ King Với Ban Công', 3, 25,1700000,
	N'Phòng giường đôi này được bố trí phòng tắm riêng với buồng tắm đứng, máy sấy tóc, dép và đồ vệ sinh cá nhân miễn phí. Phòng giường đôi có tiện nghi BBQ, TV màn hình phẳng, tầm nhìn ra thành phố cũng như rượu vang/rượu sâm panh cho khách. Căn này được trang bị 1 giường.',
	N'Sân trong,Ban công,Nhìn ra thành phố',
	'LARGE_DOUBLE');

INSERT INTO ROOM_TYPE VALUES(20, 3, N'Phòng Deluxe Giường Đôi', 3, 20,1539000,
	N'Phòng giường đôi này được bố trí phòng tắm riêng với buồng tắm đứng, máy sấy tóc, dép và đồ vệ sinh cá nhân miễn phí. Phòng giường đôi có tiện nghi BBQ, TV màn hình phẳng và sân hiên. Căn này được trang bị 1 giường.',
	N'Sân hiên',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(20,1,2);
INSERT INTO ROOM_FACILITY VALUES(20,1,3);
INSERT INTO ROOM_FACILITY VALUES(20,1,4);
INSERT INTO ROOM_FACILITY VALUES(20,1,6);
INSERT INTO ROOM_FACILITY VALUES(20,1,7);
INSERT INTO ROOM_FACILITY VALUES(20,1,8);
INSERT INTO ROOM_FACILITY VALUES(20,1,9);
INSERT INTO ROOM_FACILITY VALUES(20,1,10);
INSERT INTO ROOM_FACILITY VALUES(20,1,11);
INSERT INTO ROOM_FACILITY VALUES(20,1,13);
INSERT INTO ROOM_FACILITY VALUES(20,1,14);

INSERT INTO ROOM_FACILITY VALUES(20,2,2);
INSERT INTO ROOM_FACILITY VALUES(20,2,3);
INSERT INTO ROOM_FACILITY VALUES(20,2,4);
INSERT INTO ROOM_FACILITY VALUES(20,2,6);
INSERT INTO ROOM_FACILITY VALUES(20,2,7);
INSERT INTO ROOM_FACILITY VALUES(20,2,8);
INSERT INTO ROOM_FACILITY VALUES(20,2,9);
INSERT INTO ROOM_FACILITY VALUES(20,2,10);
INSERT INTO ROOM_FACILITY VALUES(20,2,11);
INSERT INTO ROOM_FACILITY VALUES(20,2,13);
INSERT INTO ROOM_FACILITY VALUES(20,2,14);

INSERT INTO ROOM_FACILITY VALUES(20,3,2);
INSERT INTO ROOM_FACILITY VALUES(20,3,3);
INSERT INTO ROOM_FACILITY VALUES(20,3,4);
INSERT INTO ROOM_FACILITY VALUES(20,3,6);
INSERT INTO ROOM_FACILITY VALUES(20,3,7);
INSERT INTO ROOM_FACILITY VALUES(20,3,8);
INSERT INTO ROOM_FACILITY VALUES(20,3,9);
INSERT INTO ROOM_FACILITY VALUES(20,3,10);
INSERT INTO ROOM_FACILITY VALUES(20,3,11);
INSERT INTO ROOM_FACILITY VALUES(20,3,13);
INSERT INTO ROOM_FACILITY VALUES(20,3,14);

--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(20,1,2);
INSERT INTO ROOM_SERVICE VALUES(20,2,2);
INSERT INTO ROOM_SERVICE VALUES(20,3,2);

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
INSERT INTO ROOM_PICTURE VALUES(2,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/Studio%20Nh%C3%ACn%20Ra%20V%C6%B0%E1%BB%9Dn1.jpg');
INSERT INTO ROOM_PICTURE VALUES(2,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/Studio%20Nh%C3%ACn%20Ra%20V%C6%B0%E1%BB%9Dn2.jpg');
INSERT INTO ROOM_PICTURE VALUES(2,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/Studio%20Nh%C3%ACn%20Ra%20V%C6%B0%E1%BB%9Dn3.jpg');

INSERT INTO ROOM_PICTURE VALUES(2,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/C%C4%83n%20H%E1%BB%99%20C%C3%B3%20Ban%20C%C3%B4ng1.jpg');
INSERT INTO ROOM_PICTURE VALUES(2,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/C%C4%83n%20H%E1%BB%99%20C%C3%B3%20Ban%20C%C3%B4ng2.jpg');
INSERT INTO ROOM_PICTURE VALUES(2,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/C%C4%83n%20H%E1%BB%99%20C%C3%B3%20Ban%20C%C3%B4ng3.jpg');

INSERT INTO ROOM_PICTURE VALUES(2,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/C%C4%83n%20H%E1%BB%99%20Studio1.jpg');
INSERT INTO ROOM_PICTURE VALUES(2,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/C%C4%83n%20H%E1%BB%99%20Studio2.jpg');
INSERT INTO ROOM_PICTURE VALUES(2,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/C%C4%83n%20H%E1%BB%99%20Studio3.jpg');

--todo Landmark Plus Luxury - Vinhomes Central Park
INSERT INTO ROOM_PICTURE VALUES(3,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20h%E1%BB%99%20Deluxe1.jpg');
INSERT INTO ROOM_PICTURE VALUES(3,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20h%E1%BB%99%20Deluxe2.jpg');
INSERT INTO ROOM_PICTURE VALUES(3,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20h%E1%BB%99%20Deluxe3.jpg');

INSERT INTO ROOM_PICTURE VALUES(3,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20H%E1%BB%99%20C%C3%B3%20Ban%20C%C3%B4ng1.1.jpg');
INSERT INTO ROOM_PICTURE VALUES(3,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20H%E1%BB%99%20C%C3%B3%20Ban%20C%C3%B4ng2.2.jpg');
INSERT INTO ROOM_PICTURE VALUES(3,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20H%E1%BB%99%20C%C3%B3%20Ban%20C%C3%B4ng3.3.jpg');

INSERT INTO ROOM_PICTURE VALUES(3,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20H%E1%BB%99%202%20Ph%C3%B2ng%20Ng%E1%BB%A71.jpg');
INSERT INTO ROOM_PICTURE VALUES(3,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20H%E1%BB%99%202%20Ph%C3%B2ng%20Ng%E1%BB%A72.jpg');
INSERT INTO ROOM_PICTURE VALUES(3,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/C%C4%83n%20H%E1%BB%99%202%20Ph%C3%B2ng%20Ng%E1%BB%A73.jpg');

--todo Musketeers Guest House
INSERT INTO ROOM_PICTURE VALUES(4,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Ph%C3%B2ng%202%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n1.jpg');
INSERT INTO ROOM_PICTURE VALUES(4,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Ph%C3%B2ng%202%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n2.jpg');
INSERT INTO ROOM_PICTURE VALUES(4,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Ph%C3%B2ng%202%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n3.jpg');

INSERT INTO ROOM_PICTURE VALUES(4,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i1.jpg');
INSERT INTO ROOM_PICTURE VALUES(4,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i2.jpg');
INSERT INTO ROOM_PICTURE VALUES(4,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i3.jpg');

INSERT INTO ROOM_PICTURE VALUES(4,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Gi%C6%B0%E1%BB%9Dng%20T%E1%BA%A7ng%20Trong%20Ph%C3%B2ng%20Ng%E1%BB%A7%20T%E1%BA%ADp%20Th%E1%BB%831.jpg');
INSERT INTO ROOM_PICTURE VALUES(4,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Gi%C6%B0%E1%BB%9Dng%20T%E1%BA%A7ng%20Trong%20Ph%C3%B2ng%20Ng%E1%BB%A7%20T%E1%BA%ADp%20Th%E1%BB%832.jpg');
INSERT INTO ROOM_PICTURE VALUES(4,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Gi%C6%B0%E1%BB%9Dng%20T%E1%BA%A7ng%20Trong%20Ph%C3%B2ng%20Ng%E1%BB%A7%20T%E1%BA%ADp%20Th%E1%BB%833.jpg');

--todo Cristina Boutique Hotel
INSERT INTO ROOM_PICTURE VALUES(5,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Ph%C3%B2ng%20Ti%C3%AAu%20Chu%E1%BA%A9n%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i1.jpg');
INSERT INTO ROOM_PICTURE VALUES(5,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Ph%C3%B2ng%20Ti%C3%AAu%20Chu%E1%BA%A9n%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i2.jpg');
INSERT INTO ROOM_PICTURE VALUES(5,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Ph%C3%B2ng%20Ti%C3%AAu%20Chu%E1%BA%A9n%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i3.jpg');

INSERT INTO ROOM_PICTURE VALUES(5,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20C%C3%B3%20Ban%20C%C3%B4ng1.jpg');
INSERT INTO ROOM_PICTURE VALUES(5,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20C%C3%B3%20Ban%20C%C3%B4ng2.jpg');
INSERT INTO ROOM_PICTURE VALUES(5,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20C%C3%B3%20Ban%20C%C3%B4ng3.jpg');

INSERT INTO ROOM_PICTURE VALUES(5,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Ph%C3%B2ng%20Gia%20%C4%90%C3%ACnh%20C%C3%B3%20Ban%20C%C3%B4ng1.jpg');
INSERT INTO ROOM_PICTURE VALUES(5,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Ph%C3%B2ng%20Gia%20%C4%90%C3%ACnh%20C%C3%B3%20Ban%20C%C3%B4ng2.jpg');
INSERT INTO ROOM_PICTURE VALUES(5,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Ph%C3%B2ng%20Gia%20%C4%90%C3%ACnh%20C%C3%B3%20Ban%20C%C3%B4ng3.jpg');

--TODO SMARANA Hanoi HERITAGE
INSERT INTO ROOM_PICTURE VALUES(6,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Ph%C3%B2ng%20Deluxe%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King1.jpg');
INSERT INTO ROOM_PICTURE VALUES(6,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Ph%C3%B2ng%20Deluxe%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King2.jpg');
INSERT INTO ROOM_PICTURE VALUES(6,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Ph%C3%B2ng%20Deluxe%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King3.jpg');

INSERT INTO ROOM_PICTURE VALUES(6,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Suite%20co%CC%81%20gi%C6%B0%C6%A1%CC%80ng%20c%C6%A1%CC%83%20King%20v%E1%BB%9Bi%20ban%20c%C3%B4ng1.jpg');
INSERT INTO ROOM_PICTURE VALUES(6,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Suite%20co%CC%81%20gi%C6%B0%C6%A1%CC%80ng%20c%C6%A1%CC%83%20King%20v%E1%BB%9Bi%20ban%20c%C3%B4ng2.jpg');
INSERT INTO ROOM_PICTURE VALUES(6,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Suite%20co%CC%81%20gi%C6%B0%C6%A1%CC%80ng%20c%C6%A1%CC%83%20King%20v%E1%BB%9Bi%20ban%20c%C3%B4ng3.jpg');

INSERT INTO ROOM_PICTURE VALUES(6,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Suite%20H%E1%BA%A1ng%20T%E1%BB%95ng%20Th%E1%BB%91ng1.jpg');
INSERT INTO ROOM_PICTURE VALUES(6,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Suite%20H%E1%BA%A1ng%20T%E1%BB%95ng%20Th%E1%BB%91ng2.jpg');
INSERT INTO ROOM_PICTURE VALUES(6,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/Suite%20H%E1%BA%A1ng%20T%E1%BB%95ng%20Th%E1%BB%91ng3.jpg');

--! An Hiên Homestay Hội An => must fix
--eluxe
INSERT INTO ROOM_PICTURE VALUES(7,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Deluxe%20cho%203%20Ng%C6%B0%E1%BB%9Di1.jpg');
INSERT INTO ROOM_PICTURE VALUES(7,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Deluxe%20cho%203%20Ng%C6%B0%E1%BB%9Di2.jpg');
INSERT INTO ROOM_PICTURE VALUES(7,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Deluxe%20cho%203%20Ng%C6%B0%E1%BB%9Di3.jpg');
--king
INSERT INTO ROOM_PICTURE VALUES(7,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Pho%CC%80ng%20Ti%C3%AAu%20Chu%C3%A2%CC%89n%20Co%CC%81%20Gi%C6%B0%C6%A1%CC%80ng%20C%C6%A1%CC%83%20King1.jpg');
INSERT INTO ROOM_PICTURE VALUES(7,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Pho%CC%80ng%20Ti%C3%AAu%20Chu%C3%A2%CC%89n%20Co%CC%81%20Gi%C6%B0%C6%A1%CC%80ng%20C%C6%A1%CC%83%20King2.jpg');
INSERT INTO ROOM_PICTURE VALUES(7,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Pho%CC%80ng%20Ti%C3%AAu%20Chu%C3%A2%CC%89n%20Co%CC%81%20Gi%C6%B0%C6%A1%CC%80ng%20C%C6%A1%CC%83%20King3.jpg');
--superior
INSERT INTO ROOM_PICTURE VALUES(7,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Superior%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i1.jpg');
INSERT INTO ROOM_PICTURE VALUES(7,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Superior%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i2.jpg');
INSERT INTO ROOM_PICTURE VALUES(7,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Superior%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i3.jpg');

--todo iHome Hoi An
INSERT INTO ROOM_PICTURE VALUES(8,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i%20Nh%C3%ACn%20Ra%20H%E1%BB%93%20B%C6%A1i1.jpg');
INSERT INTO ROOM_PICTURE VALUES(8,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i%20Nh%C3%ACn%20Ra%20H%E1%BB%93%20B%C6%A1i2.jpg');
INSERT INTO ROOM_PICTURE VALUES(8,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i%20Nh%C3%ACn%20Ra%20H%E1%BB%93%20B%C6%A1i3.jpg');

INSERT INTO ROOM_PICTURE VALUES(8,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i%20C%C3%B3%20Ban%20C%C3%B4ng1.jpg');
INSERT INTO ROOM_PICTURE VALUES(8,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i%20C%C3%B3%20Ban%20C%C3%B4ng2.jpg');
INSERT INTO ROOM_PICTURE VALUES(8,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i%20C%C3%B3%20Ban%20C%C3%B4ng3.jpg');

INSERT INTO ROOM_PICTURE VALUES(8,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%202%20gi%C6%B0%E1%BB%9Dng%20%C4%91%C6%A1n%20co%CC%81%20ban%20c%C3%B4ng1.jpg');
INSERT INTO ROOM_PICTURE VALUES(8,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%202%20gi%C6%B0%E1%BB%9Dng%20%C4%91%C6%A1n%20co%CC%81%20ban%20c%C3%B4ng2.jpg');
INSERT INTO ROOM_PICTURE VALUES(8,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Ph%C3%B2ng%202%20gi%C6%B0%E1%BB%9Dng%20%C4%91%C6%A1n%20co%CC%81%20ban%20c%C3%B4ng3.jpg');

--! Florida Nha Trang Hotel -->must fix
--suite
INSERT INTO ROOM_PICTURE VALUES(9,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Florida%20Nha%20Trang%20Hotel/Suite1.jpg');
INSERT INTO ROOM_PICTURE VALUES(9,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Florida%20Nha%20Trang%20Hotel/Suite2.jpg');
INSERT INTO ROOM_PICTURE VALUES(9,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Florida%20Nha%20Trang%20Hotel/Suite3.jpg');
--senior deluxe
INSERT INTO ROOM_PICTURE VALUES(9,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Florida%20Nha%20Trang%20Hotel/Senior%20Deluxe1.jpg');
INSERT INTO ROOM_PICTURE VALUES(9,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Florida%20Nha%20Trang%20Hotel/Senior%20Deluxe2.jpg');
INSERT INTO ROOM_PICTURE VALUES(9,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Florida%20Nha%20Trang%20Hotel/Senior%20Deluxe3.jpg');
--view tp
INSERT INTO ROOM_PICTURE VALUES(9,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Florida%20Nha%20Trang%20Hotel/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%911.jpg');
INSERT INTO ROOM_PICTURE VALUES(9,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Florida%20Nha%20Trang%20Hotel/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%912.jpg');
INSERT INTO ROOM_PICTURE VALUES(9,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Florida%20Nha%20Trang%20Hotel/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%913.jpg');

--todo Crown Hotel Nha Trang
INSERT INTO ROOM_PICTURE VALUES(10,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%20Deluxe%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King1.1.jpg');
INSERT INTO ROOM_PICTURE VALUES(10,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%20Deluxe%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King1.2.jpg');
INSERT INTO ROOM_PICTURE VALUES(10,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%20Deluxe%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King1.3.jpg');

INSERT INTO ROOM_PICTURE VALUES(10,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%202%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Bi%E1%BB%83n1.jpg');
INSERT INTO ROOM_PICTURE VALUES(10,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%202%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Bi%E1%BB%83n2.jpg');
INSERT INTO ROOM_PICTURE VALUES(10,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%202%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Bi%E1%BB%83n3.jpg');

INSERT INTO ROOM_PICTURE VALUES(10,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%20Superior%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%911.jpg');
INSERT INTO ROOM_PICTURE VALUES(10,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%20Superior%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%912.jpg');
INSERT INTO ROOM_PICTURE VALUES(10,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Crown%20Hotel%20Nha%20Trang/Ph%C3%B2ng%20Superior%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%913.jpg');

----todo Fati Botique Hotel Vũng Tàu
INSERT INTO ROOM_PICTURE VALUES(11,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Fati%20Boutique%20Hotel/335467546.jpg');
INSERT INTO ROOM_PICTURE VALUES(11,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Fati%20Boutique%20Hotel/336208771.jpg');
INSERT INTO ROOM_PICTURE VALUES(11,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Fati%20Boutique%20Hotel/336292390.jpg');

INSERT INTO ROOM_PICTURE VALUES(11,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Fati%20Boutique%20Hotel/337086341.jpg');
INSERT INTO ROOM_PICTURE VALUES(11,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Fati%20Boutique%20Hotel/334384752.jpg');
INSERT INTO ROOM_PICTURE VALUES(11,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Fati%20Boutique%20Hotel/334369573.jpg');

INSERT INTO ROOM_PICTURE VALUES(11,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Fati%20Boutique%20Hotel/334369572.jpg');
INSERT INTO ROOM_PICTURE VALUES(11,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Fati%20Boutique%20Hotel/334369565.jpg');
INSERT INTO ROOM_PICTURE VALUES(11,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Fati%20Boutique%20Hotel/334369514.jpg');

----todo Halios Luxury Hotel Hạ Long
INSERT INTO ROOM_PICTURE VALUES(12,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Halios%20Luxury%20Halong%20Hotel/449912287.jpg');
INSERT INTO ROOM_PICTURE VALUES(12,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Halios%20Luxury%20Halong%20Hotel/449912313.jpg');
INSERT INTO ROOM_PICTURE VALUES(12,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Halios%20Luxury%20Halong%20Hotel/449912342.jpg');

INSERT INTO ROOM_PICTURE VALUES(12,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Halios%20Luxury%20Halong%20Hotel/449916352.jpg');
INSERT INTO ROOM_PICTURE VALUES(12,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Halios%20Luxury%20Halong%20Hotel/449916360.jpg');
INSERT INTO ROOM_PICTURE VALUES(12,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Halios%20Luxury%20Halong%20Hotel/449925775.jpg');

INSERT INTO ROOM_PICTURE VALUES(12,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Halios%20Luxury%20Halong%20Hotel/449926165.jpg');
INSERT INTO ROOM_PICTURE VALUES(12,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Halios%20Luxury%20Halong%20Hotel/468213975.jpg');

----todo Mi Nhon Em Hotel Muine Phan Thiết
INSERT INTO ROOM_PICTURE VALUES(13,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mi%20Nhon%20Em%20Hotel%20Muine/425765463.jpg');
INSERT INTO ROOM_PICTURE VALUES(13,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mi%20Nhon%20Em%20Hotel%20Muine/425765562.jpg');
INSERT INTO ROOM_PICTURE VALUES(13,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mi%20Nhon%20Em%20Hotel%20Muine/425788880.jpg');

INSERT INTO ROOM_PICTURE VALUES(13,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mi%20Nhon%20Em%20Hotel%20Muine/425788884.jpg');
INSERT INTO ROOM_PICTURE VALUES(13,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mi%20Nhon%20Em%20Hotel%20Muine/431896528.jpg');
INSERT INTO ROOM_PICTURE VALUES(13,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mi%20Nhon%20Em%20Hotel%20Muine/434307989.jpg');

INSERT INTO ROOM_PICTURE VALUES(13,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mi%20Nhon%20Em%20Hotel%20Muine/434961924.jpg');
INSERT INTO ROOM_PICTURE VALUES(13,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mi%20Nhon%20Em%20Hotel%20Muine/434961996.jpg');

----todo DelaSol Sapa Hotel
INSERT INTO ROOM_PICTURE VALUES(14,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/DeLaSol%20Sapa%20Hotel/349612057.jpg');
INSERT INTO ROOM_PICTURE VALUES(14,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/DeLaSol%20Sapa%20Hotel/349612102.jpg');
INSERT INTO ROOM_PICTURE VALUES(14,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/DeLaSol%20Sapa%20Hotel/349612140.jpg');

INSERT INTO ROOM_PICTURE VALUES(14,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/DeLaSol%20Sapa%20Hotel/349612055.jpg');
INSERT INTO ROOM_PICTURE VALUES(14,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/DeLaSol%20Sapa%20Hotel/349611959.jpg');
INSERT INTO ROOM_PICTURE VALUES(14,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/DeLaSol%20Sapa%20Hotel/340502432.jpg');

INSERT INTO ROOM_PICTURE VALUES(14,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/DeLaSol%20Sapa%20Hotel/340502431.jpg');
INSERT INTO ROOM_PICTURE VALUES(14,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/DeLaSol%20Sapa%20Hotel/340502425.jpg');

----todo Pistachio Sapa Hotel
INSERT INTO ROOM_PICTURE VALUES(15,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Pistachio%20Hotel%20Sapa/200762189.jpg');
INSERT INTO ROOM_PICTURE VALUES(15,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Pistachio%20Hotel%20Sapa/200762157.jpg');
INSERT INTO ROOM_PICTURE VALUES(15,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Pistachio%20Hotel%20Sapa/200759957.jpg');

INSERT INTO ROOM_PICTURE VALUES(15,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Pistachio%20Hotel%20Sapa/261685187.jpg');
INSERT INTO ROOM_PICTURE VALUES(15,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Pistachio%20Hotel%20Sapa/269775654.jpg');
INSERT INTO ROOM_PICTURE VALUES(15,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Pistachio%20Hotel%20Sapa/326287377.jpg');

INSERT INTO ROOM_PICTURE VALUES(15,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Pistachio%20Hotel%20Sapa/413493798.jpg');
INSERT INTO ROOM_PICTURE VALUES(15,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Pistachio%20Hotel%20Sapa/413435145.jpg');

----todo Star city Riverside by Haviland Hotel
INSERT INTO ROOM_PICTURE VALUES(16,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Star%20City%20Riverside%20Hotel%20By%20Haviland/245832649.jpg');
INSERT INTO ROOM_PICTURE VALUES(16,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Star%20City%20Riverside%20Hotel%20By%20Haviland/246006672.jpg');
INSERT INTO ROOM_PICTURE VALUES(16,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Star%20City%20Riverside%20Hotel%20By%20Haviland/246008656.jpg');

INSERT INTO ROOM_PICTURE VALUES(16,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Star%20City%20Riverside%20Hotel%20By%20Haviland/246030927.jpg');
INSERT INTO ROOM_PICTURE VALUES(16,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Star%20City%20Riverside%20Hotel%20By%20Haviland/346320600.jpg');
INSERT INTO ROOM_PICTURE VALUES(16,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Star%20City%20Riverside%20Hotel%20By%20Haviland/346321690.jpg');

INSERT INTO ROOM_PICTURE VALUES(16,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Star%20City%20Riverside%20Hotel%20By%20Haviland/428612339.jpg');
INSERT INTO ROOM_PICTURE VALUES(16,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Star%20City%20Riverside%20Hotel%20By%20Haviland/441637874.jpg');
INSERT INTO ROOM_PICTURE VALUES(16,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Star%20City%20Riverside%20Hotel%20By%20Haviland/77598478.jpg');

----todo Na Hostel Hue
INSERT INTO ROOM_PICTURE VALUES(17,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Na%20Hostel%20Hue/Ph%C3%B2ng%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King1.jpg');
INSERT INTO ROOM_PICTURE VALUES(17,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Na%20Hostel%20Hue/Ph%C3%B2ng%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King2.jpg');
INSERT INTO ROOM_PICTURE VALUES(17,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Na%20Hostel%20Hue/Ph%C3%B2ng%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King3.jpg');

INSERT INTO ROOM_PICTURE VALUES(17,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Na%20Hostel%20Hue/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i1.jpg');
INSERT INTO ROOM_PICTURE VALUES(17,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Na%20Hostel%20Hue/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i2.jpg');
INSERT INTO ROOM_PICTURE VALUES(17,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Na%20Hostel%20Hue/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i3.jpg');

----todo The Chum Boutique
INSERT INTO ROOM_PICTURE VALUES(18,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/The%20Chum%20Boutique/Ph%C3%B2ng%20Duplex%204%20Ng%C6%B0%E1%BB%9Di1.jpg');
INSERT INTO ROOM_PICTURE VALUES(18,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/The%20Chum%20Boutique/Ph%C3%B2ng%20Duplex%204%20Ng%C6%B0%E1%BB%9Di2.jpg');
INSERT INTO ROOM_PICTURE VALUES(18,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/The%20Chum%20Boutique/Ph%C3%B2ng%20Duplex%204%20Ng%C6%B0%E1%BB%9Di3.jpg');

INSERT INTO ROOM_PICTURE VALUES(18,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/The%20Chum%20Boutique/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i%20C%C3%B3%20B%E1%BB%93n%20T%E1%BA%AFm1.jpg');
INSERT INTO ROOM_PICTURE VALUES(18,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/The%20Chum%20Boutique/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i%20C%C3%B3%20B%E1%BB%93n%20T%E1%BA%AFm2.jpg');
INSERT INTO ROOM_PICTURE VALUES(18,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/The%20Chum%20Boutique/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i%20C%C3%B3%20B%E1%BB%93n%20T%E1%BA%AFm3.jpg');

INSERT INTO ROOM_PICTURE VALUES(18,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/The%20Chum%20Boutique/Ph%C3%B2ng%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i1.jpg');
INSERT INTO ROOM_PICTURE VALUES(18,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/The%20Chum%20Boutique/Ph%C3%B2ng%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i2.jpg');
INSERT INTO ROOM_PICTURE VALUES(18,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/The%20Chum%20Boutique/Ph%C3%B2ng%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i3.jpg');

----todo Art Garden Dalat
INSERT INTO ROOM_PICTURE VALUES(19,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Art%20Garden%20Dalat/Ph%C3%B2ng%20Gia%20%C4%90%C3%ACnh1.jpg');
INSERT INTO ROOM_PICTURE VALUES(19,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Art%20Garden%20Dalat/Ph%C3%B2ng%20Gia%20%C4%90%C3%ACnh2.jpg');
INSERT INTO ROOM_PICTURE VALUES(19,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Art%20Garden%20Dalat/Ph%C3%B2ng%20Gia%20%C4%90%C3%ACnh3.jpg');

INSERT INTO ROOM_PICTURE VALUES(19,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Art%20Garden%20Dalat/Ph%C3%B2ng%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i11.jpg');
INSERT INTO ROOM_PICTURE VALUES(19,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Art%20Garden%20Dalat/Ph%C3%B2ng%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i22.jpg');
INSERT INTO ROOM_PICTURE VALUES(19,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Art%20Garden%20Dalat/Ph%C3%B2ng%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i33.jpg');

----todo Đà Lạt Thanh Xuân Hotel
INSERT INTO ROOM_PICTURE VALUES(20,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/Ph%C3%B2ng%20Gia%20%C4%91%C3%ACnh%20nhi%CC%80n%20ra%20N%C3%BAi1.jpg');
INSERT INTO ROOM_PICTURE VALUES(20,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/Ph%C3%B2ng%20Gia%20%C4%91%C3%ACnh%20nhi%CC%80n%20ra%20N%C3%BAi2.jpg');
INSERT INTO ROOM_PICTURE VALUES(20,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/Ph%C3%B2ng%20Gia%20%C4%91%C3%ACnh%20nhi%CC%80n%20ra%20N%C3%BAi3.jpg');

INSERT INTO ROOM_PICTURE VALUES(20,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/Ph%C3%B2ng%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King%20V%E1%BB%9Bi%20Ban%20C%C3%B4ng1.jpg');
INSERT INTO ROOM_PICTURE VALUES(20,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/Ph%C3%B2ng%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King%20V%E1%BB%9Bi%20Ban%20C%C3%B4ng2.jpg');
INSERT INTO ROOM_PICTURE VALUES(20,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/Ph%C3%B2ng%20C%C3%B3%20Gi%C6%B0%E1%BB%9Dng%20C%E1%BB%A1%20King%20V%E1%BB%9Bi%20Ban%20C%C3%B4ng3.jpg');

INSERT INTO ROOM_PICTURE VALUES(20,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i11.jpg');
INSERT INTO ROOM_PICTURE VALUES(20,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i22.jpg');
INSERT INTO ROOM_PICTURE VALUES(20,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i33.jpg');






insert into REVIEW (AccountId, HotelId, Points, Content) 
values 
	('3696','6','10','Simple group training plant agent loss goal her continue order.'),
	('2699','2','8','Report eye unit peace hotel car choose everything.'),
	('4755','5','9','Ok service Republican always can nearly recognize growth public man him skill.'),
	('3680','7','8','Wife member his nothing stage certainly middle leader would natural.'),
	('2291','7','8','War seem think enough score enough age top.'),
	('7293','5','9','Now nothing low standard medical discussion like focus.'),
	('9003','2','9','Program scene key us need general whose never former say.'),
	('7427','10','9','Church away hand commercial effort determine realize more sense think gas sport miss fine.'),
	('6067','4','9','Research lose name group there health enough nor.'),
	('6292','10','10','Suggest your yet break child standard likely six out step.'),
	('4823','2','9','Which discover tree experience whether share network performance money blue.'),
	('2049','2','9','Maybe six teach factor figure increase step.'),
	('8174','8','10','Town down pay bed beyond student law image wait.'),
	('5820','4','10','How day bad audience community government add manage.'),
	('685','2','10','Trip at new card size result.'),
	('6677','7','8','Business provide group box high industry.'),
	('1510','3','8','Certainly site when everything effect check personal book.'),
	('5062','4','9','Strong product sea until low agree budget son author international born.'),
	('3486','6','10','Position matter weight reveal church social see build act newspaper participant.'),
	('1385','4','9','Boy party policy fund more every level wonder seek.'),
	('2576','10','10','Son although store economic himself easy own hotel number cover writer give.'),
	('3841','5','8','Suggest former important later debate provide lot civil that onto economy raise capital.'),
	('7959','7','10','Century truth manage parent whose ground car too mission however.'),
	('2485','4','10','Game worry hear site especially least.'),
	('3431','1','8','New full do generation program record others there character street.'),
	('7055','8','8','Color trial public fund official movie under police admit student three.'),
	('4907','7','8','Vote rise range loss clear political than read staff second including certainly.'),
	('5693','8','10','Boy truth happy skin analysis energy itself number baby recent federal.'),
	('2550','6','8','Mrs fish others future country do.'),
	('9422','8','8','Administration speak sort similar hospital sit.'),
	('1018','2','8','Group lead floor traditional should open try night need eight no.'),
	('9986','4','9','Source somebody white type easy house decade future her trouble.'),
	('2137','3','10','Catch certainly past grow two policy between mention many think what great rock.'),
	('5736','10','10','Threat especially produce note model best type daughter always again whatever watch.'),
	('1019','5','8','Present do operation impact form painting dog provide subject.'),
	('5860','4','10','Return do car fast hair sea order.'),
	('9426','2','10','Bar federal next both administration Congress.'),
	('8315','9','9','Two court hold test charge move.'),
	('7067','4','8','East purpose end site woman ever reflect whom so group too face easy.'),
	('8365','9','8','Company according order tree total determine structure early figure speech treat sing.'),
	('6114','8','9','Side their already technology matter herself job who.'),
	('9475','6','10','Card believe project decade themselves option bag process science west gun.'),
	('4069','5','10','Certainly question provide central reduce security factor true run beat why radio.'),
	('4649','10','8','Ago film pay against per stuff company national serve.'),
	('2467','4','8','Wall purpose his record front compare.'),
	('134','1','8','Live tend law there alone nice tough nature less together ever.'),
	('4910','10','10','Avoid center front seem serve any century their effort subject science growth air.'),
	('2017','6','10','Congress phone personal only marriage film thank investment employee small simply practice.'),
	('856','3','9','Daughter summer same simply question good morning leave.'),
	('8442','5','9','Question reflect scene represent radio system you wish toward government energy sport.'),
	('8733','3','9','Easy summer house way member begin camera fire.'),
	('2376','3','9','Other for watch writer alone anyone professional base quite air record.'),
	('7706','6','8','Determine Congress receive ever kitchen participant expert administration not call stay fish.'),
	('5776','9','9','Listen social national resource black four start machine manage because down save common.'),
	('7141','2','9','Strong business personal heart easy least seek prove believe job radio.'),
	('1797','7','8','Station sport card tough care unit value career figure support later point.'),
	('5588','5','9','Another area buy support food magazine strategy thank responsibility likely official seem.'),
	('9267','7','10','Push above several turn idea man thank ever market full.'),
	('4972','8','8','More training girl adult life safe positive social its draw day staff.'),
	('3800','8','10','Exist team think culture success himself administration difficult end truth game lot.'),
	('7077','3','8','Late along hotel size exist process perform answer lawyer.'),
	('6142','6','8','Artist free if democratic believe history listen outside west team base research.'),
	('7162','6','10','Management appear up bring market full talk.'),
	('7729','7','9','Southern material nation boy must study pick heart more message.'),
	('4113','1','8','I others next first process summer.'),
	('8964','3','10','Shoulder live movie ready one use near able.'),
	('5749','9','10','Door various daughter me middle scientist whether interview.'),
	('7827','2','8','Far else technology recognize represent law investment rich author friend need fill treat.'),
	('7996','2','8','Upon clear moment law if piece part however.'),
	('2577','9','8','Morning push tough population develop question human physical.'),
	('5498','8','9','Think model difficult organization television your she special though recent yeah cup.'),
	('3912','8','8','Apply attention south hot hear fear heavy.'),
	('3339','8','10','Create identify true growth Congress economic long old.'),
	('7054','8','9','Part break magazine together first one I plan amount include enough.'),
	('2188','4','10','North challenge true character office sign factor several.'),
	('5593','8','10','Drive might employee ever teach as table put central upon.'),
	('1517','4','8','Name property opportunity west discover PM growth big create population stand reason control.'),
	('4596','5','8','Expect improve approach letter put push decade recent loss morning bank pass.'),
	('9941','4','10','Federal issue information task understand hot win money full idea.'),
	('6842','2','10','Report well prepare view mouth change other left.'),
	('1963','10','9','Church board pass officer from discuss big far.'),
	('196','7','9','Fish hospital high single prevent various bed poor.'),
	('2735','5','8','Attention remain boy firm research catch most center debate.'),
	('5935','7','10','Price successful federal summer take fine blue total type carry party sit like.'),
	('1256','3','10','Difference community cell positive white these.'),
	('6118','9','8','Station whose card carry girl use must top easy station peace.'),
	('5768','1','10','Well start bed choose move use consumer similar dark.'),
	('2643','7','10','Young popular push four wait heart generation all school whom.'),
	('9935','10','8','Than hand level type nice subject above service tax customer difference others.'),
	('8831','8','9','Customer yourself fly feeling group must time million ready total her.'),
	('4039','4','9','Above performance shoulder dark grow board half future along international democratic.'),
	('4072','7','8','Direction house improve case item gas eight professor stage tree current than somebody.'),
	('5080','1','9','Hard store series red nature fast.'),
	('8357','1','8','Two lose run reality until item throw we chance.'),
	('1702','8','10','Wear religious down rest ever argue them yourself fast court.'),
	('8239','2','8','Challenge thank case seek onto at light.'),
	('7060','10','10','Financial clear house this charge national mother long seem out begin.'),
	('2999','1','9','Sign think travel organization window generation sometimes.'),
	('9782','8','10','Others recognize nearly style common safe operation.'),
	('33','2','8','Music tough pass night born evening series right interview be decide second.'),
	('3049','1','10','Official down because large wear every itself where quite once many look.'),
	('9044','10','10','Sister may people staff structure decision way also.'),
	('5599','6','8','Evidence only wide manager audience head growth nature suggest without.'),
	('223','10','9','House entire ahead seat sign voice least suggest possible claim send seven.'),
	('4511','1','10','Avoid thing left get wonder work marriage five her.'),
	('7571','3','10','Already model food drug Mr prove seek peace phone special until technology.'),
	('3327','9','10','Pick unit leg them threat treat first pick voice Democrat pattern speak.'),
	('67','1','10','Area specific over word force fine on while piece heart sort prove.'),
	('4382','4','10','Interest how out tree source focus sound charge full teacher increase agent same.'),
	('9289','9','10','Participant say lawyer wish enter night professional.'),
	('514','3','10','Mrs for involve eat learn human car fly national across good.'),
	('1520','1','10','Whole pattern opportunity not none everyone study or.'),
	('6028','9','10','Catch police never never candidate small our nation force beat.'),
	('1018','6','10','Establish against finish man enough rich follow idea onto none phone.'),
	('9205','9','8','Me avoid citizen over trip effect ready physical.'),
	('4710','8','9','Magazine friend agree or crime own PM anyone account hand whether economic power.'),
	('323','10','9','Shake professor enter teach apply book they law.'),
	('9636','1','8','Although whose huge travel family break total make pull view whose.'),
	('844','5','8','Century deep bar these establish senior build without herself defense order occur.'),
	('5747','7','10','Successful before compare letter wife make control mission success wrong skin technology reality.'),
	('5936','6','9','Enjoy type apply she most arm class stand.'),
	('6141','3','10','By strong candidate president notice local perform.'),
	('1582','10','8','Then among easy center development piece clear billion herself same.'),
	('9180','3','9','Space challenge inside result not father money guy never stop benefit.'),
	('6250','8','10','Television response draw few reflect marriage account medical across think radio future over floor.'),
	('9174','9','9','Well present treatment claim control party site type either back.'),
	('716','1','8','Table edge action feel various near skill treat.'),
	('3459','9','9','Reduce third onto care music create mind those friend everybody.'),
	('3902','3','9','Pick food technology method bring art performance artist toward.'),
	('7319','1','10','Poor yeah research who take office heart while.'),
	('8457','4','9','Large fine effort spend response two five Republican opportunity evidence letter or black.'),
	('7752','9','9','Product of himself themselves hand allow report everything.'),
	('9008','4','10','Real training remember doctor mind station.'),
	('6422','4','8','She your into throw recent most score specific total old.'),
	('3592','6','10','Manager my fall north team represent partner.'),
	('7475','6','10','Turn worker land happen certain hundred south probably.'),
	('6065','10','8','Choose firm truth cover type sort hot truth price reason year.'),
	('6951','9','9','Run inside generation want image score relate care natural behavior fire present.'),
	('4779','10','8','Democratic tell information war out remember painting key network mother.'),
	('1346','7','8','Character bar fish sound discover respond.'),
	('4667','3','8','Vote weight less expect fill protect hotel major forget whether bring couple put.'),
	('9103','6','8','Finally candidate market city probably next reality stage wide piece reflect herself foreign.'),
	('1503','10','9','Party reality open my cultural debate develop sing themselves stay relationship several.'),
	('9117','1','8','Approach new computer after make left end fact rich.'),
	('8980','8','8','If year each manager machine Republican type.'),
	('1540','1','8','Take rest Mrs season sign lose change according.'),
	('9223','3','8','Rock identify wide health choose action.'),
	('2204','6','9','Anything example upon course minute middle success shoulder election lose shoulder daughter.'),
	('2162','10','10','Station official major begin since room strong policy.'),
	('5652','3','9','Or occur race indeed use various investment believe suddenly economy.'),
	('7453','4','9','Which spring quality cell lot notice quality many score building politics Congress whom.'),
	('5945','2','10','Of know few cell suffer decade interesting read once mission both single say.'),
	('3952','8','8','Prove reflect current mind treatment great especially option well Democrat ready provide station.'),
	('8448','6','10','Plan find sell nice three letter senior consumer ready.'),
	('1017','1','9','Save job wish federal clearly close until value.'),
	('8825','4','10','Sit discussion mean range study sing gas speak join newspaper effort what.'),
	('2625','9','8','Owner child military real beyond need heavy Republican.'),
	('3218','7','8','Tonight human me wait early when bring discuss from night form improve.'),
	('5187','5','8','Officer direction like team member necessary son boy management way others final.'),
	('6491','9','10','Either computer we bag idea growth on media.'),
	('8526','6','8','West grow black detail line before build lead morning already.'),
	('6911','9','10','Choice whose method week nothing only long budget green international summer.'),
	('4039','10','8','I hold once into find later camera yes home size final building.'),
	('3024','1','9','View imagine first step enough dream open prevent here.'),
	('5818','4','9','First head early study power forget yourself morning significant safe sing.'),
	('483','6','9','Fight father record popular memory choose everything degree keep.'),
	('7356','1','8','Expect situation quickly quickly experience believe tend should medical.'),
	('7481','5','9','Responsibility material teach anyone operation history adult including ok current should.'),
	('872','9','9','Hand spend despite serve including mouth house network form visit low employee claim.'),
	('7650','3','8','Cover worry within method will outside result memory prevent card herself interview cell.'),
	('6659','6','8','Fly own executive coach several indicate spring player.'),
	('694','6','8','Poor beyond near ability yes responsibility teach political big head.'),
	('2432','8','8','Suffer age seat interesting let necessary establish.'),
	('7548','4','10','Room guess modern before imagine woman month fear.'),
	('5607','7','8','Public community capital recent new enter only physical each fish.'),
	('120','5','9','Range stuff learn ground subject base skill project crime next right.'),
	('7219','3','8','However place oil life face beautiful worker.'),
	('3081','5','8','Inside nor so success become customer official night industry because natural.'),
	('470','8','8','Election too without close you change affect young baby.'),
	('6391','8','8','Notice she truth serve evidence girl table organization.'),
	('3532','8','10','By east four model quickly current final ask music spend their natural continue.'),
	('4618','4','9','Treatment very health behind already way big yeah ahead.'),
	('2045','3','8','Social town order reduce image wait.'),
	('6540','1','8','Season ten right trial help play upon among according century table place.'),
	('5284','1','9','Into face two total see century sit much foot production.'),
	('2181','3','9','Establish appear where Mr several color.'),
	('3022','2','10','Agency create her then task east community though.'),
	('9084','9','10','Teach vote card each down approach sit choice law example new share.'),
	('8658','3','10','Study way next short class activity fire remember response religious.'),
	('7864','7','9','Collection beyond anything over cultural direction.'),
	('1123','5','9','Glass director up tree team magazine myself hotel weight ask.'),
	('6563','1','10','Free successful yet help still nor.'),
	('3937','1','9','Television pay government future from east instead course.'),
	('1645','4','10','Next people always send throw culture rest out claim politics benefit international mission.'),
	('9307','1','8','See use take bank for scientist source base.'),
	('7944','3','9','Hold act career country science forward relationship.'),
	('8676','8','8','Structure official mention huge herself morning something hand.'),
	('7044','1','8','May reflect cup often hair attack later look bank American.'),
	('3414','3','8','Past direction goal per teacher trip enjoy life audience.'),
	('7793','4','8','Wish early tax data ahead field economy rich bag simple.'),
	('421','10','7','Hour international start PM agent article many town on.'),
	('9775','10','8','Difference put general ready southern save young land grow remember.'),
	('4424','2','8','Market like town around country pattern and star.'),
	('8391','2','8','Expert fear throughout once talk such product coach floor effect wonder cultural.'),
	('3683','7','6','Media system drug draw plan personal threat.'),
	('4573','1','8','Speech property reveal star near world according practice light family whether prove.'),
	('1915','4','8','Age movement push movie which game movie.'),
	('7890','10','7','His sing sort forget chair candidate hard enter crime.'),
	('9348','4','7','Manage consider she well stop dog call recently.'),
	('2995','2','7','Affect news down yes middle less since deal part.'),
	('5542','1','6','Job ready gas sound history career.'),
	('5781','5','7','Break fall audience threat dream hospital best identify final up experience.'),
	('9939','9','6','Then collection old establish energy gun training.'),
	('328','8','7','Recently it language community pick property after.'),
	('395','2','6','Sport anyone meet news choose thank hold none through stop.'),
	('4155','7','6','Full center Mr important stuff contain until area policy.'),
	('1528','6','6','Herself support impact note eat hotel contain become.'),
	('228','7','7','With cup management realize commercial cost tend once visit else.'),
	('7133','6','6','Use attorney adult exist agree book American organization arrive technology.'),
	('4898','5','6','Answer crime seven most politics force bring talk.'),
	('9697','7','6','West doctor war us him from.'),
	('5555','9','6','Contain outside option you leave experience decision five eat.'),
	('333','5','6','Media wish pattern approach or keep.'),
	('3709','10','6','Ability trade itself soon save identify.'),
	('1728','4','8','Activity contain investment character nothing bed who between less significant step skill.'),
	('8087','6','8','Answer kitchen seek cause job wonder free method.'),
	('6889','8','6','Short according response reason form support enjoy laugh organization election vote development treat.'),
	('4460','1','7','Yes guy size pattern author list dinner would environmental.'),
	('157','8','8','Describe sing election part Congress institution include political like can none.'),
	('3500','3','8','Only wrong feeling person floor poor think option those trial these within.'),
	('637','1','7','Eight ready but how discussion scientist bag two remain house when month run.'),
	('3124','8','7','Head teach enough population success country arrive loss upon benefit spend.'),
	('5392','6','7','Itself factor mention those policy strategy number phone wonder.'),
	('1563','2','6','Example heavy member assume action list serious.'),
	('8258','4','8','Fly sign else rich often rate.'),
	('3430','9','6','Seem table piece open try indeed listen.'),
	('9971','4','8','Early interesting degree lose pay tell cut degree stage according remain off employee term.'),
	('3697','4','6','Result unit story actually before music report pull water.'),
	('8611','10','6','Necessary others cultural direction skin remain simply cold early claim player growth answer.'),
	('365','10','6','Brother later name month democratic different.'),
	('798','3','7','None reduce approach source part letter share walk such wish day themselves.'),
	('602','7','6','Consumer fill why history process manage.'),
	('3850','2','8','Catch blue maybe across consumer lay question.'),
	('4094','9','7','Economic chair really worker ask often.'),
	('8222','10','6','Just front arrive owner city it note data key.'),
	('1320','9','7','Within wife go main this lose article fine language wife century.'),
	('2126','2','6','Well young people like federal carry anyone more discuss.'),
	('8377','8','7','Young off teach attention word ago leg great industry pick watch.'),
	('3107','4','7','Run gas whatever far commercial improve high stock husband thank.'),
	('7972','2','6','Tax represent know new offer economic film arm staff like.'),
	('3051','8','6','Example behind wall even recent indeed you record thank one benefit I bring.'),
	('1182','5','6','My matter smile sometimes relationship hold hair best sit.'),
	('9740','3','8','Yourself strong it if imagine walk much research sit your I marriage.'),
	('641','2','6','Here guy can defense back leg much somebody number hour.'),
	('212','9','6','Vote majority trade friend office carry can film.'),
	('435','5','8','Seek grow current white class speak light against more magazine magazine sister.'),
	('8897','7','7','Interest drive hundred control gun bank seat let especially president personal enter pattern.'),
	('19','8','7','Really teach room likely everything as probably surface third.'),
	('9892','10','8','Prove per service old us discuss.'),
	('6938','3','7','Reality fight forget person everything former describe treat share.'),
	('5340','4','8','Represent traditional make easy yard notice crime better successful.'),
	('9748','1','6','Clear where final may election capital seat level scientist.'),
	('1517','9','7','Although long long fill check dark quite senior attack class class treatment.'),
	('8690','6','7','Become beautiful pay action ever candidate southern source scene specific carry.'),
	('6721','1','6','Culture example style anyone either week reach movement value side somebody according.'),
	('5573','9','7','Just mention continue happy read none.'),
	('1079','10','8','Education writer region herself forget wait one take analysis piece involve the.'),
	('5656','4','7','Ever news site in camera drop.'),
	('5220','3','8','Occur full case region too beautiful thought still professional.'),
	('5170','3','7','While national road of high mean arm fast source catch degree argue identify.'),
	('8217','6','6','Hair theory line today attention off onto huge gas here.'),
	('4254','10','6','Address list our event question try.'),
	('9480','9','7','Court trade it on nor almost you summer must similar science degree.'),
	('7002','10','8','Mother view get set draw future themselves white he.'),
	('565','2','6','Skin have on teach ready senior require executive increase home bill.'),
	('7901','4','7','Yes top challenge feel if later fire way environmental mouth so time require.'),
	('8540','10','8','Religious special whom no radio else artist popular thing watch he next amount.'),
	('7944','1','8','Current build man home child per report scene indicate among.'),
	('6314','10','6','Discussion score Mr season nor return send us.'),
	('9161','3','8','Father nice west research challenge police well expert place break name.'),
	('3989','5','8','Piece according then field couple effort worker avoid sit age realize research movement.'),
	('2487','2','7','Other least order miss why say.'),
	('9835','9','6','Win those young structure though foreign send.'),
	('873','3','7','Former hotel build long station friend something share onto name mind member.'),
	('3124','3','8','Case hotel court chance civil control type land outside whatever despite.'),
	('3653','8','7','Tax about option night list billion scientist.'),
	('9772','5','7','Organization will well war local forward resource notice woman.'),
	('1419','2','6','Lose soon hundred season economy professor ground debate animal area.'),
	('9329','5','6','Her represent rate method behind per.'),
	('968','9','7','Raise relate really plan age accept form performance itself tell.'),
	('7420','9','6','Thousand recent speak they piece practice media design too.'),
	('2722','1','6','Site career meet raise act me final remember mean collection work.'),
	('7584','3','7','There off wear though work strategy carry charge also them expect pay old.'),
	('2398','2','7','Already kind expect born wait from daughter.'),
	('2817','7','8','Dream create offer wonder ten according speak.'),
	('4362','2','8','Read one into modern century then surface because.'),
	('2111','6','7','Their effort particular our matter year letter various participant business cost within.'),
	('7848','4','7','Another week close want box future road election first with lose.'),
	('6248','2','8','Allow theory cell government break medical.');