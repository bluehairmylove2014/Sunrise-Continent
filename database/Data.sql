USE [sunrise-hotel]
GO

--!add account
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
--INSERT INTO PERSONAL_DETAILS (AccountId, FullName, EmailAddress, PhoneNumber, DateOfBirth, Gender, Image, Rank) VALUES 
--(1, N'Lý Văn Đạt', 'lydat@gmail.com', 'default', '2002-01-01', 'Male', 'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', 'Bronze'),
--(2, N'Phan Phúc Đạt', 'pdat@gmail.com', 'default', '2002-01-01', 'Male', 'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', 'Bronze'),
--(3, N'Cường Phạm', 'cuong457@gmail.com', 'default', '2002-01-01', 'Male', 'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', 'Bronze'),
--(4, N'Cường Phạm', 'hahaha@gmail.com', 'default', '2002-01-01', 'Male', 'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', 'Bronze'),
--(5, N'Lý Văn Đạt', 'lydatadmin@gmail.com', 'default', '2002-01-01', 'Male', 'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', 'Bronze'),
--(6, N'Phạm Nguyễn Cao Cường', 'cuong@gmail.com', 'default', '2002-01-01', 'Male', 'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', 'Bronze');

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

INSERT INTO HOTEL VALUES(21, N'Mandala Cham Bay Mui Ne', N'Việt Nam', 'HOTEL', N'Bình Thuận',
	N'Đường DT 716, phường Mũi Né, Phan Thiết',
 	4, 0,
	N'Tọa lạc tại thành phố Phan Thiết, cách Bãi biển Long Sơn 600 m, Mandala Cham Bay Mui Ne cung cấp chỗ nghỉ với hồ bơi ngoài trời, chỗ đỗ xe riêng miễn phí, trung tâm thể dục và nhà hàng. Mỗi chỗ nghỉ tại khách sạn 5 sao này đều có tầm nhìn ra biển và du khách có thể sử dụng phòng xông hơi khô cũng như bể sục. ',
	N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mandala%20Cham%20Bay%20Mui%20Ne/445116348.jpg');

INSERT INTO HOTEL VALUES(22, N'RUBENS BOUTIQUE HOTEL', N'Việt Nam', 'HOTEL', N'Bình Thuận',
	N'D3 -32A Khu đô thị Phố Biển, Phường Phú Thủy, TP Phan Thiết, Bình Thuận',
 	4, 0,
	N'Tọa lạc tại thành phố Phan Thiết, cách Bãi biển Đồi Dương 500 m, RUBENS BOUTIQUE HOTEL có chỗ nghỉ với sân hiên, chỗ đỗ xe riêng miễn phí, nhà hàng và quầy bar.  Chỗ nghỉ nằm cách Bãi biển Thương Chánh 2,2 km, Sân Golf Sea Link 500 m và ga tàu Phan Thiết 3,1 km.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/RUBENS%20BOUTIQUE%20HOTEL/447358764.jpg')

INSERT INTO HOTEL VALUES(23, N'Movenpick Hotel Phan Thiet', N'Việt Nam', 'HOTEL', N'Bình Thuận',
	N'Đường Hòn Giò - Thuận Quý, Thôn Tiến Hòa, Xã Tiến Thành, Thành phố Phan Thiết, Bình Thuận',
 	4, 0,
	N'Quay mặt ra bãi biển ở thành phố Phan Thiết, Mövenpick Resort Phan Thiet cung cấp chỗ nghỉ 5 sao và có hồ bơi ngoài trời, trung tâm thể dục cũng như khu vườn. Resort này còn có CLB trẻ em, nhà hàng và sân hiên. Chỗ nghỉ cung cấp dịch vụ phòng, dịch vụ lễ tân 24 giờ và phòng giữ hành lý cho khách.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Movenpick%20Resort%20Phan%20Thiet/334369514.jpg');

INSERT INTO HOTEL VALUES(24, N'Radisson Resort Phan Thiet', N'Việt Nam', 'HOTEL', N'Bình Thuận',
	N'Đường Lạc Long Quân, Thôn Tiến Hòa, Xã Tiến Thành , Phan Thiết',
 	4, 0,
	N'ọa lạc tại thành phố Phan Thiết, cách ga Phan Thiết 14 km, Radisson Resort Phan Thiet cung cấp chỗ nghỉ với xe đạp cho khách sử dụng miễn phí, chỗ đỗ xe riêng miễn phí, hồ bơi ngoài trời và trung tâm thể dục. Khách sạn 4 sao này có khu vườn và phòng nghỉ gắn máy điều hòa với WiFi miễn phí.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Radisson%20Resort%20Phan%20Thiet/367681542.jpg');

INSERT INTO HOTEL VALUES(25, N'Kim Long Hotel', N'Việt Nam', 'HOTEL', N'Bình Thuận',
	N'Hẻm 69 Nguyễn Đình Chiểu, Hàm Tiến, Phan Thiết',
 	4, 0,
	N'Tọa lạc tại thành phố Phan Thiết, cách Bãi đá Ông Địa 1,8 km và Suối Tiên 6,5 km, Kim Long Hotel cung cấp chỗ nghỉ có WiFi miễn phí, máy điều hòa, khu vực bãi biển riêng và khu vườn.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Kim%20Long%20Hotel/468897403.jpg');

INSERT INTO HOTEL VALUES(26, N'Mui Ne Alena Hotel', N'Việt Nam', 'HOTEL', N'Bình Thuận',
	N'265/5 Nguyễn Đình Chiểu, Phường Hàm Tiến, Thành phố Phan Thiết,',
 	4, 0,
	N'ọa lạc tại thành phố Phan Thiết, cách Bãi biển Hàm Tiến vài bước chân, Mui Ne Alena Hotel cung cấp chỗ nghỉ với hồ bơi ngoài trời, chỗ đỗ xe riêng miễn phí, khu vườn và sảnh khách chung. Chỗ nghỉ này có dịch vụ phòng, nhà hàng, sòng bạc và sân chơi cho trẻ em.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mui%20Ne%20Alena%20Hotel/236967178.jpg');

INSERT INTO HOTEL VALUES(27, N'Wanderlust Hotel', N'Việt Nam', 'HOTEL', N'Bình Thuận',
	N'375 Nguyễn Đình Chiểu, Phan Thiết',
 	4, 0,
	N'Tọa lạc tại thành phố Phan Thiết, cách Bãi biển Hàm Tiến 300 m và Suối Tiên 1,3 km, Wanderlust Hotel cung cấp chỗ nghỉ với WiFi miễn phí. Chỗ nghỉ này nằm trong bán kính 17 km từ Sân golf Sea Link, 18 km từ Bến xe Bình Thuận và 19 km từ ga Phan Thiết.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Wanderlust%20Hotel/465910803.jpg');

INSERT INTO HOTEL VALUES(28, N'Sea Night Hotel', N'Việt Nam', 'HOTEL', N'Bình Thuận',
	N'N4 - 11 Phan Trung, Phú Thuỷ, Khu đô thị phố biển Phan Thiết, Bình Thuận',
 	4, 0,
	N'Tọa lạc tại thành phố Phan Thiết, cách Bãi biển Đồi Dương 700 m, Sea Night Hotel có chỗ nghỉ với sảnh khách chung, chỗ đỗ xe riêng miễn phí, sân hiên và quầy bar. Khách sạn này nằm trong bán kính khoảng 2,4 km từ Bãi biển Thương Chánh và 700 m từ Sân golf Sea Link',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sea%20Night%20Hotel/333122531.jpg');

INSERT INTO HOTEL VALUES(29, N'EMERALD OCEAN HOTEL', N'Việt Nam', 'HOTEL', N'Bình Thuận',
	N'D5/01 Khu Đô Thị Du Lịch Biển - Phú Thủy - Phan Thiết, Phan Thiết',
 	4, 0,
	N'Tọa lạc tại thành phố Phan Thiết, cách Bến xe Bình Thuận 2,7 km, EMERALD OCEAN HOTEL cung cấp chỗ nghỉ với nhà hàng, chỗ đỗ xe riêng miễn phí, quán bar và sân hiên. Khách sạn này nằm trong bán kính khoảng 5 km từ Phố ẩm thực Phan Thiết, 2,5 km từ Bảo tàng Hồ Chí Minh và 2,6 km từ Cảng cá Phan Thiết. ',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/EMERALD%20OCEAN%20HOTEL/426295909.jpg');

INSERT INTO HOTEL VALUES(30, N'TIFFANY HOTEL & RESTAURANT', N'Việt Nam', 'HOTEL', N'Bình Thuận',
	N'D3 79-80 Khu Đô Thị Biển Phan Thiết, Phường Phú Thuỷ, Thành Phố Phan Thiết',
 	4, 0,
	N'TIFFANY HOTEL & RESTAURANT là khách sạn 3 sao tọa lạc tại Phan Thiết, đối diện với bãi biển. Ngoài dịch vụ phòng, nơi nghỉ này còn chào đón du khách với nhà hàng, công viên nước và sân hiên. Khách sạn cũng cung cấp Wi-Fi miễn phí cũng như dịch vụ đưa đón sân bay có tính phí.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/TIFFANY%20HOTEL%20%26%20RESTAURANT/411699222.jpg');
	
INSERT INTO HOTEL VALUES(31, N'Long Life Riverside Hotel', N'Việt Nam', 'HOTEL', N'Quảng Nam',
	N'61 Nguyễn Phúc Chu, Minh An, Hội An',
 	4, 0,
	N'Chỉ mất 2 phút đi dạo ngắn từ Long Life Riverside Hotel là du khách có thể đến Phố Cổ Hội An nổi tiếng, Di sản thế giới được UNESCO công nhận. Khách sạn boutique này có hồ bơi ngoài trời và các lựa chọn ăn uống ngay trong khuôn viên. Du khách có thể truy cập Wi-Fi miễn phí ở tất cả các khu vực.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Long%20Life%20Riverside%20Hotel/117079623.jpg');
INSERT INTO HOTEL VALUES(32, N'Hoi An Dream City Hotel', N'Việt Nam', 'HOTEL', N'Quảng Nam',
	N' 39 Trần Cao Vân, Sơn Phong, Hội An',
 	5, 0,
	N'Nằm cách Phố Cổ Hội An 5 phút đi bộ, Hoi An Dream City Hotel có hồ bơi ngoài trời cũng như nhà hàng trong khuôn viên. Khách sạn này cung cấp chỗ nghỉ ấm cúng với Wi-Fi miễn phí.Tất cả phòng nghỉ tại đây đều có cửa sổ lớn, máy điều hòa và không gian lớn hơn. TV truyền hình cáp màn hình phẳng và bàn làm việc cũng được trang bị trong phòng.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Dream%20City%20Hotel/121432858.jpg');
INSERT INTO HOTEL VALUES(33, N'Hoa My II Hotel', N'Việt Nam', 'HOTEL', N'Quảng Nam',
	N'44 Trần Cao Vân, Sơn Phong, Hội An',
 	4, 0,
	N'Hoa My II có nhà hàng, hồ bơi trong nhà và cung cấp các phòng với Wi-Fi miễn phí. Nằm trên đường Trần Cao Vân, khách sạn cách vài bước chân từ khu trung tâm thành phố Hội An, Di sản Thế giới được UNESCO công nhận. Tất cả các phòng đều được trang bị máy điều hòa và cho tầm nhìn ra quang cảnh thành phố.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoa%20My%20II%20Hotel/422433652.jpg');
INSERT INTO HOTEL VALUES(34, N'HOI AN HISTORIC HOTEL', N'Việt Nam', 'HOTEL', N'Quảng Nam',
	N'10 Trần Hưng Đạo, Sơn Phong, Hội An',
 	5, 0,
	N'Tọa lạc tại vị trí lý tưởng ở thành phố Hội An, HOI AN HISTORIC HOTEL cung cấp phòng nghỉ gắn máy điều hòa với WiFi miễn phí, chỗ đỗ xe riêng miễn phí và dịch vụ phòng. Khách sạn này có xe đạp cho khách sử dụng miễn phí, khu vườn, quầy bar, trung tâm thể dục, hồ bơi ngoài trời mở cửa quanh năm và sân hiên. Du khách có thể dùng bữa tại nhà hàng.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HOI%20AN%20HISTORIC%20HOTEL/429302775.jpg');
INSERT INTO HOTEL VALUES(35, N'HY Local Budget Hotel', N'Việt Nam', 'HOTEL', N'Quảng Nam',
	N'694 Đường Hai Bà Trưng phường Cẩm Phô, TP Hội An',
 	5, 0,
	N'Tọa lạc tại vị trí tuyệt đẹp ở thành phố Hội An, HY Local Budget Hotel by Hoianese - 5 mins walk to Hoi An Ancient Town có phòng nghỉ gắn máy điều hòa, nhà hàng, WiFi miễn phí và quầy bar. Khách sạn 1 sao này cung cấp dịch vụ phòng và dịch vụ tiền sảnh. Một số phòng nghỉ tại đây có ban công nhìn ra thành phố.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HY%20Local%20Budget%20Hotel/336597848.jpg');
INSERT INTO HOTEL VALUES(36, N'Golden River Hotel', N'Việt Nam', 'HOTEL', N'Quảng Nam',
	N' 04 Nguyễn Phúc Nguyên, Minh An, TP Hội An',
 	5, 0,
	N'Golden River Hotel nằm chỉ một vài bước chân từ phố cổ Hội An và cung cấp chỗ ở thoải mái, hồ bơi trong nhà và Wi-Fi miễn phí. Ngay trong khuôn viên khách sạn còn có nhà hàng. Các phòng nghỉ của khách sạn Golden River được trang bị máy lạnh đầy đủ và truyền hình cáp màn hình phẳng, minibar và khu vực tiếp khách. Các phòng đều có phòng tắm riêng với đồ vệ sinh cá nhân miễn phí.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Golden%20River%20Hotel/239870611.jpg');
INSERT INTO HOTEL VALUES(37, N'Hoi An Pho Library Hotel', N'Việt Nam', 'HOTEL', N'Quảng Nam',
	N'96 Bà Triệu, phường Cẩm Phô, TP Hội An',
 	4, 0,
	N'Tọa lạc tại trung tâm thành phố Hội An, cách Khu Phố Cổ giàu giá trị văn hóa chỉ 5 phút đi bộ, Hoi An Pho Library Hotel chào đón du khách bằng đồ uống đồng thời cung cấp hồ bơi trên sân thượng, các phòng hiện đại với những tác phẩm thủ công của địa phương và Wi-Fi miễn phí trong toàn khuôn viên.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Pho%20Library%20Hotel/64559435.jpg');
INSERT INTO HOTEL VALUES(38, N'Uptown Hoi An Hotel', N'Việt Nam', 'HOTEL', N'Quảng Nam',
	N'209 Lý Thường Kiệt, Sơn Phong, Hội An',
 	4, 0,
	N'Tọa lạc tại thành phố Hội An, cách Bảo tàng Lịch sử Hội An 800 m, Uptown Hoi An Hotel & Spa có hồ bơi ngoài trời, khu vườn và tầm nhìn ra khu vườn. Trong số các tiện nghi của chỗ nghỉ này có nhà hàng, lễ tân 24 giờ, dịch vụ phòng và WiFi miễn phí. Nơi đây có máy ATM, dịch vụ tiền sảnh và dịch vụ thu đổi ngoại tệ cho khách.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Uptown%20Hoi%20An%20Hotel/218594100.jpg');
INSERT INTO HOTEL VALUES(39, N'Thanh Binh Central Hotel', N'Việt Nam', 'HOTEL', N'Quảng Nam',
	N'98 Bà Triệu, Cẩm Phô, Hội An',
 	4, 0,
	N'Tọa lạc tại trung tâm Thành phố Hội An, Thanh Binh III - Serene Hotel cung cấp các phòng nghỉ trang nhã với Wi-Fi miễn phí và tầm nhìn ra quang cảnh hồ bơi/thành phố. Khách sạn có spa và hồ bơi ngoài trời.hanh Binh III Hotel tọa lạc tại vị trí thuận tiện nằm trong bán kính chưa đến 5 phút đi bộ từ Khu Phố Cổ, nơi có các điểm tham quan như Bảo tàng Chứng tích Chiến tranh.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Binh%20Central%20Hotel/246386236.jpg');
INSERT INTO HOTEL VALUES(40, N'Thanh Van 1 Hotel', N'Việt Nam', 'HOTEL', N'Quảng Nam',
	N'78 Trần Hưng Đạo, Sơn Phong, Hội An',
 	5, 0,
	N'Thanh Van 1 Hotel ở Phố Cổ Hội An, cách Bãi biển An Bàng một đoạn tản bộ. Wi-Fi được cung cấp miễn phí trong toàn bộ khuôn viên nơi này.Các phòng máy lạnh tại Thanh Van 1 Hotel cung cấp tầm nhìn tuyệt vời hướng ra khu vườn. Trong phòng có các tiện nghi phòng tắm riêng, không gian tiếp khách rộng rãi và bàn làm việc.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Van%201%20Hotel/45059761.jpg');

INSERT INTO HOTEL VALUES(41, N'Đà Lạt Thanh Xuân Hotel', N'Việt Nam', 'HOTEL', N'Lâm Đồng',
	N'126 Đường Tô Hiến Thành, Đà Lạt',
 	5, 0,
	N'Tọa lạc tại thành phố Đà Lạt, cách Công viên Yersin 1,6 km, Đà Lạt Thanh Xuân Hotel cung cấp chỗ nghỉ với sân hiên, chỗ đỗ xe riêng miễn phí và nhà hàng. Khách sạn 4 sao này có dịch vụ tiền sảnh, bàn đặt tour, dịch vụ phòng, lễ tân 24 giờ và dịch vụ thu đổi ngoại tệ cho khách.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/479066255.jpg');

INSERT INTO HOTEL VALUES(42, N'Minh Phú 2 Hotel', N'Việt Nam', 'HOTEL', N'Lâm Đồng',
	N'25 Đường Trần Khánh Dư, Đà Lạt,',
 	2, 0,
	N'Minh Phú 2 Hotel tọa lạc tại thành phố Đà Lạt, cách Câu lạc bộ Golf Dalat Palace 1,1 km và Vườn hoa Đà Lạt 1,9 km. Với Wi-Fi miễn phí, khách sạn 1 sao này có quầy lễ tân 24 giờ và dịch vụ trợ giúp đặc biệt. Tại đây có bãi đậu xe riêng miễn phí và chỗ nghỉ cung cấp dịch vụ đưa đón sân bay có tính phí.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Minh%20Ph%C3%BA%202%20Hotel/487331477.jpg');

INSERT INTO HOTEL VALUES(43, N'Torino Hotel Dalat', N'Việt Nam', 'HOTEL', N'Lâm Đồng',
	N'45 Đường Thủ Khoa Huân, Đà Lạt,',
 	5, 0,
	N'Nằm ở thành phố Đà Lạt, Torino Hotel Dalat có sảnh khách chung, sân hiên, nhà hàng và quầy bar. Khách sạn 2 sao này cung cấp dịch vụ phòng, dịch vụ tiền sảnh, dịch vụ lễ tân 24 giờ, dịch vụ đưa đón sân bay, khu vực bếp chung và WiFi miễn phí.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Torino%20Hotel%20Dalat/471041099.jpg');

INSERT INTO HOTEL VALUES(44, N'HouseChill Dalat Hotel', N'Việt Nam', 'HOTEL', N'Lâm Đồng',
	N'Đường Hà Huy Tập 6 Tầng, Đà Lạt',
 	5, 0,
	N'Nằm ở Đà Lạt, cách Quảng trường Lâm Viên 1,2 km, HouseChill Dalat Hotel cung cấp chỗ nghỉ với nhà hàng, chỗ đỗ xe riêng miễn phí và quán bar. Khách sạn 2 sao này có dịch vụ trợ giúp đặc biệt và bàn đặt tour. Chỗ nghỉ có quầy lễ tân 24 giờ, dịch vụ đưa đón sân bay, dịch vụ phòng và WiFi miễn phí trong toàn bộ khuôn viên.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HouseChill%20Dalat%20Hotel/481510906.jpg');

INSERT INTO HOTEL VALUES(45, N'Dalat Wind Hotel', N'Việt Nam', 'HOTEL', N'Lâm Đồng',
	N'Lô R2 03-04. Thung lũng Golf, Phường 2, Đà Lạt',
 	3, 0,
	N'Tọa lạc tại thành phố Đà Lạt, cách Hồ Xuân Hương 500 m, Dalat Wind Hotel là khách sạn 2 sao có lễ tân 24 giờ, sảnh khách chung, Wi-Fi và chỗ đỗ xe riêng miễn phí.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Dalat%20Wind%20Hotel/402605354.jpg');

INSERT INTO HOTEL VALUES(46, N'Vuon Xuan Hotel', N'Việt Nam', 'HOTEL', N'Lâm Đồng',
	N'40 Đường Tô Hiến Thành, Đà Lạt',
 	5, 0,
	N'Tọa lạc tại thành phố Đà Lạt, cách Công viên Yersin 1,6 km, Vuon Xuan Hotel cung cấp chỗ nghỉ với vườn, chỗ đỗ xe riêng miễn phí và sân hiên. Khách sạn 3 sao này có bếp chung, dịch vụ phòng, lễ tân 24 giờ, dịch vụ tiền sảnh và tổ chức các tour du lịch cho khách.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Vuon%20Xuan%20Hotel/408976426.jpg');

INSERT INTO HOTEL VALUES(47, N'Sunset Hill Dalat', N'Việt Nam', 'HOTEL', N'Lâm Đồng',
	N'5/24 Nguyễn Hữu Cảnh, Phường 8, Đà Lạt',
 	5, 0,
	N'Tọa lạc tại thành phố Đà Lạt, cách Câu lạc bộ Golf Dalat Palace 2,1 km, Sunset Hill Dalat cung cấp chỗ nghỉ với vườn, chỗ đỗ xe riêng miễn phí, sảnh khách chung và sân hiên. Khách sạn 3 sao này có dịch vụ trợ giúp đặc biệt và bàn bán tour. Chỗ nghỉ có quầy lễ tân 24 giờ, dịch vụ đưa đón sân bay, dịch vụ phòng và WiFi miễn phí trong toàn bộ khuôn viên.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sunset%20Hill%20Dalat/480342705.jpg');

INSERT INTO HOTEL VALUES(48, N'AN Boutique Hotel', N'Việt Nam', 'HOTEL', N'Lâm Đồng',
	N'138 Bùi Thị Xuân, phường 2, thành phố Đà Lạt',
 	4, 0,
	N'Tọa lạc tại thành phố Đà Lạt, cách sân golf Dalat Palace Golf Club 1,5 km, AN Boutique Hotel có dịch vụ tiền sảnh, phòng nghỉ không hút thuốc, khu vườn, WiFi miễn phí, sảnh khách chung và sân hiên. Khách sạn 3 sao này cung cấp dịch vụ phòng, dịch vụ lễ tân 24 giờ và dịch vụ thu đổi ngoại tệ cho khách.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/AN%20Boutique%20Hotel/429887656.jpg');

INSERT INTO HOTEL VALUES(49, N'Đảo Hoa Dalat Hotel', N'Việt Nam', 'HOTEL', N'Lâm Đồng',
	N'56 Đường Phạm Ngũ Lão, Đà Lạt',
 	4, 0,
	N'Đảo Hoa Đà Lạt Hotel tọa lạc tại thành phố Đà Lạt, cách Hồ Xuân Hương 1,6 km và Công viên Yersin Đà Lạt 1,8 km. Khách sạn 2 sao này cung cấp dịch vụ phòng và lễ tân 24 giờ. Chỗ nghỉ cấm hút thuốc và cách Quảng trường Lâm Viên 1,4 km.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90%E1%BA%A3o%20Hoa%20Dalat%20Hotel/487047698.jpg');

INSERT INTO HOTEL VALUES(50, N'Hạ Na Hotel Đà Lạt', N'Việt Nam', 'HOTEL', N'Lâm Đồng',
	N'Hẻm 163 Ba Tháng Hai, Đà Lạt',
 	5, 0,
	N'Nằm ở thành phố Đà Lạt, cách Quảng trường Lâm Viên 1,9 km, Hạ Na Hotel Đà Lạt cung cấp chỗ nghỉ với sảnh khách chung, chỗ đỗ xe riêng miễn phí và sân hiên. Chỗ nghỉ này nằm trong bán kính 2,1 km từ Hồ Xuân Hương, 2,2 km từ Công viên Yersin và 3,1 km từ Vườn hoa Đà Lạt. Nơi đây cung cấp dịch vụ lễ tân 24 giờ, dịch vụ đưa đón sân bay, khu bếp chung và WiFi miễn phí trong toàn bộ khuôn viên.',
	N'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/H%E1%BA%A1%20Na%20Hotel%20%C4%90%C3%A0%20L%E1%BA%A1t/346439681.jpg');



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
	'SINGLE_OR_TWIN');

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

--todo Mandala Cham Bay Mui Ne
INSERT INTO ROOM_TYPE VALUES(21, 1,N'Suite President Nhìn ra Thành Phố', 3, 80,4300000,
	N'Phòng giường đơn cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi, Nhìn ra rừng, Nhìn ra địa danh nổi tiếng',
	'SINGLE_OR_TWIN');
INSERT INTO ROOM_TYPE VALUES(21, 2,N'Suite Deluxe Gia Đình', 3, 80,5700000,
	N'Phòng giường đôi này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'DOUBLE');
INSERT INTO ROOM_TYPE VALUES(21, 3,N'Suite Senior Deluxe', 3, 80,5200000,
	N'Phòng giường đôi cực lớn này được bố trí phòng tắm riêng với buồng tắm đứng, máy sấy tóc, dép và đồ vệ sinh cá nhân miễn phí.',
	N'Ban công rộng,Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
	'LARGE_DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(21,1,15);
INSERT INTO ROOM_FACILITY VALUES(21,1,13);
INSERT INTO ROOM_FACILITY VALUES(21,1,11);

INSERT INTO ROOM_FACILITY VALUES(21,2,1);
INSERT INTO ROOM_FACILITY VALUES(21,2,4);
INSERT INTO ROOM_FACILITY VALUES(21,2,5);

INSERT INTO ROOM_FACILITY VALUES(21,3,3);
INSERT INTO ROOM_FACILITY VALUES(21,3,4);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(21,1,5);
INSERT INTO ROOM_SERVICE VALUES(21,1,4);

INSERT INTO ROOM_SERVICE VALUES(21,2,4);

INSERT INTO ROOM_SERVICE VALUES(21,3,4);
INSERT INTO ROOM_SERVICE VALUES(21,3,1);

--todo RUBENS BOUTIQUE HOTE
INSERT INTO ROOM_TYPE VALUES(22, 1,N'Phòng 2 Giường Đơn Nhìn Ra Biển', 3, 80,3000000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(22, 2,N'Phòng Giường Đôi Nhìn Ra Hồ Bơi', 3, 80,3150000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(22, 3,N'Phòng Deluxe Giường Đôi/2 Giường Đơn Nhìn Ra Thành Phố', 3, 80,3300000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(22,1,4);
INSERT INTO ROOM_FACILITY VALUES(22,1,5);
INSERT INTO ROOM_FACILITY VALUES(22,1,6);

INSERT INTO ROOM_FACILITY VALUES(22,2,7);
INSERT INTO ROOM_FACILITY VALUES(22,2,8);
INSERT INTO ROOM_FACILITY VALUES(22,2,9);

INSERT INTO ROOM_FACILITY VALUES(22,3,10);
INSERT INTO ROOM_FACILITY VALUES(22,3,11);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(22,1,4);
INSERT INTO ROOM_SERVICE VALUES(22,1,2);

INSERT INTO ROOM_SERVICE VALUES(22,2,2);

INSERT INTO ROOM_SERVICE VALUES(22,3,1);
INSERT INTO ROOM_SERVICE VALUES(22,3,2);
--todo Movenpick Hotel Phan Thiet
INSERT INTO ROOM_TYPE VALUES(23, 1,N'Suite Senior Deluxe', 3, 80,5450000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(23, 2,N'Phòng Deluxe Giường Đôi/2 Giường Đơn Nhìn Ra Thành Phố', 3, 80,5230000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(23, 3,N'Suite', 3, 80,5150000,
	N'Phòng giường đôi này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(23,1,8);
INSERT INTO ROOM_FACILITY VALUES(23,1,11);
INSERT INTO ROOM_FACILITY VALUES(23,1,7);

INSERT INTO ROOM_FACILITY VALUES(23,2,5);
INSERT INTO ROOM_FACILITY VALUES(23,2,11);
INSERT INTO ROOM_FACILITY VALUES(23,2,14);

INSERT INTO ROOM_FACILITY VALUES(23,3,12);
INSERT INTO ROOM_FACILITY VALUES(23,3,14);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(23,1,1);
INSERT INTO ROOM_SERVICE VALUES(23,1,2);

INSERT INTO ROOM_SERVICE VALUES(23,2,4);

INSERT INTO ROOM_SERVICE VALUES(23,3,4);
INSERT INTO ROOM_SERVICE VALUES(23,3,5);
--todo Radisson Resort Phan Thiet
INSERT INTO ROOM_TYPE VALUES(24, 1,N'Phòng Deluxe Giường Đôi Có Ban Công', 3, 80,4300000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(24, 2,N'Phòng 2 giường đơn có ban công ', 3, 80,4100000,
	N'Phòng 2 Giường Đơn này có ban công, ấm đun nước điện và máy điều hòa.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'SINGLE_OR_TWIN');
INSERT INTO ROOM_TYPE VALUES(24, 3,N'Phòng Deluxe Giường Đôi Có Bồn Tắm', 3, 80,3150000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(24,1,7);
INSERT INTO ROOM_FACILITY VALUES(24,1,16);
INSERT INTO ROOM_FACILITY VALUES(24,1,11);

INSERT INTO ROOM_FACILITY VALUES(24,2,7);
INSERT INTO ROOM_FACILITY VALUES(24,2,6);
INSERT INTO ROOM_FACILITY VALUES(24,2,3);

INSERT INTO ROOM_FACILITY VALUES(24,3,14);
INSERT INTO ROOM_FACILITY VALUES(24,3,2);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(24,1,2);
INSERT INTO ROOM_SERVICE VALUES(24,1,5);

INSERT INTO ROOM_SERVICE VALUES(24,2,3);

INSERT INTO ROOM_SERVICE VALUES(24,3,4);
INSERT INTO ROOM_SERVICE VALUES(24,3,1);

--todo Kim Long Hotel
INSERT INTO ROOM_TYPE VALUES(25, 1,N'Phòng 2 Giường Đôi Nhìn Ra Biển', 3, 80,5300000,
	N'Phòng 2 Giường Đôi lớn này có ban công, ấm đun nước điện và máy điều hòa.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(25, 2,N'Phòng Deluxe Giường Đôi Có Ban Công', 3, 80,5100000,
	N'Phòng giường đôi này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'DOUBLE');
INSERT INTO ROOM_TYPE VALUES(25, 3,N'Phòng Deluxe Có Giường Cỡ King', 3, 80,5200000,
	N'Phòng giường đơn cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Phòng giường đơn này được bố trí phòng tắm riêng với buồng tắm đứng, máy sấy tóc, dép và đồ vệ sinh cá nhân miễn phí.',
	'SINGLE_OR_TWIN');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(25,1,15);
INSERT INTO ROOM_FACILITY VALUES(25,1,12);
INSERT INTO ROOM_FACILITY VALUES(25,1,11);

INSERT INTO ROOM_FACILITY VALUES(25,2,8);
INSERT INTO ROOM_FACILITY VALUES(25,2,6);
INSERT INTO ROOM_FACILITY VALUES(25,2,7);

INSERT INTO ROOM_FACILITY VALUES(25,3,6);
INSERT INTO ROOM_FACILITY VALUES(25,3,5);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(25,1,5);
INSERT INTO ROOM_SERVICE VALUES(25,1,4);

INSERT INTO ROOM_SERVICE VALUES(25,2,3);

INSERT INTO ROOM_SERVICE VALUES(25,3,2);
INSERT INTO ROOM_SERVICE VALUES(25,3,1);

--todo Mui Ne Alena Hotel
INSERT INTO ROOM_TYPE VALUES(26, 1,N'Suite Deluxe Gia Đình', 3, 70,6500000,
	N'Phòng giường đôi này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(26, 2,N'Suite Royal Nhìn ra Biển', 3, 80,7000000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(26, 3,N'Phòng Giường Tầng Nhìn Ra Hồ Bơi', 3, 80,550000,
	N'Phòng giường tầng này có ấm đun nước điện, tủ lạnh mini, nước lọc.',
	N'Ban công, Nhìn ra thành biển, Nhìn ra địa thành phố',
	'BUNK');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(26,1,2);
INSERT INTO ROOM_FACILITY VALUES(26,1,7);
INSERT INTO ROOM_FACILITY VALUES(26,1,3);

INSERT INTO ROOM_FACILITY VALUES(26,2,9);
INSERT INTO ROOM_FACILITY VALUES(26,2,11);
INSERT INTO ROOM_FACILITY VALUES(26,2,12);

INSERT INTO ROOM_FACILITY VALUES(26,3,16);
INSERT INTO ROOM_FACILITY VALUES(26,3,15);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(26,1,5);
INSERT INTO ROOM_SERVICE VALUES(26,1,4);

INSERT INTO ROOM_SERVICE VALUES(26,2,2);

INSERT INTO ROOM_SERVICE VALUES(26,3,1);
INSERT INTO ROOM_SERVICE VALUES(26,3,3);

--todo Wanderlust Hotel
INSERT INTO ROOM_TYPE VALUES(27, 1,N'Phòng Superior Giường Đôi/2 Giường Đơn Nhìn Ra Thành Phố', 3, 70,4800000,
	N'Phòng giường đôi cực lớn này có ấm đun nước điện, tủ lạnh mini, nước lọc.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(27, 2,N'Suite Deluxe Giường Đôi Có Ban Công', 3, 90,4900000,
	N'Phòng giường đôi này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Ban công, Nhìn ra thành biển, Nhìn ra địa thành phố',
	'DOUBLE');
INSERT INTO ROOM_TYPE VALUES(27, 3,N'Suite Senior Deluxe', 3, 85,5000000,
	N'Phòng giường đơn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi, Nhìn ra rừng, Nhìn ra địa danh nổi tiếng',
	'SINGLE_OR_TWIN');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(27,1,9);
INSERT INTO ROOM_FACILITY VALUES(27,1,1);
INSERT INTO ROOM_FACILITY VALUES(27,1,7);

INSERT INTO ROOM_FACILITY VALUES(27,2,8);
INSERT INTO ROOM_FACILITY VALUES(27,2,2);
INSERT INTO ROOM_FACILITY VALUES(27,2,7);

INSERT INTO ROOM_FACILITY VALUES(27,3,6);
INSERT INTO ROOM_FACILITY VALUES(27,3,15);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(27,1,4);
INSERT INTO ROOM_SERVICE VALUES(27,1,5);

INSERT INTO ROOM_SERVICE VALUES(27,2,3);

INSERT INTO ROOM_SERVICE VALUES(27,3,2);
INSERT INTO ROOM_SERVICE VALUES(27,3,1);

--todo Sea Night Hotel
INSERT INTO ROOM_TYPE VALUES(28, 1,N'Suite Deluxe Gia Đình', 3, 70,2200000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(28, 2,N'Suite Royal Nhìn ra Biển', 3, 80,3300000,
	N'Phòng giường đôi này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Ban công rộng,Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
	'DOUBLE');
INSERT INTO ROOM_TYPE VALUES(28, 3,N'Phòng Deluxe Giường Đôi', 3, 85,4400000,
	N'Phòng giường đôi này được bố trí phòng tắm riêng với buồng tắm đứng, máy sấy tóc, dép và đồ vệ sinh cá nhân miễn phí..',
	N'Nhìn ra núi, Nhìn ra rừng, Nhìn ra địa danh nổi tiếng, Nhìn ra hồ bơi',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(28,1,5);
INSERT INTO ROOM_FACILITY VALUES(28,1,2);
INSERT INTO ROOM_FACILITY VALUES(28,1,1);

INSERT INTO ROOM_FACILITY VALUES(28,2,14);
INSERT INTO ROOM_FACILITY VALUES(28,2,6);
INSERT INTO ROOM_FACILITY VALUES(28,2,4);

INSERT INTO ROOM_FACILITY VALUES(28,3,1);
INSERT INTO ROOM_FACILITY VALUES(28,3,15);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(28,1,2);
INSERT INTO ROOM_SERVICE VALUES(28,1,3);

INSERT INTO ROOM_SERVICE VALUES(28,2,4);

INSERT INTO ROOM_SERVICE VALUES(28,3,5);
INSERT INTO ROOM_SERVICE VALUES(28,3,1);

--todo EMERALD OCEAN HOTEL
INSERT INTO ROOM_TYPE VALUES(29, 1,N'Phòng Deluxe Giường Đôi Có Bồn Tắm', 3, 85,4200000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE');
INSERT INTO ROOM_TYPE VALUES(29, 2,N'Phòng 2 Giường Đôi có ban công', 3, 60,4500000,
	N'Phòng 2 giường đôi cực lớn này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(29, 3,N'Phòng Deluxe Có Giường Cỡ King', 3, 70,5200000,
	N'Phòng 2 Giường Đơn này có ban công, ấm đun nước điện và máy điều hòa.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'SINGLE_OR_TWIN');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(29,1,3);
INSERT INTO ROOM_FACILITY VALUES(29,1,6);
INSERT INTO ROOM_FACILITY VALUES(29,1,7);

INSERT INTO ROOM_FACILITY VALUES(29,2,3);
INSERT INTO ROOM_FACILITY VALUES(29,2,15);
INSERT INTO ROOM_FACILITY VALUES(29,2,16);

INSERT INTO ROOM_FACILITY VALUES(29,3,14);
INSERT INTO ROOM_FACILITY VALUES(29,3,12);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(29,1,5);
INSERT INTO ROOM_SERVICE VALUES(29,1,3);

INSERT INTO ROOM_SERVICE VALUES(29,2,4);

INSERT INTO ROOM_SERVICE VALUES(29,3,1);
INSERT INTO ROOM_SERVICE VALUES(29,3,2);

--todo TIFFANY HOTEL & RESTAURANT
INSERT INTO ROOM_TYPE VALUES(30, 1,N'Suite President Nhìn ra Thành Phố', 3, 80,5500000,
	N'Phòng giường đôi cực lớn này có ban công, ấm đun nước điện và máy điều hòa.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(30, 2,N'Phòng 2 giường đơn có ban công', 3, 80,5400000,
	N'Phòng giường đôi này được bố trí phòng tắm riêng với buồng tắm đứng, máy sấy tóc, dép và đồ vệ sinh cá nhân miễn phí.',
	N'Nhìn ra hồ bơi, Ban công, Nhìn ra địa danh nổi tiếng',
	'SINGLE_OR_TWIN');
INSERT INTO ROOM_TYPE VALUES(30, 3,N'Phòng Giường Đôi Nhìn Ra Hồ Bơi', 3, 80,4300000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra hồ bơi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(30,1,4);
INSERT INTO ROOM_FACILITY VALUES(30,1,7);
INSERT INTO ROOM_FACILITY VALUES(30,1,12);

INSERT INTO ROOM_FACILITY VALUES(30,2,2);
INSERT INTO ROOM_FACILITY VALUES(30,2,8);
INSERT INTO ROOM_FACILITY VALUES(30,2,3);

INSERT INTO ROOM_FACILITY VALUES(30,3,1);
INSERT INTO ROOM_FACILITY VALUES(30,3,9);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(30,1,3);
INSERT INTO ROOM_SERVICE VALUES(30,1,4);

INSERT INTO ROOM_SERVICE VALUES(30,2,1);

INSERT INTO ROOM_SERVICE VALUES(30,3,2);
INSERT INTO ROOM_SERVICE VALUES(30,3,5);


--todo Long Life Riverside Hotel
INSERT INTO ROOM_TYPE VALUES(31, 1,N'Phòng Giường Đôi Nhìn Ra Hồ Bơi', 3, 85,4200000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra hồ bơi',
	'DOUBLE');
INSERT INTO ROOM_TYPE VALUES(31, 2,N'Phòng 2 Giường Đôi có ban công', 3, 60,4500000,
	N'Phòng 2 giường đôi cực lớn này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra rừng',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(31, 3,N'Phòng Superior Giường Đôi/2 Giường Đơn Nhìn Ra Thành Phố', 3, 70,5200000,
	N'Phòng 2 Giường Đơn này có ban công, ấm đun nước điện và máy điều hòa.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra vườn',
	'SINGLE_OR_TWIN');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(31,1,3);
INSERT INTO ROOM_FACILITY VALUES(31,1,6);
INSERT INTO ROOM_FACILITY VALUES(31,1,7);

INSERT INTO ROOM_FACILITY VALUES(31,2,3);
INSERT INTO ROOM_FACILITY VALUES(31,2,15);
INSERT INTO ROOM_FACILITY VALUES(31,2,16);

INSERT INTO ROOM_FACILITY VALUES(31,3,14);
INSERT INTO ROOM_FACILITY VALUES(31,3,12);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(31,1,5);
INSERT INTO ROOM_SERVICE VALUES(31,1,3);

INSERT INTO ROOM_SERVICE VALUES(31,2,4);

INSERT INTO ROOM_SERVICE VALUES(31,3,1);
INSERT INTO ROOM_SERVICE VALUES(31,3,2);

--todo Hoi An Dream City Hotel
INSERT INTO ROOM_TYPE VALUES(32, 1, N'Suite President Nhìn ra Thành Phố', 3, 85, 4250000,
	N'Phòng 2 giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra vườn',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(32, 2, N'Phòng Deluxe Gia Đình', 3, 60, 4590000,
	N'Phòng giường đôi cực lớn này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra đường phố',
	'DOUBLE');
INSERT INTO ROOM_TYPE VALUES(32, 3, N'Suite Royal Nhìn ra Thành phố', 3, 60, 4950000,
	N'Phòng 2 Giường Đơn này có ban công, ấm đun nước điện và máy điều hòa.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra hồ bơi',
	'LARGE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(32,1,1);
INSERT INTO ROOM_FACILITY VALUES(32,1,2);
INSERT INTO ROOM_FACILITY VALUES(32,1,3);

INSERT INTO ROOM_FACILITY VALUES(32,2,7);
INSERT INTO ROOM_FACILITY VALUES(32,2,8);
INSERT INTO ROOM_FACILITY VALUES(32,2,9);

INSERT INTO ROOM_FACILITY VALUES(32,3,11);
INSERT INTO ROOM_FACILITY VALUES(32,3,12);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(32,1,1);
INSERT INTO ROOM_SERVICE VALUES(32,1,3);

INSERT INTO ROOM_SERVICE VALUES(32,2,4);

INSERT INTO ROOM_SERVICE VALUES(32,3,1);
INSERT INTO ROOM_SERVICE VALUES(32,3,2);

--todo Hoa My II Hotel
INSERT INTO ROOM_TYPE VALUES(33, 1,N'Phòng Deluxe Giường Đôi Có Bồn Tắm', 3, 85,2890000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra hồ bơi',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(33, 2,N'Phòng 2 Giường Đôi có ban công', 3, 60,3150000,
	N'Phòng 2 giường đơn cực lớn này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'SINGLE_OR_TWIN');
INSERT INTO ROOM_TYPE VALUES(33, 3,N'Phòng Deluxe Có Giường Cỡ King', 3, 70,2430000,
	N'Phòng Giường Đơn cực lớn này có ban công, ấm đun nước điện và máy điều hòa.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra vườn',
	'LARGE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(33,1,13);
INSERT INTO ROOM_FACILITY VALUES(33,1,16);
INSERT INTO ROOM_FACILITY VALUES(33,1,7);

INSERT INTO ROOM_FACILITY VALUES(33,2,4);
INSERT INTO ROOM_FACILITY VALUES(33,2,11);
INSERT INTO ROOM_FACILITY VALUES(33,2,7);

INSERT INTO ROOM_FACILITY VALUES(33,3,14);
INSERT INTO ROOM_FACILITY VALUES(33,3,2);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(33,1,2);
INSERT INTO ROOM_SERVICE VALUES(33,1,3);

INSERT INTO ROOM_SERVICE VALUES(33,2,4);

INSERT INTO ROOM_SERVICE VALUES(33,3,5);
INSERT INTO ROOM_SERVICE VALUES(33,3,2);

--todo HOI AN HISTORIC HOTEL
INSERT INTO ROOM_TYPE VALUES(34, 1,N'Phòng Deluxe Giường Đôi Có Bồn Tắm', 3, 85,3740000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra bãi cát',
	'LARGE');
INSERT INTO ROOM_TYPE VALUES(34, 2,N'Phòng 2 Giường Đôi có ban công', 3, 60,3350000,
	N'Phòng 2 giường đôi cực lớn này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra hồ bơi',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(34, 3,N'Phòng Deluxe Giường Tầng', 3, 70,4260000,
	N'Phòng có Giường Tầng này có ban công, ấm đun nước điện và máy điều hòa.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra vườn xanh',
	'BUNK');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(34,1,3);
INSERT INTO ROOM_FACILITY VALUES(34,1,6);
INSERT INTO ROOM_FACILITY VALUES(34,1,7);

INSERT INTO ROOM_FACILITY VALUES(34,2,3);
INSERT INTO ROOM_FACILITY VALUES(34,2,15);
INSERT INTO ROOM_FACILITY VALUES(34,2,16);

INSERT INTO ROOM_FACILITY VALUES(34,3,14);
INSERT INTO ROOM_FACILITY VALUES(34,3,12);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(34,1,5);
INSERT INTO ROOM_SERVICE VALUES(34,1,3);

INSERT INTO ROOM_SERVICE VALUES(34,2,4);

INSERT INTO ROOM_SERVICE VALUES(34,3,1);
INSERT INTO ROOM_SERVICE VALUES(34,3,2);

--todo HY Local Budget Hotel
INSERT INTO ROOM_TYPE VALUES(35, 1,N'Phòng Deluxe Giường Đôi Có Bồn Tắm', 3, 85,2200000,
	N'Phòng 2 giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(35, 2,N'Phòng 2 Giường Đôi có ban công', 3, 60,1750000,
	N'Phòng giường đôi cực lớn này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE');
INSERT INTO ROOM_TYPE VALUES(35, 3,N'Phòng Deluxe Giường Đơn', 3, 70,1300000,
	N'Phòng Giường Đơn này có ban công, ấm đun nước điện và máy điều hòa.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'SINGLE_OR_TWIN');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(35,1,3);
INSERT INTO ROOM_FACILITY VALUES(35,1,9);
INSERT INTO ROOM_FACILITY VALUES(35,1,2);

INSERT INTO ROOM_FACILITY VALUES(35,2,8);
INSERT INTO ROOM_FACILITY VALUES(35,2,5);
INSERT INTO ROOM_FACILITY VALUES(35,2,13);

INSERT INTO ROOM_FACILITY VALUES(35,3,11);
INSERT INTO ROOM_FACILITY VALUES(35,3,2);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(35,1,5);
INSERT INTO ROOM_SERVICE VALUES(35,1,2);

INSERT INTO ROOM_SERVICE VALUES(35,2,5);

INSERT INTO ROOM_SERVICE VALUES(35,3,1);
INSERT INTO ROOM_SERVICE VALUES(35,3,2);

--todo Golden River Hotel
INSERT INTO ROOM_TYPE VALUES(36, 1,N'Phòng Deluxe Giường Đôi/2 Giường Đơn Nhìn Ra Thành Phố', 3, 85,3200000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE');
INSERT INTO ROOM_TYPE VALUES(36, 2,N'Phòng 2 Giường Đôi có ban công', 3, 60,2750000,
	N'Phòng 2 giường đôi cực lớn này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'DOUBLE');
INSERT INTO ROOM_TYPE VALUES(36, 3,N'Deluxe Gia Đình', 3, 70,2500000,
	N'Phòng 2 Giường Đôi này có ban công, ấm đun nước điện và máy điều hòa.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(36,1,9);
INSERT INTO ROOM_FACILITY VALUES(36,1,6);
INSERT INTO ROOM_FACILITY VALUES(36,1,7);

INSERT INTO ROOM_FACILITY VALUES(36,2,13);
INSERT INTO ROOM_FACILITY VALUES(36,2,15);
INSERT INTO ROOM_FACILITY VALUES(36,2,6);

INSERT INTO ROOM_FACILITY VALUES(36,3,14);
INSERT INTO ROOM_FACILITY VALUES(36,3,4);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(36,1,5);
INSERT INTO ROOM_SERVICE VALUES(36,1,3);

INSERT INTO ROOM_SERVICE VALUES(36,2,4);

INSERT INTO ROOM_SERVICE VALUES(36,3,4);
INSERT INTO ROOM_SERVICE VALUES(36,3,5);

--todo Hoi An Pho Library Hotel
INSERT INTO ROOM_TYPE VALUES(37, 1,N'Phòng Deluxe Gia Đình', 3, 85,4200000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE');
INSERT INTO ROOM_TYPE VALUES(37, 2,N'Suite Royal Nhìn ra Biển', 3, 60,4400000,
	N'Phòng 2 giường đôi cực lớn này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
	'DOUBLE');
INSERT INTO ROOM_TYPE VALUES(37, 3,N'Phòng Senior Deluxe', 3, 70,5100000,
	N'Phòng 2 Giường Đơn này có ban công, ấm đun nước điện và máy điều hòa.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'SINGLE_OR_TWIN');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(37,1,3);
INSERT INTO ROOM_FACILITY VALUES(37,1,6);
INSERT INTO ROOM_FACILITY VALUES(37,1,8);

INSERT INTO ROOM_FACILITY VALUES(37,2,3);
INSERT INTO ROOM_FACILITY VALUES(37,2,12);
INSERT INTO ROOM_FACILITY VALUES(37,2,11);

INSERT INTO ROOM_FACILITY VALUES(37,3,14);
INSERT INTO ROOM_FACILITY VALUES(37,3,1);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(37,1,5);
INSERT INTO ROOM_SERVICE VALUES(37,1,3);

INSERT INTO ROOM_SERVICE VALUES(37,2,2);

INSERT INTO ROOM_SERVICE VALUES(37,3,1);
INSERT INTO ROOM_SERVICE VALUES(37,3,3);

--todo Uptown Hoi An Hotel
INSERT INTO ROOM_TYPE VALUES(38, 1,N'Phòng Deluxe Giường Đôi Có Bồn Tắm', 3, 85,4270000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
	'DOUBLE');
INSERT INTO ROOM_TYPE VALUES(38, 2,N'Phòng 2 Giường Đôi có ban công', 3, 60,3720000,
	N'Phòng 2 giường đôi cực lớn này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Ban công',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(38, 3,N'Phòng Deluxe Có Giường Cỡ King', 3, 70,4650000,
	N'Phòng 2 Giường Đơn này có ban công, ấm đun nước điện và máy điều hòa.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra hồ bơi',
	'LARGE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(38,1,3);
INSERT INTO ROOM_FACILITY VALUES(38,1,6);
INSERT INTO ROOM_FACILITY VALUES(38,1,7);

INSERT INTO ROOM_FACILITY VALUES(38,2,3);
INSERT INTO ROOM_FACILITY VALUES(38,2,15);
INSERT INTO ROOM_FACILITY VALUES(38,2,16);

INSERT INTO ROOM_FACILITY VALUES(38,3,14);
INSERT INTO ROOM_FACILITY VALUES(38,3,12);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(38,1,5);
INSERT INTO ROOM_SERVICE VALUES(38,1,3);

INSERT INTO ROOM_SERVICE VALUES(38,2,4);

INSERT INTO ROOM_SERVICE VALUES(38,3,1);
INSERT INTO ROOM_SERVICE VALUES(38,3,2);

--todo Thanh Binh Central Hotel
INSERT INTO ROOM_TYPE VALUES(39, 1,N'Phòng Deluxe Giường Đôi Có Bồn Tắm', 3, 85,4150000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE');
INSERT INTO ROOM_TYPE VALUES(39, 2,N'Phòng 2 Giường Đôi Nhìn Ra Biển', 3, 60,2540000,
	N'Phòng 2 giường đôi cực lớn này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
	'LARGE');
INSERT INTO ROOM_TYPE VALUES(39, 3,N'Phòng Deluxe Có Giường Cỡ King', 3, 70,3250000,
	N'Phòng Giường Đôi này có ban công, ấm đun nước điện và máy điều hòa.',
	N'Ban công,Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(39,1,4);
INSERT INTO ROOM_FACILITY VALUES(39,1,6);
INSERT INTO ROOM_FACILITY VALUES(39,1,9);

INSERT INTO ROOM_FACILITY VALUES(39,2,5);
INSERT INTO ROOM_FACILITY VALUES(39,2,2);
INSERT INTO ROOM_FACILITY VALUES(39,2,1);

INSERT INTO ROOM_FACILITY VALUES(39,3,14);
INSERT INTO ROOM_FACILITY VALUES(39,3,15);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(39,1,5);
INSERT INTO ROOM_SERVICE VALUES(39,1,2);

INSERT INTO ROOM_SERVICE VALUES(39,2,1);

INSERT INTO ROOM_SERVICE VALUES(39,3,1);
INSERT INTO ROOM_SERVICE VALUES(39,3,2);

--todo Thanh Van 1 Hotel
INSERT INTO ROOM_TYPE VALUES(40, 1,N'Phòng Deluxe Giường Đôi Có Bồn Tắm', 3, 85,4450000,
	N'Phòng giường đôi cực lớn này có sofa, SmartTV, bàn ghế trang điểm, minibar và đầy đủ đồ nội thất.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng, Nhìn ra biển',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(40, 2,N'Phòng 2 Giường Đôi có ban công', 3, 60,4570000,
	N'Phòng 2 giường đôi cực lớn này có ấm đun nước điện, sofa, bàn ghế trang điểm, máy sấy.',
	N'Ban công, Nhìn ra thành phố, Nhìn ra địa danh nổi tiếng',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(40, 3,N'Phòng Deluxe Có Giường Cỡ King', 3, 70,3250000,
	N'Phòng giường đôi cực lớn này có ban công, ấm đun nước điện và máy điều hòa.',
	N'Nhìn ra núi,Nhìn ra vườn, Nhìn ra rừng, Nhìn ra thành phố',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(40,1,4);
INSERT INTO ROOM_FACILITY VALUES(40,1,5);
INSERT INTO ROOM_FACILITY VALUES(40,1,8);

INSERT INTO ROOM_FACILITY VALUES(40,2,13);
INSERT INTO ROOM_FACILITY VALUES(40,2,15);
INSERT INTO ROOM_FACILITY VALUES(40,2,16);

INSERT INTO ROOM_FACILITY VALUES(40,3,11);
INSERT INTO ROOM_FACILITY VALUES(40,3,12);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(40,1,5);
INSERT INTO ROOM_SERVICE VALUES(40,1,3);

INSERT INTO ROOM_SERVICE VALUES(40,2,4);

INSERT INTO ROOM_SERVICE VALUES(40,3,1);
INSERT INTO ROOM_SERVICE VALUES(40,3,2);

--todo Đà Lạt Thanh Xuân Hotel
INSERT INTO ROOM_TYPE VALUES(41, 1,N'', 3, 85,4450000,
	N'',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(41, 2,N'', 3, 60,4570000,
	N'.',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(41, 3,N'', 3, 70,3250000,
	N'.',
	N'',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(41,1,4);
INSERT INTO ROOM_FACILITY VALUES(41,1,5);
INSERT INTO ROOM_FACILITY VALUES(41,1,8);

INSERT INTO ROOM_FACILITY VALUES(41,2,13);
INSERT INTO ROOM_FACILITY VALUES(41,2,15);
INSERT INTO ROOM_FACILITY VALUES(41,2,16);

INSERT INTO ROOM_FACILITY VALUES(41,3,11);
INSERT INTO ROOM_FACILITY VALUES(41,3,12);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(41,1,5);
INSERT INTO ROOM_SERVICE VALUES(41,1,3);

INSERT INTO ROOM_SERVICE VALUES(41,2,4);

INSERT INTO ROOM_SERVICE VALUES(41,3,1);
INSERT INTO ROOM_SERVICE VALUES(41,3,2);

--todo Minh Phú 2 Hotel
INSERT INTO ROOM_TYPE VALUES(42, 1,N'', 3, 85,3450000,
	N'',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(42, 2,N'', 3, 60,2640000,
	N'.',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(42, 3,N'', 3, 70,1950000,
	N'.',
	N'',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(42,1,4);
INSERT INTO ROOM_FACILITY VALUES(42,1,5);
INSERT INTO ROOM_FACILITY VALUES(42,1,8);

INSERT INTO ROOM_FACILITY VALUES(42,2,13);
INSERT INTO ROOM_FACILITY VALUES(42,2,15);
INSERT INTO ROOM_FACILITY VALUES(42,2,16);

INSERT INTO ROOM_FACILITY VALUES(42,3,11);
INSERT INTO ROOM_FACILITY VALUES(4,3,12);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(42,1,5);
INSERT INTO ROOM_SERVICE VALUES(42,1,3);

INSERT INTO ROOM_SERVICE VALUES(42,2,4);

INSERT INTO ROOM_SERVICE VALUES(42,3,1);
INSERT INTO ROOM_SERVICE VALUES(42,3,2);

--todo Torino Hotel Dalat
INSERT INTO ROOM_TYPE VALUES(43, 1,N'', 3, 85,2960000,
	N'',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(43, 2,N'', 3, 60,2360000,
	N'.',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(43, 3,N'', 3, 70,1500000,
	N'.',
	N'',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(43,1,4);
INSERT INTO ROOM_FACILITY VALUES(43,1,5);
INSERT INTO ROOM_FACILITY VALUES(43,1,8);

INSERT INTO ROOM_FACILITY VALUES(43,2,13);
INSERT INTO ROOM_FACILITY VALUES(43,2,15);
INSERT INTO ROOM_FACILITY VALUES(43,2,16);

INSERT INTO ROOM_FACILITY VALUES(43,3,11);
INSERT INTO ROOM_FACILITY VALUES(43,3,12);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(43,1,5);
INSERT INTO ROOM_SERVICE VALUES(43,1,3);

INSERT INTO ROOM_SERVICE VALUES(43,2,4);

INSERT INTO ROOM_SERVICE VALUES(43,3,1);
INSERT INTO ROOM_SERVICE VALUES(43,3,2);

--todo HouseChill Dalat Hotel
INSERT INTO ROOM_TYPE VALUES(44, 1,N'', 3, 85,1750000,
	N'',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(44, 2,N'', 3, 60,2570000,
	N'.',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(44, 3,N'', 3, 70,3150000,
	N'.',
	N'',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(44,1,4);
INSERT INTO ROOM_FACILITY VALUES(44,1,5);
INSERT INTO ROOM_FACILITY VALUES(44,1,8);

INSERT INTO ROOM_FACILITY VALUES(44,2,13);
INSERT INTO ROOM_FACILITY VALUES(44,2,15);
INSERT INTO ROOM_FACILITY VALUES(44,2,16);

INSERT INTO ROOM_FACILITY VALUES(44,3,11);
INSERT INTO ROOM_FACILITY VALUES(44,3,12);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(44,1,5);
INSERT INTO ROOM_SERVICE VALUES(44,1,3);

INSERT INTO ROOM_SERVICE VALUES(44,2,4);

INSERT INTO ROOM_SERVICE VALUES(44,3,1);
INSERT INTO ROOM_SERVICE VALUES(44,3,2);

--todo Dalat Wind Hotel
INSERT INTO ROOM_TYPE VALUES(45, 1,N'', 3, 85,4250000,
	N'',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(45, 2,N'', 3, 60,4170000,
	N'.',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(45, 3,N'', 3, 70,3240000,
	N'.',
	N'',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(45,1,4);
INSERT INTO ROOM_FACILITY VALUES(45,1,5);
INSERT INTO ROOM_FACILITY VALUES(45,1,8);

INSERT INTO ROOM_FACILITY VALUES(45,2,13);
INSERT INTO ROOM_FACILITY VALUES(45,2,15);
INSERT INTO ROOM_FACILITY VALUES(45,2,16);

INSERT INTO ROOM_FACILITY VALUES(45,3,11);
INSERT INTO ROOM_FACILITY VALUES(45,3,12);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(45,1,5);
INSERT INTO ROOM_SERVICE VALUES(45,1,3);

INSERT INTO ROOM_SERVICE VALUES(45,2,4);

INSERT INTO ROOM_SERVICE VALUES(45,3,1);
INSERT INTO ROOM_SERVICE VALUES(45,3,2);

--todo Vuon Xuan Hotel
INSERT INTO ROOM_TYPE VALUES(46, 1,N'', 3, 85,2450000,
	N'',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(46, 2,N'', 3, 66,4570000,
	N'.',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(46, 3,N'', 3, 70,2250000,
	N'.',
	N'',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(46,1,4);
INSERT INTO ROOM_FACILITY VALUES(46,1,5);
INSERT INTO ROOM_FACILITY VALUES(46,1,8);

INSERT INTO ROOM_FACILITY VALUES(46,2,13);
INSERT INTO ROOM_FACILITY VALUES(46,2,15);
INSERT INTO ROOM_FACILITY VALUES(46,2,16);

INSERT INTO ROOM_FACILITY VALUES(46,3,11);
INSERT INTO ROOM_FACILITY VALUES(46,3,12);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(46,1,5);
INSERT INTO ROOM_SERVICE VALUES(46,1,3);

INSERT INTO ROOM_SERVICE VALUES(46,2,4);

INSERT INTO ROOM_SERVICE VALUES(46,3,1);
INSERT INTO ROOM_SERVICE VALUES(46,3,2);

--todo Sunset Hill Dalat
INSERT INTO ROOM_TYPE VALUES(47, 1,N'', 3, 81,2970000,
	N'',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(47, 2,N'', 3, 68,2560000,
	N'.',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(47, 3,N'', 3, 72,3570000,
	N'.',
	N'',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(47,1,4);
INSERT INTO ROOM_FACILITY VALUES(47,1,5);
INSERT INTO ROOM_FACILITY VALUES(47,1,8);

INSERT INTO ROOM_FACILITY VALUES(47,2,13);
INSERT INTO ROOM_FACILITY VALUES(47,2,15);
INSERT INTO ROOM_FACILITY VALUES(47,2,16);

INSERT INTO ROOM_FACILITY VALUES(47,3,11);
INSERT INTO ROOM_FACILITY VALUES(47,3,12);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(47,1,5);
INSERT INTO ROOM_SERVICE VALUES(47,1,3);

INSERT INTO ROOM_SERVICE VALUES(47,2,4);

INSERT INTO ROOM_SERVICE VALUES(47,3,1);
INSERT INTO ROOM_SERVICE VALUES(47,3,2);

--todo AN Boutique Hotel
INSERT INTO ROOM_TYPE VALUES(48, 1,N'', 3, 85,1970000,
	N'',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(48, 2,N'', 3, 64,1570000,
	N'.',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(48, 3,N'', 3, 72,1250000,
	N'.',
	N'',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(48,1,4);
INSERT INTO ROOM_FACILITY VALUES(48,1,5);
INSERT INTO ROOM_FACILITY VALUES(48,1,8);

INSERT INTO ROOM_FACILITY VALUES(48,2,13);
INSERT INTO ROOM_FACILITY VALUES(48,2,15);
INSERT INTO ROOM_FACILITY VALUES(48,2,16);

INSERT INTO ROOM_FACILITY VALUES(48,3,11);
INSERT INTO ROOM_FACILITY VALUES(48,3,12);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(48,1,5);
INSERT INTO ROOM_SERVICE VALUES(48,1,3);

INSERT INTO ROOM_SERVICE VALUES(48,2,4);

INSERT INTO ROOM_SERVICE VALUES(48,3,1);
INSERT INTO ROOM_SERVICE VALUES(48,3,2);

--todo Đảo Hoa Dalat Hotel
INSERT INTO ROOM_TYPE VALUES(49, 1,N'', 3, 65,4850000,
	N'',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(49, 2,N'', 3, 60,2730000,
	N'.',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(49, 3,N'', 3, 60,3360000,
	N'.',
	N'',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(49,1,4);
INSERT INTO ROOM_FACILITY VALUES(49,1,5);
INSERT INTO ROOM_FACILITY VALUES(49,1,8);

INSERT INTO ROOM_FACILITY VALUES(49,2,13);
INSERT INTO ROOM_FACILITY VALUES(49,2,15);
INSERT INTO ROOM_FACILITY VALUES(49,2,16);

INSERT INTO ROOM_FACILITY VALUES(49,3,11);
INSERT INTO ROOM_FACILITY VALUES(49,3,12);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(49,1,5);
INSERT INTO ROOM_SERVICE VALUES(49,1,3);

INSERT INTO ROOM_SERVICE VALUES(49,2,4);

INSERT INTO ROOM_SERVICE VALUES(49,3,1);
INSERT INTO ROOM_SERVICE VALUES(49,3,2);

--todo Hạ Na Hotel Đà Lạt
INSERT INTO ROOM_TYPE VALUES(50, 1,N'', 3, 85,3150000,
	N'',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(50, 2,N'', 3, 60,2930000,
	N'.',
	N'',
	'LARGE_DOUBLE');
INSERT INTO ROOM_TYPE VALUES(50, 3,N'', 3, 70,1340000,
	N'.',
	N'',
	'DOUBLE');

--!ADD ROOM FACILITY
INSERT INTO ROOM_FACILITY VALUES(50,1,4);
INSERT INTO ROOM_FACILITY VALUES(50,1,5);
INSERT INTO ROOM_FACILITY VALUES(50,1,8);

INSERT INTO ROOM_FACILITY VALUES(50,2,13);
INSERT INTO ROOM_FACILITY VALUES(50,2,15);
INSERT INTO ROOM_FACILITY VALUES(50,2,16);

INSERT INTO ROOM_FACILITY VALUES(50,3,11);
INSERT INTO ROOM_FACILITY VALUES(50,3,12);
--! ADD ROOM SERVICE
INSERT INTO ROOM_SERVICE VALUES(50,1,5);
INSERT INTO ROOM_SERVICE VALUES(50,1,3);

INSERT INTO ROOM_SERVICE VALUES(50,2,4);

INSERT INTO ROOM_SERVICE VALUES(50,3,1);
INSERT INTO ROOM_SERVICE VALUES(50,3,2);


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

--todo Mandala Cham Bay Mui Ne
INSERT INTO ROOM_PICTURE VALUES(21,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mandala%20Cham%20Bay%20Mui%20Ne/445137756.jpg');
INSERT INTO ROOM_PICTURE VALUES(21,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mandala%20Cham%20Bay%20Mui%20Ne/478768394.jpg');
INSERT INTO ROOM_PICTURE VALUES(21,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mandala%20Cham%20Bay%20Mui%20Ne/445135913.jpg');

INSERT INTO ROOM_PICTURE VALUES(21,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mandala%20Cham%20Bay%20Mui%20Ne/478768373.jpg');
INSERT INTO ROOM_PICTURE VALUES(21,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mandala%20Cham%20Bay%20Mui%20Ne/445127970.jpg');
INSERT INTO ROOM_PICTURE VALUES(21,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mandala%20Cham%20Bay%20Mui%20Ne/445116503.jpg');

INSERT INTO ROOM_PICTURE VALUES(21,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mandala%20Cham%20Bay%20Mui%20Ne/445115104.jpg');
INSERT INTO ROOM_PICTURE VALUES(21,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mandala%20Cham%20Bay%20Mui%20Ne/445119484.jpg');
INSERT INTO ROOM_PICTURE VALUES(21,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mandala%20Cham%20Bay%20Mui%20Ne/445116495.jpg');

--todo RUBENS BOUTIQUE HOTEL
INSERT INTO ROOM_PICTURE VALUES(22,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/RUBENS%20BOUTIQUE%20HOTEL/447351998.jpg');
INSERT INTO ROOM_PICTURE VALUES(22,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/RUBENS%20BOUTIQUE%20HOTEL/447358764.jpg');
INSERT INTO ROOM_PICTURE VALUES(22,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/RUBENS%20BOUTIQUE%20HOTEL/447351907.jpg');

INSERT INTO ROOM_PICTURE VALUES(22,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/RUBENS%20BOUTIQUE%20HOTEL/446536012.jpg');
INSERT INTO ROOM_PICTURE VALUES(22,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/RUBENS%20BOUTIQUE%20HOTEL/446535980.jpg');
INSERT INTO ROOM_PICTURE VALUES(22,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/RUBENS%20BOUTIQUE%20HOTEL/446535974.jpg');

INSERT INTO ROOM_PICTURE VALUES(22,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/RUBENS%20BOUTIQUE%20HOTEL/446535962.jpg');
INSERT INTO ROOM_PICTURE VALUES(22,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/RUBENS%20BOUTIQUE%20HOTEL/446535982.jpg');
INSERT INTO ROOM_PICTURE VALUES(22,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/RUBENS%20BOUTIQUE%20HOTEL/446535958.jpg');

--todo Movenpick Hotel Phan Thiet
INSERT INTO ROOM_PICTURE VALUES(23,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Movenpick%20Resort%20Phan%20Thiet/464508175.jpg');
INSERT INTO ROOM_PICTURE VALUES(23,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Movenpick%20Resort%20Phan%20Thiet/464508127.jpg');
INSERT INTO ROOM_PICTURE VALUES(23,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Movenpick%20Resort%20Phan%20Thiet/464508148.jpg');

INSERT INTO ROOM_PICTURE VALUES(23,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Movenpick%20Resort%20Phan%20Thiet/464508143.jpg');
INSERT INTO ROOM_PICTURE VALUES(23,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Movenpick%20Resort%20Phan%20Thiet/464508125.jpg');
INSERT INTO ROOM_PICTURE VALUES(23,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Movenpick%20Resort%20Phan%20Thiet/464508120.jpg');

INSERT INTO ROOM_PICTURE VALUES(23,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Movenpick%20Resort%20Phan%20Thiet/464508113.jpg');
INSERT INTO ROOM_PICTURE VALUES(23,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Movenpick%20Resort%20Phan%20Thiet/464508107.jpg');
INSERT INTO ROOM_PICTURE VALUES(23,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Movenpick%20Resort%20Phan%20Thiet/334369514.jpg');

--todo Radisson Resort Phan Thiet
INSERT INTO ROOM_PICTURE VALUES(24,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Radisson%20Resort%20Phan%20Thiet/367681569.jpg');
INSERT INTO ROOM_PICTURE VALUES(24,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Radisson%20Resort%20Phan%20Thiet/367681542.jpg');
INSERT INTO ROOM_PICTURE VALUES(24,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Radisson%20Resort%20Phan%20Thiet/346364993.jpg');

INSERT INTO ROOM_PICTURE VALUES(24,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Radisson%20Resort%20Phan%20Thiet/346364979.jpg');
INSERT INTO ROOM_PICTURE VALUES(24,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Radisson%20Resort%20Phan%20Thiet/346364967.jpg');
INSERT INTO ROOM_PICTURE VALUES(24,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Radisson%20Resort%20Phan%20Thiet/346364914.jpg');

INSERT INTO ROOM_PICTURE VALUES(24,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Radisson%20Resort%20Phan%20Thiet/346364872.jpg');
INSERT INTO ROOM_PICTURE VALUES(24,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Radisson%20Resort%20Phan%20Thiet/346364848.jpg');
INSERT INTO ROOM_PICTURE VALUES(24,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Radisson%20Resort%20Phan%20Thiet/346364884.jpg');

--todo Kim Long Hotel
INSERT INTO ROOM_PICTURE VALUES(25,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Kim%20Long%20Hotel/483548892.jpg');
INSERT INTO ROOM_PICTURE VALUES(25,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Kim%20Long%20Hotel/483549380.jpg');
INSERT INTO ROOM_PICTURE VALUES(25,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Kim%20Long%20Hotel/483548586.jpg');

INSERT INTO ROOM_PICTURE VALUES(25,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Kim%20Long%20Hotel/483548446.jpg');
INSERT INTO ROOM_PICTURE VALUES(25,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Kim%20Long%20Hotel/468897445.jpg');
INSERT INTO ROOM_PICTURE VALUES(25,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Kim%20Long%20Hotel/468897439.jpg');

INSERT INTO ROOM_PICTURE VALUES(25,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Kim%20Long%20Hotel/468897446.jpg');
INSERT INTO ROOM_PICTURE VALUES(25,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Kim%20Long%20Hotel/468897403.jpg');
INSERT INTO ROOM_PICTURE VALUES(25,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Kim%20Long%20Hotel/468897424.jpg');

--todo Mui Ne Alena Hotel
INSERT INTO ROOM_PICTURE VALUES(26,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mui%20Ne%20Alena%20Hotel/243244834.jpg');
INSERT INTO ROOM_PICTURE VALUES(26,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mui%20Ne%20Alena%20Hotel/243045781.jpg');
INSERT INTO ROOM_PICTURE VALUES(26,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mui%20Ne%20Alena%20Hotel/236967178.jpg');

INSERT INTO ROOM_PICTURE VALUES(26,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mui%20Ne%20Alena%20Hotel/230761107.jpg');
INSERT INTO ROOM_PICTURE VALUES(26,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mui%20Ne%20Alena%20Hotel/188826512.jpg');
INSERT INTO ROOM_PICTURE VALUES(26,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mui%20Ne%20Alena%20Hotel/188814351.jpg');

INSERT INTO ROOM_PICTURE VALUES(26,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mui%20Ne%20Alena%20Hotel/187680867.jpg');
INSERT INTO ROOM_PICTURE VALUES(26,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mui%20Ne%20Alena%20Hotel/188815723.jpg');
INSERT INTO ROOM_PICTURE VALUES(26,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Mui%20Ne%20Alena%20Hotel/187678853.jpg');

--todo Wanderlust Hotel
INSERT INTO ROOM_PICTURE VALUES(27,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Wanderlust%20Hotel/480683786.jpg');
INSERT INTO ROOM_PICTURE VALUES(27,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Wanderlust%20Hotel/465910803.jpg');
INSERT INTO ROOM_PICTURE VALUES(27,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Wanderlust%20Hotel/465908882.jpg');

INSERT INTO ROOM_PICTURE VALUES(27,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Wanderlust%20Hotel/465909060.jpg');
INSERT INTO ROOM_PICTURE VALUES(27,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Wanderlust%20Hotel/465905787.jpg');
INSERT INTO ROOM_PICTURE VALUES(27,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Wanderlust%20Hotel/465908022.jpg');

INSERT INTO ROOM_PICTURE VALUES(27,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Wanderlust%20Hotel/465905770.jpg');
INSERT INTO ROOM_PICTURE VALUES(27,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Wanderlust%20Hotel/465904526.jpg');
INSERT INTO ROOM_PICTURE VALUES(27,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Wanderlust%20Hotel/465906980.jpg');

--todo Sea Night Hotel
INSERT INTO ROOM_PICTURE VALUES(28,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sea%20Night%20Hotel/334952939.jpg');
INSERT INTO ROOM_PICTURE VALUES(28,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sea%20Night%20Hotel/333131059.jpg');
INSERT INTO ROOM_PICTURE VALUES(28,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sea%20Night%20Hotel/334952933.jpg');

INSERT INTO ROOM_PICTURE VALUES(28,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sea%20Night%20Hotel/333131030.jpg');
INSERT INTO ROOM_PICTURE VALUES(28,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sea%20Night%20Hotel/333131025.jpg');
INSERT INTO ROOM_PICTURE VALUES(28,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sea%20Night%20Hotel/333131018.jpg');

INSERT INTO ROOM_PICTURE VALUES(28,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sea%20Night%20Hotel/333122531.jpg');
INSERT INTO ROOM_PICTURE VALUES(28,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sea%20Night%20Hotel/333130987.jpg');
INSERT INTO ROOM_PICTURE VALUES(28,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sea%20Night%20Hotel/333130990.jpg');

--todo EMERALD OCEAN HOTEL
INSERT INTO ROOM_PICTURE VALUES(29,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/EMERALD%20OCEAN%20HOTEL/427987584.jpg');
INSERT INTO ROOM_PICTURE VALUES(29,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/EMERALD%20OCEAN%20HOTEL/426295909.jpg');
INSERT INTO ROOM_PICTURE VALUES(29,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/EMERALD%20OCEAN%20HOTEL/426295239.jpg');

INSERT INTO ROOM_PICTURE VALUES(29,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/EMERALD%20OCEAN%20HOTEL/426295240.jpg');
INSERT INTO ROOM_PICTURE VALUES(29,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/EMERALD%20OCEAN%20HOTEL/243515557.jpg');
INSERT INTO ROOM_PICTURE VALUES(29,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/EMERALD%20OCEAN%20HOTEL/243510531.jpg');

INSERT INTO ROOM_PICTURE VALUES(29,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/EMERALD%20OCEAN%20HOTEL/243515499.jpg');
INSERT INTO ROOM_PICTURE VALUES(29,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/EMERALD%20OCEAN%20HOTEL/243506736.jpg');
INSERT INTO ROOM_PICTURE VALUES(29,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/EMERALD%20OCEAN%20HOTEL/243508993.jpg');

--todo TIFFANY HOTEL & RESTAURANT
INSERT INTO ROOM_PICTURE VALUES(30,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/TIFFANY%20HOTEL%20%26%20RESTAURANT/456597582.jpg');
INSERT INTO ROOM_PICTURE VALUES(30,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/TIFFANY%20HOTEL%20%26%20RESTAURANT/411699222.jpg');
INSERT INTO ROOM_PICTURE VALUES(30,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/TIFFANY%20HOTEL%20%26%20RESTAURANT/419558763.jpg');

INSERT INTO ROOM_PICTURE VALUES(30,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/TIFFANY%20HOTEL%20%26%20RESTAURANT/411699038.jpg');
INSERT INTO ROOM_PICTURE VALUES(30,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/TIFFANY%20HOTEL%20%26%20RESTAURANT/334801043.jpg');
INSERT INTO ROOM_PICTURE VALUES(30,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/TIFFANY%20HOTEL%20%26%20RESTAURANT/334801612.jpg');

INSERT INTO ROOM_PICTURE VALUES(30,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/TIFFANY%20HOTEL%20%26%20RESTAURANT/334497251.jpg');
INSERT INTO ROOM_PICTURE VALUES(30,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/TIFFANY%20HOTEL%20%26%20RESTAURANT/334497112.jpg');
INSERT INTO ROOM_PICTURE VALUES(30,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/TIFFANY%20HOTEL%20%26%20RESTAURANT/334801420.jpg');

--todo Long Life Riverside Hotel
INSERT INTO ROOM_PICTURE VALUES(31,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Long%20Life%20Riverside%20Hotel/155200125.jpg');
INSERT INTO ROOM_PICTURE VALUES(31,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Long%20Life%20Riverside%20Hotel/155200191.jpg');
INSERT INTO ROOM_PICTURE VALUES(31,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Long%20Life%20Riverside%20Hotel/160078659.jpg');

INSERT INTO ROOM_PICTURE VALUES(31,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Long%20Life%20Riverside%20Hotel/5520534.jpg');
INSERT INTO ROOM_PICTURE VALUES(31,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Long%20Life%20Riverside%20Hotel/117079636.jpg');
INSERT INTO ROOM_PICTURE VALUES(31,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Long%20Life%20Riverside%20Hotel/117079623.jpg');

INSERT INTO ROOM_PICTURE VALUES(31,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Long%20Life%20Riverside%20Hotel/155200012.jpg');
INSERT INTO ROOM_PICTURE VALUES(31,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Long%20Life%20Riverside%20Hotel/117362415.jpg');
INSERT INTO ROOM_PICTURE VALUES(31,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Long%20Life%20Riverside%20Hotel/117079681.jpg');

--todo Hoi An Dream City Hotel
INSERT INTO ROOM_PICTURE VALUES(32,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Dream%20City%20Hotel/122022493.jpg');
INSERT INTO ROOM_PICTURE VALUES(32,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Dream%20City%20Hotel/121432858.jpg');
INSERT INTO ROOM_PICTURE VALUES(32,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Dream%20City%20Hotel/121431967.jpg');

INSERT INTO ROOM_PICTURE VALUES(32,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Dream%20City%20Hotel/121431975.jpg');
INSERT INTO ROOM_PICTURE VALUES(32,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Dream%20City%20Hotel/120476906.jpg');
INSERT INTO ROOM_PICTURE VALUES(32,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Dream%20City%20Hotel/121431964.jpg');

INSERT INTO ROOM_PICTURE VALUES(32,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Dream%20City%20Hotel/120477181.jpg');
INSERT INTO ROOM_PICTURE VALUES(32,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Dream%20City%20Hotel/120477539.jpg');
INSERT INTO ROOM_PICTURE VALUES(32,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Dream%20City%20Hotel/120477487.jpg');

--todo Hoa My II Hotel
INSERT INTO ROOM_PICTURE VALUES(33,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoa%20My%20II%20Hotel/422433712.jpg');
INSERT INTO ROOM_PICTURE VALUES(33,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoa%20My%20II%20Hotel/422433699.jpg');
INSERT INTO ROOM_PICTURE VALUES(33,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoa%20My%20II%20Hotel/422433711.jpg');

INSERT INTO ROOM_PICTURE VALUES(33,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoa%20My%20II%20Hotel/422433675.jpg');
INSERT INTO ROOM_PICTURE VALUES(33,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoa%20My%20II%20Hotel/422433654.jpg');
INSERT INTO ROOM_PICTURE VALUES(33,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoa%20My%20II%20Hotel/422433672.jpg');

INSERT INTO ROOM_PICTURE VALUES(33,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoa%20My%20II%20Hotel/422433662.jpg');
INSERT INTO ROOM_PICTURE VALUES(33,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoa%20My%20II%20Hotel/422433652.jpg');
INSERT INTO ROOM_PICTURE VALUES(33,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoa%20My%20II%20Hotel/422433658.jpg');

--todo HOI AN HISTORIC HOTEL
INSERT INTO ROOM_PICTURE VALUES(34,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HOI%20AN%20HISTORIC%20HOTEL/429303109.jpg');
INSERT INTO ROOM_PICTURE VALUES(34,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HOI%20AN%20HISTORIC%20HOTEL/429303086.jpg');
INSERT INTO ROOM_PICTURE VALUES(34,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HOI%20AN%20HISTORIC%20HOTEL/429303020.jpg');

INSERT INTO ROOM_PICTURE VALUES(34,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HOI%20AN%20HISTORIC%20HOTEL/429302941.jpg');
INSERT INTO ROOM_PICTURE VALUES(34,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HOI%20AN%20HISTORIC%20HOTEL/429302887.jpg');
INSERT INTO ROOM_PICTURE VALUES(34,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HOI%20AN%20HISTORIC%20HOTEL/429302902.jpg');

INSERT INTO ROOM_PICTURE VALUES(34,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HOI%20AN%20HISTORIC%20HOTEL/429302775.jpg');
INSERT INTO ROOM_PICTURE VALUES(34,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HOI%20AN%20HISTORIC%20HOTEL/429302869.jpg');
INSERT INTO ROOM_PICTURE VALUES(34,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HOI%20AN%20HISTORIC%20HOTEL/429302737.jpg');

--todo HY Local Budget Hotel
INSERT INTO ROOM_PICTURE VALUES(35,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HY%20Local%20Budget%20Hotel/405764810.jpg');
INSERT INTO ROOM_PICTURE VALUES(35,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HY%20Local%20Budget%20Hotel/400958465.jpg');
INSERT INTO ROOM_PICTURE VALUES(35,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HY%20Local%20Budget%20Hotel/381307242.jpg');

INSERT INTO ROOM_PICTURE VALUES(35,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HY%20Local%20Budget%20Hotel/381323364.jpg');
INSERT INTO ROOM_PICTURE VALUES(35,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HY%20Local%20Budget%20Hotel/336597848.jpg');
INSERT INTO ROOM_PICTURE VALUES(35,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HY%20Local%20Budget%20Hotel/336592668.jpg');

INSERT INTO ROOM_PICTURE VALUES(35,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HY%20Local%20Budget%20Hotel/336597270.jpg');
INSERT INTO ROOM_PICTURE VALUES(35,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HY%20Local%20Budget%20Hotel/336597272.jpg');
INSERT INTO ROOM_PICTURE VALUES(35,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HY%20Local%20Budget%20Hotel/336592669.jpg');

--todo Golden River Hotel
INSERT INTO ROOM_PICTURE VALUES(36,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Golden%20River%20Hotel/239904008.jpg');
INSERT INTO ROOM_PICTURE VALUES(36,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Golden%20River%20Hotel/244893021.jpg');
INSERT INTO ROOM_PICTURE VALUES(36,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Golden%20River%20Hotel/242821919.jpg');

INSERT INTO ROOM_PICTURE VALUES(36,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Golden%20River%20Hotel/239904639.jpg');
INSERT INTO ROOM_PICTURE VALUES(36,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Golden%20River%20Hotel/239901536.jpg');
INSERT INTO ROOM_PICTURE VALUES(36,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Golden%20River%20Hotel/239903570.jpg');

INSERT INTO ROOM_PICTURE VALUES(36,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Golden%20River%20Hotel/239901364.jpg');
INSERT INTO ROOM_PICTURE VALUES(36,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Golden%20River%20Hotel/239895254.jpg');
INSERT INTO ROOM_PICTURE VALUES(36,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Golden%20River%20Hotel/239870611.jpg');

--todo Hoi An Pho Library Hotel
INSERT INTO ROOM_PICTURE VALUES(37,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Pho%20Library%20Hotel/64559435.jpg');
INSERT INTO ROOM_PICTURE VALUES(37,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Pho%20Library%20Hotel/361461271.jpg');
INSERT INTO ROOM_PICTURE VALUES(37,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Pho%20Library%20Hotel/133769358.jpg');

INSERT INTO ROOM_PICTURE VALUES(37,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Pho%20Library%20Hotel/218271547.jpg');
INSERT INTO ROOM_PICTURE VALUES(37,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Pho%20Library%20Hotel/218271702.jpg');
INSERT INTO ROOM_PICTURE VALUES(37,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Pho%20Library%20Hotel/218264257.jpg');

INSERT INTO ROOM_PICTURE VALUES(37,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Pho%20Library%20Hotel/133759042.jpg');
INSERT INTO ROOM_PICTURE VALUES(37,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Pho%20Library%20Hotel/218271693.jpg');
INSERT INTO ROOM_PICTURE VALUES(37,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Hoi%20An%20Pho%20Library%20Hotel/218271548.jpg');

--todo Uptown Hoi An Hotel
INSERT INTO ROOM_PICTURE VALUES(38,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Uptown%20Hoi%20An%20Hotel/211627915.jpg');
INSERT INTO ROOM_PICTURE VALUES(38,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Uptown%20Hoi%20An%20Hotel/209587599.jpg');
INSERT INTO ROOM_PICTURE VALUES(38,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Uptown%20Hoi%20An%20Hotel/218594100.jpg');

INSERT INTO ROOM_PICTURE VALUES(38,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Uptown%20Hoi%20An%20Hotel/209587596.jpg');
INSERT INTO ROOM_PICTURE VALUES(38,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Uptown%20Hoi%20An%20Hotel/209587201.jpg');
INSERT INTO ROOM_PICTURE VALUES(38,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Uptown%20Hoi%20An%20Hotel/209587378.jpg');

INSERT INTO ROOM_PICTURE VALUES(38,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Uptown%20Hoi%20An%20Hotel/209587594.jpg');
INSERT INTO ROOM_PICTURE VALUES(38,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Uptown%20Hoi%20An%20Hotel/209587587.jpg');
INSERT INTO ROOM_PICTURE VALUES(38,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Uptown%20Hoi%20An%20Hotel/209587585.jpg');

--todo Thanh Binh Central Hotel
INSERT INTO ROOM_PICTURE VALUES(39,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Binh%20Central%20Hotel/270888964.jpg');
INSERT INTO ROOM_PICTURE VALUES(39,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Binh%20Central%20Hotel/270888961.jpg');
INSERT INTO ROOM_PICTURE VALUES(39,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Binh%20Central%20Hotel/246386249.jpg');

INSERT INTO ROOM_PICTURE VALUES(39,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Binh%20Central%20Hotel/246386236.jpg');
INSERT INTO ROOM_PICTURE VALUES(39,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Binh%20Central%20Hotel/243079829.jpg');
INSERT INTO ROOM_PICTURE VALUES(39,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Binh%20Central%20Hotel/243071742.jpg');

INSERT INTO ROOM_PICTURE VALUES(39,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Binh%20Central%20Hotel/243070437.jpg');
INSERT INTO ROOM_PICTURE VALUES(39,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Binh%20Central%20Hotel/243071717.jpg');
INSERT INTO ROOM_PICTURE VALUES(39,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Binh%20Central%20Hotel/243071156.jpg');

--todo Thanh Van 1 Hotel
INSERT INTO ROOM_PICTURE VALUES(40,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Van%201%20Hotel/45059835.jpg');
INSERT INTO ROOM_PICTURE VALUES(40,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Van%201%20Hotel/45059864.jpg');
INSERT INTO ROOM_PICTURE VALUES(40,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Van%201%20Hotel/45059832.jpg');

INSERT INTO ROOM_PICTURE VALUES(40,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Van%201%20Hotel/45059827.jpg');
INSERT INTO ROOM_PICTURE VALUES(40,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Van%201%20Hotel/45059826.jpg');
INSERT INTO ROOM_PICTURE VALUES(40,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Van%201%20Hotel/45059758.jpg');

INSERT INTO ROOM_PICTURE VALUES(40,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Van%201%20Hotel/45059801.jpg');
INSERT INTO ROOM_PICTURE VALUES(40,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Van%201%20Hotel/45059792.jpg');
INSERT INTO ROOM_PICTURE VALUES(40,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Thanh%20Van%201%20Hotel/45059761.jpg');

--todo Đà Lạt Thanh Xuân Hotel
INSERT INTO ROOM_PICTURE VALUES(41,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/479066255.jpg');
INSERT INTO ROOM_PICTURE VALUES(41,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/463982739.jpg');
INSERT INTO ROOM_PICTURE VALUES(41,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/456940292.jpg');

INSERT INTO ROOM_PICTURE VALUES(41,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/463983476.jpg');
INSERT INTO ROOM_PICTURE VALUES(41,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/456940288.jpg');
INSERT INTO ROOM_PICTURE VALUES(41,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/456940290.jpg');

INSERT INTO ROOM_PICTURE VALUES(41,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/456940281.jpg');
INSERT INTO ROOM_PICTURE VALUES(41,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/456940281.jpg');
INSERT INTO ROOM_PICTURE VALUES(41,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90a%CC%80%20La%CC%A3t%20Thanh%20Xu%C3%A2n%20Hotel/456940283.jpg');

--todo Minh Phú 2 Hotel		
INSERT INTO ROOM_PICTURE VALUES(42,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Minh%20Ph%C3%BA%202%20Hotel/486470565.jpg');
INSERT INTO ROOM_PICTURE VALUES(42,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Minh%20Ph%C3%BA%202%20Hotel/486470631.jpg');
INSERT INTO ROOM_PICTURE VALUES(42,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Minh%20Ph%C3%BA%202%20Hotel/487331477.jpg');

INSERT INTO ROOM_PICTURE VALUES(42,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Minh%20Ph%C3%BA%202%20Hotel/486470082.jpg');
INSERT INTO ROOM_PICTURE VALUES(42,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Minh%20Ph%C3%BA%202%20Hotel/483917499.jpg');
INSERT INTO ROOM_PICTURE VALUES(42,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Minh%20Ph%C3%BA%202%20Hotel/486272578.jpg');

INSERT INTO ROOM_PICTURE VALUES(42,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Minh%20Ph%C3%BA%202%20Hotel/486470180.jpg');
INSERT INTO ROOM_PICTURE VALUES(42,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Minh%20Ph%C3%BA%202%20Hotel/486272574.jpg');
INSERT INTO ROOM_PICTURE VALUES(42,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Minh%20Ph%C3%BA%202%20Hotel/486272558.jpg');

--todo Torino Hotel Dalat
INSERT INTO ROOM_PICTURE VALUES(43,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Torino%20Hotel%20Dalat/474307896.jpg');
INSERT INTO ROOM_PICTURE VALUES(43,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Torino%20Hotel%20Dalat/474298677.jpg');
INSERT INTO ROOM_PICTURE VALUES(43,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Torino%20Hotel%20Dalat/474298667.jpg');

INSERT INTO ROOM_PICTURE VALUES(43,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Torino%20Hotel%20Dalat/474305730.jpg');
INSERT INTO ROOM_PICTURE VALUES(43,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Torino%20Hotel%20Dalat/474296986.jpg');
INSERT INTO ROOM_PICTURE VALUES(43,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Torino%20Hotel%20Dalat/474297037.jpg');

INSERT INTO ROOM_PICTURE VALUES(43,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Torino%20Hotel%20Dalat/471041099.jpg');
INSERT INTO ROOM_PICTURE VALUES(43,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Torino%20Hotel%20Dalat/474295523.jpg');
INSERT INTO ROOM_PICTURE VALUES(43,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Torino%20Hotel%20Dalat/471041030.jpg');

--todo HouseChill Dalat Hotel
INSERT INTO ROOM_PICTURE VALUES(44,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HouseChill%20Dalat%20Hotel/481511046.jpg');
INSERT INTO ROOM_PICTURE VALUES(44,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HouseChill%20Dalat%20Hotel/481510906.jpg');
INSERT INTO ROOM_PICTURE VALUES(44,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HouseChill%20Dalat%20Hotel/481510898.jpg');

INSERT INTO ROOM_PICTURE VALUES(44,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HouseChill%20Dalat%20Hotel/481510352.jpg');
INSERT INTO ROOM_PICTURE VALUES(44,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HouseChill%20Dalat%20Hotel/481509555.jpg');
INSERT INTO ROOM_PICTURE VALUES(44,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HouseChill%20Dalat%20Hotel/481509558.jpg');

INSERT INTO ROOM_PICTURE VALUES(44,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HouseChill%20Dalat%20Hotel/481508792.jpg');
INSERT INTO ROOM_PICTURE VALUES(44,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HouseChill%20Dalat%20Hotel/481509485.jpg');
INSERT INTO ROOM_PICTURE VALUES(44,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/HouseChill%20Dalat%20Hotel/481509493.jpg');

--todo Dalat Wind Hotel
INSERT INTO ROOM_PICTURE VALUES(45,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Dalat%20Wind%20Hotel/402606970.jpg');
INSERT INTO ROOM_PICTURE VALUES(45,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Dalat%20Wind%20Hotel/481239795.jpg');
INSERT INTO ROOM_PICTURE VALUES(45,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Dalat%20Wind%20Hotel/449510419.jpg');

INSERT INTO ROOM_PICTURE VALUES(45,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Dalat%20Wind%20Hotel/402607942.jpg');
INSERT INTO ROOM_PICTURE VALUES(45,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Dalat%20Wind%20Hotel/402606316.jpg');
INSERT INTO ROOM_PICTURE VALUES(45,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Dalat%20Wind%20Hotel/402605836.jpg');

INSERT INTO ROOM_PICTURE VALUES(45,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Dalat%20Wind%20Hotel/402605759.jpg');
INSERT INTO ROOM_PICTURE VALUES(45,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Dalat%20Wind%20Hotel/402605354.jpg');
INSERT INTO ROOM_PICTURE VALUES(45,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Dalat%20Wind%20Hotel/402605742.jpg');

--todo Vuon Xuan Hotel
INSERT INTO ROOM_PICTURE VALUES(46,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Vuon%20Xuan%20Hotel/408981593.jpg');
INSERT INTO ROOM_PICTURE VALUES(46,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Vuon%20Xuan%20Hotel/408981268.jpg');
INSERT INTO ROOM_PICTURE VALUES(46,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Vuon%20Xuan%20Hotel/408981600.jpg');

INSERT INTO ROOM_PICTURE VALUES(46,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Vuon%20Xuan%20Hotel/408976032.jpg');
INSERT INTO ROOM_PICTURE VALUES(46,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Vuon%20Xuan%20Hotel/408981265.jpg');
INSERT INTO ROOM_PICTURE VALUES(46,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Vuon%20Xuan%20Hotel/408976035.jpg');

INSERT INTO ROOM_PICTURE VALUES(46,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Vuon%20Xuan%20Hotel/408976021.jpg');
INSERT INTO ROOM_PICTURE VALUES(46,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Vuon%20Xuan%20Hotel/408976898.jpg');
INSERT INTO ROOM_PICTURE VALUES(46,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Vuon%20Xuan%20Hotel/408976426.jpg');

--todo Sunset Hill Dalat
INSERT INTO ROOM_PICTURE VALUES(47,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sunset%20Hill%20Dalat/480342705.jpg');
INSERT INTO ROOM_PICTURE VALUES(47,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sunset%20Hill%20Dalat/478157957.jpg');
INSERT INTO ROOM_PICTURE VALUES(47,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sunset%20Hill%20Dalat/478157975.jpg');

INSERT INTO ROOM_PICTURE VALUES(47,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sunset%20Hill%20Dalat/478157911.jpg');
INSERT INTO ROOM_PICTURE VALUES(47,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sunset%20Hill%20Dalat/478157878.jpg');
INSERT INTO ROOM_PICTURE VALUES(47,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sunset%20Hill%20Dalat/478157910.jpg');

INSERT INTO ROOM_PICTURE VALUES(47,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sunset%20Hill%20Dalat/478157876.jpg');
INSERT INTO ROOM_PICTURE VALUES(47,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sunset%20Hill%20Dalat/478157783.jpg');
INSERT INTO ROOM_PICTURE VALUES(47,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Sunset%20Hill%20Dalat/478157888.jpg');

--todo AN Boutique Hotel
INSERT INTO ROOM_PICTURE VALUES(48,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/AN%20Boutique%20Hotel/430679432.jpg');
INSERT INTO ROOM_PICTURE VALUES(48,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/AN%20Boutique%20Hotel/430679813.jpg');
INSERT INTO ROOM_PICTURE VALUES(48,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/AN%20Boutique%20Hotel/430676760.jpg');

INSERT INTO ROOM_PICTURE VALUES(48,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/AN%20Boutique%20Hotel/429887683.jpg');
INSERT INTO ROOM_PICTURE VALUES(48,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/AN%20Boutique%20Hotel/429806403.jpg');
INSERT INTO ROOM_PICTURE VALUES(48,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/AN%20Boutique%20Hotel/429887653.jpg');

INSERT INTO ROOM_PICTURE VALUES(48,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/AN%20Boutique%20Hotel/429806405.jpg');
INSERT INTO ROOM_PICTURE VALUES(48,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/AN%20Boutique%20Hotel/429887656.jpg');
INSERT INTO ROOM_PICTURE VALUES(48,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/AN%20Boutique%20Hotel/428733700.jpg');

--todo Đảo Hoa Dalat Hotel
INSERT INTO ROOM_PICTURE VALUES(49,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90%E1%BA%A3o%20Hoa%20Dalat%20Hotel/487048142.jpg');
INSERT INTO ROOM_PICTURE VALUES(49,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90%E1%BA%A3o%20Hoa%20Dalat%20Hotel/487048285.jpg');
INSERT INTO ROOM_PICTURE VALUES(49,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90%E1%BA%A3o%20Hoa%20Dalat%20Hotel/487048193.jpg');

INSERT INTO ROOM_PICTURE VALUES(49,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90%E1%BA%A3o%20Hoa%20Dalat%20Hotel/487048118.jpg');
INSERT INTO ROOM_PICTURE VALUES(49,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90%E1%BA%A3o%20Hoa%20Dalat%20Hotel/487048114.jpg');
INSERT INTO ROOM_PICTURE VALUES(49,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90%E1%BA%A3o%20Hoa%20Dalat%20Hotel/487048097.jpg');

INSERT INTO ROOM_PICTURE VALUES(49,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90%E1%BA%A3o%20Hoa%20Dalat%20Hotel/487047698.jpg');
INSERT INTO ROOM_PICTURE VALUES(49,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90%E1%BA%A3o%20Hoa%20Dalat%20Hotel/487048117.jpg');
INSERT INTO ROOM_PICTURE VALUES(49,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/%C4%90%E1%BA%A3o%20Hoa%20Dalat%20Hotel/487048056.jpg');

--todo Hạ Na Hotel Đà Lạt
INSERT INTO ROOM_PICTURE VALUES(50,1,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/H%E1%BA%A1%20Na%20Hotel%20%C4%90%C3%A0%20L%E1%BA%A1t/456112321.jpg');
INSERT INTO ROOM_PICTURE VALUES(50,1,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/H%E1%BA%A1%20Na%20Hotel%20%C4%90%C3%A0%20L%E1%BA%A1t/456114903.jpg');
INSERT INTO ROOM_PICTURE VALUES(50,1,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/H%E1%BA%A1%20Na%20Hotel%20%C4%90%C3%A0%20L%E1%BA%A1t/456112318.jpg');

INSERT INTO ROOM_PICTURE VALUES(50,2,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/H%E1%BA%A1%20Na%20Hotel%20%C4%90%C3%A0%20L%E1%BA%A1t/456118711.jpg');
INSERT INTO ROOM_PICTURE VALUES(50,2,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/H%E1%BA%A1%20Na%20Hotel%20%C4%90%C3%A0%20L%E1%BA%A1t/456103398.jpg');
INSERT INTO ROOM_PICTURE VALUES(50,2,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/H%E1%BA%A1%20Na%20Hotel%20%C4%90%C3%A0%20L%E1%BA%A1t/456112273.jpg');

INSERT INTO ROOM_PICTURE VALUES(50,3,1,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/H%E1%BA%A1%20Na%20Hotel%20%C4%90%C3%A0%20L%E1%BA%A1t/456099174.jpg');
INSERT INTO ROOM_PICTURE VALUES(50,3,2,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/H%E1%BA%A1%20Na%20Hotel%20%C4%90%C3%A0%20L%E1%BA%A1t/346439681.jpg');
INSERT INTO ROOM_PICTURE VALUES(50,3,3,'https://eleinvar.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/H%E1%BA%A1%20Na%20Hotel%20%C4%90%C3%A0%20L%E1%BA%A1t/456098428.jpg');


INSERT INTO PERSONAL_DETAILS (AccountId, FullName, EmailAddress, PhoneNumber, DateOfBirth, Gender, Image, Rank) VALUES
(1, N'Lý Văn Đạt', 'lydat@gmail.com', 'default', '2002-01-01', 'Male', 'https://rialloer.sirv.com/Sunrise-Continent/Users/focalos.png', 'Bronze'),
(2, N'Phan Phúc Đạt', 'pdat@gmail.com', 'default', '2002-01-01', 'Male', 'https://rialloer.sirv.com/Sunrise-Continent/Users/focalos.png', 'Bronze'),
(3, N'Cường Phạm', 'cuong457@gmail.com', 'default', '2002-01-01', 'Male', 'https://rialloer.sirv.com/Sunrise-Continent/Users/focalos.png', 'Bronze'),
(4, N'Cường Phạm', 'hahaha@gmail.com', 'default', '2002-01-01', 'Male', 'https://rialloer.sirv.com/Sunrise-Continent/Users/focalos.png', 'Bronze'),
(5, N'Lý Văn Đạt', 'lydatadmin@gmail.com', 'default', '2002-01-01', 'Male', 'https://rialloer.sirv.com/Sunrise-Continent/Users/focalos.png', 'Bronze'),
(6, N'Phạm Nguyễn Cao Cường', 'cuong@gmail.com', 'default', '2002-01-01', 'Male', 'https://rialloer.sirv.com/Sunrise-Continent/Users/focalos.png', 'Bronze'),
(7, N'Phan Phúc Đạt', 'phucdat4102@gmail.com', 'default', '2002-01-01', 'Male', 'https://rialloer.sirv.com/Sunrise-Continent/Users/focalos.png', 'Diamond'),
(8, N'Đạt Phan Phúc', 'bluehairmylove2014@gmail.com', 'default', '2002-01-01', 'Male', 'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', 'Bronze'),
(9, N'Phan Hùng Thịnh', 'jacksonashley@yahoo.com', '0339730305', '2005-06-02', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(10, N'Phạm Xuân Hương', 'ryan98@gmail.com', '0979807224', '1969-01-02', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(11, N'Trương Khúc Lan', 'antoniodaniels@hotmail.com', '0961835426', '1988-07-10', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(12, N'Hoàng Võ Cao Phong', 'krobinson@hotmail.com', '0933769841', '1964-04-26', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(13, N'Phạm Đỗ Phương Ngọc', 'elliottrichard@hotmail.com', '0394099544', '1975-07-11', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(14, N'Đặng Cát Uy', 'jeffery97@hotmail.com', '0384942175', '1964-02-24', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(15, N'Trần Huỳnh Tấn Lợi', 'taylorkidd@yahoo.com', '0328497030', '1993-05-16', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(16, N'Đinh Võ Khánh Bình', 'john73@gmail.com', '0852579321', '1985-07-18', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(17, N'Huỳnh Võ Thu Hường', 'nicholas73@hotmail.com', '0397377727', '1997-06-23', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(18, N'Lê Linh Ðan', 'jeffreygarcia@gmail.com', '0386668176', '1996-09-11', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(19, N'Đỗ Hoàng Khắc Minh', 'elliottkatherine@gmail.com', '0914260618', '1986-03-03', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(20, N'Lê Đỗ Ngân Trúc', 'pamela34@hotmail.com', '0391184060', '1996-02-26', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(21, N'Đinh Thái Vân', 'lopezkelly@yahoo.com', '0983621802', '2000-06-23', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(22, N'Trương Hồ Bá Lộc', 'gilbertsteven@hotmail.com', '0853455934', '1999-07-20', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(23, N'Dương Gia Bình', 'susan18@yahoo.com', '0902179030', '1992-10-23', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(24, N'Ngô Vũ Việt Hải', 'rebeccaoliver@hotmail.com', '0907549428', '1980-10-13', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(25, N'Võ Huỳnh Thúy Vy', 'gregorymeghan@yahoo.com', '0949795324', '1994-06-30', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(26, N'Trương Lê Phi Nhung', 'moralesjonathan@hotmail.com', '0862969187', '1982-09-22', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(27, N'Phan Dương Linh Giang', 'stacy20@yahoo.com', '0945311976', '2002-08-17', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(28, N'Trương Như Bảo', 'houstonnicole@yahoo.com', '0935630185', '2000-12-14', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(29, N'Trần Quốc Huy', 'robert31@yahoo.com', '0941856365', '1992-11-11', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(30, N'Dương Huỳnh Trúc Linh', 'christian66@gmail.com', '0939041337', '2003-03-14', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(31, N'Lê Hồng Hà', 'hgarrett@yahoo.com', '0945779517', '1979-11-16', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(32, N'Dương Hải Ðăng', 'cynthia34@hotmail.com', '0978426483', '1992-05-23', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(33, N'Đỗ Quang Khải', 'michellelloyd@gmail.com', '0369951919', '1984-10-17', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(34, N'Hoàng Nguyễn Linh Phượng', 'wstewart@yahoo.com', '0842644248', '1973-06-24', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(35, N'Trần Dương Hồng Ngân', 'payneangela@yahoo.com', '0865757140', '1991-08-05', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(36, N'Đinh Lê Thanh Nhã', 'lramirez@gmail.com', '0348043287', '1991-04-17', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(37, N'Hoàng Huỳnh Thiên Phương', 'rogersanne@hotmail.com', '0907746638', '1966-01-15', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(38, N'Huỳnh Hồ Bảo Quốc', 'ghowell@hotmail.com', '0912193895', '1991-08-16', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(39, N'Phạm Dương Thanh Ngọc', 'hilljohn@hotmail.com', '0349343295', '1989-07-31', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(40, N'Vũ Ðức Chính', 'beardrichard@gmail.com', '0913883526', '1993-12-16', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(41, N'Đặng Trúc Lâm', 'daniel01@yahoo.com', '0842474045', '1996-12-29', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(42, N'Trương Hải Bình', 'karen63@hotmail.com', '0342003506', '1995-07-17', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(43, N'Phạm Trương Hoàng Oanh', 'eric68@yahoo.com', '0987212456', '1991-04-12', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(44, N'Hoàng Hữu Tân', 'cmendoza@gmail.com', '0986026121', '1969-05-19', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(45, N'Hoàng Kiều Mỹ', 'brian79@yahoo.com', '0335360186', '1962-12-07', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(46, N'Vũ Mai Vy', 'alexandra94@hotmail.com', '0326894561', '1978-12-04', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(47, N'Võ Phạm Mỹ Trang', 'teresa05@yahoo.com', '0905837245', '1988-07-29', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(48, N'Huỳnh Vũ Trung Nhân', 'pamelahester@hotmail.com', '0935358861', '1996-02-11', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(49, N'Ngô Võ Tuyết Hồng', 'zimmermanjames@hotmail.com', '0372758616', '1975-01-07', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(50, N'Trần Hồ Mộng Tuyền', 'corey30@gmail.com', '0322154614', '1986-03-29', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(51, N'Đinh Phạm Lưu Ly', 'lmorris@hotmail.com', '0842066934', '1971-12-21', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(52, N'Phan Hoàng Thanh Hậu', 'stanleynicole@yahoo.com', '0832408182', '1962-12-14', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(53, N'Ngô Thùy Mi', 'umartinez@hotmail.com', '0939576806', '2002-01-26', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(54, N'Ngô Thế Tường', 'tina11@hotmail.com', '0903210231', '1975-06-21', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(55, N'Đỗ Phạm Thúy Phượng', 'hortonmary@gmail.com', '0917734296', '1991-05-02', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(56, N'Ngô Hoàng Thảo Vân', 'santosdebbie@gmail.com', '0854400396', '1986-01-20', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(57, N'Hoàng Đặng Thái Sang', 'cynthia09@yahoo.com', '0931222236', '1978-05-19', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(58, N'Huỳnh Đỗ Công Tuấn', 'ewolf@yahoo.com', '0918506997', '1989-01-07', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(59, N'Đinh Lê Thảo Linh', 'medinaelizabeth@gmail.com', '0363685005', '1964-07-26', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(60, N'Đinh Đặng Hồng Khanh', 'nicholas41@gmail.com', '0397210605', '2003-05-25', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(61, N'Phạm Thúy Vy', 'fduran@hotmail.com', '0964172342', '1999-12-13', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(62, N'Đặng Thanh Thư', 'davisjack@yahoo.com', '0841725864', '1992-12-10', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(63, N'Vũ Quế Anh', 'charles14@yahoo.com', '0323273169', '2003-10-24', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(64, N'Vũ Huỳnh Minh An', 'pacerebecca@gmail.com', '0843845957', '1999-10-05', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(65, N'Võ Minh Uyên', 'herreracarrie@hotmail.com', '0395381602', '1966-04-02', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(66, N'Lê Hồ Việt Trinh', 'ochurch@hotmail.com', '0837456482', '1992-06-29', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(67, N'Trần Xuân Trung', 'xmartinez@gmail.com', '0941276499', '1996-10-29', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(68, N'Đinh Thuận Thành', 'steven01@gmail.com', '0963988145', '1989-06-11', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(69, N'Đặng Nguyễn Kim Loan', 'maldonadovalerie@hotmail.com', '0832538374', '1971-04-07', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(70, N'Trần Hồng Phúc', 'isanchez@hotmail.com', '0919413976', '1993-06-18', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(71, N'Vũ Ngọc Quỳnh', 'philip51@yahoo.com', '0356240845', '1991-08-16', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(72, N'Phạm Tuyết Băng', 'brownalan@hotmail.com', '0984856598', '1980-02-14', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(73, N'Huỳnh Hoàng Bình Ðạt', 'nroberson@yahoo.com', '0378632167', '1980-06-10', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(74, N'Lê Hồ Đan Linh', 'johndurham@gmail.com', '0918538083', '1974-03-04', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(75, N'Lê Trọng Tấn', 'colinowen@hotmail.com', '0342943005', '1980-10-03', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(76, N'Trương Tất Hòa', 'kjames@yahoo.com', '0336885450', '1967-01-25', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(77, N'Trương Phạm Phương Tâm', 'priley@gmail.com', '0934418285', '2005-01-21', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(78, N'Ngô Dương Kiều Anh', 'smartin@yahoo.com', '0395959227', '1980-07-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(79, N'Vũ Hồ Cao Nghiệp', 'juannelson@gmail.com', '0853880849', '1970-02-17', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(80, N'Dương Phạm Chiêu Quân', 'carlrobinson@hotmail.com', '0839000271', '2002-05-04', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(81, N'Phan Đỗ Vy Lan', 'sloanjamie@yahoo.com', '0863046650', '1998-01-15', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(82, N'Trương Phạm Ðức Khiêm', 'jefferyrobinson@hotmail.com', '0371919471', '1979-06-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(83, N'Đỗ Xuân Hiếu', 'thompsonrobert@gmail.com', '0976076712', '2000-08-15', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(84, N'Đỗ Hồng Vinh', 'mcbridebrittany@hotmail.com', '0382864491', '2000-11-25', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(85, N'Vũ Trần Hải Vân', 'alexpaul@yahoo.com', '0399873054', '1990-04-14', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(86, N'Trương Đỗ Trúc Lâm', 'gonzalezsarah@gmail.com', '0384979239', '1975-02-01', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(87, N'Dương Thục Tâm', 'austingibson@yahoo.com', '0348964628', '1987-01-20', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(88, N'Trần Trần Thái Hồng', 'alicia46@gmail.com', '0916409169', '1975-03-11', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(89, N'Hoàng Hồ Kim Long', 'vtaylor@gmail.com', '0371480627', '1963-06-29', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(90, N'Đặng Hồ Lâm Tuyền', 'fhill@gmail.com', '0381496214', '1987-11-04', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(91, N'Đặng Gia Hùng', 'swilson@hotmail.com', '0345391973', '2005-05-20', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(92, N'Huỳnh Đỗ Duy Hùng', 'morrisjason@yahoo.com', '0854279406', '1982-12-30', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(93, N'Võ Trọng Kiên', 'lauren63@yahoo.com', '0381556799', '1997-06-08', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(94, N'Phạm Hoàng Việt Anh', 'mejiaclaudia@yahoo.com', '0322446184', '1981-06-05', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(95, N'Nguyễn Ngô Phương Giang', 'oharris@yahoo.com', '0356777716', '1997-08-17', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(96, N'Lê Khánh Vi', 'awilson@hotmail.com', '0343380444', '1965-02-08', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(97, N'Ngô Đặng Duy Hùng', 'lauraevans@gmail.com', '0358774839', '1977-09-21', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(98, N'Ngô Khải Ca', 'uhoffman@yahoo.com', '0362754100', '1999-11-29', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(99, N'Ngô Từ Ðông', 'bonniegriffin@yahoo.com', '0915199568', '1996-09-13', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(100, N'Hoàng Thúy Vi', 'branchheidi@gmail.com', '0913590369', '1965-05-24', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(101, N'Phạm Quang Hữu', 'ladkins@gmail.com', '0394556466', '1970-04-10', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(102, N'Đinh Thu Phương', 'christophercarter@hotmail.com', '0358652937', '1992-06-16', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(103, N'Huỳnh Ðức Thành', 'bramos@hotmail.com', '0376596632', '1976-06-22', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(104, N'Đặng Quốc Hoàn', 'ysmith@gmail.com', '0918087136', '1982-01-03', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(105, N'Đặng Khánh Ngọc', 'howellmarcus@hotmail.com', '0343448889', '1966-10-09', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(106, N'Nguyễn Hữu Tài', 'brownpaul@gmail.com', '0941172021', '1985-12-02', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(107, N'Nguyễn Ngọc Khương', 'imoore@gmail.com', '0337551202', '1993-05-21', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(108, N'Trần Phan Thiên Trí', 'cross@hotmail.com', '0964029571', '1999-12-29', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(109, N'Đỗ Đặng Thúy Phượng', 'sharon47@hotmail.com', '0981414473', '1983-06-19', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(110, N'Lê Ngọc Lệ', 'qobrien@hotmail.com', '0385494971', '1991-02-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(111, N'Hoàng Vũ Huyền Nhi', 'sylviagarza@hotmail.com', '0979044198', '2001-09-11', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(112, N'Nguyễn Đặng Diệu Ái', 'alison61@yahoo.com', '0842468390', '1992-01-21', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(113, N'Phan Hoàng Trí Hùng', 'judithwu@hotmail.com', '0986192753', '1976-02-09', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(114, N'Phạm Trương Thanh Vy', 'lmoore@hotmail.com', '0939470064', '1985-11-26', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(115, N'Đỗ Huỳnh Ngọc Quyết', 'rrobinson@gmail.com', '0986515663', '1968-08-18', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(116, N'Ngô Thúy Hạnh', 'clayton59@yahoo.com', '0345075746', '2001-06-07', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(117, N'Lê Võ Mộng Tuyền', 'shane83@yahoo.com', '0855192957', '1968-01-13', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(118, N'Phạm Hữu Trác', 'snyderlinda@hotmail.com', '0907015329', '1982-05-08', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(119, N'Hoàng Huỳnh Ðình Toàn', 'calexander@hotmail.com', '0325049303', '2004-05-02', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(120, N'Hồ Đỗ Anh Minh', 'rochaamanda@hotmail.com', '0392267928', '1964-05-08', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(121, N'Huỳnh Lâm Uyên', 'yrodriguez@hotmail.com', '0833651344', '1966-04-12', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(122, N'Đỗ Thanh Vân', 'sowens@gmail.com', '0326013414', '1985-05-11', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(123, N'Phan Bích Thu', 'brownjose@yahoo.com', '0863577876', '1971-01-08', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(124, N'Lê Thanh Quang', 'seth67@gmail.com', '0849419308', '1993-07-10', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(125, N'Hồ Bảo Lan', 'kelsey86@gmail.com', '0948960647', '1972-02-29', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(126, N'Trần Đinh Hồng Thư', 'jgallagher@yahoo.com', '0354795097', '2000-01-21', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(127, N'Đặng Quốc Trường', 'vbrown@yahoo.com', '0859446052', '1984-11-03', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(128, N'Ngô Hồ Bội Linh', 'johnosborne@yahoo.com', '0364166812', '1996-11-12', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(129, N'Dương Bích San', 'smithdavid@yahoo.com', '0356542404', '2004-09-02', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(130, N'Đinh Lê Tịnh Lâm', 'kathleen61@gmail.com', '0839715189', '1966-07-02', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(131, N'Hồ Khánh Hà', 'jeremy38@gmail.com', '0839908747', '1975-04-29', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(132, N'Vũ Tiến Hoạt', 'ztaylor@yahoo.com', '0343242051', '1970-03-19', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(133, N'Phan Minh Tú', 'patricia91@hotmail.com', '0843061632', '2003-02-09', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(134, N'Dương Nguyễn Thành Sang', 'eileenmathis@gmail.com', '0842691083', '1975-08-17', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(135, N'Vũ Võ Thu Hiền', 'lroberts@hotmail.com', '0397833235', '1997-05-05', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(136, N'Vũ Ngô Quốc Thiện', 'jamescurtis@yahoo.com', '0932576657', '1998-12-09', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(137, N'Trần Quỳnh Chi', 'amy51@hotmail.com', '0912099645', '1999-11-03', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(138, N'Trương Phi Cường', 'leefaith@yahoo.com', '0969105363', '1981-04-02', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(139, N'Trần Minh Vương', 'melinda39@hotmail.com', '0989243784', '2003-10-17', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(140, N'Trương Ngọc Thơ', 'natalie88@yahoo.com', '0369508358', '1981-01-29', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(141, N'Hồ Hồng Minh', 'heathdouglas@hotmail.com', '0355534443', '1981-10-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(142, N'Hồ Trần Minh Kiệt', 'devin93@hotmail.com', '0373998213', '1994-06-06', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(143, N'Phạm Hữu Trung', 'stonekatie@gmail.com', '0855199584', '1970-09-30', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(144, N'Hoàng Võ Tú Anh', 'smccann@hotmail.com', '0348106135', '1989-02-03', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(145, N'Đặng Trương Tất Hòa', 'robertabryant@gmail.com', '0863717644', '2004-01-23', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(146, N'Lê Minh Huy', 'dawnshelton@yahoo.com', '0963288373', '1972-09-12', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(147, N'Hoàng Hoàng Thúy Nga', 'ishelton@hotmail.com', '0859137574', '1973-09-29', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(148, N'Ngô Ðình Ðôn', 'juanmcgee@yahoo.com', '0399227397', '1980-01-01', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(149, N'Phạm Ngọc Ly', 'robertschneider@hotmail.com', '0856229578', '1963-05-19', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(150, N'Dương Hương Trầm', 'michaelgoodwin@gmail.com', '0831372208', '1982-03-20', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(151, N'Lê Lê Khánh Thi (Thy)', 'mallory71@hotmail.com', '0969682655', '2004-01-18', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(152, N'Đinh Chi Mai', 'jyang@yahoo.com', '0328536727', '2002-07-03', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(153, N'Trương Bảo Ngọc', 'steven15@hotmail.com', '0903398955', '1969-07-25', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(154, N'Vũ Tuấn Dũng', 'pjones@hotmail.com', '0342353791', '1967-04-23', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(155, N'Huỳnh Gia Khanh', 'brianfletcher@yahoo.com', '0359955926', '1968-07-09', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(156, N'Đỗ Quốc Việt', 'tpowers@yahoo.com', '0385472650', '1972-11-16', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(157, N'Phạm Đỗ Hoàng Cúc', 'sonyacochran@yahoo.com', '0976319540', '1985-05-06', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(158, N'Nguyễn Đặng Danh Sơn', 'keiththomas@yahoo.com', '0838333575', '1972-11-28', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(159, N'Đặng Khải Tâm', 'lisamaxwell@hotmail.com', '0844026793', '1970-09-15', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(160, N'Võ Thúy Liên', 'harrisonamber@yahoo.com', '0989123089', '1968-05-02', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(161, N'Đặng Vũ Trung Nhân', 'katherine63@hotmail.com', '0944735299', '1982-12-20', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(162, N'Trương Ðình Nam', 'gnguyen@yahoo.com', '0964152529', '1981-12-31', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(163, N'Trương Trường An', 'gwendolynflowers@yahoo.com', '0328735681', '1994-03-17', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(164, N'Võ Huy Quang', 'bishopkristi@hotmail.com', '0942815749', '1986-03-28', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(165, N'Phạm Hoàng Thụy Lâm', 'ygonzales@gmail.com', '0327487395', '1998-04-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(166, N'Dương Thụy Vân', 'ocastillo@hotmail.com', '0902086449', '2000-12-03', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(167, N'Dương Lê Ðan Khanh', 'cgonzalez@yahoo.com', '0949458985', '1966-09-17', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(168, N'Dương Vũ Linh San', 'tara45@yahoo.com', '0378673287', '1966-06-12', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(169, N'Dương Trần Tuấn Dũng', 'wesley05@yahoo.com', '0971993873', '1999-03-27', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(170, N'Vũ Ngô Tường Anh', 'andraderita@yahoo.com', '0328977671', '1985-02-05', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(171, N'Đinh Kim Thủy', 'ahoward@gmail.com', '0377632022', '1987-01-11', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(172, N'Trương Diễm Thảo', 'juan15@yahoo.com', '0964481457', '2001-07-28', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(173, N'Huỳnh Phan Tú Sương', 'michaellewis@gmail.com', '0393333609', '1966-06-28', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(174, N'Đặng Trường Sơn', 'gutierreznicole@hotmail.com', '0321952725', '1976-12-08', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(175, N'Phạm Hoàng Phương Yến', 'rebeccaalvarado@gmail.com', '0376757370', '1993-09-24', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(176, N'Ngô Hà Phương', 'baileymelissa@hotmail.com', '0381214845', '1989-01-12', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(177, N'Đinh Hùng Sơn', 'eric59@hotmail.com', '0914164833', '1979-12-26', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(178, N'Phan Đỗ Thái Yên', 'fgonzales@gmail.com', '0342560852', '1974-08-10', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(179, N'Đỗ Thanh Hương', 'nmccullough@gmail.com', '0395826587', '1993-06-11', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(180, N'Phan Gia Hòa', 'jill91@gmail.com', '0343451601', '1977-02-01', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(181, N'Trương Hương Lâm', 'markgregory@hotmail.com', '0371516937', '1992-12-12', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(182, N'Đặng Quốc Hạnh', 'amy67@gmail.com', '0914893319', '1966-12-19', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(183, N'Ngô Vũ Thụy Lâm', 'zboyd@yahoo.com', '0377853298', '1997-01-14', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(184, N'Đinh Thúy Nga', 'justin49@hotmail.com', '0358212876', '1973-09-24', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(185, N'Hồ Phan Hữu Nam', 'wigginselizabeth@hotmail.com', '0916970467', '1991-03-20', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(186, N'Dương Hồ Ðình Cường', 'ysharp@yahoo.com', '0374396177', '1970-08-13', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(187, N'Đặng Phạm Vinh Quốc', 'owarren@hotmail.com', '0843853224', '1979-11-03', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(188, N'Dương Quốc Trường', 'gonzalesdarius@gmail.com', '0973295834', '1982-06-30', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(189, N'Huỳnh Ngọc Dũng', 'andreanelson@hotmail.com', '0857401854', '1987-11-15', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(190, N'Phạm Vũ Ngọc Liên', 'jlopez@gmail.com', '0967601421', '1991-08-06', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(191, N'Đỗ Phương Giang', 'hannahzamora@yahoo.com', '0336657051', '1981-07-11', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(192, N'Nguyễn Đỗ Xuân Lan', 'hwebb@hotmail.com', '0919856852', '1983-04-08', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(193, N'Võ Ngô Ngọc Ngạn', 'helenmartin@hotmail.com', '0978439915', '1995-02-19', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(194, N'Phan Trần Huyền Trân', 'tsalinas@gmail.com', '0987889931', '1974-11-20', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(195, N'Hoàng Nguyễn Mai Liên', 'oschroeder@yahoo.com', '0834574463', '2003-05-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(196, N'Trần Nguyễn Thu Phương', 'sarahjackson@yahoo.com', '0947059388', '1984-12-13', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(197, N'Dương Ngô Mai Ly', 'taylormatthew@yahoo.com', '0937462248', '1978-02-25', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(198, N'Phạm Lê Ngọc Hân', 'rivasshawn@hotmail.com', '0338295452', '1993-03-17', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(199, N'Nguyễn Trần Hồng Phương', 'floydrodney@yahoo.com', '0844441131', '2001-12-02', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(200, N'Phạm Trần Hùng Phong', 'ruizmargaret@yahoo.com', '0322344179', '1983-11-28', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(201, N'Hoàng Vương Triều', 'richardgibson@hotmail.com', '0392846004', '1973-03-21', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(202, N'Đinh Trương Quốc Hòa', 'courtneyshepherd@yahoo.com', '0377726433', '1985-03-04', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(203, N'Dương Ngọc Đại', 'joy27@hotmail.com', '0367516588', '1993-03-15', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(204, N'Vũ Công Hào', 'james77@yahoo.com', '0388091562', '1965-05-01', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(205, N'Võ Trương Xuân Hiền', 'timothyyates@gmail.com', '0981079503', '1994-05-01', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(206, N'Đặng Cao Sơn', 'craig06@gmail.com', '0377215642', '2003-02-06', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(207, N'Trần Triệu Thái', 'alewis@hotmail.com', '0348035019', '1995-02-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(208, N'Lê Thanh Ngọc', 'jason30@yahoo.com', '0949915186', '1989-05-14', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(209, N'Nguyễn Đinh Vi Quyên', 'vincent63@gmail.com', '0349902743', '1971-10-15', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(210, N'Phạm Huỳnh Thục Nhi', 'steve87@yahoo.com', '0374568947', '1968-09-15', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(211, N'Hoàng Quốc Hưng', 'amandawatkins@hotmail.com', '0366852018', '2000-07-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(212, N'Nguyễn Ngô Quang Trường', 'kelseynelson@yahoo.com', '0913397665', '1991-05-22', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(213, N'Đặng Phương Trà', 'hgibbs@hotmail.com', '0835682769', '1981-10-01', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(214, N'Trần Phan Hương Lâm', 'joseph16@yahoo.com', '0983328091', '1986-08-21', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(215, N'Hoàng Đinh Minh Ðạt', 'hallkimberly@hotmail.com', '0393245707', '1999-10-08', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(216, N'Huỳnh Hồ Ngọc Danh', 'powellrobert@gmail.com', '0324573941', '2002-03-13', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(217, N'Trần Phương Triều', 'teresa59@gmail.com', '0863649174', '1968-08-28', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(218, N'Ngô Nguyễn Kiên Trung', 'mariahgarcia@hotmail.com', '0942861638', '1988-03-04', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(219, N'Đỗ Tùng Linh', 'mary26@yahoo.com', '0352507943', '1989-08-28', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(220, N'Lê Thúy Kiều', 'jessicasanchez@hotmail.com', '0368277878', '1977-05-18', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(221, N'Vũ Hồng Thư', 'xwilson@hotmail.com', '0865924828', '1977-11-28', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(222, N'Dương Lê Tùng Châu', 'annettedaniels@hotmail.com', '0987063374', '1999-01-20', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(223, N'Dương Ngô Thu Nguyệt', 'xlee@gmail.com', '0348479386', '1985-10-25', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(224, N'Đinh Đặng Thủy Mai', 'ralph59@hotmail.com', '0368870182', '1975-02-03', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(225, N'Đinh Huỳnh Bá Thành', 'owensbradley@gmail.com', '0831794615', '2004-11-12', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(226, N'Võ Dạ Yến', 'zhinton@hotmail.com', '0383114517', '1998-09-18', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(227, N'Đỗ Hoàng Mỹ Trang', 'juliesmith@hotmail.com', '0332390761', '1964-01-07', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(228, N'Huỳnh Nguyễn Thảo Vân', 'imurray@gmail.com', '0901049311', '1963-03-22', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(229, N'Phan Ngô Minh Thủy', 'ismith@gmail.com', '0364071661', '1991-11-08', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(230, N'Phạm Trần Lê Quỳnh', 'mcdonaldaaron@hotmail.com', '0916352124', '1979-03-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(231, N'Đinh Anh Quốc', 'joseph49@gmail.com', '0988094820', '1972-11-05', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(232, N'Đỗ Thuận Phương', 'matthewclay@hotmail.com', '0323753918', '1985-10-28', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(233, N'Đặng Thụy Nương', 'jsmith@hotmail.com', '0859184489', '1995-05-09', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(234, N'Ngô Văn Minh', 'ajordan@gmail.com', '0325522383', '1984-02-02', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(235, N'Võ Thiện Minh', 'larrywalker@gmail.com', '0937556438', '1982-03-01', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(236, N'Hồ Huỳnh Yến Phượng', 'bmills@yahoo.com', '0967982647', '1984-04-19', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(237, N'Dương Ngô Hà Tiên', 'zpowell@gmail.com', '0853099218', '1986-01-17', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(238, N'Ngô Ðức Cường', 'thompsonjoseph@yahoo.com', '0946926428', '1995-08-20', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(239, N'Phan Việt Phong', 'zwilliams@yahoo.com', '0855936281', '1966-08-03', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(240, N'Phan Phan Thanh Thu', 'hardyedward@yahoo.com', '0832105158', '1965-02-21', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(241, N'Đặng Kiến Văn', 'qrivas@gmail.com', '0379007523', '1982-05-04', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(242, N'Huỳnh Bích Hợp', 'alexis42@gmail.com', '0333976069', '1976-01-12', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(243, N'Đỗ Huỳnh Hồng Anh', 'wgonzales@gmail.com', '0946788678', '1998-08-04', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(244, N'Nguyễn Võ Sơn Hải', 'watsonkenneth@yahoo.com', '0383157429', '1972-09-14', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(245, N'Phạm Trương Bình Ðạt', 'stephaniecohen@yahoo.com', '0911381052', '1978-11-02', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(246, N'Trương Ngô Tâm Hiền', 'george80@yahoo.com', '0329660992', '1979-06-01', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(247, N'Dương Thiện Nhân', 'rosefernandez@hotmail.com', '0836676487', '1981-12-14', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(248, N'Lê Hồ Ngọc Hoàn', 'jgray@gmail.com', '0948087558', '1963-09-23', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(249, N'Phạm Quỳnh Giao', 'barbara70@gmail.com', '0989381259', '2003-09-24', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(250, N'Đặng An Hạ', 'cordovavanessa@hotmail.com', '0397239886', '1990-11-26', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(251, N'Nguyễn Diễm Hạnh', 'lynnward@gmail.com', '0947727372', '1986-05-01', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(252, N'Võ Thế Sơn', 'april22@hotmail.com', '0396583465', '1982-01-17', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(253, N'Đỗ Phạm Thùy Oanh', 'brittney10@yahoo.com', '0906226925', '1980-08-19', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(254, N'Đặng Huỳnh Trọng Duy', 'kristin48@gmail.com', '0335273127', '1983-05-24', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(255, N'Dương Đặng Yến Mai', 'mark07@hotmail.com', '0974864271', '2000-11-15', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(256, N'Trương Nhật Hòa', 'xcampbell@gmail.com', '0378161260', '1987-04-12', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(257, N'Hoàng Đặng Thái Hòa', 'dukegabriel@yahoo.com', '0378389018', '1966-07-12', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(258, N'Đặng Hồ Khánh Nam', 'baueraudrey@yahoo.com', '0345961496', '1973-10-02', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(259, N'Trương Phạm Nhã Thanh', 'cjimenez@gmail.com', '0852282036', '1980-05-18', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(260, N'Hồ Ngọc Trụ', 'sschneider@hotmail.com', '0355215624', '2004-05-19', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(261, N'Đỗ Đặng Thu Hường', 'andrew98@yahoo.com', '0946768027', '1980-08-28', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(262, N'Dương Hoàng Ngọc Huệ', 'fschmidt@gmail.com', '0848198169', '1963-07-16', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(263, N'Đặng Đinh Thục Trinh', 'smccormick@gmail.com', '0333656883', '1973-04-27', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(264, N'Nguyễn Tâm Hiền', 'klam@yahoo.com', '0949238052', '1966-09-11', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(265, N'Đinh Ngô Yến Loan', 'iknox@gmail.com', '0938526824', '1985-01-01', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(266, N'Dương Bảo Thạch', 'umiller@hotmail.com', '0394374391', '1998-03-30', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(267, N'Võ Lê Minh Khôi', 'lgordon@hotmail.com', '0853720156', '1978-02-19', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(268, N'Phạm Hùng Cường', 'peter69@hotmail.com', '0341044679', '1967-10-24', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(269, N'Hoàng Bảo Thái', 'hlee@gmail.com', '0979748751', '1966-06-30', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(270, N'Trần Xuân Cung', 'christopher26@yahoo.com', '0866548130', '1987-10-25', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(271, N'Nguyễn Hồ Hoàng Yến', 'zmiller@yahoo.com', '0966381179', '1992-07-02', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(272, N'Nguyễn Hồ Yến Hồng', 'wwhite@gmail.com', '0865106086', '1983-08-28', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(273, N'Phạm Kim Yến', 'gabriela77@gmail.com', '0863285654', '1991-02-05', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(274, N'Dương Võ Kim Ngọc', 'amontgomery@gmail.com', '0962185828', '1971-06-18', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(275, N'Đỗ Phan Minh Quý', 'hgross@hotmail.com', '0916835549', '1966-04-30', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(276, N'Nguyễn Hoàng Thanh Thu', 'jessica28@gmail.com', '0399651380', '1983-07-13', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(277, N'Hồ Giáng Ngọc', 'carolyn91@yahoo.com', '0335532107', '1975-04-13', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(278, N'Vũ Trương Ngọc Tuyết', 'vward@gmail.com', '0324023364', '1983-12-04', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(279, N'Phạm Ngô Xuân Cung', 'ruthray@yahoo.com', '0338645605', '1995-12-27', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(280, N'Phạm Lạc Phúc', 'martincarla@yahoo.com', '0838652088', '2004-10-30', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(281, N'Vũ Duy Ngôn', 'porterzachary@hotmail.com', '0858216789', '2001-11-30', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(282, N'Đặng Phan Bích Chiêu', 'websteranthony@gmail.com', '0975884959', '1978-08-20', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(283, N'Hồ Linh Nhi', 'ythompson@hotmail.com', '0384712672', '2000-08-31', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(284, N'Phan Dương Thanh Hiền', 'kayla39@gmail.com', '0969598485', '2001-11-25', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(285, N'Đặng Hoàng Bảo Khánh', 'matastephanie@gmail.com', '0917003333', '2003-02-06', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(286, N'Đinh Đặng Bá Lộc', 'judysmith@yahoo.com', '0358591657', '1981-10-19', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(287, N'Huỳnh Lập Thành', 'dthompson@yahoo.com', '0365051645', '1988-02-25', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(288, N'Trương Đặng Thanh Thuận', 'faguirre@hotmail.com', '0963195032', '1964-09-03', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(289, N'Hồ Phạm Ái Vân', 'jmarshall@gmail.com', '0353880469', '1984-11-07', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(290, N'Đỗ Tiến Hoạt', 'mariaswanson@gmail.com', '0328142635', '1975-06-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(291, N'Đinh Huỳnh Vũ Minh', 'jasonharris@gmail.com', '0356549923', '1982-06-21', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(292, N'Nguyễn Vũ Long Quân', 'georgehaney@hotmail.com', '0338386364', '1979-11-04', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(293, N'Phạm Trương Tuệ Lâm', 'paynegerald@hotmail.com', '0902597597', '1984-10-22', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(294, N'Huỳnh Dương Thanh Nhung', 'reyesdonna@hotmail.com', '0908252154', '1982-10-25', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(295, N'Trương Thúy Vy', 'rivasdavid@hotmail.com', '0862892119', '2000-08-17', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(296, N'Phan Huỳnh Hà Tiên', 'lisamayo@gmail.com', '0386165828', '1973-02-21', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(297, N'Đỗ Phạm Bảo Trâm', 'kimberlynewman@gmail.com', '0847418787', '1980-07-31', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(298, N'Dương Đỗ Bảo Hòa', 'jessicaholder@hotmail.com', '0398418253', '1994-05-01', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(299, N'Đặng Nhật Khương', 'hernandezgina@hotmail.com', '0854501733', '1977-07-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(300, N'Phạm Đỗ Ngân Hà', 'samuel73@yahoo.com', '0946384850', '1974-07-14', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(301, N'Đặng Võ Phượng Tiên', 'petersonwesley@yahoo.com', '0936107789', '1975-09-08', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(302, N'Hồ Lê Huệ Hương', 'lreid@yahoo.com', '0349737996', '1985-01-16', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(303, N'Dương Phan Xuân Nhiên', 'johnsoncrystal@hotmail.com', '0937492709', '1980-10-20', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(304, N'Trần Mạnh Tấn', 'john18@hotmail.com', '0982354785', '1963-06-08', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(305, N'Lê Dương Phượng Loan', 'tkrause@yahoo.com', '0963952096', '2002-06-13', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(306, N'Ngô Minh Huệ', 'amandapierce@gmail.com', '0848443306', '2001-04-05', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(307, N'Hồ Vũ Hoàng Hải', 'ugregory@yahoo.com', '0834624809', '2002-08-06', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(308, N'Đinh Minh Nguyệt', 'sarah34@hotmail.com', '0965744322', '1983-11-11', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(309, N'Hồ Hoài Việt', 'andrew28@gmail.com', '0942404576', '2004-04-09', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(310, N'Đặng Trương Ðình Phúc', 'scottjohn@yahoo.com', '0371321045', '1963-12-26', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(311, N'Dương Lâm Dũng', 'cody55@yahoo.com', '0933367184', '1973-03-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(312, N'Phạm Xuân Trường', 'johnmason@gmail.com', '0338160531', '1977-08-28', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(313, N'Đặng Phan Bảo Long', 'xspencer@yahoo.com', '0358860606', '1984-04-27', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(314, N'Phạm Trần Quang Tài', 'mcdanielwilliam@gmail.com', '0863066617', '1975-07-19', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(315, N'Phan Hồng Ðiệp', 'wgilbert@gmail.com', '0343070144', '1964-03-12', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(316, N'Trương Hồng Nhung', 'nbrown@gmail.com', '0941281881', '2005-06-20', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(317, N'Dương Lê Lam Ngọc', 'andrew75@yahoo.com', '0329680621', '1995-01-16', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(318, N'Huỳnh Chấn Hùng', 'joshuaacosta@gmail.com', '0857047802', '2004-12-16', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(319, N'Hồ Bá Thiện', 'ivasquez@yahoo.com', '0398541745', '1989-05-20', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(320, N'Võ Đinh Vương Triệu', 'jennifereverett@yahoo.com', '0903541239', '1996-09-20', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(321, N'Vũ Phan Gia Hân', 'conleybrendan@hotmail.com', '0964525580', '1981-02-04', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(322, N'Huỳnh Gia Bảo', 'tiffanynavarro@yahoo.com', '0338022718', '1964-08-16', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(323, N'Nguyễn Kim Phú', 'tammydalton@yahoo.com', '0379416104', '1998-02-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(324, N'Phan Mai Lan', 'david49@yahoo.com', '0855559535', '1993-05-25', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(325, N'Hồ Ngô Cẩm Tú', 'edward90@hotmail.com', '0865518032', '2000-02-29', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(326, N'Nguyễn Vũ Thiệu Bảo', 'kellychristopher@gmail.com', '0967479544', '1990-06-13', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(327, N'Huỳnh Hoàng Mạnh Thiện', 'amber92@gmail.com', '0985017281', '1987-04-05', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(328, N'Phan Hồng Nhung', 'ortegapamela@gmail.com', '0325325382', '1996-12-17', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(329, N'Hồ Ngọc Ánh', 'julian05@hotmail.com', '0913684040', '1972-04-10', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(330, N'Vũ Đặng Ngọc Khánh', 'michaelmccall@yahoo.com', '0902521186', '1963-10-28', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(331, N'Phan Tấn Lợi', 'orrmichael@gmail.com', '0902231226', '1980-08-29', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(332, N'Trần Lê Hồng Lâm', 'bdavis@hotmail.com', '0359248848', '1999-02-07', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(333, N'Phan Trần Yến Phương', 'stephanie87@yahoo.com', '0342210094', '1983-11-28', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(334, N'Võ Phan Nam Hải', 'bwood@gmail.com', '0901107371', '1971-02-21', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(335, N'Đinh Ngô Minh Lý', 'zberry@yahoo.com', '0978638695', '1990-02-23', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(336, N'Huỳnh Huỳnh Khánh An', 'wrightsteven@yahoo.com', '0911577380', '1979-01-24', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(337, N'Đỗ An Ninh', 'reedrachel@yahoo.com', '0393111586', '1968-07-14', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(338, N'Huỳnh Võ Mỹ Trâm', 'tbrown@hotmail.com', '0966497783', '1963-07-02', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(339, N'Huỳnh Hòa Hợp', 'angela35@yahoo.com', '0946587292', '1973-07-29', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(340, N'Đinh Trần Hữu Lương', 'brenda92@yahoo.com', '0343581558', '1976-08-08', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(341, N'Đặng Đỗ Mạnh Hùng', 'tmiller@hotmail.com', '0911889340', '2001-01-07', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(342, N'Nguyễn Trần Mạnh Nghiêm', 'elizabethmorgan@yahoo.com', '0977943581', '1996-06-01', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(343, N'Hồ Thúy Liên', 'scott76@hotmail.com', '0384658635', '2004-12-27', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(344, N'Ngô Ngọc Oanh', 'kimberly64@gmail.com', '0914437427', '1976-07-19', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(345, N'Lê Đặng Thiện Giang', 'stephanie53@yahoo.com', '0903554750', '1982-12-24', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(346, N'Dương Duy Khiêm', 'powelledward@yahoo.com', '0975512501', '1987-02-17', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(347, N'Vũ Ngọc Huy', 'scott62@yahoo.com', '0376603611', '1989-04-17', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(348, N'Phan Đinh Ngọc Khang', 'mcbrideashley@hotmail.com', '0846159768', '1999-10-06', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(349, N'Ngô Ðức Kiên', 'donna89@yahoo.com', '0936475466', '2003-03-21', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(350, N'Trần Ðức Tuệ', 'melissabarnes@gmail.com', '0937226243', '1966-07-04', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(351, N'Ngô Hữu Trung', 'scottjanice@gmail.com', '0941646152', '1977-05-06', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(352, N'Phan Vũ Huy Quang', 'jonesmatthew@yahoo.com', '0969040914', '1983-01-15', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(353, N'Trần Bích Hồng', 'timothyfields@yahoo.com', '0858737508', '1970-08-03', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(354, N'Dương Minh Nghĩa', 'melaniemartin@hotmail.com', '0901216692', '1993-04-07', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(355, N'Võ Minh Tuệ', 'hbryant@yahoo.com', '0398500453', '1963-12-24', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(356, N'Hồ Hạnh Vi', 'patricia86@gmail.com', '0377733659', '1965-09-12', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(357, N'Võ Hồ Hà Giang', 'maryshaffer@yahoo.com', '0905081265', '1997-10-23', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(358, N'Đỗ Phan Chí Thanh', 'chernandez@yahoo.com', '0931125543', '1975-08-18', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(359, N'Huỳnh Thảo Ly', 'ismith@hotmail.com', '0394354504', '1993-01-01', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(360, N'Nguyễn Ngọc Thi (Thy)', 'hblevins@hotmail.com', '0938718348', '1991-02-10', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(361, N'Nguyễn Huỳnh Hùng Phong', 'mnielsen@hotmail.com', '0379209531', '1999-02-18', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(362, N'Hoàng Tuyết Loan', 'abennett@hotmail.com', '0347202845', '1999-01-04', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(363, N'Ngô Tuấn Hoàng', 'keith98@gmail.com', '0379668594', '1971-08-14', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(364, N'Nguyễn An Cơ', 'acostajennifer@gmail.com', '0337890080', '1980-05-08', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(365, N'Nguyễn Thủy Mai', 'dawngarcia@yahoo.com', '0913777199', '1976-12-23', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(366, N'Đặng Vũ Mai Thu', 'andersonkent@gmail.com', '0988233874', '1981-07-19', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(367, N'Đinh Xuân Loan', 'ahamilton@hotmail.com', '0906508321', '1998-08-20', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(368, N'Võ Võ Minh Ân', 'hesterchristina@yahoo.com', '0868490740', '1963-03-26', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(369, N'Võ Trương Xuân Loan', 'anthonyrivas@yahoo.com', '0347362665', '1988-03-08', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(370, N'Phạm Phương Trinh', 'sandovalwayne@hotmail.com', '0392827744', '1977-12-05', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(371, N'Dương Quế Linh', 'amber94@yahoo.com', '0848151753', '1976-01-05', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(372, N'Hồ Khánh Hội', 'eric49@yahoo.com', '0844024573', '1984-04-13', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(373, N'Hoàng Hồ Nhật Quân', 'jvasquez@yahoo.com', '0322279691', '1991-10-31', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(374, N'Hoàng Hoài Thanh', 'iwelch@gmail.com', '0375816321', '1982-08-17', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(375, N'Võ Thành Ðạt', 'stronggary@gmail.com', '0332612721', '1981-02-14', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(376, N'Trần Phạm Quốc Trung', 'juliebutler@yahoo.com', '0387797833', '2004-08-23', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(377, N'Trần Thu Thảo', 'wgill@gmail.com', '0391347309', '1985-04-28', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(378, N'Vũ Khánh Quỳnh', 'pachecoapril@yahoo.com', '0907330502', '2003-10-27', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(379, N'Đỗ Hoàng Ngọc Quế', 'denise61@gmail.com', '0869729266', '1981-08-15', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(380, N'Đặng Trương Linh Ðan', 'julie67@hotmail.com', '0981925048', '1999-08-07', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(381, N'Đặng Phạm Hải Châu', 'juliafleming@yahoo.com', '0393098124', '1978-12-26', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(382, N'Ngô Dương Bích Diệp', 'gregbonilla@yahoo.com', '0915562976', '1966-03-16', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(383, N'Phạm Phạm Ý Lan', 'ian23@hotmail.com', '0389932774', '1965-04-15', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(384, N'Trương Ngô Yến Mai', 'johnhansen@yahoo.com', '0972611624', '1971-04-25', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(385, N'Phạm Lê Công Lộc', 'raymond37@yahoo.com', '0371670257', '1985-01-04', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(386, N'Võ Thành Vinh', 'owensryan@yahoo.com', '0977052315', '1971-02-23', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(387, N'Đặng Trung Hiếu', 'cleach@gmail.com', '0961682347', '2001-10-28', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(388, N'Ngô Kim Tuyết', 'spalmer@hotmail.com', '0988380823', '1984-11-12', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(389, N'Nguyễn Dạ Thi (Thy)', 'justinlane@yahoo.com', '0329830909', '1999-01-14', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(390, N'Đỗ Chi Mai', 'michelle23@hotmail.com', '0342168997', '2002-12-25', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(391, N'Phan Nhật Tiến', 'wbenjamin@gmail.com', '0863498336', '1997-09-07', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(392, N'Võ Nguyễn Trọng Dũng', 'meganalvarado@yahoo.com', '0357827018', '1964-03-04', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(393, N'Nguyễn Hồ Nam', 'charlesturner@yahoo.com', '0388018409', '1977-01-02', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(394, N'Ngô Huỳnh Thu Thảo', 'lisavaughn@hotmail.com', '0983033997', '1984-09-19', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(395, N'Lê Nguyễn Xuân Thuyết', 'leerebecca@hotmail.com', '0335145440', '1999-09-03', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(396, N'Phan Đinh Xuân Vũ', 'ryanandrews@yahoo.com', '0358642078', '1972-11-25', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(397, N'Đinh Minh Nguyệt', 'brandonreyes@gmail.com', '0831681293', '2002-05-04', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(398, N'Hoàng Thế Dân', 'sirwin@hotmail.com', '0839892672', '1989-09-01', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(399, N'Trần Đinh Bảo Trúc', 'amanda55@gmail.com', '0945007789', '1977-10-26', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(400, N'Hồ Võ Minh Sơn', 'tiffany17@gmail.com', '0971815594', '1993-04-27', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(401, N'Vũ Kiều Nương', 'patricia39@gmail.com', '0394934776', '1982-07-28', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(402, N'Đặng Dương Ðức Phú', 'patrickmontes@yahoo.com', '0867954048', '2005-06-17', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(403, N'Huỳnh Trọng Hà', 'michael92@gmail.com', '0971401680', '1981-11-18', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(404, N'Võ Kiều Trang', 'jonesjulia@yahoo.com', '0329571818', '2003-12-13', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(405, N'Huỳnh Dương Mỹ Nga', 'garrettdavid@hotmail.com', '0846109248', '1968-09-13', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(406, N'Ngô Ngô Chi Mai', 'baileydaniel@yahoo.com', '0354637369', '1965-03-15', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(407, N'Võ Minh Ngọc', 'beardrebecca@yahoo.com', '0859392638', '1970-10-11', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(408, N'Hoàng Thu Ngà', 'camachorachael@yahoo.com', '0398399761', '1987-09-12', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(409, N'Võ Quốc Hưng', 'eshaw@yahoo.com', '0368302988', '1973-08-17', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(410, N'Ngô Ngô Thục Anh', 'kennethgreen@yahoo.com', '0962528611', '1981-02-12', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(411, N'Huỳnh Hữu Trí', 'barreraadam@gmail.com', '0391794484', '1966-10-10', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(412, N'Hoàng Quang Hùng', 'kathylong@gmail.com', '0367322408', '1968-05-14', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(413, N'Đỗ Vũ Hạnh Vi', 'wellsjeremy@yahoo.com', '0911520925', '1972-02-25', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(414, N'Đỗ Huệ Ân', 'copelandlori@hotmail.com', '0988877221', '1963-01-07', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(415, N'Ngô Quốc Vinh', 'francisashley@gmail.com', '0366217846', '1977-03-24', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(416, N'Trần Nguyễn Gia Ân', 'davidbowen@hotmail.com', '0396107795', '1993-01-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(417, N'Đỗ Diệp Vy', 'zwalker@yahoo.com', '0966673549', '1999-07-02', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(418, N'Huỳnh Kiên Bình', 'martinrose@gmail.com', '0867848020', '1993-11-08', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(419, N'Dương Thái Minh', 'krystalgriffin@hotmail.com', '0949728989', '1964-07-15', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(420, N'Trần Lê Ðoan Thanh', 'feliciacunningham@yahoo.com', '0387126223', '1984-09-26', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(421, N'Trương Trương Xuân Huy', 'jenniferlopez@gmail.com', '0337652551', '1981-09-28', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(422, N'Phan Nguyệt Hồng', 'iharrison@hotmail.com', '0852108985', '1970-10-26', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(423, N'Đặng Thành Sang', 'garypark@gmail.com', '0854173724', '1973-07-03', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(424, N'Huỳnh Phú Ân', 'collinsandrew@gmail.com', '0834685958', '1979-12-05', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(425, N'Trần Hải Vân', 'marywheeler@hotmail.com', '0901158667', '2001-01-09', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(426, N'Hoàng Kim Ánh', 'joseph20@gmail.com', '0362678672', '1975-03-28', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(427, N'Đặng Trương Thành Vinh', 'pkelly@gmail.com', '0848230936', '1983-02-23', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(428, N'Nguyễn Ngô Lệ Băng', 'brenda91@hotmail.com', '0849272461', '2004-06-26', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(429, N'Ngô Trần Hải Quân', 'mclaughlinlaura@gmail.com', '0334145113', '1997-03-15', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(430, N'Đinh Dương Duy Thắng', 'samuel08@yahoo.com', '0331694732', '1976-11-25', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(431, N'Đỗ Minh Triệu', 'lewisrhonda@hotmail.com', '0382287710', '1986-03-24', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(432, N'Đặng Thùy Nhi', 'alanfrancis@yahoo.com', '0342682116', '1996-07-10', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(433, N'Huỳnh Hoàng Anh Sơn', 'sarah24@hotmail.com', '0375387986', '2003-12-12', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(434, N'Hồ Minh Nhân', 'kevinlopez@gmail.com', '0948508585', '1995-05-16', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(435, N'Đặng Minh Khuê', 'mejiadylan@yahoo.com', '0361297017', '1967-11-13', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(436, N'Hồ Đặng Hòa Giang', 'gonzalezwilliam@yahoo.com', '0945689280', '1969-08-05', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(437, N'Lê Nguyễn Trọng Hà', 'janice35@hotmail.com', '0357928613', '1978-09-06', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(438, N'Lê Chi Mai', 'linda92@gmail.com', '0912333816', '1973-02-24', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(439, N'Lê Tấn Trương', 'jeffreypacheco@hotmail.com', '0354123551', '1971-11-11', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(440, N'Trương Xuân Lâm', 'robin88@hotmail.com', '0359517612', '1985-12-29', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(441, N'Nguyễn Vũ Quang Huy', 'jonesmichael@hotmail.com', '0849254566', '1990-03-20', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(442, N'Hoàng Ðại Dương', 'stephenlawson@gmail.com', '0942788678', '1992-02-16', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(443, N'Lê Đặng Xuân Nhi', 'albert73@hotmail.com', '0368649043', '1963-04-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(444, N'Hồ Ngô Thanh Trúc', 'kenneth53@gmail.com', '0936523917', '1965-08-19', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(445, N'Vũ Vũ Hải Yến', 'espinozajames@hotmail.com', '0906356945', '2001-11-07', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(446, N'Trương Lan Khuê', 'vbutler@gmail.com', '0989144089', '1990-12-05', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(447, N'Đỗ Trung Thành', 'tranpatricia@gmail.com', '0343753435', '1993-10-11', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(448, N'Nguyễn Khánh Linh', 'upatel@hotmail.com', '0972803170', '2005-02-27', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(449, N'Đinh Huỳnh Nam Việt', 'nscott@hotmail.com', '0332401645', '1989-07-19', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(450, N'Hoàng Đinh Minh Giang', 'nbutler@hotmail.com', '0932473680', '1963-01-24', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(451, N'Đinh Ðắc Trọng', 'amywillis@gmail.com', '0396305294', '1973-05-06', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(452, N'Võ Trương Huyền Ngọc', 'asmith@hotmail.com', '0967788562', '1998-07-03', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(453, N'Lê Minh Hương', 'omcintosh@yahoo.com', '0911149908', '1990-09-04', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(454, N'Hoàng Gia Khiêm', 'eric93@hotmail.com', '0944680730', '1998-01-14', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(455, N'Phan Ðan Khanh', 'millerpam@yahoo.com', '0941490631', '1971-12-16', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(456, N'Võ Gia Bạch', 'dominguezwilliam@yahoo.com', '0974425321', '2005-04-14', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(457, N'Dương Tôn Lễ', 'sandraburns@yahoo.com', '0849339927', '1982-11-10', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(458, N'Huỳnh Xuân Ngọc', 'harperrebecca@yahoo.com', '0833478006', '1976-05-20', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(459, N'Vũ Trường Sơn', 'john68@gmail.com', '0941167480', '1995-01-04', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(460, N'Hồ Phan Ðoan Thanh', 'kellyelliott@gmail.com', '0944397223', '1974-04-13', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(461, N'Đặng Kim Thoa', 'kmiller@gmail.com', '0961155344', '1978-04-29', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(462, N'Trần Hoàng Phát', 'petersonlori@yahoo.com', '0938468390', '1983-01-12', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(463, N'Võ Quang Lân', 'clarkrachel@yahoo.com', '0847769978', '2004-03-31', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(464, N'Đinh Quang Tú', 'meganwheeler@hotmail.com', '0324132963', '1969-07-28', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(465, N'Nguyễn Đặng Thiện Khiêm', 'shannontanner@yahoo.com', '0934017838', '2004-02-27', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(466, N'Phạm Phi Long', 'john57@yahoo.com', '0867691035', '1992-02-05', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(467, N'Nguyễn Hồ Quế Lâm', 'sheri90@gmail.com', '0346779868', '1987-12-03', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(468, N'Phạm Cẩm Hường', 'martinezmichael@gmail.com', '0865991290', '1990-09-03', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(469, N'Dương Dương Giáng Uyên', 'mark08@gmail.com', '0331652373', '1989-11-03', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(470, N'Huỳnh Hòa Hợp', 'carl91@gmail.com', '0368568112', '1978-11-09', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(471, N'Lê Vũ Kiết Trinh', 'taylor55@hotmail.com', '0341605277', '1997-11-25', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(472, N'Huỳnh Hồng Lâm', 'evan12@gmail.com', '0333167228', '1985-12-10', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(473, N'Huỳnh Bích Quân', 'nramirez@hotmail.com', '0352515407', '1989-12-13', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(474, N'Ngô Hồng Linh', 'kennethrivera@hotmail.com', '0849654733', '1975-10-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(475, N'Nguyễn Thúy Vy', 'hineswilliam@gmail.com', '0947674512', '1987-12-18', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(476, N'Dương Phan Ngân Hà', 'smithchristina@gmail.com', '0986346909', '1964-01-02', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(477, N'Vũ Vũ Quốc Ðại', 'caldwellchristina@hotmail.com', '0858287335', '1978-01-05', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(478, N'Đặng Phan Ánh Ngọc', 'vthomas@gmail.com', '0356634637', '1986-06-26', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(479, N'Hoàng Việt Hải', 'fdunn@yahoo.com', '0325843232', '1995-01-27', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(480, N'Phan Ngọc Khang', 'allisonjason@yahoo.com', '0394013796', '1968-06-09', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(481, N'Hoàng Quỳnh Tiên', 'sandra80@gmail.com', '0325264466', '1975-11-04', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(482, N'Vũ Phan Thúy Hà', 'fking@yahoo.com', '0844182476', '1983-04-07', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(483, N'Phạm Quốc Thịnh', 'monica18@gmail.com', '0338374179', '1968-07-07', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(484, N'Hoàng Duy Minh', 'mcdowelllindsay@gmail.com', '0913816666', '1996-08-23', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(485, N'Hồ Trí Dũng', 'rwright@hotmail.com', '0965292926', '1976-03-06', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(486, N'Vũ Ðinh Hương', 'ylambert@hotmail.com', '0393343447', '1972-11-19', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(487, N'Vũ Anh Dũng', 'srichardson@gmail.com', '0981611503', '1984-02-29', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(488, N'Võ Vũ Cát Uy', 'houstonelizabeth@yahoo.com', '0841021487', '1998-05-16', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(489, N'Nguyễn Nhật Hồng', 'jbanks@hotmail.com', '0965500235', '2001-06-21', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(490, N'Đặng Hữu Minh', 'kevin43@hotmail.com', '0324331957', '1993-11-11', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(491, N'Hoàng Phạm Khánh Quyên', 'brycelopez@hotmail.com', '0973298250', '1966-09-15', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(492, N'Võ Bảo Quyên', 'hollowayanthony@yahoo.com', '0968285545', '1987-06-18', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(493, N'Ngô Tuấn Thành', 'vaughnjasmine@gmail.com', '0399839400', '2002-08-09', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(494, N'Lê Trương Lan Thương', 'sheryldonovan@gmail.com', '0833303016', '2002-05-15', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(495, N'Đinh Thanh Nhung', 'morrisondylan@yahoo.com', '0349057444', '1975-11-25', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(496, N'Đặng Diễm Trinh', 'brandon14@hotmail.com', '0392704154', '1991-05-20', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(497, N'Đặng Hồng Lĩnh', 'howellian@yahoo.com', '0911746985', '1991-09-04', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(498, N'Ngô Ngọc Tú', 'tammy86@hotmail.com', '0338041101', '1999-03-20', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(499, N'Đỗ Huỳnh Thành Danh', 'ronald48@yahoo.com', '0345070230', '1982-09-20', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(500, N'Đặng Nguyễn Thúy Hạnh', 'ashleyharris@yahoo.com', '0933117503', '1976-04-06', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(501, N'Hồ Quang Tài', 'debramoore@gmail.com', '0865063756', '1982-06-18', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(502, N'Huỳnh Dương Nam Thông', 'caitlinallison@hotmail.com', '0322442922', '2000-11-30', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(503, N'Hồ Hoàng Công Tráng', 'robert87@gmail.com', '0866784602', '1965-10-17', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(504, N'Trần Hồng Phúc', 'travis98@yahoo.com', '0852784026', '1998-09-18', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(505, N'Lê Hoàng Thái Dương', 'robincastro@gmail.com', '0378032312', '1977-09-13', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(506, N'Đặng Hồng Hạnh', 'rachelmyers@gmail.com', '0371584528', '1977-02-03', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(507, N'Ngô Phan Bảo Lâm', 'howardcourtney@gmail.com', '0348241156', '1989-04-27', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(508, N'Dương Thành Sang', 'jillian44@hotmail.com', '0937155001', '1992-07-07', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(509, N'Lê Thảo Quyên', 'julie67@hotmail.com', '0337079462', '1978-12-14', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(510, N'Vũ Phan Tuệ Mẫn', 'elijahdiaz@yahoo.com', '0387116967', '1979-08-10', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(511, N'Lê Ngô Yến Oanh', 'wesley66@gmail.com', '0834985282', '1989-09-19', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(512, N'Huỳnh Băng Băng', 'ustewart@yahoo.com', '0908832281', '1964-07-01', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(513, N'Phan Võ Thủy Mai', 'deangaines@hotmail.com', '0948714531', '1976-10-05', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(514, N'Nguyễn Đặng Lan Phương', 'amandaturner@gmail.com', '0338242668', '2004-10-08', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(515, N'Phan Đỗ Ðức Nhân', 'joelcooper@hotmail.com', '0852131554', '1990-01-17', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(516, N'Trần Phan Diệu Lan', 'brittanywelch@yahoo.com', '0945059289', '1976-07-16', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(517, N'Phạm Hồ Sơn Tùng', 'ychapman@gmail.com', '0901761463', '1974-12-16', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(518, N'Hoàng Khánh Vi', 'anthonyperez@yahoo.com', '0856016827', '1991-03-14', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(519, N'Hồ Thái Hồng', 'odommelissa@gmail.com', '0963732475', '1969-09-17', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(520, N'Hoàng Dương Khánh Huy', 'ygreer@yahoo.com', '0941491748', '1970-06-19', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(521, N'Vũ Ngọc Sương', 'brandonharris@hotmail.com', '0917077531', '2002-12-22', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(522, N'Võ Tú Nguyệt', 'valenzuelatammy@yahoo.com', '0988888934', '1984-01-16', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(523, N'Trần Hồ Chiêu Minh', 'williambecker@gmail.com', '0975827925', '1999-05-28', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(524, N'Trần Đặng Ðức Mạnh', 'vwilliams@hotmail.com', '0332869910', '2003-11-16', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(525, N'Võ Quang Nhật', 'asandoval@yahoo.com', '0352632295', '1982-03-27', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(526, N'Đỗ Cao Sỹ', 'ncopeland@yahoo.com', '0844715666', '1987-01-03', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(527, N'Phạm Anh Thơ', 'whitney15@gmail.com', '0856901609', '1978-02-21', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(528, N'Đặng Đinh Phương Uyên', 'shannon45@gmail.com', '0856642069', '2003-03-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(529, N'Hoàng Uy Vũ', 'tracey64@yahoo.com', '0867197085', '1982-09-29', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(530, N'Vũ Trần Việt Khôi', 'paulhaley@hotmail.com', '0851750299', '1979-06-15', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(531, N'Đỗ Thiện Tâm', 'amandaturner@hotmail.com', '0361811122', '1962-11-07', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(532, N'Trương Huỳnh Minh Triệu', 'briandavis@hotmail.com', '0911483742', '1983-08-27', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(533, N'Trần Hòa Hợp', 'shelby30@yahoo.com', '0847170910', '1992-05-19', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(534, N'Đỗ Minh Huyền', 'melissa50@gmail.com', '0398352750', '1975-02-08', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(535, N'Phạm Khánh Hà', 'clarkestacy@gmail.com', '0979756420', '1980-01-31', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(536, N'Dương Tuấn Kiệt', 'tiffany36@gmail.com', '0395702625', '1966-09-16', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(537, N'Dương Phạm Nam Tú', 'traviskoch@hotmail.com', '0933183152', '1962-08-17', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(538, N'Lê Dạ Lan', 'pricefelicia@gmail.com', '0383554967', '1989-07-29', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(539, N'Hoàng Trần Kiên Trung', 'lisanelson@hotmail.com', '0851734974', '1977-04-06', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(540, N'Đặng Lê Thiện Thanh', 'smithdylan@gmail.com', '0859835712', '1964-10-03', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(541, N'Nguyễn Lê Minh Ðức', 'willie76@hotmail.com', '0378751991', '1994-05-15', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(542, N'Phạm Triệu Thái', 'courtneyriley@hotmail.com', '0903468093', '1967-06-01', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(543, N'Ngô Vũ Duy Thanh', 'michelle05@hotmail.com', '0353389633', '1981-11-16', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(544, N'Hồ Ngô Việt Hoàng', 'bradfordtonya@yahoo.com', '0838154694', '1967-08-11', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(545, N'Huỳnh Gia Phúc', 'granthardy@yahoo.com', '0399120561', '1977-08-09', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(546, N'Nguyễn Bá Tùng', 'sara68@yahoo.com', '0986744384', '1966-04-04', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(547, N'Đặng Huỳnh Lan Ngọc', 'janicejones@yahoo.com', '0973413734', '2004-04-11', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(548, N'Trần Kiết Trinh', 'bryanduke@hotmail.com', '0398936915', '1987-09-04', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(549, N'Đặng Khánh Vi', 'andrewjones@yahoo.com', '0864314300', '2001-05-27', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(550, N'Phan Hoàng Vương', 'samuel74@yahoo.com', '0345960596', '1966-06-26', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(551, N'Ngô Đinh Hữu Hoàng', 'ohaney@hotmail.com', '0358066364', '1984-09-24', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(552, N'Vũ Ðức Hải', 'brownmelissa@yahoo.com', '0917296025', '2004-01-13', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(553, N'Đặng Công Sinh', 'johnsonsamantha@hotmail.com', '0395487915', '1981-02-13', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(554, N'Ngô Ðức Kiên', 'jenniferkrueger@hotmail.com', '0948085138', '1997-03-09', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(555, N'Hồ Vũ Ðại Ngọc', 'khobbs@gmail.com', '0975935686', '2005-03-13', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(556, N'Nguyễn Trung Nghĩa', 'tannercraig@hotmail.com', '0392441082', '2001-04-12', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(557, N'Phan Đặng Bích Duyên', 'phelpsjeffrey@hotmail.com', '0838297748', '1995-03-20', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(558, N'Lê Quang Lộc', 'scottwest@hotmail.com', '0862387261', '1965-01-14', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_2.png', N'Bronze'),
(559, N'Dương Đặng Ðăng Minh', 'hsmith@hotmail.com', '0984544396', '1974-01-20', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(560, N'Hồ Ngọc Hạ', 'andrew89@yahoo.com', '0905791639', '1998-05-29', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(561, N'Võ Bích Hằng', 'robynbrown@gmail.com', '0938626220', '1964-12-15', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(562, N'Ngô Đặng Phượng Tiên', 'roy32@yahoo.com', '0835875375', '1977-08-20', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(563, N'Nguyễn Xuân Lộc', 'djarvis@hotmail.com', '0398896268', '1969-01-21', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(564, N'Huỳnh Đỗ Khắc Thành', 'cranemitchell@yahoo.com', '0385979844', '1988-02-18', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_6.png', N'Bronze'),
(565, N'Đỗ Đinh Gia Uy', 'ogreen@hotmail.com', '0363595949', '1988-11-09', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(566, N'Nguyễn Thúy Vi', 'paula79@hotmail.com', '0324187986', '1974-05-27', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(567, N'Phan Phạm Trâm Anh', 'tommyliu@yahoo.com', '0368489757', '1997-10-09', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(568, N'Dương Minh Hương', 'adamcantu@gmail.com', '0904588974', '1970-03-14', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(569, N'Ngô Kim Thủy', 'josephtorres@gmail.com', '0396681435', '1962-11-23', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_9.png', N'Bronze'),
(570, N'Huỳnh Ngọc Lâm', 'jennifer78@gmail.com', '0383041434', '1981-10-19', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(571, N'Nguyễn Nhân Nguyên', 'kgates@hotmail.com', '0385124849', '1997-05-10', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_10.png', N'Bronze'),
(572, N'Đỗ Ðắc Thành', 'lhuang@hotmail.com', '0978038235', '1975-03-30', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(573, N'Đặng Phượng Vy', 'tammyjohnson@hotmail.com', '0905903291', '1972-09-22', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_11.png', N'Bronze'),
(574, N'Dương Huỳnh Quỳnh Sa', 'lorireynolds@yahoo.com', '0375407493', '2001-05-23', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/andre-tan-nX0mSJ999Og-unsplash.jpg', N'Bronze'),
(575, N'Huỳnh Nguyễn Xuân Thu', 'xstone@hotmail.com', '0361314170', '1986-06-20', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(576, N'Trương Lê Ngọc Huệ', 'michaelschultz@hotmail.com', '0864765672', '1978-12-29', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(577, N'Võ Linh Lan', 'meganevans@hotmail.com', '0931865220', '1991-02-04', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze'),
(578, N'Ngô Trường Chinh', 'david83@hotmail.com', '0839688181', '1973-06-03', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(579, N'Lê Vũ Tâm Thiện', 'wendyanderson@hotmail.com', '0342663284', '1963-12-03', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(580, N'Trương Phạm Thanh Hải', 'parker60@gmail.com', '0321732925', '1970-11-15', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(581, N'Đặng Lê Ngọc Thạch', 'timothy28@yahoo.com', '0865450753', '1981-10-08', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(582, N'Hoàng Phạm Kim Mai', 'bergeraaron@gmail.com', '0368376945', '1969-10-22', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(583, N'Đinh Trung Việt', 'swansonamy@gmail.com', '0904029210', '1981-12-27', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(584, N'Đỗ Trúc Ðào', 'emily00@hotmail.com', '0972547424', '2005-05-21', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(585, N'Trương Võ Diệp Vy', 'chill@yahoo.com', '0395505082', '1973-06-24', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(586, N'Lê Vũ Bảo Quỳnh', 'denisethompson@hotmail.com', '0356942299', '1972-10-27', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(587, N'Võ Lê Xuân Thuyết', 'daniel92@hotmail.com', '0971405771', '1963-05-27', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_13.png', N'Bronze'),
(588, N'Đặng Quảng Thông', 'elizabeth67@gmail.com', '0398517831', '1993-07-16', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(589, N'Trần Đinh Mỹ Tâm', 'sally75@hotmail.com', '0946494150', '1973-05-12', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_1.png', N'Bronze'),
(590, N'Lê Công Ân', 'pittseric@hotmail.com', '0989413735', '2002-07-05', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/apostolos-vamvouras-RNoslAw80b8-unsplash.jpg', N'Bronze'),
(591, N'Đỗ Vân Thúy', 'angelagarcia@hotmail.com', '0847240469', '1986-04-29', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_8.png', N'Bronze'),
(592, N'Trương Đặng Lan Ngọc', 'jbryan@hotmail.com', '0383984591', '1971-12-12', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_3.png', N'Bronze'),
(593, N'Phan Ngọc Thọ', 'katrina13@hotmail.com', '0836989077', '1995-01-21', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_5.png', N'Bronze'),
(594, N'Ngô Vân Ngọc', 'steven97@gmail.com', '0332440993', '1965-09-28', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/IMG_0615-min%20(1).jpg', N'Bronze'),
(595, N'Vũ Võ Sỹ Ðan', 'pcooley@gmail.com', '0371828769', '1974-11-05', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_4.png', N'Bronze'),
(596, N'Phan Sơn Tuyền', 'brittany13@yahoo.com', '0939983313', '1965-09-25', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_12.png', N'Bronze'),
(597, N'Võ Phan Tuệ Thi', 'matthewbooth@yahoo.com', '0374729632', '1988-11-12', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(598, N'Hoàng Minh Cảnh', 'rachel22@hotmail.com', '0947702520', '2003-06-09', 'Male', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/Untitled-UaAu9kQf7-transformed.jpeg', N'Bronze'),
(599, N'Hồ Võ Thanh Thu', 'stevencombs@gmail.com', '0381390001', '1979-10-01', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/avt_7.png', N'Bronze'),
(600, N'Nguyễn Minh Lý', 'justinwaters@gmail.com', '0842756271', '1980-09-27', 'Female', N'https://drallitu.sirv.com/Shared/Sunrise-Continent-from-rialloer/Users/focalos.png', N'Bronze');
UPDATE PERSONAL_DETAILS SET HotelId = 0;

INSERT INTO REVIEW (ReviewId, AccountId, HotelId, ReviewDate, Points, Content) VALUES
(1, 299, 7, '2023-03-06', 8, N'Eight light she store quite see serve successful line door.'),
(2, 206, 14, '2023-04-22', 6, N'Within fund behind year fact lay success clearly wear.'),
(3, 452, 6, '2023-07-04', 6, N'Agency hope common thought half meeting visit service course Mr including.'),
(4, 230, 10, '2023-07-20', 6, N'Town against single build firm book without anyone often particularly security claim hour.'),
(5, 208, 9, '2023-04-27', 7, N'Who meeting material two speech head.'),
(6, 190, 2, '2023-01-18', 6, N'Relationship bit safe production form television true believe strong.'),
(7, 51, 16, '2023-08-05', 6, N'Audience throughout win way guy grow detail.'),
(8, 564, 7, '2023-02-21', 6, N'Discussion story trade pay exist either oil beyond indeed street number pull mother.'),
(9, 140, 11, '2023-05-04', 8, N'World mention whole with do myself structure site item.'),
(10, 406, 4, '2023-08-03', 6, N'Future several former face office system.'),
(11, 119, 10, '2023-01-15', 6, N'Stage two region number both morning light nation position contain meeting life stuff.'),
(12, 569, 4, '2023-06-09', 6, N'Any response run everybody onto sing.'),
(13, 564, 19, '2023-04-25', 8, N'Crime agency close compare eight lose describe seek us strong over.'),
(14, 264, 1, '2023-02-05', 6, N'Red collection program share agree memory voice off I time five military.'),
(15, 45, 9, '2023-01-22', 8, N'A notice activity main add share.'),
(16, 538, 2, '2023-01-10', 6, N'Central might each beautiful news son throughout dinner statement audience student.'),
(17, 291, 14, '2023-05-25', 7, N'If throw indicate professor example idea.'),
(18, 304, 17, '2023-07-08', 6, N'Seat collection face stuff can stage weight listen assume with.'),
(19, 410, 3, '2023-07-08', 8, N'Computer modern increase me item many ready according be decision film anything cost.'),
(20, 185, 11, '2023-02-24', 7, N'Significant choose serious experience country mission argue name.'),
(21, 333, 17, '2023-07-29', 7, N'Agree ok nothing evidence leave knowledge toward former thousand TV build unit option.'),
(22, 508, 3, '2023-08-12', 7, N'Tonight act base suddenly support but share policy happy PM.'),
(23, 317, 8, '2023-05-06', 7, N'Bring either stay public experience event significant.'),
(24, 150, 9, '2023-06-17', 8, N'Hair again partner weight financial eight doctor somebody friend bed represent raise.'),
(25, 14, 14, '2023-04-09', 8, N'Them me couple each necessary bank best trial parent control question nature Democrat.'),
(26, 141, 16, '2023-07-16', 7, N'Already develop coach risk morning concern next game add visit upon value recent.'),
(27, 327, 6, '2023-03-05', 8, N'Ask friend run meet where factor.'),
(28, 543, 13, '2023-03-14', 8, N'Growth return middle plant language throw available fast machine around.'),
(29, 433, 6, '2023-07-13', 8, N'Agent nice physical old business no worker amount.'),
(30, 106, 8, '2023-06-07', 7, N'Listen statement raise bed class own boy interest attention whole writer because.'),
(31, 535, 15, '2023-03-19', 7, N'Prove environmental will could style always into medical once early feel step.'),
(32, 186, 10, '2023-01-31', 8, N'Travel friend theory in animal local blood manage use pressure once father play.'),
(33, 533, 9, '2023-08-08', 7, N'Close tree this great nature reduce human general low.'),
(34, 282, 6, '2023-04-27', 7, N'Notice boy sign themselves exactly same win.'),
(35, 452, 7, '2023-06-14', 8, N'Trip behavior street learn who watch room every film.'),
(36, 288, 18, '2023-08-03', 6, N'Will father art before soon choose treatment.'),
(37, 104, 10, '2023-07-24', 8, N'Him indeed student finish family family discover.'),
(38, 278, 13, '2023-01-10', 7, N'Learn likely audience body scientist appear black cost control nothing since entire southern.'),
(39, 135, 20, '2023-01-29', 8, N'Discuss great step idea public car with particular base investment throughout.'),
(40, 238, 12, '2023-04-23', 6, N'Do girl some exactly important no heart third office under ability.'),
(41, 579, 7, '2023-04-07', 8, N'Too general though statement just or fine move.'),
(42, 29, 7, '2023-07-07', 6, N'Dinner least leave professional consumer share.'),
(43, 173, 2, '2023-02-24', 8, N'If bill base store cold affect woman down trouble.'),
(44, 341, 13, '2023-08-11', 6, N'Fight camera role yet eat any region happy trial.'),
(45, 139, 5, '2023-07-18', 7, N'Serious finally gun peace though people democratic month nation evidence size total.'),
(46, 120, 8, '2023-05-27', 7, N'Theory officer rather too reason staff listen recent of seat.'),
(47, 144, 9, '2023-05-25', 7, N'Site decade affect feeling model others technology successful move design gas dark.'),
(48, 311, 8, '2023-04-05', 8, N'Human cost space him grow bad either those education.'),
(49, 150, 1, '2023-03-03', 8, N'Finish simple others painting choose simply PM skin occur institution.'),
(50, 357, 1, '2023-03-21', 6, N'Possible common up heavy structure community loss Democrat heart.'),
(51, 229, 15, '2023-04-20', 7, N'Drop me career thousand plan them section next in his tax hot media.'),
(52, 500, 20, '2023-07-10', 7, N'Four west heart doctor test feel project throw day economic body.'),
(53, 196, 4, '2023-05-19', 6, N'Different phone career else stock stage family easy debate arm real.'),
(54, 435, 15, '2023-04-01', 7, N'And various hotel leg consumer available particular performance able care reduce for to.'),
(55, 342, 7, '2023-04-14', 6, N'Owner that growth finally rest daughter government some election develop.'),
(56, 558, 14, '2023-07-21', 8, N'Need season company approach change care institution school friend environment.'),
(57, 570, 16, '2023-03-18', 7, N'Computer idea series back floor many five officer.'),
(58, 324, 2, '2023-03-17', 6, N'Both north fly rich could various many sport.'),
(59, 36, 19, '2023-01-26', 6, N'Way pay air bag I modern together big want free choose money party.'),
(60, 548, 20, '2023-03-07', 8, N'Respond when enough indicate car floor development factor bill outside from meeting.'),
(61, 238, 10, '2023-06-13', 7, N'National weight air west bank cultural charge simply hold fight.'),
(62, 495, 11, '2023-05-16', 7, N'Feeling continue image fact card important anyone throw positive.'),
(63, 134, 5, '2023-02-27', 6, N'Truth about support artist pattern officer idea rock give building.'),
(64, 557, 8, '2023-05-31', 8, N'Run deep same whether full but create soon.'),
(65, 237, 3, '2023-04-03', 8, N'Center firm term move someone would grow program.'),
(66, 327, 7, '2023-03-17', 8, N'Range identify event view director wear door finish it case.'),
(67, 577, 13, '2023-05-02', 6, N'Analysis light evening several night try.'),
(68, 598, 18, '2023-03-08', 8, N'Meeting major of democratic capital join true quickly stock feel program nature nature.'),
(69, 471, 10, '2023-02-10', 6, N'Personal former throughout forward tree rule.'),
(70, 456, 9, '2023-03-30', 7, N'Current effort near while board personal energy green may heart.'),
(71, 275, 10, '2023-06-14', 8, N'Ball drop research usually result accept nor admit until enjoy.'),
(72, 481, 8, '2023-05-28', 6, N'Him director site bank arrive worry service old director.'),
(73, 84, 6, '2023-04-17', 6, N'Break fall itself candidate grow believe century still show sense cold indicate send.'),
(74, 544, 4, '2023-04-08', 7, N'Idea baby something seven may threat agency eat charge.'),
(75, 32, 14, '2023-03-20', 8, N'Oil about mention discover whose election sign quite.'),
(76, 115, 20, '2023-02-05', 8, N'Decide picture structure as officer machine pay rise season federal worry.'),
(77, 238, 8, '2023-02-12', 8, N'Wind small beat store couple exactly both similar allow rate including always far.'),
(78, 59, 3, '2023-04-14', 8, N'Level drug bad industry ten team grow piece identify at do manager attention.'),
(79, 78, 3, '2023-05-21', 7, N'Different bar successful significant until away tend vote theory maintain.'),
(80, 339, 17, '2023-04-22', 7, N'Bed network left could father player year individual power.'),
(81, 454, 15, '2023-06-13', 6, N'Knowledge listen other produce campaign social word value everything dog.'),
(82, 215, 7, '2023-03-30', 7, N'Parent treat rather yard about could which big of carry.'),
(83, 277, 17, '2023-04-12', 6, N'Condition food forget happy place particular evidence participant explain fall must prove rich.'),
(84, 344, 19, '2023-01-20', 8, N'Up evidence mind party everyone against certainly another.'),
(85, 128, 8, '2023-04-29', 8, N'Whole use right church executive pattern figure.'),
(86, 413, 6, '2023-05-15', 6, N'Participant fight man pay building identify rest chance bar down.'),
(87, 481, 20, '2023-03-28', 6, N'Education notice campaign size effort former like agreement include section he probably skin.'),
(88, 48, 20, '2023-05-19', 8, N'Find them civil example third speech walk least.'),
(89, 157, 11, '2023-04-08', 6, N'Himself central modern PM dark Mrs film medical.'),
(90, 539, 1, '2023-06-20', 8, N'Serious cause water partner western Democrat behind skill service.'),
(91, 111, 19, '2023-04-28', 6, N'I camera away why tonight early cold affect risk expert north blood.'),
(92, 498, 6, '2023-05-20', 7, N'Central skin dog who but campaign reason never.'),
(93, 314, 6, '2023-01-10', 6, N'Door middle yard reality provide must sit.'),
(94, 500, 19, '2023-04-27', 8, N'At debate war card low strong smile end wonder cost necessary reduce.'),
(95, 70, 18, '2023-01-14', 6, N'Finally offer compare could difficult huge realize year recognize half.'),
(96, 537, 13, '2023-05-26', 6, N'Pass commercial range we central camera.'),
(97, 570, 11, '2023-02-18', 8, N'Exist read clearly write life without wind thank.'),
(98, 419, 15, '2023-07-22', 7, N'Figure indeed thus dark institution discover meeting themselves piece relationship.'),
(99, 36, 13, '2023-04-03', 6, N'Expect far take hold his us would take inside research.'),
(100, 388, 3, '2023-07-15', 8, N'See perform listen size resource record build account budget same lawyer.'),
(101, 383, 19, '2023-02-27', 7, N'Establish stage adult kind moment themselves international table make point will health.'),
(102, 23, 16, '2023-04-02', 8, N'Vote simply outside respond travel nature drop.'),
(103, 126, 14, '2023-05-22', 6, N'Plant them wish learn edge body nature reason medical sign.'),
(104, 103, 1, '2023-05-09', 8, N'Entire those own forward break close wrong future wait cut.'),
(105, 184, 10, '2023-01-30', 6, N'Suffer off yourself marriage hand task bit offer conference about accept manage.'),
(106, 552, 10, '2023-01-26', 6, N'Central choose interesting fine for mention design may understand.'),
(107, 47, 7, '2023-01-29', 7, N'Chance statement those whether after reason sea thank president play.'),
(108, 378, 7, '2023-06-01', 6, N'Break painting budget Congress care medical common involve his seven strong.'),
(109, 214, 16, '2023-03-14', 6, N'Commercial model carry front half my.'),
(110, 262, 10, '2023-02-25', 6, N'Most successful modern despite seat draw day protect war win also police every.'),
(111, 506, 14, '2023-03-29', 7, N'When past someone brother civil occur window shake get democratic president usually camera.'),
(112, 71, 10, '2023-08-04', 6, N'Performance upon suddenly travel while much others north home describe paper eight.'),
(113, 180, 6, '2023-01-08', 8, N'Security the wide senior actually director large.'),
(114, 109, 12, '2023-03-16', 8, N'Score kitchen daughter American wall social student.'),
(115, 500, 2, '2023-06-04', 7, N'Occur with second seek treat team study late certainly itself better key magazine part.'),
(116, 107, 16, '2023-08-04', 8, N'Simple total walk attention expect similar must.'),
(117, 358, 1, '2023-03-12', 8, N'Now sport tough mission speak sell indicate effort find cultural with turn blood.'),
(118, 505, 8, '2023-02-13', 6, N'Exactly share safe color choice summer action.'),
(119, 29, 1, '2023-05-29', 7, N'Maybe number think goal radio throughout population black represent wall fire while.'),
(120, 127, 10, '2023-06-09', 7, N'Network movement quite little project outside behind his risk too feel everything.'),
(121, 369, 7, '2023-03-09', 8, N'Theory structure well major brother learn film particularly.'),
(122, 198, 4, '2023-04-10', 8, N'Level campaign understand lay billion game wide.'),
(123, 23, 13, '2023-08-07', 8, N'Ok conference walk road camera it research part.'),
(124, 263, 6, '2023-03-30', 8, N'Alone name program fight yard short plan view.'),
(125, 200, 17, '2023-05-28', 8, N'Rule it discuss return heavy but decision air air strategy again authority camera.'),
(126, 279, 5, '2023-07-27', 7, N'Me however office phone five piece son.'),
(127, 409, 5, '2023-04-27', 6, N'Experience call treatment dream thought recognize size design direction look town.'),
(128, 229, 18, '2023-07-07', 8, N'Other describe organization third late interesting commercial thousand same.'),
(129, 515, 17, '2023-07-03', 6, N'Require official rule billion feel whom buy end seek mention four religious bag.'),
(130, 546, 12, '2023-02-20', 7, N'Quite seat lot behavior movement woman big network little along.'),
(131, 490, 3, '2023-04-21', 6, N'Learn hard media break method training finally garden fast happy when.'),
(132, 256, 13, '2023-08-04', 8, N'Several magazine sign act outside tough evidence management short medical past water structure.'),
(133, 275, 2, '2023-02-03', 7, N'Contain role until truth especially event month arm education base coach.'),
(134, 191, 12, '2023-05-07', 7, N'Reveal me free draw per fight role peace wait according candidate total.'),
(135, 368, 4, '2023-01-25', 7, N'President establish argue television or require fill short.'),
(136, 70, 18, '2023-03-25', 6, N'After beyond hour phone many manage.'),
(137, 43, 15, '2023-07-01', 7, N'Democrat step home hotel put everyone effort behavior method establish wonder decide environmental.'),
(138, 435, 19, '2023-06-12', 8, N'Word memory half music wind describe future agent today.'),
(139, 499, 4, '2023-02-27', 6, N'Majority year either career where now skill follow education woman never body.'),
(140, 187, 3, '2023-07-19', 8, N'For people wide live do security experience agency pretty measure goal.'),
(141, 239, 3, '2023-07-21', 8, N'Hope gas after son include for policy town guy them different.'),
(142, 246, 7, '2023-06-30', 8, N'Describe she need game your affect.'),
(143, 23, 5, '2023-03-28', 7, N'West hit take where perform idea.'),
(144, 307, 20, '2023-04-14', 8, N'What show Democrat Republican inside continue break where.'),
(145, 513, 2, '2023-05-20', 6, N'Tough dark wear hospital whose past we line recent serve better trade.'),
(146, 85, 6, '2023-01-26', 6, N'Across music police news information physical.'),
(147, 38, 4, '2023-06-28', 7, N'Fine center have official wind quality.'),
(148, 117, 9, '2023-04-16', 7, N'Phone whom public child red international school answer growth who performance finish.'),
(149, 260, 16, '2023-06-16', 8, N'Entire oil research base produce artist yet public spend once.'),
(150, 100, 13, '2023-08-03', 7, N'Door center quite there central well take too.'),
(151, 493, 7, '2023-02-20', 7, N'Test sport reality box scene laugh from believe leg offer.'),
(152, 515, 16, '2023-07-17', 7, N'Place company ahead bank save vote church.'),
(153, 570, 5, '2023-02-11', 7, N'Very forward range bring idea sign including.'),
(154, 438, 5, '2023-03-18', 7, N'Civil southern politics perform speech no attention its nearly do hundred.'),
(155, 241, 14, '2023-04-17', 8, N'He ago year forward far employee skin bank approach discuss action wrong.'),
(156, 434, 4, '2023-04-08', 7, N'Quite rule reality happen probably address threat figure discover project.'),
(157, 133, 1, '2023-07-22', 7, N'Space store party surface story lot capital woman PM center whether model.'),
(158, 597, 17, '2023-06-05', 7, N'New yes question stock cause similar difficult require hit provide wish message.'),
(159, 158, 13, '2023-06-07', 8, N'Push high gas first laugh stock pattern serious score court material several realize.'),
(160, 377, 20, '2023-03-22', 6, N'Street ahead magazine better many however recently happen success large.'),
(161, 65, 14, '2023-07-25', 6, N'Big land song morning beat population conference over also charge leg.'),
(162, 464, 6, '2023-07-05', 6, N'Budget term positive option serious minute president whether perform.'),
(163, 485, 20, '2023-06-06', 7, N'Mother draw spring case TV game other join concern feeling attack.'),
(164, 569, 18, '2023-05-13', 7, N'Though raise enjoy trouble good thing mother red outside skin sister what.'),
(165, 17, 18, '2023-06-12', 8, N'Perform daughter organization star beyond ahead company discussion like instead rate.'),
(166, 516, 18, '2023-01-04', 6, N'Customer letter wife alone until next process center wife sure during certain just.'),
(167, 267, 20, '2023-04-22', 6, N'During owner million very look vote tell edge.'),
(168, 86, 14, '2023-07-31', 6, N'Leave particular strong low election I like.'),
(169, 412, 15, '2023-02-22', 7, N'Direction whole family whatever who Republican statement worry necessary worry huge.'),
(170, 352, 8, '2023-05-01', 8, N'Certain son actually future skin because sometimes along family act president travel.'),
(171, 568, 18, '2023-01-21', 6, N'View around above argue black camera television southern dark industry red air left.'),
(172, 106, 8, '2023-06-10', 8, N'Thought could player cut effect reach election nearly month.'),
(173, 376, 10, '2023-03-10', 8, N'North word none trial focus serve order.'),
(174, 421, 11, '2023-01-10', 7, N'Similar rate to hear religious trade hotel full morning finish hand scientist.'),
(175, 340, 20, '2023-02-12', 7, N'Project factor study audience style these recently through adult.'),
(176, 436, 19, '2023-07-12', 6, N'Worry explain sister soldier majority treatment.'),
(177, 42, 8, '2023-04-30', 6, N'Letter animal let good question either social person.'),
(178, 32, 20, '2023-07-21', 8, N'Available image thought season score particular reduce month decade walk.'),
(179, 50, 16, '2023-01-25', 6, N'Pattern realize language notice board too hair model arrive hospital.'),
(180, 587, 17, '2023-03-09', 8, N'Whom official could home short image kind politics it however.'),
(181, 549, 6, '2023-03-26', 7, N'Wind structure fill be final seat purpose.'),
(182, 431, 2, '2023-07-21', 7, N'Government off size all reflect cultural time president life field well.'),
(183, 217, 10, '2023-08-13', 8, N'Put decade us fear drive low.'),
(184, 507, 5, '2023-01-21', 6, N'Unit thousand manage wall forget somebody rich fact wish center.'),
(185, 260, 1, '2023-03-05', 8, N'Statement officer knowledge sort would somebody officer official child.'),
(186, 387, 17, '2023-04-30', 8, N'Night entire skill professor expect change option before head focus.'),
(187, 301, 17, '2023-07-13', 6, N'Lawyer agreement ahead something article leave with whole.'),
(188, 410, 6, '2023-04-30', 8, N'Top for treat blue though watch toward audience I good recognize condition together.'),
(189, 511, 2, '2023-07-21', 7, N'Tell bit account across treatment use PM seat moment management.'),
(190, 542, 12, '2023-01-10', 8, N'Response read explain within those rule affect toward measure rate to.'),
(191, 548, 6, '2023-01-27', 7, N'World baby western team place democratic eight understand especially.'),
(192, 91, 12, '2023-04-20', 8, N'Medical reality together suddenly most board break yet always me.'),
(193, 177, 9, '2023-07-27', 6, N'Form common sell building century determine draw board I gun.'),
(194, 404, 5, '2023-06-12', 8, N'Risk yet animal role country appear eye scientist toward lawyer administration available.'),
(195, 419, 17, '2023-03-19', 7, N'End offer rise something activity night executive one maintain amount young.'),
(196, 9, 7, '2023-06-10', 8, N'Compare wide appear area political forward nearly former hot relationship.'),
(197, 345, 11, '2023-06-12', 7, N'Should part paper challenge over strategy themselves.'),
(198, 211, 11, '2023-07-19', 8, N'Or wear eye heavy man all memory task head little option style.'),
(199, 55, 19, '2023-07-24', 6, N'Factor chair hour role represent particularly.'),
(200, 235, 8, '2023-01-21', 7, N'Night would read address minute any nearly week decision.'),
(201, 290, 7, '2023-07-20', 6, N'Speak bill rate rise discover family.'),
(202, 334, 1, '2023-02-16', 8, N'Area worry success discuss unit owner pretty.'),
(203, 76, 20, '2023-06-10', 8, N'Identify nothing difficult member scientist fight market security.'),
(204, 512, 10, '2023-07-15', 6, N'Control prepare shoulder environmental often least every success time.'),
(205, 485, 17, '2023-07-06', 8, N'Spend consumer wind trial act how.'),
(206, 31, 1, '2023-02-03', 8, N'That position stop order argue military rather successful contain professional.'),
(207, 39, 15, '2023-06-13', 7, N'Nothing size significant candidate sell claim.'),
(208, 93, 18, '2023-06-09', 7, N'Property area bed population why individual son early simple not.'),
(209, 291, 7, '2023-05-23', 8, N'Seek second still peace hotel argue up two lead half cut not.'),
(210, 302, 17, '2023-06-18', 7, N'No half bit none degree firm market treatment west well every learn.'),
(211, 95, 6, '2023-07-12', 6, N'Sense evidence leader better drive interview street personal without rock.'),
(212, 52, 12, '2023-05-05', 7, N'Within describe leave per nothing especially.'),
(213, 397, 2, '2023-07-06', 7, N'Author anything though accept heart small early American development already everyone ever manager.'),
(214, 273, 8, '2023-02-25', 7, N'Direction media professor tax across personal data during red call unit response.'),
(215, 287, 12, '2023-03-24', 8, N'Nor customer break specific happen sit marriage under difference question miss.'),
(216, 202, 17, '2023-03-07', 7, N'Window area simple my design risk onto have painting we serve interest now.'),
(217, 569, 17, '2023-04-14', 6, N'Left report to anything a like beat help his.'),
(218, 233, 19, '2023-01-12', 7, N'Seven control onto prove argue plant face.'),
(219, 398, 18, '2023-07-19', 6, N'Performance owner particular physical near few tell between beyond management can listen hundred.'),
(220, 584, 8, '2023-02-11', 8, N'Hour produce theory suggest away relate suffer future daughter whom.'),
(221, 306, 17, '2023-07-16', 8, N'Blood federal both positive by own along enjoy situation shake.'),
(222, 175, 16, '2023-01-02', 8, N'Yes career huge billion very customer road.'),
(223, 78, 11, '2023-06-15', 7, N'End social leg above sign according national opportunity practice call.'),
(224, 169, 10, '2023-03-22', 7, N'Fast first east talk born break cost.'),
(225, 286, 13, '2023-01-11', 6, N'Challenge apply single administration soldier suddenly group.'),
(226, 22, 12, '2023-03-24', 6, N'Itself by husband size again ball unit by should health central.'),
(227, 265, 5, '2023-06-05', 7, N'Sure responsibility then election write laugh area lawyer black various thank.'),
(228, 492, 12, '2023-08-05', 7, N'Run high high hit point thousand wife leave rest.'),
(229, 69, 8, '2023-08-08', 7, N'Short international really foreign task relate.'),
(230, 136, 8, '2023-04-19', 8, N'Security claim education actually possible middle great artist general explain.'),
(231, 113, 5, '2023-07-05', 6, N'Benefit near project serve difference wall past four.'),
(232, 507, 5, '2023-04-17', 8, N'Now reduce get rate suffer result television everyone check check.'),
(233, 255, 5, '2023-01-10', 8, N'Use during manage section require audience guy music.'),
(234, 596, 3, '2023-04-14', 6, N'Election bad care approach own military perhaps top set more until service.'),
(235, 487, 10, '2023-04-08', 6, N'Player two inside on increase TV room Mr behind to memory from.'),
(236, 310, 17, '2023-06-12', 7, N'Resource alone quickly memory security vote story.'),
(237, 14, 15, '2023-01-21', 7, N'Trial space near carry list rich when develop mean hold.'),
(238, 553, 16, '2023-04-16', 8, N'American keep simply pressure way industry require.'),
(239, 153, 5, '2023-05-27', 6, N'Democratic police treat ahead candidate market very all sign rather community pick between.'),
(240, 308, 19, '2023-06-15', 7, N'Course sea nothing economy admit close avoid majority quality.'),
(241, 505, 7, '2023-03-15', 8, N'Reach agree simple such campaign computer president cause American unit player environmental possible.'),
(242, 408, 1, '2023-05-30', 7, N'Put forget respond seem identify old author.'),
(243, 329, 3, '2023-05-12', 7, N'Fish education head begin indicate sure page modern marriage.'),
(244, 316, 6, '2023-04-07', 8, N'Deep service try himself everybody security cell capital truth big attorney.'),
(245, 359, 7, '2023-08-07', 7, N'Produce magazine end red put dinner notice must.'),
(246, 520, 13, '2023-07-16', 8, N'Product body mind beat concern thousand truth open important.'),
(247, 466, 5, '2023-01-01', 6, N'Wrong investment live even animal phone.'),
(248, 238, 4, '2023-03-23', 7, N'Today seven lose amount thousand car article officer clearly.'),
(249, 499, 15, '2023-02-24', 7, N'Democrat participant PM direction sport need wind child deep.'),
(250, 227, 9, '2023-04-07', 7, N'Rule church yes enjoy to win move.'),
(251, 194, 10, '2023-08-02', 7, N'Share pick send fish hotel forget region do worker.'),
(252, 157, 4, '2023-08-03', 8, N'Member for popular summer purpose both student want spring stop significant sister.'),
(253, 226, 12, '2023-03-12', 8, N'Out give effect former garden and us.'),
(254, 472, 1, '2023-01-12', 7, N'Full bag civil important pressure local north discover apply debate test thus inside.'),
(255, 15, 8, '2023-02-27', 8, N'Son above field office effect end former.'),
(256, 399, 11, '2023-04-19', 7, N'Tv issue history animal authority bag finally door election at house year.'),
(257, 77, 20, '2023-03-15', 6, N'Factor open food for fear article near surface author tend somebody discussion various.'),
(258, 276, 20, '2023-02-02', 6, N'Man especially radio southern will information left born work second.'),
(259, 20, 9, '2023-01-27', 6, N'Democratic up during wall even country inside unit floor just I.'),
(260, 501, 4, '2023-04-19', 8, N'Whether project consumer hotel teach relationship other finish campaign two environmental.'),
(261, 460, 4, '2023-07-04', 6, N'Person material pay price finish minute already themselves chair contain case actually surface.'),
(262, 380, 9, '2023-03-13', 7, N'Prepare recognize city story speech protect.'),
(263, 33, 2, '2023-02-08', 8, N'Personal establish identify cut employee recognize president claim class three weight for.'),
(264, 67, 15, '2023-05-12', 6, N'Five learn wish bag amount different many whom director soon feel.'),
(265, 517, 19, '2023-03-10', 8, N'Series western threat pretty almost try say carry.'),
(266, 140, 5, '2023-01-24', 7, N'Grow mention growth product trial set develop half certainly type happen nor actually.'),
(267, 201, 17, '2023-07-12', 6, N'Quite heavy land sea yourself stuff suffer respond story western necessary like.'),
(268, 104, 10, '2023-01-23', 8, N'By participant brother whom break rather push purpose green politics country indeed pay.'),
(269, 120, 3, '2023-01-23', 6, N'International stock face likely civil including two.'),
(270, 213, 14, '2023-03-14', 6, N'Take foot into return somebody business song growth high interview traditional.'),
(271, 173, 6, '2023-06-28', 7, N'Baby eye enjoy face conference few along.'),
(272, 353, 12, '2023-04-01', 8, N'Hair itself model public popular could beat.'),
(273, 221, 4, '2023-07-06', 7, N'Low doctor window central Mrs just fine.'),
(274, 404, 17, '2023-06-24', 7, N'Away concern hour century summer plan meet thank threat.'),
(275, 47, 6, '2023-08-09', 6, N'Budget guess down stock guess position positive bank somebody president page something.'),
(276, 51, 18, '2023-05-21', 6, N'Herself available these statement inside billion available.'),
(277, 405, 16, '2023-04-30', 6, N'Big yeah along try individual top heart nice weight.'),
(278, 393, 9, '2023-02-22', 7, N'Open inside mission get may occur street conference third important.'),
(279, 193, 9, '2023-01-16', 8, N'Cold short campaign including data with Mr common increase behind environment business they.'),
(280, 517, 7, '2023-03-16', 8, N'Although rest everyone consumer nor international.'),
(281, 356, 7, '2023-05-16', 7, N'May radio heavy however per leg fall necessary cultural.'),
(282, 347, 8, '2023-04-12', 6, N'Learn young one particularly use enjoy these later moment instead.'),
(283, 570, 16, '2023-05-16', 7, N'Tv term oil offer few break ahead game.'),
(284, 406, 17, '2023-04-04', 7, N'Up hope music effect home deep reflect receive.'),
(285, 435, 8, '2023-04-09', 6, N'If important beyond here fly themselves occur pull let.'),
(286, 188, 20, '2023-01-04', 8, N'However feel between work end green anything wish field affect another he.'),
(287, 411, 7, '2023-07-06', 6, N'Happen most we business small agency upon item.'),
(288, 16, 12, '2023-02-12', 7, N'Nothing far last reflect majority expect center level.'),
(289, 225, 10, '2023-03-11', 6, N'Indicate test professor security name also.'),
(290, 495, 19, '2023-01-01', 7, N'As full cup note service over family behavior successful several which require drop on.'),
(291, 9, 11, '2023-01-13', 7, N'Every their paper open state both land.'),
(292, 222, 5, '2023-07-07', 6, N'Say daughter interesting level movie short would carry PM.'),
(293, 121, 19, '2023-06-06', 7, N'Owner house crime best cell drop why effect feeling page mind morning.'),
(294, 28, 19, '2023-03-30', 7, N'Prove catch couple field leg lay expert wonder.'),
(295, 387, 2, '2023-05-12', 8, N'Camera statement should best you nothing kind.'),
(296, 588, 7, '2023-03-10', 7, N'Realize enter trial draw better Republican.'),
(297, 19, 7, '2023-03-28', 6, N'Voice to policy dark work experience.'),
(298, 439, 5, '2023-07-20', 7, N'Ok total could report class challenge two.'),
(299, 416, 17, '2023-05-12', 8, N'She sure six college suggest information court rather.'),
(300, 224, 13, '2023-03-16', 8, N'Partner house operation energy near remember blood often learn and deep.'),
(301, 214, 9, '2023-05-07', 7, N'American ready long oil across onto research general.'),
(302, 393, 15, '2023-08-14', 7, N'Table gun bill walk majority firm audience soldier.'),
(303, 528, 8, '2023-07-01', 7, N'Should special finish by treat name join foot and material.'),
(304, 161, 20, '2023-05-13', 8, N'Several success test picture something just Mr PM gas condition morning skill.'),
(305, 246, 20, '2023-03-15', 8, N'Rate employee hear month pick according direction pretty.'),
(306, 8, 8, '2023-03-31', 8, N'Leg about major similar work arrive play.'),
(307, 134, 4, '2023-08-02', 7, N'Turn case official cultural themselves parent base.'),
(308, 130, 9, '2023-04-25', 8, N'Girl that remember claim day data sometimes evidence human add wear ball lead.'),
(309, 92, 18, '2023-07-07', 7, N'Enjoy until degree machine serve eye population after strong team seven.'),
(310, 144, 4, '2023-01-16', 6, N'Tonight compare power wrong hour continue young nothing.'),
(311, 227, 20, '2023-03-26', 8, N'Feel push entire hand during put term respond reduce health avoid area kid.'),
(312, 348, 13, '2023-03-01', 8, N'Threat soldier yet decide trade trade teach believe.'),
(313, 142, 2, '2023-03-06', 6, N'Finish media economic sister face heavy woman.'),
(314, 547, 5, '2023-02-20', 6, N'Especially right great win carry senior national behind magazine investment speech on.'),
(315, 177, 4, '2023-04-05', 6, N'Large head top receive issue make usually teacher follow.'),
(316, 125, 11, '2023-04-24', 7, N'Rise organization center suffer give method year level everyone bag memory.'),
(317, 381, 3, '2023-06-12', 6, N'Fill newspaper radio remain should gas ask would food.'),
(318, 127, 10, '2023-03-15', 8, N'Lawyer glass speak economic popular street government current.'),
(319, 285, 20, '2023-04-14', 7, N'Serve happy will kitchen expect poor.'),
(320, 282, 19, '2023-01-22', 8, N'Trial parent space agreement western also actually home cover campaign rate.'),
(321, 283, 11, '2023-05-27', 8, N'Majority music nothing prepare paper share actually property but church capital list.'),
(322, 75, 1, '2023-04-03', 7, N'Fire together good surface week throw federal computer better generation toward.'),
(323, 560, 2, '2023-04-08', 6, N'Risk media various development understand trade.'),
(324, 545, 19, '2023-05-03', 6, N'Executive country its performance understand success system interview give behavior.'),
(325, 116, 14, '2023-07-23', 6, N'Win western civil dinner brother special several tree indicate person prove yourself.'),
(326, 322, 2, '2023-06-18', 7, N'Light hotel foreign huge gun standard each.'),
(327, 512, 3, '2023-04-14', 7, N'Want popular fine wait force between laugh.'),
(328, 252, 6, '2023-05-01', 8, N'Her low doctor war success employee like.'),
(329, 132, 4, '2023-07-29', 6, N'Campaign wear everybody officer fly tend morning pass collection.'),
(330, 255, 4, '2023-05-24', 8, N'Arrive job wide laugh federal night individual live show analysis true teacher start.'),
(331, 471, 12, '2023-08-11', 6, N'Employee add market policy tree sense chair walk stuff break.'),
(332, 451, 11, '2023-03-08', 7, N'Industry focus let exist them whether.'),
(333, 532, 9, '2023-06-21', 7, N'Something own type total how education.'),
(334, 95, 19, '2023-02-09', 8, N'Only it over character woman television school per.'),
(335, 179, 20, '2023-01-12', 8, N'Cultural second trade TV his expert exactly.'),
(336, 277, 17, '2023-02-07', 6, N'Together speak heart together near how.'),
(337, 179, 13, '2023-04-13', 6, N'Student per recent large behind sort part kid beautiful discuss would administration.'),
(338, 305, 18, '2023-01-11', 8, N'Along trade war father painting audience choice.'),
(339, 474, 5, '2023-08-06', 7, N'Every down city economic possible kid discuss particularly truth bad.'),
(340, 532, 8, '2023-07-23', 7, N'Space real center any daughter everyone week.'),
(341, 512, 20, '2023-01-19', 6, N'Expect now them century almost ability within commercial necessary group create.'),
(342, 361, 5, '2023-05-20', 7, N'Want clear I environmental rate rule suddenly member speech him why.'),
(343, 347, 3, '2023-04-02', 6, N'Develop might off issue official owner participant hospital between really evening then our.'),
(344, 209, 5, '2023-08-09', 8, N'Tell thus thing building personal team resource focus parent account.'),
(345, 109, 13, '2023-02-18', 7, N'Student view talk commercial southern control.'),
(346, 230, 2, '2023-08-07', 8, N'Because political develop listen church resource far job choose against name ability anything.'),
(347, 267, 4, '2023-02-11', 8, N'Like civil over lawyer really our clearly.'),
(348, 478, 1, '2023-02-26', 8, N'Both seven pay family way seek country exactly.'),
(349, 179, 9, '2023-07-30', 6, N'Make week send away rather people step special between.'),
(350, 240, 20, '2023-04-10', 7, N'Method out employee future soon per.'),
(351, 251, 20, '2023-04-29', 7, N'Choice style rule action order realize dinner blood million guess understand street they.'),
(352, 42, 9, '2023-05-10', 8, N'Age mind attack successful choose see entire cut memory actually.'),
(353, 460, 4, '2023-04-19', 7, N'Big simply west fact bit physical budget both.'),
(354, 158, 11, '2023-07-12', 7, N'Yard fact drop interesting certain project service stock.'),
(355, 321, 2, '2023-02-10', 8, N'More star wonder down difference happy anything structure.'),
(356, 599, 20, '2023-05-25', 8, N'Financial race serve positive day yet control quite.'),
(357, 344, 18, '2023-06-26', 6, N'Color she give share cover make work serious.'),
(358, 522, 4, '2023-04-29', 8, N'Pattern space prove improve across usually system.'),
(359, 64, 18, '2023-04-03', 6, N'Receive moment woman increase crime notice respond have analysis possible.'),
(360, 114, 8, '2023-05-10', 6, N'Live always deep step present machine lay understand shake environmental discover direction however south.'),
(361, 591, 20, '2023-02-19', 7, N'Interesting go point people traditional already skill.'),
(362, 267, 5, '2023-07-23', 6, N'Become authority anyone decision buy course challenge significant American two region practice move.'),
(363, 288, 7, '2023-05-10', 7, N'Ready explain wall newspaper draw again themselves common.'),
(364, 524, 16, '2023-02-13', 8, N'Benefit appear participant friend partner throughout campaign accept modern hour look citizen.'),
(365, 248, 13, '2023-03-09', 6, N'Country two note draw whole student resource her trade with he range sound.'),
(366, 196, 16, '2023-03-21', 8, N'Would approach in kid understand it general.'),
(367, 301, 11, '2023-06-06', 8, N'Event old because yeah must may operation edge city her people.'),
(368, 309, 19, '2023-07-14', 7, N'Hold base half those fear free avoid evidence later.'),
(369, 439, 2, '2023-03-24', 7, N'Use future land around free TV else but.'),
(370, 238, 1, '2023-06-22', 7, N'Design describe design physical already necessary fight east.'),
(371, 54, 6, '2023-04-18', 7, N'Whole eye full evidence spend check old investment whom head social region college.'),
(372, 17, 13, '2023-08-14', 6, N'Positive generation tend member author wish family for same pay.'),
(373, 417, 18, '2023-07-14', 6, N'Common tax half citizen middle respond newspaper company it pull structure various.'),
(374, 289, 11, '2023-03-30', 6, N'Who build subject area far on security visit movie.'),
(375, 196, 18, '2023-05-08', 7, N'Stuff office will glass nothing model particularly.'),
(376, 293, 5, '2023-06-03', 7, N'Continue ago who study positive over black word.'),
(377, 27, 9, '2023-07-27', 8, N'Garden class general school one area drop my.'),
(378, 426, 20, '2023-01-15', 6, N'Thousand north letter positive marriage put require could.'),
(379, 55, 15, '2023-05-31', 7, N'Mother firm rule American care do total week fall trouble.'),
(380, 159, 8, '2023-04-27', 8, N'Miss fire describe economic medical art blue.'),
(381, 298, 10, '2023-04-02', 7, N'My decision fine stay let first bad other us.'),
(382, 161, 7, '2023-01-05', 7, N'Field these purpose thousand left sing someone whole public threat receive.'),
(383, 173, 9, '2023-04-01', 8, N'Industry state own report hit letter study probably.'),
(384, 510, 8, '2023-05-22', 8, N'Laugh them onto person people especially.'),
(385, 51, 18, '2023-06-05', 7, N'Hear pattern property future seat explain others any although.'),
(386, 4, 3, '2023-02-13', 8, N'Big among mission low growth into maintain.'),
(387, 173, 5, '2023-01-12', 6, N'Continue season few only range remain believe put leader debate.'),
(388, 43, 5, '2023-01-08', 7, N'Particularly attention you state age federal remember but throughout war capital American.'),
(389, 587, 8, '2023-06-19', 6, N'Order exist letter main herself subject really resource ahead skill item space treat.'),
(390, 304, 19, '2023-05-22', 8, N'Member let clearly despite board western across technology public.'),
(391, 174, 4, '2023-02-05', 6, N'Between plant his always very focus newspaper bank.'),
(392, 327, 13, '2023-05-19', 6, N'Center morning nothing heavy former choice level.'),
(393, 372, 18, '2023-05-17', 7, N'Well ago similar pass ability impact be travel apply this run place.'),
(394, 368, 5, '2023-05-15', 7, N'Prepare on strategy maintain buy hair sea.'),
(395, 328, 6, '2023-04-07', 6, N'Reflect among building teacher throughout must least move television ahead among.'),
(396, 217, 9, '2023-03-31', 6, N'Capital against that decision short suddenly after degree loss choice hand final significant.'),
(397, 364, 1, '2023-03-14', 6, N'Want bar interview section success wide cause cultural performance ability western baby and.'),
(398, 186, 15, '2023-04-20', 8, N'Huge too project culture area sound strong central whether.'),
(399, 368, 19, '2023-07-22', 7, N'Space baby act bring movement pull building low.'),
(400, 547, 17, '2023-02-16', 6, N'Teacher food yard or tend word sell list but low scientist whatever model.'),
(401, 360, 14, '2023-05-04', 6, N'Study particularly close approach born material great leg film arm easy bring involve.'),
(402, 29, 3, '2023-08-12', 8, N'Because call quality follow model final.'),
(403, 312, 18, '2023-05-06', 7, N'Focus study series eye any lot north.'),
(404, 324, 9, '2023-07-08', 8, N'Wrong risk television admit consumer trade nation.'),
(405, 350, 1, '2023-03-20', 7, N'Theory training she serious national plant.'),
(406, 551, 20, '2023-07-11', 7, N'Scene than customer number lot become establish whether ahead less.'),
(407, 366, 13, '2023-02-27', 7, N'As some but set paper others skin campaign line sure across.'),
(408, 435, 20, '2023-06-24', 7, N'Once next beyond glass half suffer.'),
(409, 506, 14, '2023-05-05', 8, N'Stuff kind operation if child thank ok.'),
(410, 115, 9, '2023-08-15', 6, N'Tree hit thing Republican staff father staff pressure.'),
(411, 575, 19, '2023-04-04', 8, N'Military PM prevent themselves up dog our experience.'),
(412, 188, 4, '2023-01-28', 6, N'Eat environment like how under American southern situation.'),
(413, 384, 9, '2023-05-20', 7, N'Feel evening water away weight it situation table everybody class could.'),
(414, 16, 19, '2023-04-12', 7, N'Night run ago movie team still kitchen employee one sometimes.'),
(415, 68, 7, '2023-06-15', 6, N'Generation smile carry approach establish weight quickly model amount population dinner.'),
(416, 558, 3, '2023-02-17', 8, N'Report ever bed true on decide poor happen social nothing partner certain or.'),
(417, 430, 7, '2023-02-21', 7, N'Serious parent exactly hard goal much themselves in just light prepare direction Mr.'),
(418, 367, 13, '2023-01-13', 6, N'Peace decision ahead there manager true.'),
(419, 93, 6, '2023-04-20', 8, N'Bring one western data cover news choice nice type let care leader would.'),
(420, 458, 7, '2023-01-15', 8, N'Behavior floor then very everyone soon kid door.'),
(421, 204, 14, '2023-07-04', 7, N'Across degree hit coach walk kitchen fire million.'),
(422, 500, 11, '2023-02-01', 8, N'Conference military place reality style draw.'),
(423, 49, 10, '2023-02-16', 7, N'Change food ability leg not culture cut opportunity.'),
(424, 335, 12, '2023-03-09', 8, N'Often pressure paper field similar truth when official true admit.'),
(425, 577, 12, '2023-04-03', 7, N'Worry old focus American yard west thing reveal at.'),
(426, 45, 1, '2023-07-14', 6, N'Worry computer trial look its easy form operation.'),
(427, 488, 12, '2023-01-23', 6, N'Trip set week traditional soldier station.'),
(428, 22, 2, '2023-06-10', 6, N'Why dinner employee arm major job rule arrive kitchen other almost low worry.'),
(429, 228, 12, '2023-03-17', 7, N'Certain heart including theory both reduce change son conference past.'),
(430, 500, 12, '2023-02-03', 8, N'Treatment increase appear yard feel agree question just real.'),
(431, 405, 14, '2023-01-29', 8, N'Purpose rate music cold learn system west recognize.'),
(432, 174, 13, '2023-02-06', 7, N'Candidate fire activity type box second second dog skill box this dream.'),
(433, 219, 2, '2023-05-02', 8, N'Process capital history glass or list action amount present white life address its.'),
(434, 163, 16, '2023-02-09', 7, N'Car commercial happen hard wait security attorney material wrong standard worry someone later.'),
(435, 43, 18, '2023-05-03', 8, N'Thought lawyer door ago sport listen more Democrat catch kind painting.'),
(436, 270, 11, '2023-02-15', 6, N'Wait hold doctor item low store return.'),
(437, 109, 12, '2023-02-19', 6, N'Office office simple card less save.'),
(438, 360, 14, '2023-03-23', 8, N'Vote pressure color catch participant card second as course husband those staff religious.'),
(439, 525, 15, '2023-07-19', 7, N'Total news result strategy very agree analysis give high.'),
(440, 490, 1, '2023-02-18', 7, N'Guy trade country office owner education.'),
(441, 186, 12, '2023-08-08', 8, N'Environmental someone term machine black baby agreement fly process hair.'),
(442, 469, 7, '2023-06-22', 8, N'Thing total lot writer remain owner realize hard.'),
(443, 176, 18, '2023-01-31', 7, N'House effort response pattern floor final right place serve hear dog.'),
(444, 20, 7, '2023-01-31', 8, N'Deal great head once yourself account result far player participant.'),
(445, 75, 8, '2023-08-04', 7, N'Media meet student kitchen author recent tree point goal such school painting.'),
(446, 7, 15, '2023-01-27', 8, N'Range support improve ability reduce guess fly there four their these relationship.'),
(447, 321, 6, '2023-06-20', 8, N'School appear view respond assume sit.'),
(448, 417, 4, '2023-03-11', 7, N'Painting general prove director know pull suddenly discussion among event whom class.'),
(449, 43, 3, '2023-04-04', 7, N'Ten discover around agree weight administration fall image move he fear itself short.'),
(450, 528, 15, '2023-05-06', 7, N'Expert else energy look view rich put the industry a young dog.'),
(451, 12, 10, '2023-07-14', 7, N'Section better which air fire pay against.'),
(452, 216, 17, '2023-03-08', 8, N'Audience lose fine author own yourself form how issue eight member bring.'),
(453, 23, 1, '2023-02-17', 8, N'Gas attention movement always civil road maybe know.'),
(454, 551, 17, '2023-07-17', 6, N'Month another memory easy safe actually way data.'),
(455, 405, 11, '2023-05-08', 7, N'Politics focus for I leg letter skill.'),
(456, 302, 20, '2023-06-01', 8, N'Deal study detail scene director structure.'),
(457, 586, 9, '2023-01-07', 8, N'Building baby leader three stay employee sister.'),
(458, 310, 18, '2023-04-21', 7, N'Somebody reduce notice star cold still detail.'),
(459, 217, 6, '2023-03-12', 8, N'Economy pretty civil cold even nice.'),
(460, 31, 13, '2023-03-06', 6, N'Month company film organization try say rather last allow life into officer.'),
(461, 342, 14, '2023-04-21', 6, N'Simply boy full accept call not special positive nothing attorney.'),
(462, 371, 5, '2023-03-06', 6, N'Thing next allow author loss consider dream raise old.'),
(463, 511, 6, '2023-04-29', 7, N'And quickly artist account it outside add.'),
(464, 555, 8, '2023-03-11', 7, N'Front cold church base term leg eat sort positive nation team.'),
(465, 227, 19, '2023-03-29', 7, N'Wrong source vote road administration evening talk section ability above happen enjoy how.'),
(466, 192, 13, '2023-06-06', 8, N'Job step section low next clearly magazine pull.'),
(467, 160, 9, '2023-04-30', 6, N'Cup cut tend certainly draw today trouble security.'),
(468, 115, 9, '2023-03-13', 6, N'Own last pass step trade consumer key.'),
(469, 494, 15, '2023-06-04', 8, N'Coach art career body gun college pass thought break determine.'),
(470, 401, 3, '2023-01-22', 7, N'Board goal wind near onto sense view care computer.'),
(471, 175, 10, '2023-01-03', 6, N'Attack remember political serve surface eight exist.'),
(472, 526, 13, '2023-07-03', 6, N'Church wear sea point add end dog commercial science treatment.'),
(473, 85, 7, '2023-03-18', 6, N'Leg pull outside little government seem under bank up try morning score.'),
(474, 443, 12, '2023-08-14', 8, N'Impact avoid television over allow quality anything risk land future.'),
(475, 173, 12, '2023-03-05', 6, N'Specific face something avoid eye foreign approach interview there through enter boy first.'),
(476, 371, 1, '2023-01-12', 7, N'Despite grow health politics memory better two floor pass model child expert away.'),
(477, 65, 6, '2023-08-11', 7, N'Himself condition often eat hard learn hotel line size those she.'),
(478, 229, 19, '2023-03-10', 6, N'Explain at off save find hand me site next threat person.'),
(479, 3, 2, '2023-01-28', 6, N'Something degree charge him national enter book hear source.'),
(480, 573, 1, '2023-04-09', 7, N'Chair stand budget after ever remain cut later.'),
(481, 410, 18, '2023-06-25', 7, N'High education voice country kitchen medical evidence fear summer have each turn have few.'),
(482, 405, 12, '2023-06-04', 7, N'Available four name site score Mrs doctor.'),
(483, 414, 13, '2023-01-20', 8, N'Down far fall put design future.'),
(484, 404, 14, '2023-04-24', 7, N'Produce send film federal current manager bed case piece perform ever claim.'),
(485, 441, 13, '2023-05-08', 8, N'Check agency summer option painting thought sell word style store.'),
(486, 313, 9, '2023-04-08', 7, N'Cultural ok put people them term.'),
(487, 469, 7, '2023-06-05', 6, N'Television measure word herself discuss relate nature later trip.'),
(488, 95, 12, '2023-05-08', 7, N'Debate real suffer garden wide hair surface cup special better lot democratic organization.'),
(489, 433, 14, '2023-08-05', 6, N'Along industry take large everything strong city couple carry much.'),
(490, 499, 15, '2023-03-29', 7, N'Because natural collection mouth evening truth.'),
(491, 591, 19, '2023-08-03', 6, N'Between shake exactly interest many standard dinner learn view paper song election.'),
(492, 375, 6, '2023-02-10', 6, N'Interview tend camera article time sure cut phone capital action it although.'),
(493, 273, 10, '2023-03-15', 8, N'Discover message his wonder serve tax seat author western outside.'),
(494, 516, 14, '2023-08-14', 7, N'Cause behind impact rock seven finally sister know inside career garden century woman.'),
(495, 50, 14, '2023-02-18', 8, N'Structure leg few science least someone kind finish chair.'),
(496, 67, 18, '2023-07-22', 8, N'What too building own event according trouble pretty great after.'),
(497, 7, 4, '2023-07-13', 7, N'Hour success television of marriage design feel ever knowledge mother might agency.'),
(498, 80, 17, '2023-03-09', 7, N'Manage might try rise goal tough participant issue plant from.'),
(499, 100, 3, '2023-05-07', 6, N'There expert treat save offer nice bit everybody song seek mother cold adult job.'),
(500, 18, 5, '2023-01-12', 7, N'Here rise production news kitchen common but not.'),
(501, 284, 13, '2023-06-28', 7, N'Relationship ten there office institution well public role our response own treat.'),
(502, 88, 16, '2023-02-13', 8, N'Along technology claim or single nature public ago.'),
(503, 54, 18, '2023-02-14', 6, N'Interview us it television degree positive rest answer.'),
(504, 590, 2, '2023-05-26', 8, N'Score two data fear lose bar hope community instead main never.'),
(505, 569, 20, '2023-01-06', 6, N'These guy we step Republican inside.'),
(506, 190, 9, '2023-04-15', 6, N'Group value method policy year four above water born policy single successful.'),
(507, 291, 20, '2023-04-22', 7, N'Full doctor bad economy produce figure a Mr quickly despite leg.'),
(508, 474, 10, '2023-04-24', 6, N'Let finish deal word activity goal force gun sing participant.'),
(509, 159, 6, '2023-02-13', 8, N'Head author seem young position keep whether authority concern win.'),
(510, 412, 9, '2023-07-03', 6, N'Strong heavy kid third just apply interest.'),
(511, 369, 1, '2023-05-03', 7, N'Want pretty high choose so you wear manager there would against.'),
(512, 186, 13, '2023-01-04', 7, N'Investment late describe lay learn fish follow director beautiful home expect each.'),
(513, 428, 7, '2023-03-07', 7, N'Million American actually thing low might again.'),
(514, 273, 7, '2023-02-02', 7, N'Industry fill carry concern design financial next east.'),
(515, 520, 18, '2023-05-30', 6, N'Role matter continue Mr threat activity science woman around reach situation.'),
(516, 56, 19, '2023-04-21', 6, N'Unit test I body capital cultural long or certainly.'),
(517, 126, 16, '2023-08-07', 8, N'Operation where task dog voice throughout government.'),
(518, 443, 12, '2023-07-31', 7, N'Sell result his floor growth back very pick evidence space class.'),
(519, 403, 8, '2023-02-02', 7, N'Too tell moment range garden red school particular history.'),
(520, 246, 9, '2023-06-19', 7, N'See method though really show drive true southern term.'),
(521, 291, 4, '2023-08-07', 6, N'Yard much budget tree realize professor yourself control budget nor.'),
(522, 546, 10, '2023-05-31', 8, N'Would adult important point boy hit particular job collection security sense.'),
(523, 510, 16, '2023-07-12', 7, N'Choice anyone treatment point shake material physical my from name represent better end.'),
(524, 153, 3, '2023-06-03', 7, N'Room entire seven least data science blue anything.'),
(525, 496, 1, '2023-07-12', 6, N'Available policy surface across wish international manage hundred by.'),
(526, 549, 7, '2023-07-12', 6, N'Other third to simply expert fear ahead hundred public whole prepare international hit house.'),
(527, 173, 16, '2023-04-06', 7, N'Heavy share carry business join thought bank real agency itself.'),
(528, 329, 19, '2023-07-14', 8, N'Resource vote beautiful partner according focus.'),
(529, 138, 7, '2023-02-26', 8, N'President either personal adult lawyer relationship white lose become bad might join.'),
(530, 323, 3, '2023-01-05', 6, N'Black it type education likely issue happen.'),
(531, 198, 14, '2023-02-05', 6, N'Other fine idea consider large theory charge purpose.'),
(532, 103, 1, '2023-06-11', 6, N'Voice personal off drug draw low.'),
(533, 150, 5, '2023-04-20', 7, N'Family voice house claim pay get performance area effect.'),
(534, 538, 7, '2023-07-01', 8, N'Fact value however camera fund operation dog mean him assume number vote whatever.'),
(535, 436, 17, '2023-02-23', 7, N'I let claim foot reflect focus ten behavior like.'),
(536, 502, 17, '2023-07-14', 8, N'Pass clearly market win trip industry else.'),
(537, 405, 4, '2023-05-25', 7, N'Tell phone experience building assume not TV effect military only even attorney.'),
(538, 305, 14, '2023-01-23', 8, N'Pull defense hospital table similar room at already we own measure.'),
(539, 404, 15, '2023-05-17', 7, N'Key draw black quite suffer return.'),
(540, 78, 2, '2023-02-26', 8, N'Own notice board expect law plant kid particularly.'),
(541, 373, 9, '2023-04-16', 7, N'Person improve see term glass fish nature page bit environment.'),
(542, 215, 20, '2023-04-28', 6, N'Since table artist certainly central bring yourself good election remain figure most decade.'),
(543, 552, 13, '2023-04-07', 6, N'Attack word only available market mind about none card election accept.'),
(544, 360, 1, '2023-02-05', 8, N'Administration challenge fish help spring only interest.'),
(545, 45, 16, '2023-05-10', 7, N'Low allow rock send street throughout hotel than focus foreign enter.'),
(546, 101, 6, '2023-05-27', 8, N'Interesting mind determine sure design outside drug individual cup marriage quality.'),
(547, 527, 7, '2023-05-10', 7, N'Product according political political successful he both yet hot tough yes.'),
(548, 486, 1, '2023-03-09', 6, N'Heavy really organization various fly speech best.'),
(549, 102, 9, '2023-01-04', 8, N'Join I peace before protect south both hair score decision image idea radio.'),
(550, 300, 9, '2023-04-11', 6, N'Eat suggest computer team here student defense against scientist event cut.'),
(551, 113, 19, '2023-03-01', 8, N'American push among financial someone their what do cup beautiful.'),
(552, 2, 9, '2023-02-21', 8, N'Phone training TV new image down thought much.'),
(553, 377, 13, '2023-06-01', 6, N'State question adult range human while economy join lot.'),
(554, 9, 9, '2023-07-19', 6, N'This together whether guy bag center before they generation special service pattern.'),
(555, 23, 9, '2023-01-18', 7, N'Bring tell only painting road oil table political these.'),
(556, 394, 14, '2023-05-31', 8, N'Affect throughout cause church travel carry.'),
(557, 108, 14, '2023-03-16', 7, N'Response head school practice least whose agency likely.'),
(558, 576, 6, '2023-05-01', 6, N'Help trade event theory activity stay everyone give like increase choose.'),
(559, 558, 8, '2023-08-10', 7, N'Up partner consumer cause practice another total.'),
(560, 240, 2, '2023-06-24', 7, N'Record management about second save despite.'),
(561, 163, 7, '2023-05-16', 8, N'Manager happen anything should able media.'),
(562, 536, 2, '2023-02-14', 8, N'Food area pretty dog site support.'),
(563, 375, 13, '2023-01-02', 8, N'Knowledge several see key laugh local place voice.'),
(564, 597, 20, '2023-05-19', 8, N'Various west realize question modern discuss activity usually these sister sure.'),
(565, 229, 12, '2023-06-22', 6, N'Girl reason glass window visit life no action.'),
(566, 566, 20, '2023-08-04', 7, N'Author yeah create remember sometimes value finally team stay trip guess.'),
(567, 354, 12, '2023-06-01', 6, N'Game base finally course throw discuss family prepare answer wife dinner voice ability.'),
(568, 479, 19, '2023-08-07', 6, N'Until particularly mission thank share remember must share.'),
(569, 387, 18, '2023-03-18', 7, N'Whose hot line later poor sometimes as.'),
(570, 564, 18, '2023-05-28', 8, N'Despite only growth this interest event reveal instead simply.'),
(571, 224, 7, '2023-02-06', 8, N'How college save international suffer think else build friend voice bank pressure security.'),
(572, 136, 11, '2023-07-01', 7, N'Compare American husband turn religious then hospital catch believe.'),
(573, 350, 4, '2023-02-26', 8, N'Good two figure other note near window.'),
(574, 164, 1, '2023-05-24', 7, N'Several beautiful sense much director performance week eye bed.'),
(575, 100, 8, '2023-03-07', 7, N'Be human work level light anything charge wrong blue see.'),
(576, 1, 8, '2023-03-05', 8, N'Produce attack day area executive own husband nice board many.'),
(577, 227, 7, '2023-04-08', 7, N'Way approach exactly try read threat sister cost.'),
(578, 419, 1, '2023-01-06', 8, N'Vote resource ball short where hope.'),
(579, 277, 11, '2023-07-28', 7, N'Very south government goal worry not benefit tax those door.'),
(580, 8, 20, '2023-01-31', 7, N'Provide seem force true would fund probably bed street another capital simple.'),
(581, 280, 11, '2023-05-16', 6, N'Mention western window fill realize hard approach.'),
(582, 65, 13, '2023-02-19', 7, N'Situation choose position carry drive find also sea before little trade probably true.'),
(583, 183, 2, '2023-06-24', 7, N'Ask upon high cost themselves me.'),
(584, 572, 16, '2023-05-04', 7, N'Include radio now answer simply fly much.'),
(585, 424, 6, '2023-08-13', 7, N'Sort somebody major fill cold adult student arrive allow.'),
(586, 141, 2, '2023-06-23', 6, N'Apply include dog minute heart fish wear watch even tonight minute.'),
(587, 69, 7, '2023-06-03', 6, N'Yourself team window career front popular tonight report yet.'),
(588, 423, 1, '2023-02-21', 6, N'Budget whether new step recognize size push.'),
(589, 259, 8, '2023-01-17', 6, N'Beat nice big rock green especially brother meet simple remain tree.'),
(590, 260, 17, '2023-04-14', 8, N'Risk already land late ability international where ready read admit protect lot.'),
(591, 142, 13, '2023-04-26', 8, N'Test meet close image become visit mean first interview.'),
(592, 459, 10, '2023-05-04', 8, N'Unit make wish who bill son writer.'),
(593, 279, 20, '2023-03-15', 8, N'Idea country two government network American traditional right because too film cost.'),
(594, 451, 3, '2023-02-09', 8, N'Decide sure science indeed community task.'),
(595, 22, 4, '2023-06-23', 6, N'Newspaper rich half more nothing staff significant lawyer.'),
(596, 331, 11, '2023-02-19', 8, N'Television because away political wind want.'),
(597, 251, 14, '2023-05-12', 8, N'Those eight or cut itself method country ask.'),
(598, 52, 5, '2023-04-29', 8, N'Really sense economic long on speech national evening knowledge.'),
(599, 591, 12, '2023-05-03', 7, N'Movie between when enjoy significant imagine trip.'),
(600, 425, 12, '2023-01-27', 8, N'Spend face student billion sell Republican stop everything.')