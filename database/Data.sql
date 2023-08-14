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
(6, 0, 'Bronze', 'cuong@gmail.com', '63927922e816797646afdb67a26598edc3d8e6a7b4eafb8ac0b36ddadd69a88843f7b8f1fc1a2ee6f15ac5ba0de867e3389d0ff13ebda5642437dcc4f5c27dfe', 'cc97f6039c4ccc0cf944c9facab11a534f8152b300de76f70dd307e9479e080febe982ff831a7df759ae81c8e03f8307e33de5e1420e94ef56eadde1d8e2f49267b19b56d6a5d0fc5152c94441da96427fc131232abd7470062b389c0905836361d7df0fa54e7721aa9ea8dada7c9964d0585d55ac94c4da26491c014f271c0f', 'User', 'W0Q20ryEsowpc2Zb51yStSA3I37I84srULomm+e0qgiZfOwDWEipfF0hP2bb96UW6JfHauKfX33uFYjjJAAnBA==', '2023-08-09 20:09:59.000', '2023-08-16 20:09:59.000'),
(7, 0, 'Diamond', 'bluehairmylove2014@gmail.com', '3e1dcac1eddc9f99ee06fe71178e0ad0562c551b9a382cc72ee7c00919f31878a90325fb1b287ec43a9711177c08a43d29b1e42b157f790fa5336b5920ea4f2b', 'b1a5137653964ebd04abe46f552e674ed622992983149cc27f5a2d9a3465ccd5fabdce76fb71b33ea74c3729fd3483acbdc6102738e5e142bc2bbf5f2e4c0b6886705a109ef2fbc79a598acb92b1722e9617fc61323aa1a8197ca3de3620755fe7815b6dc54e4effc71f0f661fbfacbb7f96e0199b6ee7416389a83e95cc4bac', 'User', '+34iPTdqI5mhEhia6qfgp9qMprkg3uVLdwfhcd6Tn8YlgRwiGchjKYsyByhgyBfIC0NLO5cLKDmvuNrc0jCfBw==', '2023-08-14 21:42:55.000', '2023-08-21 21:42:55.000');

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
	('Diamond', 20000),
	('Gold', 10000),
	('Silver', 4000),
	('Bronze', 100);

INSERT INTO VOUCHER (VoucherId, Name, Value, Point, AccountRank) VALUES 
	(1, 'Voucher 2%', 0.02, 50, 'Bronze'), --> 2% -> 6%
	(2, 'Voucher 5%', 0.05, 150, 'Silver'), --> 6% -> 12%
	(3, 'Voucher 10%', 0.1, 300, 'Gold'), --> 6% -> 12%
	(4, 'Voucher 15%', 0.15, 450, 'Gold'), --> 12% -> 15%
	(5, 'Voucher 20%', 0.2, 600, 'Diamond'); --> 15% -> 20%

--!add hotel 
INSERT INTO HOTEL VALUES(1, N'Triple E Hotel Metro Ben Thanh',N'Việt Nam','HOTEL',N'TP Hồ Chí Minh',
	 N'146- 148 Đường Ký Con, Phường Nguyễn Thái Bình, Quận 1, Thành phố Hồ Chí Minh, Việt Nam',
	 3, 8.8, 
	 N'Tọa lạc ở Thành phố Hồ Chí Minh, cách Bảo tàng Mỹ thuật 300 m, Triple E Hotel Metro Ben Thanh cung cấp chỗ nghỉ 3 sao với trung tâm thể dục.Khách sạn 3 sao này cung cấp WiFi miễn phí, dịch vụ phòng và dịch vụ lễ tân 24 giờ. Nhân viên tại đây có thể thu xếp dịch vụ đưa đón cho khách.',
	 N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Triple%20E%20Hotel%20Metro%20Ben%20Thanh.jpg');

INSERT INTO HOTEL VALUES(2, N'Nexus House Thao Dien',N'Việt Nam','HOMESTAY',N'Hồ Chí Minh City',
	N'8/9 Võ Trường Toản, An Phú, Quận 2, TP. Hồ Chí Minh, Việt Nam',
 	0, 9.5,
	N'Nằm cách Bảo tàng Lịch sử Việt Nam 6,3 km, Nexus House Thao Dien có khu vườn, sân hiên và chỗ nghỉ gắn máy điều hòa với ban công cùng WiFi miễn phí.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Nexus%20House%20Thao%20Dien/Studio%20Nh%C3%ACn%20Ra%20V%C6%B0%E1%BB%9Dn1.jpg');

INSERT INTO HOTEL VALUES(3, N'Landmark Plus Luxury - Vinhomes Central Park',N'Việt Nam','SINGLE_APARTMENT',N'TP Hồ Chí Minh', 
	N'146- 148 Đường Ký Con, Phường Nguyễn Thái Bình, Quận 1,Thành phố Hồ Chí Minh , Việt Nam',
	0, 8.1, 
	N'Tọa lạc tại Thành phố Hồ Chí Minh, Landmark Plus Luxury - Vinhomes Central Park cung cấp chỗ nghỉ với hồ bơi ngoài trời, khu vườn, sảnh khách chung, sân hiên, quầy bar và tầm nhìn ra thành phố.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Landmark%20Plus%20Luxury%20-%20Vinhomes%20Central%20Park/landmark.jpg');

INSERT INTO HOTEL VALUES(4, N'Musketeers Guest House',N'Việt Nam','HOTEL',N'Hà Nội', 
	N'21 Ngõ 67 Tô Ngọc Vân Quảng An, Quận Tây Hồ, Hà Nội, Việt Nam',
	0, 9.7, 
	N'Tọa lạc tại thành phố Hà Nội, cách Hồ Tây 3,2 km, Musketeers Guest House cung cấp chỗ nghỉ với sảnh khách chung, chỗ đỗ xe riêng miễn phí, sân hiên và quầy bar. Trong số các tiện nghi tại chỗ nghỉ này có quầy lễ tân 24 giờ, dịch vụ trợ giúp đặc biệt và Wi-Fi miễn phí trong toàn bộ khuôn viên. Du khách có thể ngắm nhìn quang cảnh khu vườn.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i1.jpg');

INSERT INTO HOTEL VALUES(5, N'Cristina Boutique Hotel',N'Việt Nam','HOTEL',N'Hà Nội', 
	N'4A Ngõ Phất Lộc, Quận Hoàn Kiếm, Hà Nội, Việt Nam',
	3, 9.1, 
	N'Tọa lạc tại một vị trí thuận tiện ở trung tâm thành phố Hà Nội, Cristina Boutique Hotel cung cấp chỗ nghỉ 3 sao gần Ô Quan Chưởng Hà Nội và Nhà hát múa rối nước Thăng Long. Khách sạn 3 sao này cung cấp các phòng máy lạnh với phòng tắm riêng. Chỗ nghỉ có lễ tân 24 giờ, dịch vụ đưa đón sân bay, dịch vụ phòng và WiFi miễn phí.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Cristina%20Boutique%20Hotel/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20C%C3%B3%20Ban%20C%C3%B4ng1.jpg');

INSERT INTO HOTEL VALUES(6, N'SMARANA Hanoi HERITAGE',N'Việt Nam','HOTEL',N'Hà Nội', 
	N'Phường Dịch Vọng Hầu, Quận Cầu Giấy Số 5, Ngõ 82/1 Dịch Vọng Hậu, Quận Cầu Giấy, Hà Nội, Việt Nam',
	5, 9.7, 
	N'Tọa lạc tại thành phố Hà Nội, cách Bảo tàng Dân tộc học Việt Nam 2,4 km, SMARANA Hanoi HERITAGE có dịch vụ tiền sảnh, phòng nghỉ không hút thuốc, sân hiên, WiFi miễn phí trong toàn bộ khuôn viên và nhà hàng. Khách sạn 5 sao này cung cấp dịch vụ phòng, dịch vụ lễ tân 24 giờ, dịch vụ đưa đón sân bay và dịch vụ cho thuê xe đạp.',
	N'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/smarana-hanoi-heritage.jpg');

INSERT INTO HOTEL VALUES(7, N'An Hiên Homestay Hội An',N'Việt Nam','HOMESTAY',N'Hội An', 
	N'164 Lý Thái Tổ, phường Cẩm Châu, Cẩm Châu, Hội An, Việt Nam',
	0, 9.6, 
	N'Tọa lạc tại thành phố Hội An, cách Bảo tàng Lịch sử Hội An 1,2 km và Hội quán Triều Châu Trung Quốc 1,6 km, An Hiên Homestay Hội An cung cấp chỗ nghỉ với WiFi miễn phí, máy điều hòa, xe đạp miễn phí và khu vườn.',
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


INSERT INTO REVIEW (ReviewId, AccountId, HotelId, ReviewDate, Points, Content) VALUES
(1, 9052, 9, '2023-05-16', 8, N'Player sort wear sign rise second nothing do.'),
(2, 5546, 20, '2023-07-03', 7, N'Which day herself two during free office general.'),
(3, 5616, 4, '2023-03-23', 7, N'Another student daughter national attorney PM.'),
(4, 1125, 16, '2023-06-05', 8, N'Itself return produce reality rather feel best.'),
(5, 6854, 18, '2023-01-30', 6, N'Key art home management side about fear attack pick nearly art.'),
(6, 7582, 10, '2023-02-06', 7, N'Southern current trade employee main wall remain.'),
(7, 3761, 2, '2023-03-15', 6, N'Operation every race society can crime ability drop.'),
(8, 5327, 10, '2023-07-19', 6, N'Fact source laugh reason three specific movie.'),
(9, 7137, 12, '2023-02-09', 7, N'Open market rate middle cost American play sister energy product person.'),
(10, 5706, 13, '2023-04-02', 6, N'Staff glass throw raise seem as lawyer friend product behind see.'),
(11, 953, 4, '2023-06-01', 7, N'Discussion ten certain agent his child artist reason ago window.'),
(12, 6462, 3, '2023-05-14', 8, N'Science edge plan require box minute arm such.'),
(13, 7134, 17, '2023-06-26', 6, N'Blood business kitchen almost may law scientist.'),
(14, 1383, 12, '2023-05-21', 8, N'Leave environmental girl wonder natural leg style coach light fund.'),
(15, 4748, 11, '2023-07-13', 6, N'Chance image international war hair space watch size similar through also see myself.'),
(16, 9025, 18, '2023-07-20', 6, N'Out past often relate real tree threat.'),
(17, 2214, 2, '2023-04-02', 7, N'Whole prove play though style same home girl ask appear site reason hard.'),
(18, 4897, 18, '2023-02-09', 8, N'Story prevent although prepare adult above on leg nearly page.'),
(19, 947, 11, '2023-07-22', 6, N'Box research environmental child sometimes really rest home must remain movement Mrs world.'),
(20, 2959, 15, '2023-01-21', 6, N'Especially meet by me new material production standard drug would treatment.'),
(21, 7758, 9, '2023-05-25', 8, N'Million why enough by contain issue machine back.'),
(22, 6042, 20, '2023-04-04', 6, N'Spring office top check water these.'),
(23, 3236, 16, '2023-05-16', 8, N'Entire difference discover care others that.'),
(24, 8071, 10, '2023-05-19', 7, N'Financial small social goal rather evidence positive yourself air after.'),
(25, 2252, 5, '2023-05-26', 8, N'Professional though account significant since morning.'),
(26, 5864, 10, '2023-01-29', 8, N'Interesting area other whole per already enter quickly.'),
(27, 2694, 1, '2023-02-04', 7, N'Security past magazine no these left far.'),
(28, 9986, 13, '2023-01-10', 7, N'Church station various key present fly company face which agreement than common later.'),
(29, 9511, 1, '2023-03-07', 8, N'Although dream model green Democrat year.'),
(30, 9436, 10, '2023-07-18', 7, N'List visit dark season early sound front decide growth.'),
(31, 2393, 2, '2023-05-04', 6, N'Summer able almost occur fight provide around go.'),
(32, 7368, 17, '2023-03-06', 7, N'Return foot PM energy whom include Mrs still he anyone.'),
(33, 8788, 5, '2023-08-11', 7, N'Interesting cover scene natural effort nature boy race leader all result red.'),
(34, 9944, 20, '2023-02-21', 6, N'Perhaps head painting be shake bill expect.'),
(35, 2912, 17, '2023-06-30', 7, N'Practice firm foreign fill ground remember another poor occur actually dream central staff.'),
(36, 8291, 16, '2023-08-02', 8, N'Standard sit leg work ability hard society total.'),
(37, 3574, 18, '2023-01-29', 6, N'Security only true day church property about hit form.'),
(38, 9414, 8, '2023-05-04', 8, N'Become politics important me Democrat decade size.'),
(39, 6446, 3, '2023-05-21', 8, N'Company can clear inside lose those improve me business process treat.'),
(40, 5894, 7, '2023-06-02', 6, N'Country black modern lawyer environmental fact if claim consumer.'),
(41, 560, 18, '2023-01-16', 8, N'Ago according many pick learn discover require share however small.'),
(42, 3863, 1, '2023-01-16', 7, N'Run physical science under address option particular history cell natural provide your pressure.'),
(43, 1437, 6, '2023-02-14', 7, N'Top consumer let feeling seven relationship involve current mention.'),
(44, 501, 9, '2023-06-13', 8, N'By then attention century stop simply manager pretty bill.'),
(45, 3559, 1, '2023-04-06', 6, N'Trade goal standard research available else.'),
(46, 800, 10, '2023-04-05', 7, N'Difference course crime instead who toward nearly himself shoulder total past instead.'),
(47, 5243, 15, '2023-03-30', 6, N'Ask own close agency least under my some each out college glass shoulder.'),
(48, 1074, 4, '2023-03-11', 6, N'Meet whether generation develop strong phone.'),
(49, 5699, 7, '2023-04-21', 7, N'Her recognize up thus money act economic risk against parent pull.'),
(50, 3772, 14, '2023-06-05', 8, N'Tonight something adult will mother arrive voice owner simple step writer.'),
(51, 521, 6, '2023-05-03', 6, N'Machine develop everybody left skill entire decision would.'),
(52, 8289, 16, '2023-01-09', 7, N'Radio somebody set born risk bit conference past.'),
(53, 1209, 15, '2023-06-23', 6, N'Product end for try check country activity start person radio night.'),
(54, 4818, 19, '2023-07-11', 6, N'Current view into color billion building research respond it we sell begin customer.'),
(55, 9338, 18, '2023-08-09', 8, N'Few cut across full interview southern watch business by school.'),
(56, 2790, 18, '2023-07-12', 8, N'Fear while hair citizen off rather teach reflect audience fund open fire employee.'),
(57, 3535, 2, '2023-07-21', 7, N'Wear ever office create blue possible.'),
(58, 4684, 20, '2023-05-09', 7, N'With hard dog true conference since deep visit him.'),
(59, 2735, 15, '2023-07-07', 6, N'Issue his build day call only their citizen door.'),
(60, 5549, 8, '2023-04-18', 7, N'Remember time anyone speak similar fire lay customer.'),
(61, 3096, 2, '2023-01-13', 8, N'Range popular win over page job friend my reason once pass single kind.'),
(62, 3518, 4, '2023-02-28', 8, N'Adult assume happy discussion wrong worry represent cut.'),
(63, 3389, 7, '2023-03-02', 7, N'Hotel shoulder position decide however concern another whose quality deal safe.'),
(64, 4088, 19, '2023-06-15', 7, N'Present different same collection child plan garden you.'),
(65, 8302, 12, '2023-05-01', 6, N'Operation keep program relate candidate mouth wife.'),
(66, 3435, 19, '2023-01-28', 6, N'Back poor treatment television build step parent raise attention.'),
(67, 4113, 16, '2023-06-13', 6, N'Heart cost detail I test role.'),
(68, 3938, 17, '2023-05-21', 8, N'Source effort fish mind final guess nature state as participant continue attention.'),
(69, 6020, 6, '2023-02-10', 6, N'Identify interview help from top anyone.'),
(70, 7912, 7, '2023-02-19', 7, N'Four room understand peace save husband your red hot.'),
(71, 8638, 18, '2023-03-31', 7, N'Movement present responsibility according out kitchen home cup who box prepare.'),
(72, 2227, 14, '2023-06-12', 6, N'Arrive name trouble particularly reality attack modern federal everything someone likely compare economy.'),
(73, 2143, 14, '2023-03-28', 7, N'Interview compare board himself listen lead just forget common government ever.'),
(74, 3724, 16, '2023-07-02', 7, N'Boy ahead speech argue company air community happen kitchen minute future.'),
(75, 958, 6, '2023-01-30', 8, N'Television reveal ten box time challenge last during perhaps.'),
(76, 6566, 6, '2023-06-20', 6, N'Daughter person husband science house themselves bad teach politics back.'),
(77, 4773, 14, '2023-07-26', 7, N'Forward together push hospital management guy wonder message money time read.'),
(78, 9337, 12, '2023-04-29', 8, N'Million news Republican newspaper reveal some responsibility trial.'),
(79, 9037, 12, '2023-05-01', 8, N'Art image but to line center analysis serve.'),
(80, 793, 5, '2023-01-21', 8, N'Candidate job education minute heavy cost bill model hundred floor.'),
(81, 9216, 1, '2023-06-19', 6, N'Arrive want floor spring own again degree exist perhaps next.'),
(82, 6557, 16, '2023-03-15', 6, N'Along major remember point wrong air subject him probably plan.'),
(83, 4190, 15, '2023-03-23', 6, N'Fast do wear clearly throughout behavior read financial series.'),
(84, 2635, 14, '2023-07-11', 8, N'Soldier necessary maybe red from think.'),
(85, 8198, 9, '2023-01-22', 6, N'Mind budget almost parent standard resource seem upon.'),
(86, 6378, 3, '2023-03-04', 6, N'After play term tell concern get claim effect thank.'),
(87, 2331, 13, '2023-07-29', 7, N'Cover until painting maybe reality fact.'),
(88, 7448, 8, '2023-02-11', 6, N'Help second environment seem somebody western firm Mr customer.'),
(89, 9131, 1, '2023-06-24', 7, N'Along girl appear accept she spend officer provide fund tax different military.'),
(90, 8600, 13, '2023-04-30', 8, N'Building medical financial sport something strategy forget apply society lawyer impact.'),
(91, 8560, 14, '2023-07-15', 7, N'Education people per happy as son resource.'),
(92, 9248, 9, '2023-03-25', 7, N'Stage model see teach best space professor finish kitchen decide.'),
(93, 9684, 11, '2023-04-07', 7, N'Clear same poor these six several any democratic live feel.'),
(94, 1554, 2, '2023-07-14', 6, N'Say structure score task responsibility quality thank prevent.'),
(95, 4483, 11, '2023-06-29', 8, N'Wrong site must hour lead above evening begin who easy.'),
(96, 3408, 17, '2023-02-25', 7, N'Little woman police employee career top ever off which suffer idea big.'),
(97, 2048, 15, '2023-03-09', 6, N'Let matter perhaps ground however look.'),
(98, 3525, 14, '2023-03-11', 7, N'Hit suffer my out meeting born.'),
(99, 6545, 8, '2023-06-25', 8, N'Point anything something gas wrong case table board here cut relate above suddenly.'),
(100, 7613, 13, '2023-02-25', 7, N'Loss cold today support term unit bag.'),
(101, 5556, 15, '2023-04-07', 6, N'Traditional through share dog talk allow modern.'),
(102, 3602, 8, '2023-06-09', 7, N'Moment cultural suddenly many science month consumer sense gas run.'),
(103, 619, 19, '2023-01-05', 7, N'Clear east production second material hope this bring across no sport.'),
(104, 4236, 6, '2023-03-15', 8, N'Inside decision light talk stage kid again charge a understand build.'),
(105, 2568, 13, '2023-04-27', 7, N'Though read learn nothing image whose.'),
(106, 6842, 16, '2023-01-07', 8, N'Put best land require newspaper baby surface.'),
(107, 1013, 14, '2023-07-02', 8, N'Conference southern able institution drop wait again college woman meet.'),
(108, 1356, 1, '2023-04-12', 6, N'Them brother size short best list.'),
(109, 6146, 18, '2023-04-10', 6, N'Best participant than answer mother important view senior save front.'),
(110, 2525, 17, '2023-07-30', 8, N'Week person least help lose push direction some raise building bring.'),
(111, 5428, 12, '2023-03-07', 8, N'Trouble even really reflect ok rate of half focus example shoulder.'),
(112, 591, 17, '2023-02-03', 7, N'Able treat outside through let me guess always yes.'),
(113, 4902, 9, '2023-03-30', 6, N'Night carry term election race project he.'),
(114, 5050, 15, '2023-07-14', 7, N'Product window real artist on range school father.'),
(115, 887, 14, '2023-04-21', 6, N'Campaign management service window night long boy quality culture data operation federal scientist.'),
(116, 3890, 20, '2023-03-15', 7, N'Deal effort attorney often husband can boy.'),
(117, 954, 11, '2023-07-18', 8, N'Them out reflect heart weight choose cup room knowledge brother miss design current.'),
(118, 1294, 17, '2023-02-24', 6, N'Pull perform indicate have finish call answer peace good offer.'),
(119, 8361, 17, '2023-01-31', 7, N'Measure actually age support nature find pattern near.'),
(120, 2255, 11, '2023-05-22', 6, N'Teacher certainly activity board later need it guess practice staff campaign positive weight.'),
(121, 4665, 19, '2023-01-01', 8, N'Kid agency dark thousand speak floor.'),
(122, 8589, 20, '2023-02-28', 7, N'Truth speak performance list perform nothing analysis.'),
(123, 4860, 10, '2023-01-26', 6, N'Listen hotel by third professor group.'),
(124, 4418, 12, '2023-04-04', 7, N'Even million respond organization camera near establish.'),
(125, 1278, 18, '2023-02-01', 8, N'Prepare degree foreign study laugh upon seat election pay.'),
(126, 3044, 14, '2023-05-01', 7, N'Long foot marriage book to would until answer job loss who.'),
(127, 6848, 15, '2023-05-29', 6, N'Garden view quality moment manager image son base.'),
(128, 1489, 5, '2023-06-08', 8, N'Type open animal cause whether should pattern popular car day get cold.'),
(129, 6529, 7, '2023-05-03', 6, N'Old shake continue media expert from lose sea only.'),
(130, 9875, 16, '2023-02-03', 7, N'Card meet artist ten success least world than give group.'),
(131, 5497, 13, '2023-06-21', 6, N'Party walk authority involve front sister occur peace experience throw compare choose back.'),
(132, 3404, 16, '2023-06-18', 8, N'Industry table hold son head dark.'),
(133, 3146, 11, '2023-01-08', 8, N'Indeed agree risk leg about likely charge sport lot budget.'),
(134, 946, 13, '2023-08-06', 6, N'Lose large cup table morning skin picture east half its than former.'),
(135, 5067, 18, '2023-06-03', 7, N'Maybe foot science opportunity meeting catch fall.'),
(136, 1944, 20, '2023-02-09', 6, N'Our establish bed move others oil read participant while.'),
(137, 3958, 3, '2023-05-10', 7, N'Edge well whole west discuss bar long wide.'),
(138, 1007, 5, '2023-04-14', 7, N'Experience administration on reflect significant impact concern body understand important see.'),
(139, 1856, 13, '2023-06-08', 7, N'Condition effect charge anything weight amount black look attack pay conference.'),
(140, 5539, 2, '2023-08-10', 7, N'Road apply see discussion send line poor.'),
(141, 2308, 5, '2023-04-27', 8, N'Successful especially operation but anyone rich accept watch per may Mrs occur.'),
(142, 7264, 20, '2023-02-05', 6, N'Everyone loss around condition owner according product hear involve exactly structure science environmental.'),
(143, 7435, 2, '2023-03-23', 7, N'Imagine and center down husband court.'),
(144, 6588, 1, '2023-07-15', 7, N'Eight make quality today everybody environmental small ago.'),
(145, 5728, 4, '2023-04-04', 7, N'Prepare detail other easy report film issue great share author.'),
(146, 453, 6, '2023-06-05', 7, N'Point bill toward enjoy tax rate yeah process party good station fund.'),
(147, 4362, 15, '2023-02-24', 7, N'Republican give control assume day home.'),
(148, 8921, 4, '2023-07-30', 6, N'Hard control difference walk new series here area agreement other.'),
(149, 3597, 15, '2023-06-25', 6, N'Around blood research agent sign husband claim chair serve field position right.'),
(150, 6718, 17, '2023-01-17', 8, N'Quality fear discussion lawyer set up song.'),
(151, 9430, 10, '2023-06-13', 8, N'Want various against nothing expert life deal prevent sometimes grow this.'),
(152, 8009, 10, '2023-01-09', 8, N'Form after upon play window Republican.'),
(153, 9438, 3, '2023-04-15', 7, N'Model successful them Democrat shoulder store already only they.'),
(154, 999, 6, '2023-05-23', 6, N'Expert popular fly west that member hot I region.'),
(155, 3168, 3, '2023-02-26', 8, N'Forget may record determine law down really over catch keep yourself add direction.'),
(156, 4781, 20, '2023-03-08', 6, N'Since require such heart week early.'),
(157, 5883, 2, '2023-06-20', 8, N'Listen measure rest maintain stand business.'),
(158, 4455, 20, '2023-03-30', 8, N'House that house town body million various finish story job reduce live.'),
(159, 9730, 7, '2023-07-05', 8, N'Want wife land get sport threat agent.'),
(160, 1867, 11, '2023-04-16', 6, N'Difference hair sure success for also marriage whether where I question little.'),
(161, 8934, 7, '2023-05-30', 7, N'Control sit about although both discussion simply east.'),
(162, 3930, 5, '2023-06-18', 7, N'Discover tonight itself population technology property myself.'),
(163, 9746, 16, '2023-06-05', 6, N'North behavior senior space firm be system miss meeting choose.'),
(164, 5939, 15, '2023-04-21', 6, N'Dog wind never cup place ever real inside trade.'),
(165, 6147, 1, '2023-05-08', 6, N'Put include yourself throughout like little a sing four reality doctor democratic we.'),
(166, 961, 17, '2023-03-25', 6, N'Nearly performance sign owner just figure parent relationship some.'),
(167, 4288, 5, '2023-01-02', 7, N'Individual ten son plant sport strategy center contain reason watch reason.'),
(168, 2428, 6, '2023-07-11', 7, N'Care ability such paper sure difficult hard.'),
(169, 6390, 10, '2023-05-01', 6, N'Child physical color front learn town.'),
(170, 6380, 13, '2023-04-20', 6, N'War together head heavy that key herself rich become.'),
(171, 5536, 11, '2023-03-10', 7, N'Program imagine hot drug choice yes scientist two citizen trouble leave central watch.'),
(172, 3359, 16, '2023-08-08', 6, N'Measure try national town agent drop it.'),
(173, 6870, 13, '2023-05-22', 6, N'Arm job fall away kitchen compare.'),
(174, 6108, 3, '2023-01-01', 7, N'Animal employee approach institution strategy full table us.'),
(175, 2946, 6, '2023-07-04', 8, N'For offer TV ever general over ask.'),
(176, 2545, 6, '2023-03-15', 7, N'Along nature structure pull model remember.'),
(177, 5622, 3, '2023-05-14', 8, N'If seek financial around factor station.'),
(178, 7945, 7, '2023-02-23', 8, N'Find design eye couple tree whether market meeting situation painting.'),
(179, 3652, 13, '2023-07-17', 7, N'And voice group eight attention hair arm without miss team according international mention.'),
(180, 3820, 18, '2023-03-08', 7, N'Lead treatment according production customer form ago second near.'),
(181, 7218, 7, '2023-01-11', 7, N'Officer professional talk town family building message ten wear three often.'),
(182, 204, 2, '2023-07-10', 6, N'Design require article least can with nearly of already.'),
(183, 7784, 3, '2023-02-13', 6, N'Animal total fast say apply detail outside himself pay teacher.'),
(184, 7139, 10, '2023-07-14', 7, N'Must item age start bring current mind around its room admit exist.'),
(185, 1810, 3, '2023-08-01', 7, N'Six treat sense spend year second size threat.'),
(186, 3555, 9, '2023-02-19', 8, N'Affect person whether town at military people others affect sister.'),
(187, 5469, 15, '2023-08-07', 8, N'Another eye husband leave world market natural nice image green true game.'),
(188, 6861, 20, '2023-02-26', 7, N'Southern note artist surface unit couple person finally positive guy.'),
(189, 199, 10, '2023-08-05', 8, N'Concern mean Democrat ask capital event own cause half this want reason television detail.'),
(190, 3630, 15, '2023-06-28', 7, N'Although organization reveal arrive hold life subject.'),
(191, 8750, 19, '2023-06-20', 8, N'Several rule little bit someone there husband standard during.'),
(192, 6473, 1, '2023-04-12', 7, N'Some perhaps fund early through me.'),
(193, 7757, 5, '2023-03-09', 6, N'Rather doctor report speak dark everybody leader condition that knowledge gas discussion.'),
(194, 7318, 9, '2023-06-08', 7, N'Feeling matter TV help network no grow participant decision energy.'),
(195, 5122, 14, '2023-03-31', 7, N'Word eye mouth drop finally board watch catch then leave teacher debate interview.'),
(196, 8357, 16, '2023-02-04', 6, N'Else discussion them whole white ready authority sign although economic consider.'),
(197, 6729, 2, '2023-01-25', 8, N'Chair anything nor despite test close scientist quickly.'),
(198, 6664, 12, '2023-02-01', 6, N'Author wonder cultural everybody approach pass power.'),
(199, 5310, 5, '2023-04-23', 7, N'Nothing understand interest north ball yet position minute these wish field line.'),
(200, 8536, 19, '2023-02-07', 8, N'Important fight plant mother bank operation ahead car have consider much force property.'),
(201, 8012, 15, '2023-04-08', 7, N'Pull radio doctor use consumer trip someone at within white Congress agency.'),
(202, 2180, 17, '2023-05-03', 6, N'Realize inside last stuff nice part specific scientist prepare along.'),
(203, 5253, 10, '2023-01-24', 6, N'Phone film address report data already summer military position.'),
(204, 8715, 9, '2023-04-07', 8, N'His glass leg language buy mother world.'),
(205, 8035, 1, '2023-04-21', 8, N'National husband edge investment detail others.'),
(206, 6099, 19, '2023-04-14', 8, N'Us bed white against people first avoid million performance.'),
(207, 9043, 17, '2023-06-23', 6, N'Agency training free ten simply listen collection.'),
(208, 9203, 8, '2023-04-18', 6, N'Blood know most be break hundred her sea.'),
(209, 3979, 6, '2023-06-22', 7, N'Article expect player none character view because include account happy military break hope.'),
(210, 2217, 11, '2023-03-20', 7, N'Name daughter century visit adult young relate fast.'),
(211, 4633, 15, '2023-04-15', 8, N'Fear meet billion seem gas wind give else night like check.'),
(212, 9422, 3, '2023-06-30', 6, N'Any class teach sister effort prove down.'),
(213, 7588, 12, '2023-08-11', 7, N'Face cultural fly mind hope should throughout.'),
(214, 539, 9, '2023-06-21', 6, N'Result eye imagine opportunity size develop morning standard thing number power job next.'),
(215, 5944, 17, '2023-02-09', 8, N'Sure his late machine sister throw staff.'),
(216, 2537, 16, '2023-07-19', 8, N'Executive wonder fight see begin ever crime enjoy movie early key radio action.'),
(217, 8104, 5, '2023-07-12', 7, N'Then base west teach list bit reason say fill civil avoid before set.'),
(218, 1045, 15, '2023-03-09', 8, N'Suffer well certainly report pick Mrs draw anything simple deep yard policy.'),
(219, 5417, 8, '2023-02-18', 8, N'Just Mr they husband too possible phone safe.'),
(220, 1118, 17, '2023-02-27', 6, N'Value defense fall bring economy discuss act police color.'),
(221, 7621, 16, '2023-01-21', 7, N'Among drive low stop really whom.'),
(222, 5697, 12, '2023-07-02', 6, N'Career all guy type material without sort.'),
(223, 9718, 11, '2023-02-24', 8, N'Seek off source fight lot hospital wall.'),
(224, 2779, 1, '2023-04-08', 6, N'Store play ever reduce oil time quality like whole.'),
(225, 7198, 7, '2023-04-23', 8, N'Become station value probably expect suffer put see before who.'),
(226, 4448, 15, '2023-08-11', 6, N'Character executive happen glass nature debate ahead amount bill parent community method street.'),
(227, 643, 4, '2023-06-27', 8, N'Job good first reveal above discuss.'),
(228, 9608, 6, '2023-07-28', 8, N'Only technology perhaps mention win food local available happen available type.'),
(229, 111, 18, '2023-06-03', 8, N'Senior owner design point under business soon number daughter realize record.'),
(230, 3840, 6, '2023-05-24', 8, N'Threat its natural threat consider ten purpose.'),
(231, 2321, 17, '2023-03-12', 7, N'Indicate something enjoy inside its father drop rather third reality record institution over.'),
(232, 631, 8, '2023-03-30', 6, N'Street one happy drop in total turn field forget so lead and.'),
(233, 4157, 15, '2023-04-29', 8, N'Us right inside bed send take mind when significant want from evening pay.'),
(234, 2721, 20, '2023-04-07', 8, N'High drive class even woman sure report test which.'),
(235, 6811, 12, '2023-08-07', 8, N'Kid common approach student he tell its summer concern without so only.'),
(236, 3684, 8, '2023-05-06', 6, N'Food most officer method work investment black voice role particularly start spring.'),
(237, 7668, 2, '2023-01-05', 6, N'Onto to indicate TV worker might move.'),
(238, 1691, 14, '2023-04-11', 6, N'Too need economic effect company certainly under remember recent hard pay state.'),
(239, 1675, 3, '2023-02-14', 6, N'Drive official white attention new catch.'),
(240, 5584, 8, '2023-06-06', 7, N'Board thank answer because write likely size attention thus special.'),
(241, 4115, 11, '2023-08-06', 7, N'Consider expect analysis future learn attack subject school man let must every.'),
(242, 4628, 18, '2023-01-18', 6, N'Community hot key voice continue develop yeah knowledge side discover few.'),
(243, 370, 7, '2023-02-01', 6, N'Machine by debate air human assume red president price free development.'),
(244, 8764, 12, '2023-05-28', 6, N'Summer population for serious history today face arm idea project road direction stay.'),
(245, 9705, 16, '2023-07-25', 7, N'Least up significant present film choose teach successful support look site.'),
(246, 3304, 13, '2023-07-26', 6, N'Drive scene agree but current mouth tree attack wind letter.'),
(247, 7536, 4, '2023-07-04', 8, N'Hear white trial heart current those possible possible.'),
(248, 2930, 17, '2023-08-08', 7, N'Evening form record everybody contain central film best assume order marriage street why.'),
(249, 4850, 18, '2023-01-18', 8, N'Improve feeling respond wind break ground station success mother treat up anything.'),
(250, 8206, 8, '2023-03-18', 8, N'Never because right south because our side.'),
(251, 8216, 4, '2023-08-05', 6, N'Sea often employee attention police popular red trial artist collection.'),
(252, 7851, 7, '2023-06-01', 6, N'Someone movie at wind player upon put institution.'),
(253, 6100, 8, '2023-02-08', 8, N'Stock only goal memory system speak defense real guess very.'),
(254, 2169, 17, '2023-05-18', 6, N'Management feeling right you city compare game nearly something common wind whether.'),
(255, 1365, 1, '2023-05-06', 8, N'Machine top another require design yeah big course control.'),
(256, 7931, 9, '2023-06-22', 6, N'Mean number door later individual a.'),
(257, 1500, 10, '2023-06-10', 6, N'Kid she color college response medical either kind process.'),
(258, 4521, 9, '2023-01-16', 7, N'Performance add wait study hard consider design interview rate career.'),
(259, 5844, 8, '2023-05-18', 6, N'For writer dark authority could sing among effect become top.'),
(260, 5670, 15, '2023-08-02', 8, N'Drop carry sister partner friend scientist career.'),
(261, 6147, 18, '2023-02-09', 7, N'Sister people seem value gun indeed heart able spring street.'),
(262, 4776, 10, '2023-02-21', 6, N'Force somebody wrong vote see attorney.'),
(263, 3764, 7, '2023-03-03', 8, N'Player but instead state central central give soldier base.'),
(264, 521, 11, '2023-04-13', 7, N'Clear common method method so position should people yes baby great agent represent.'),
(265, 3852, 14, '2023-01-03', 6, N'Third player activity leg shake edge most professional impact though.'),
(266, 3544, 12, '2023-01-17', 7, N'Many writer past I international with your central whose indeed.'),
(267, 5089, 7, '2023-04-02', 6, N'Sport great others bank itself writer necessary training his response happy grow.'),
(268, 2622, 15, '2023-08-05', 7, N'Accept share this outside woman almost property artist special.'),
(269, 4008, 6, '2023-07-17', 7, N'Window believe international carry decade study involve American.'),
(270, 2744, 15, '2023-03-05', 8, N'Purpose better value member along fall safe in we yes.'),
(271, 3370, 20, '2023-03-26', 7, N'Should thousand nor poor war degree man.'),
(272, 9479, 19, '2023-02-08', 6, N'Consumer phone reveal leg federal may cup outside shake operation watch dinner out.'),
(273, 6656, 7, '2023-02-15', 7, N'President together minute cold ago lot financial save face president.'),
(274, 4370, 10, '2023-02-20', 6, N'Maybe point floor its throughout morning Democrat figure.'),
(275, 2870, 18, '2023-07-11', 8, N'Adult low audience challenge instead city west save kitchen it.'),
(276, 455, 5, '2023-02-06', 8, N'Large field choose deep best brother.'),
(277, 6606, 5, '2023-05-26', 7, N'Mind call trouble send level everybody wife effect.'),
(278, 6179, 20, '2023-07-18', 7, N'Character eye real think star expect agree off for represent.'),
(279, 1756, 2, '2023-03-03', 6, N'Significant wind during radio family parent democratic.'),
(280, 4410, 14, '2023-02-20', 7, N'Meet increase interest alone once within property figure establish interesting.'),
(281, 6668, 16, '2023-03-17', 6, N'Model direction account wife case conference artist night democratic particularly degree control organization.'),
(282, 1301, 3, '2023-07-21', 6, N'Different myself our like road rock agree Mrs.'),
(283, 7240, 16, '2023-08-01', 8, N'Human left deal voice conference contain course environment whether.'),
(284, 5242, 16, '2023-01-08', 8, N'High section scene top age interesting action serve senior.'),
(285, 3401, 7, '2023-01-10', 6, N'Officer respond rather century fish everybody air anything light however sing against Mrs.'),
(286, 1792, 9, '2023-05-24', 7, N'Help pretty option game apply together peace they strategy serve.'),
(287, 7359, 10, '2023-03-18', 7, N'They not treat might chair top color her throughout.'),
(288, 5724, 20, '2023-02-20', 8, N'Firm join this heart campaign such crime research travel whose.'),
(289, 8539, 1, '2023-04-17', 8, N'Value war least enter fire the Mrs baby.'),
(290, 2061, 11, '2023-05-07', 7, N'Writer unit provide show specific card keep.'),
(291, 4700, 13, '2023-01-26', 6, N'Standard whose political civil event management prepare face couple book information that face.'),
(292, 3519, 3, '2023-01-13', 8, N'President fine three leave analysis baby card someone hotel effect situation exactly finally.'),
(293, 3349, 14, '2023-07-28', 6, N'Budget green across often have sign.'),
(294, 5777, 13, '2023-02-05', 8, N'Do me actually data tend trouble form owner watch.'),
(295, 6121, 11, '2023-06-06', 8, N'Hand them five apply history break pay appear consider because project.'),
(296, 5859, 2, '2023-07-12', 8, N'Boy add participant wife talk middle its total picture sort hear sing weight.'),
(297, 1988, 2, '2023-04-24', 6, N'I talk off value guy perhaps professional trip kid wind.'),
(298, 8961, 18, '2023-01-12', 8, N'Onto religious stay sell church beyond stop federal rock finally every.'),
(299, 3760, 9, '2023-01-20', 7, N'Later western Congress environmental simply article simple.'),
(300, 7289, 10, '2023-04-10', 8, N'Budget security suffer culture statement almost.'),
(301, 412, 15, '2023-04-16', 8, N'Good business specific after final economy heart point fine.'),
(302, 1886, 14, '2023-05-09', 7, N'Best always improve already look population prevent.'),
(303, 736, 14, '2023-04-11', 8, N'High church woman account west many tend high in expect.'),
(304, 8918, 19, '2023-01-14', 6, N'Bad make yet indicate at sell fire little try sport structure her if.'),
(305, 8057, 10, '2023-05-01', 7, N'Gun important guess full when determine every kind hot.'),
(306, 6905, 3, '2023-05-16', 7, N'Forward herself officer know blood especially who single choose state.'),
(307, 5263, 11, '2023-07-13', 7, N'Personal plan mean sit seem stage like whole here.'),
(308, 346, 5, '2023-01-15', 6, N'Decision become defense responsibility manage along.'),
(309, 2294, 17, '2023-07-29', 6, N'Task interview glass woman politics put.'),
(310, 9345, 3, '2023-06-22', 6, N'Old something early long skin style away bar paper box challenge.'),
(311, 1467, 16, '2023-04-28', 8, N'Case moment money program majority state pick why truth all me opportunity wait.'),
(312, 3941, 6, '2023-04-26', 7, N'Between speak baby television question institution state newspaper structure guess represent near away.'),
(313, 7883, 3, '2023-02-22', 6, N'Everyone enjoy fear executive same speech sound economy real.'),
(314, 861, 19, '2023-07-11', 8, N'Energy just prepare left so explain.'),
(315, 9675, 9, '2023-03-23', 6, N'Deep give Mrs only option successful each radio energy structure this.'),
(316, 1184, 7, '2023-03-24', 7, N'Open south sign anything pick clear know.'),
(317, 667, 16, '2023-07-18', 6, N'Least meeting morning politics security exist society resource work career a reality six.'),
(318, 5508, 20, '2023-03-04', 7, N'Enjoy today benefit chair exactly ground any home difference.'),
(319, 1141, 3, '2023-05-12', 7, N'Trouble force rate know throughout total sort.'),
(320, 7930, 5, '2023-07-18', 8, N'Stand generation represent high your what.'),
(321, 4714, 4, '2023-06-12', 7, N'Bring part cause environmental avoid pressure other nothing a both.'),
(322, 9046, 16, '2023-03-22', 8, N'Share analysis including have rather purpose seem fire mean white whether show peace.'),
(323, 3039, 18, '2023-07-08', 7, N'Second fire nothing watch sign program country court citizen.'),
(324, 8271, 9, '2023-01-09', 8, N'Bag population left point affect arm wear process may upon call.'),
(325, 2540, 8, '2023-08-06', 8, N'Nothing industry on change individual dinner.'),
(326, 8827, 10, '2023-06-10', 8, N'Deal sound behind house right result mind identify land remain hold foot prepare.'),
(327, 8127, 9, '2023-02-14', 6, N'Hear serious night something never level paper day third they agency chair stop.'),
(328, 8107, 19, '2023-05-27', 6, N'Put rise do but maybe small leave first.'),
(329, 5974, 13, '2023-05-23', 7, N'Beautiful door smile offer letter our.'),
(330, 7782, 10, '2023-03-02', 7, N'Look paper hit black often view meet two health administration through.'),
(331, 8583, 9, '2023-04-05', 8, N'Majority turn per sound article science every summer woman relationship.'),
(332, 8719, 5, '2023-03-07', 6, N'Represent Congress major production natural side safe western suggest age father reach environment.'),
(333, 2389, 4, '2023-06-25', 6, N'Young education explain foreign our outside later live drop set industry table.'),
(334, 8203, 14, '2023-05-30', 7, N'Character then issue nice stuff military buy store.'),
(335, 5465, 10, '2023-01-15', 8, N'Society maybe general could dream lawyer third actually see professor identify.'),
(336, 8216, 17, '2023-01-10', 7, N'Article response discuss amount common wife including raise into system.'),
(337, 1941, 20, '2023-06-30', 6, N'White share indicate information economy pick everything yourself power assume degree.'),
(338, 3592, 7, '2023-08-05', 8, N'Who rather stage act ok majority for face like compare building clear.'),
(339, 2920, 3, '2023-06-11', 7, N'Citizen job land threat third look can court senior while.'),
(340, 3375, 17, '2023-01-04', 6, N'It her he actually arrive add daughter husband require nor.'),
(341, 9467, 6, '2023-04-20', 6, N'Budget sort much tree director gas almost newspaper term your doctor.'),
(342, 5677, 14, '2023-03-12', 6, N'Wait court effect foot spring approach community.'),
(343, 9907, 19, '2023-07-14', 7, N'Challenge five hand knowledge nearly house news responsibility.'),
(344, 4634, 19, '2023-04-20', 7, N'Either call even produce imagine such nature.'),
(345, 9478, 4, '2023-03-08', 6, N'Wear again less talk modern threat baby your side bit environmental ground form.'),
(346, 3271, 2, '2023-01-02', 6, N'We have race her of care science blue able.'),
(347, 704, 10, '2023-02-17', 7, N'Morning stop room table never door agent only my music special beautiful.'),
(348, 2338, 17, '2023-08-04', 8, N'Responsibility dog stop night as probably significant affect.'),
(349, 5130, 1, '2023-02-01', 7, N'Decide concern treatment somebody theory plan show including.'),
(350, 3888, 13, '2023-06-11', 8, N'Serve life anything once most particular street investment.'),
(351, 4636, 3, '2023-07-23', 7, N'Water lead choice citizen kitchen decade forward top.'),
(352, 8251, 7, '2023-07-26', 6, N'Less civil consumer least test perhaps perform already side part his second.'),
(353, 3246, 3, '2023-01-23', 7, N'Something fly mean room keep arrive arrive leg.'),
(354, 4855, 2, '2023-03-03', 6, N'Opportunity beat west health on me capital discover compare ground authority.'),
(355, 6398, 14, '2023-06-26', 8, N'Seven score already grow close north alone note something.'),
(356, 762, 12, '2023-05-27', 6, N'Blue follow door truth seven everyone mother more son.'),
(357, 5917, 13, '2023-04-24', 8, N'Court record later more increase either.'),
(358, 279, 9, '2023-02-22', 6, N'Relationship education about fill light base manage national education hour mean yourself might.'),
(359, 1675, 1, '2023-02-27', 6, N'Almost see along seek morning its final clearly.'),
(360, 2791, 10, '2023-05-13', 7, N'At give data spring answer school system safe.'),
(361, 7457, 9, '2023-03-06', 8, N'Billion foot study message me important least to.'),
(362, 7166, 19, '2023-06-05', 7, N'Money leave face miss particular huge.'),
(363, 3850, 7, '2023-01-08', 6, N'Matter listen shake per sit TV cause practice me turn huge majority.'),
(364, 9114, 7, '2023-06-23', 7, N'Card suffer number exactly perform husband heavy that talk responsibility.'),
(365, 966, 17, '2023-05-30', 7, N'Brother million range picture address east health.'),
(366, 8653, 17, '2023-04-19', 8, N'Single specific common fly child us season store.'),
(367, 8050, 4, '2023-05-05', 8, N'Heavy boy PM true blue tough fact cultural where how.'),
(368, 4336, 3, '2023-01-30', 8, N'Real cell clear subject various say ago.'),
(369, 19, 3, '2023-02-25', 7, N'Hotel indeed impact part sort ago little effort appear southern.'),
(370, 884, 2, '2023-08-01', 7, N'Third provide weight improve hot ten wide concern.'),
(371, 1603, 6, '2023-03-13', 8, N'Security hotel moment very quite mission space speak.'),
(372, 97, 1, '2023-06-07', 6, N'Wall dog responsibility ahead market attention poor.'),
(373, 6936, 5, '2023-06-24', 8, N'Letter any democratic watch know national main law later too effort.'),
(374, 1454, 2, '2023-01-06', 6, N'Treat exist for place these hundred former boy.'),
(375, 4480, 13, '2023-06-08', 7, N'Property article remember career player within she cup.'),
(376, 5492, 9, '2023-02-22', 7, N'Receive material coach positive continue like white put teach although green win.'),
(377, 7986, 5, '2023-03-02', 8, N'Garden event use strong work stay glass baby because by.'),
(378, 8374, 6, '2023-07-01', 8, N'Fire show institution own identify know feel thousand level subject begin game raise.'),
(379, 6234, 1, '2023-07-05', 7, N'Half represent represent those nature admit which.'),
(380, 6998, 16, '2023-01-17', 7, N'Nor senior happen ago discuss claim be computer hot impact answer card.'),
(381, 9713, 1, '2023-02-21', 7, N'Marriage trial PM doctor already free exactly without six ask small agent practice place.'),
(382, 3859, 20, '2023-01-28', 8, N'Worker accept area my forget study these market service pull.'),
(383, 4340, 15, '2023-07-03', 6, N'Lot small top take fight care fine test type check win method.'),
(384, 956, 13, '2023-02-15', 7, N'Age response more head rock job job view figure identify show.'),
(385, 9728, 14, '2023-04-20', 7, N'Still dinner campaign back think page.'),
(386, 4025, 4, '2023-07-08', 8, N'Mr author capital try history environmental start meeting special child.'),
(387, 8512, 16, '2023-04-06', 8, N'Study training cause attorney wall until view environmental office center.'),
(388, 6075, 6, '2023-04-05', 7, N'Weight when keep happen any eat whom positive development member quickly physical customer.'),
(389, 847, 11, '2023-06-20', 7, N'Reality reach stop employee southern role role.'),
(390, 7257, 15, '2023-06-03', 8, N'Shoulder center western method total democratic turn strong focus edge.'),
(391, 2389, 15, '2023-01-29', 8, N'Sell three sister source discussion effort together.'),
(392, 2293, 8, '2023-04-05', 7, N'Cup challenge article tax rule interest front.'),
(393, 2045, 1, '2023-07-19', 8, N'Through far low available seven six senior company move.'),
(394, 5668, 10, '2023-06-28', 6, N'Marriage relate appear charge answer evidence.'),
(395, 1475, 7, '2023-03-05', 6, N'Agent seek human mention thousand realize place prepare.'),
(396, 2501, 5, '2023-08-01', 8, N'Summer hot around tonight door book.'),
(397, 1971, 11, '2023-06-26', 7, N'Likely us best table in look thank high someone man available affect federal.'),
(398, 8007, 20, '2023-04-26', 6, N'Tonight do go protect language player skill offer near science five could east.'),
(399, 7895, 19, '2023-02-04', 7, N'East health firm cause movement cause final we imagine protect thousand month.'),
(400, 4913, 9, '2023-04-01', 8, N'Later crime money responsibility live community small allow.'),
(401, 8491, 5, '2023-05-04', 6, N'Speak recent bank allow sense reality shoulder time just end little policy short.'),
(402, 7807, 4, '2023-05-10', 8, N'Guess above light quite technology effort.'),
(403, 9297, 12, '2023-03-03', 7, N'Another room her tell as threat hard evening cover.'),
(404, 6642, 10, '2023-03-01', 7, N'Former network ahead finally financial keep baby manage kitchen.'),
(405, 9584, 19, '2023-02-05', 8, N'Allow relationship system until necessary theory sing.'),
(406, 1165, 3, '2023-05-11', 6, N'Two policy serve our produce war few wonder view down model.'),
(407, 5231, 1, '2023-04-27', 6, N'Perform yes meeting book author station improve executive country reduce seven.'),
(408, 3286, 1, '2023-06-18', 8, N'Record feel color newspaper thus choice involve.'),
(409, 7109, 14, '2023-06-13', 8, N'Data recognize movie water design as economic we morning.'),
(410, 5107, 13, '2023-03-09', 6, N'Statement memory seem development support increase gun evidence improve we gun decision.'),
(411, 3284, 13, '2023-08-05', 6, N'Far unit age spring charge for suddenly support style tough.'),
(412, 5712, 18, '2023-02-05', 7, N'I board more agreement exactly manager environmental black draw culture owner.'),
(413, 943, 19, '2023-08-11', 8, N'See whom institution room among land happy her nature difficult want choice.'),
(414, 6712, 7, '2023-03-06', 8, N'Bill on figure wide which reveal attorney both remain.'),
(415, 9582, 16, '2023-07-19', 8, N'History future high page voice successful majority never attention look so election.'),
(416, 6816, 12, '2023-08-07', 8, N'Somebody manage during catch market ahead small two design current put.'),
(417, 6425, 2, '2023-08-01', 6, N'Walk until itself community citizen them.'),
(418, 8131, 4, '2023-04-17', 6, N'Conference bank work administration stay team best.'),
(419, 9382, 16, '2023-03-22', 6, N'Whole he decide walk rest so trade.'),
(420, 8387, 13, '2023-03-11', 7, N'Until which service summer certain on itself program significant coach agreement.'),
(421, 7367, 13, '2023-01-30', 8, N'Sell baby ball continue these consider data wall blood maybe others box anyone.'),
(422, 3567, 15, '2023-07-07', 6, N'History very read be him big picture very son teacher public.'),
(423, 758, 18, '2023-03-25', 7, N'Animal far population hundred morning let pick visit public firm like room bag.'),
(424, 3868, 19, '2023-06-24', 7, N'Billion shake many win public capital discussion my pull never enough financial.'),
(425, 5821, 9, '2023-04-22', 7, N'Way officer responsibility Republican political her.'),
(426, 2769, 1, '2023-04-23', 8, N'Indicate light today kind produce thousand.'),
(427, 8284, 6, '2023-01-31', 6, N'Marriage campaign great drop wind partner address budget painting worry.'),
(428, 7150, 15, '2023-04-15', 7, N'Air her always rate born something.'),
(429, 9594, 2, '2023-05-31', 6, N'Space increase man none music commercial choose environmental part community film onto think.'),
(430, 7729, 9, '2023-01-06', 8, N'Great affect throughout check vote effect suggest item at prove fly writer professor.'),
(431, 7758, 20, '2023-03-04', 6, N'Name or else level avoid suggest couple go past important.'),
(432, 5644, 2, '2023-01-27', 6, N'Say since send again cell body treatment because.'),
(433, 6542, 19, '2023-07-20', 8, N'Near turn key loss though south.'),
(434, 729, 7, '2023-05-26', 7, N'Art try program half entire move know area.'),
(435, 3328, 10, '2023-02-13', 6, N'Mother whether role political animal quality professional mission including.'),
(436, 5904, 12, '2023-01-20', 7, N'Central meeting order scientist stock not test finish data.'),
(437, 9189, 10, '2023-06-14', 6, N'Reflect close while system movement charge him really country sound miss.'),
(438, 2198, 15, '2023-08-11', 8, N'First standard argue east technology receive.'),
(439, 2443, 20, '2023-05-18', 8, N'And stage try specific difference machine use explain involve film truth.'),
(440, 5533, 20, '2023-03-23', 6, N'Watch book group guy indicate figure behavior full capital pick will whether.'),
(441, 6514, 2, '2023-04-04', 8, N'Partner across future maybe fear think personal church.'),
(442, 3679, 18, '2023-08-04', 8, N'Air ten drug agree performance region rich.'),
(443, 1355, 11, '2023-05-20', 6, N'Young character true drive too bed.'),
(444, 1974, 20, '2023-01-21', 7, N'Responsibility along trip than degree customer future mean have.'),
(445, 5148, 19, '2023-06-07', 8, N'Meet among threat general serious theory crime dinner maybe.'),
(446, 5131, 10, '2023-04-15', 8, N'Through second price try sense style.'),
(447, 2409, 5, '2023-04-05', 7, N'Dog rule later whether often environmental push instead.'),
(448, 726, 18, '2023-02-17', 7, N'Loss dinner clear huge fill way dinner.'),
(449, 4209, 8, '2023-04-25', 7, N'Up compare least especially knowledge environment half.'),
(450, 6516, 2, '2023-03-05', 6, N'Although pressure cultural trade exist total throughout since since others color concern Mrs.'),
(451, 8716, 9, '2023-04-22', 6, N'Interest community response minute director certain quality deep.'),
(452, 553, 4, '2023-01-14', 8, N'Investment now college fund again same soon if receive least current.'),
(453, 2680, 8, '2023-06-13', 7, N'House Republican other piece mention day believe his.'),
(454, 7017, 15, '2023-06-28', 7, N'Walk human concern difficult sing available development modern reflect dinner.'),
(455, 5422, 5, '2023-07-19', 6, N'Policy impact start blue indeed usually off American pass similar feel state.'),
(456, 6234, 7, '2023-03-29', 7, N'Woman more respond degree writer avoid special thousand role style mission.'),
(457, 1493, 12, '2023-06-19', 6, N'Almost kid easy put region operation how against what.'),
(458, 3567, 20, '2023-05-06', 8, N'Position media sure edge shoulder weight development generation.'),
(459, 9794, 18, '2023-07-04', 7, N'Huge reflect camera vote size from safe apply about together president score.'),
(460, 2515, 5, '2023-04-24', 8, N'Tree figure all year region amount before upon.'),
(461, 3087, 6, '2023-07-27', 7, N'Will never stop four action high.'),
(462, 8705, 19, '2023-01-22', 7, N'Police six easy where great lead.'),
(463, 5631, 11, '2023-07-29', 6, N'Threat notice teach next voice base public consumer relate.'),
(464, 337, 2, '2023-03-14', 8, N'Star especially let current another over.'),
(465, 5062, 20, '2023-03-11', 7, N'Forget product former want almost issue late.'),
(466, 3321, 1, '2023-02-12', 7, N'Building small administration most people beyond weight agree.'),
(467, 1707, 16, '2023-02-11', 7, N'Current far that page real watch area pretty authority down.'),
(468, 7244, 17, '2023-01-14', 8, N'Food contain thought choice throughout travel treat against short everything.'),
(469, 4272, 2, '2023-04-21', 7, N'Recognize write citizen guess window generation option defense after stuff however great.'),
(470, 9918, 13, '2023-01-01', 7, N'That economic foreign option loss rock page environmental trip pass walk.'),
(471, 3226, 17, '2023-01-06', 7, N'Less early measure include decision toward conference human.'),
(472, 4091, 12, '2023-07-01', 6, N'Improve always build defense art fill left pretty between structure fight.'),
(473, 3488, 5, '2023-07-20', 7, N'Less world technology present apply between administration billion.'),
(474, 2091, 11, '2023-03-22', 8, N'Issue throughout able onto require support notice data.'),
(475, 7305, 15, '2023-07-05', 8, N'Join idea factor grow threat along generation party pick enough exactly despite similar.'),
(476, 6382, 20, '2023-06-11', 6, N'Room after effort service we wind hold hundred each.'),
(477, 2135, 19, '2023-01-11', 7, N'Off center power single set play thus certain international up shake less third.'),
(478, 1942, 15, '2023-01-21', 7, N'Arrive ago tree suffer song beyond account his voice recently almost share treat fire.'),
(479, 2399, 5, '2023-05-05', 6, N'Somebody bag language mission put sea somebody.'),
(480, 767, 1, '2023-03-28', 6, N'Money respond return address husband score song article use.'),
(481, 9332, 12, '2023-05-20', 6, N'Question marriage back meeting bad strong.'),
(482, 3178, 16, '2023-04-02', 8, N'Represent change recently test put true within bank.'),
(483, 1626, 6, '2023-01-26', 7, N'Run region tend break the medical.'),
(484, 9277, 2, '2023-06-22', 6, N'Share energy treatment newspaper seek red partner without.'),
(485, 1122, 14, '2023-06-20', 7, N'Each Congress writer fly over beat force try radio.'),
(486, 8714, 13, '2023-05-31', 8, N'Listen its southern laugh several industry everything agent.'),
(487, 1366, 14, '2023-01-04', 8, N'Effort mouth building word less up hot collection born computer senior.'),
(488, 7345, 8, '2023-04-13', 8, N'Heavy might soldier western after south much reach despite.'),
(489, 536, 17, '2023-02-16', 7, N'Sort idea this president deep people total project.'),
(490, 6846, 10, '2023-03-30', 6, N'Character service station plant pay teach culture determine wait reality good.'),
(491, 7900, 11, '2023-06-23', 8, N'Maintain wall your dark hand speech probably.'),
(492, 5760, 16, '2023-02-24', 6, N'Range individual break at well public item themselves look ahead check.'),
(493, 4484, 2, '2023-07-25', 7, N'Until hard health tonight visit across.'),
(494, 890, 14, '2023-01-02', 8, N'However study probably fire value away quickly involve care population.'),
(495, 3063, 12, '2023-04-23', 8, N'Right recent future hold individual common.'),
(496, 9430, 16, '2023-04-14', 8, N'Various deal middle tonight sit direction account become example data.'),
(497, 9578, 15, '2023-05-29', 8, N'Market speak future however ever piece clear unit way provide reflect form body.'),
(498, 5773, 3, '2023-06-30', 8, N'Sure inside image many Mr despite.'),
(499, 507, 6, '2023-03-18', 8, N'Put beautiful raise building occur machine each method out production personal perhaps owner.'),
(500, 3745, 7, '2023-05-01', 7, N'Kid authority including maybe president staff six type fund answer bill.'),
(501, 6316, 10, '2023-04-29', 6, N'Camera left back group value clearly campaign thing crime everyone let whether.'),
(502, 2361, 20, '2023-01-04', 6, N'Hundred together whom organization concern what set become hand network game position.'),
(503, 1905, 19, '2023-04-25', 7, N'Century maintain phone training month suffer about no cost former camera rock.'),
(504, 8414, 11, '2023-04-15', 7, N'Until boy expert support morning position room until.'),
(505, 6297, 2, '2023-01-18', 7, N'Color friend yard election speak town soon management speak work.'),
(506, 2096, 2, '2023-04-12', 7, N'Detail form political much rise tax pressure.'),
(507, 583, 18, '2023-02-18', 6, N'Degree authority pressure paper time here describe public.'),
(508, 7306, 1, '2023-04-13', 6, N'Set music must expect great move rich present offer skill clear within lot.'),
(509, 9796, 7, '2023-05-09', 6, N'Present who activity quality natural generation.'),
(510, 1124, 18, '2023-02-25', 6, N'Know step suggest attorney shake one parent Democrat industry child wait itself unit.'),
(511, 6273, 15, '2023-02-23', 7, N'Several rich spring people different change.'),
(512, 3690, 4, '2023-02-07', 7, N'Throughout capital cause station form test campaign early American letter matter check.'),
(513, 670, 5, '2023-06-24', 8, N'Executive hit between sort walk parent seem play easy finally condition identify.'),
(514, 2253, 7, '2023-06-07', 6, N'Mr receive feeling bank message feeling sense kid sit from discussion.'),
(515, 1541, 1, '2023-01-16', 8, N'Institution consumer race until TV still name way student rather yard.'),
(516, 5894, 6, '2023-07-06', 6, N'Message now yeah growth interview others explain your from paper show dinner adult.'),
(517, 8202, 12, '2023-03-19', 8, N'Police nothing two hundred vote picture yard hear service boy design.'),
(518, 3526, 5, '2023-04-18', 7, N'Election available director ready risk anyone treatment necessary age whom.'),
(519, 1411, 6, '2023-03-25', 6, N'Pass night water draw none eat interest thousand five.'),
(520, 7147, 17, '2023-06-30', 6, N'Box debate vote mouth color goal it strong perform dark standard.'),
(521, 6049, 5, '2023-01-21', 7, N'Personal machine serve natural wonder program buy subject our wonder boy mention.'),
(522, 6080, 9, '2023-04-08', 8, N'Continue into also material national class free tough single or enter speech.'),
(523, 4595, 3, '2023-03-20', 6, N'Effort let last age mention American lose our exactly price figure on.'),
(524, 9339, 9, '2023-06-24', 6, N'Hear the explain away first talk treatment vote collection let though.'),
(525, 4109, 2, '2023-08-10', 8, N'Listen name create hot example role down.'),
(526, 598, 4, '2023-04-04', 8, N'Daughter never part recognize choose music quite hand.'),
(527, 7327, 2, '2023-05-28', 6, N'Scene task brother top story week chance speak instead.'),
(528, 923, 18, '2023-05-03', 7, N'Place cultural shoulder ten these scientist unit trouble carry green argue create.'),
(529, 9631, 13, '2023-05-06', 7, N'Box past particular common boy ability.'),
(530, 1146, 1, '2023-07-16', 6, N'Back challenge admit create space former write different hot race.'),
(531, 5651, 20, '2023-07-04', 7, N'Brother thank full free last audience very.'),
(532, 5140, 7, '2023-08-11', 6, N'End hope relate never central lot.'),
(533, 6520, 18, '2023-06-11', 6, N'Ago table human individual its participant.'),
(534, 9821, 6, '2023-04-16', 7, N'Current quality live end arm own could wife window grow short tough include.'),
(535, 5517, 20, '2023-04-14', 7, N'Hard range eight huge model well indeed bed identify fly.'),
(536, 2506, 19, '2023-01-30', 7, N'Let safe bring individual only owner.'),
(537, 2928, 19, '2023-07-16', 7, N'Risk book million no change spring range.'),
(538, 1316, 6, '2023-01-28', 8, N'Some thought live catch amount couple situation benefit important myself allow available.'),
(539, 7590, 14, '2023-05-15', 7, N'Air market cause nothing individual garden class war option protect during.'),
(540, 2530, 13, '2023-06-25', 6, N'Buy believe somebody minute miss board approach.'),
(541, 8158, 4, '2023-04-07', 8, N'Quality game light chance real share including.'),
(542, 3231, 9, '2023-05-23', 7, N'High what for stage assume time water get trip.'),
(543, 6418, 16, '2023-08-02', 6, N'Action story particular wide bit usually.'),
(544, 7505, 10, '2023-05-06', 8, N'Station certain activity vote sing imagine low all yeah moment show cup.'),
(545, 4964, 13, '2023-01-17', 8, N'Congress full sometimes without forget box.'),
(546, 7194, 12, '2023-03-23', 6, N'Music only accept nearly staff girl health seek watch toward bring agree.'),
(547, 8110, 10, '2023-04-05', 8, N'Success your start wait to color anyone left.'),
(548, 4284, 20, '2023-07-23', 8, N'Project career road customer finally want laugh drop director product little.'),
(549, 2508, 2, '2023-04-18', 6, N'Front hospital effort size term respond.'),
(550, 174, 16, '2023-08-05', 6, N'Many coach PM stay affect travel watch area environment speech.'),
(551, 6299, 9, '2023-01-01', 8, N'Present doctor add answer professor successful us class table understand represent administration college.'),
(552, 6765, 20, '2023-04-16', 6, N'Issue discuss watch line carry Congress catch.'),
(553, 7410, 5, '2023-06-30', 7, N'Or them above call look center want low city.'),
(554, 4712, 7, '2023-04-18', 7, N'Ground data could call water public civil short himself night development need quickly.'),
(555, 9443, 1, '2023-02-11', 7, N'Couple yes rise certainly beat project.'),
(556, 1926, 8, '2023-03-17', 6, N'Across that wide whom they democratic card company yet give need hair.'),
(557, 192, 16, '2023-01-28', 7, N'Star reveal poor former more ten behind term yeah.'),
(558, 5797, 18, '2023-03-26', 7, N'Will record understand really produce debate magazine bed measure crime air pattern.'),
(559, 594, 16, '2023-04-02', 6, N'Assume statement card growth student risk call attention structure.'),
(560, 8220, 15, '2023-07-31', 6, N'According resource him lawyer police scene make letter send contain check as but.'),
(561, 9624, 1, '2023-01-27', 7, N'Nation call statement by develop would me receive decision fire research.'),
(562, 1604, 11, '2023-03-07', 8, N'Answer difficult meet human window project goal.'),
(563, 9486, 20, '2023-02-25', 6, N'Name night mouth only at modern garden prepare clear home turn decade computer.'),
(564, 4711, 13, '2023-01-03', 7, N'Fish possible avoid security else back capital people hold president.'),
(565, 9879, 3, '2023-05-25', 7, N'Above anything continue age recent from set help.'),
(566, 6801, 1, '2023-01-12', 8, N'Surface modern despite without try you field difficult east almost.'),
(567, 250, 17, '2023-05-01', 6, N'Degree stuff case practice animal detail where now.'),
(568, 3639, 7, '2023-04-09', 6, N'Run such he religious civil produce experience teacher each exist much role.'),
(569, 5575, 17, '2023-02-07', 6, N'Age early wish entire large week American common guy compare benefit.'),
(570, 9613, 14, '2023-01-17', 6, N'Seem different interview miss south him party American partner have many development matter.'),
(571, 2072, 16, '2023-07-26', 6, N'Rich year last theory couple throughout they ever.'),
(572, 4132, 16, '2023-08-09', 6, N'Individual suddenly simply west agree keep part move beyond.'),
(573, 8325, 16, '2023-03-26', 6, N'Level fall left affect of fill pattern what cup system.'),
(574, 9278, 19, '2023-03-06', 6, N'Air should station member organization now dinner recently traditional player article whatever.'),
(575, 8087, 4, '2023-01-13', 7, N'Sea religious others dream service yard admit require bank letter season.'),
(576, 6878, 15, '2023-01-02', 7, N'City eight main soon you fast single.'),
(577, 9963, 2, '2023-06-06', 6, N'Charge shoulder election generation last politics water truth.'),
(578, 7031, 2, '2023-07-23', 7, N'Indeed worker early city sell finally area know year trip six.'),
(579, 5292, 15, '2023-02-24', 7, N'Local sense blue drop reflect ago compare record miss president yourself else throw.'),
(580, 2443, 2, '2023-02-07', 6, N'Be their citizen process central determine stage.'),
(581, 5170, 11, '2023-01-30', 8, N'History pressure might activity really your else range feel.'),
(582, 7192, 4, '2023-06-20', 8, N'Skin professional sister them which if leave case.'),
(583, 4101, 4, '2023-01-26', 7, N'No recent you around serious third which when clear per.'),
(584, 6094, 19, '2023-03-05', 6, N'Voice particularly out economy beyond not product let along plan administration among.'),
(585, 2047, 5, '2023-08-07', 7, N'Close present through seek few board.'),
(586, 7392, 11, '2023-05-03', 7, N'Class simply every entire according whether.'),
(587, 2554, 5, '2023-02-09', 7, N'His traditional account future shake debate style station fire candidate quite budget.'),
(588, 6424, 10, '2023-01-16', 7, N'Yeah often ahead itself pressure tree hour.'),
(589, 1302, 9, '2023-04-09', 7, N'Couple bed himself behind fund serious painting charge understand able worker.'),
(590, 63, 8, '2023-05-28', 8, N'Certain these sort others under candidate bar either modern.'),
(591, 282, 16, '2023-08-08', 6, N'Bar sound him rest especially government.'),
(592, 7918, 8, '2023-08-06', 8, N'Throw minute student modern small machine compare bank large election item.'),
(593, 7987, 16, '2023-05-24', 7, N'Piece option recognize two thousand discuss letter or girl kid these.'),
(594, 1252, 2, '2023-01-02', 6, N'Challenge decade listen true cause evidence I recent job your woman he include.'),
(595, 8819, 5, '2023-03-10', 8, N'Mean until protect goal begin ability month stay build government political today by.'),
(596, 1757, 16, '2023-06-08', 6, N'Strong behind recent month compare last machine still thing particular high song too.'),
(597, 7637, 13, '2023-02-08', 8, N'Budget sell cultural no mention indicate nor cost class wife.'),
(598, 3333, 11, '2023-04-21', 6, N'Town agent picture tough speech media ask sort.'),
(599, 8003, 5, '2023-01-16', 6, N'Plan side wear clear camera check and ten blue window report some.'),
(600, 5959, 9, '2023-07-08', 6, N'World make officer ground at assume close else.');
