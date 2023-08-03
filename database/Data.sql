--USE SunriseDatabase
--GO

--!add account
--!PASSWORD all 123
INSERT INTO ACCOUNT (Id, MemberPoint, AccountRank, Username, PasswordHash, PasswordSalt, UserRole, RefreshToken, TokenCreated, TokenExpires)
VALUES
	(1, 0, 'Bronze', 'lydat', '440845858ea422e948887242c6bca6af1a8cc70cd877988918d0d52a4b9fb4c0ed9191da3a0595f5060a09b2b8cf2aeacaf9abb79ac1fb298dde5ae950df2904', '6c800a76a0105679e522d39b0a465ba96811839f83bec0cc0e30c2bb67eea79c8262d9516dd089b8771d170876e0fd6af69d712be700dd49b53241275429374f0bf87bda716851506aa336bd1bba299eb8bf827f44f71698c6996f077d0da0999a0b26d2c05982ba05cd238b541199a34d6e2614a466c797b7215cdf697e7124', 'User', 'XtOI31UloCVj1Q+vkWy6IaCAXShZPAbj1CRkMaz3g0bQs5opuJcCJmUTycLMvLiz9eGfKEVy6fcHZngBpJdAng==', '2023-07-29 15:04:55.000', '2023-08-05 15:04:55.000'),
	(2, 2000, 'Bronze', 'pdat', 'bca70d4ca388663f93646512552ab70c5488ba133c7837615c9d89300ad79854a82b7a8a7496b1c35d35b1d69d1544d5572fb783dd1740f2d2a1aab4f285ecc4', '0227e48bc45fc5bc97495ab4749b6739be8bb456e4d736fb6b336ae59f358a806f45e8a650e0054f07a93134ae8958c0322d72ce45affc1f1b3bfb892a47bab5ee6c30721747c2ba062c1b1b5302aa732f038f8ea39accbc121c2f00468faca284a5665d74a4db30aa3181cb4d5c26fcca7b7ef3cb93babfc46c19c05456b8f3', 'User', 'jTS5DRZiajENBgENzbuduNQWFcfiKRM5xkCAhC6MKfU7euaOM/lztibDBFSiKpEMlQegGOQ3Wdd8fcEFzzidZg==', '2023-07-29 15:05:05.000', '2023-08-05 15:05:05.000'),
	(3, 0, 'Bronze', 'ccuong', '2cc6c31db2f497490225d38463ca0b270f2dd0c56116fda2a1a2f9eba6f7e110e457cbcab043272fb814c3f41935f9fa992b0a7808ded9b6cdbb857198b215f2', '496038a5134b44d6db8862c2a1b347547a2e85f022f1da76a0952a25168ab6c2d03e2aed318376f0064e5256814be0a5e35eb72578b6651fc1f0aad1f3b7a72a20036c4e59c500a4d2e686f32ba0c97638c3ed7288999fb6c3e5a663b5f0ecdb0327105fd439353f2fb7f912d4edff110c3b6d7998a32fcbc9fbd7a49d222dff', 'User', 'QewWyrz3fgJDsk4BtXt9g5G09/gZoeBD2QSHTkneiUIQb28liKsx+/wgzRM6lIPVLgX+3OgMxLk5f0GNlmJfkg==', '2023-07-29 15:05:12.000', '2023-08-05 15:05:12.000'),
	(4, 0, 'Bronze', 'hahaha', '4994bd74d85bbf489a569abfe539aae4aca15858d9bf7ca4ebcf7669111bdf2ccc8fad334dad91dc13ffe36afaf0f7c4e026c92ef88b2db93b0698e464b7b16c', '409328f444c7024c852cb31c31712b4f5e24b20e1b70294e9b0a38d49792163f4ae4febed332b290549e68d109a17630f396c34d6eda05882c7a0adaf4a7b88d11f38ce84f3def5744991474504fe1884407547bbb2aef1760b1a1fed7e9048662962a2a255e1bb4f065d773c8434376075963390f50b551ca593aab0a8f2585', 'User', 'Rfx29LXCgtG5+BX5dmWDpvb7iGfI4Mni1U+U02gtyWA8bwI+3GRf7lBcePsNXSmI1zQv98jAmuKyOaA8XnJF8A==', '2023-07-29 15:05:18.000', '2023-08-05 15:05:18.000'),
	(5, 0, 'Bronze', 'lydatadmin', 'ab9d7e391f7b72946024c0ef8bfdcdbb22c877db424e57c1f1f39c5d685df6b9984a7538cedd6b9ad2c8dc1fc2dc43ac3258267c7424bfb4c09c859edb95291d', '8f529a952cdba91df9a5c1407205cab49ebf0bb904c21d43c36b70ffcb97f95cedda85ec64d519157c19b240c434c003a5534e70d60767ad9178cbb9a0df41c5cce3829b1bb61435ff314c8a5ea492ec5ec1c20cdbee150ad75a642b5ab14c181fa66065651524112a1a7afea2380b1a09350cd3da4f6f6d3348075e2624764e', 'Admin', 'GNRdoPqqe0rOACGdUvGiBVvO6Tn9QE+oFYl9mLU0826b9ZhBcV82PcEXBo5/Ga0WayUAMDmHhk+RouJevY/BBw==', '2023-07-29 15:08:18.000', '2023-08-05 15:08:18.000'),
	(6, 0, 'Bronze', 'cuong', '8305fc6263d1368bc4885eec60ebbafc2de92a8bbe30c4d1e0f42fb4a5db0b28bfd8ff875c11ea00435354e8d512e9758f45337167afa9bf463e8753fa31eafb', 'c7c7d82b71a6de269485f02ab5a72c62c0ff86697b884c0907b6646f2369597e444887d7d1df9d38ad37065738b9e5404008c46e0fc72446f689d1eb26562c15a90cb56e32eda7bf9eebe270b7816a472cc4f63e3774abbf5f64fb5798d3c93630a831907cdc5561b1137ed342409b59e7039ff43918e4849ddb4833386b6850', 'Admin', 'HtUhZJROVrADoVP5Io1BnCNR4OV3DKOq+oO0Q1/0kTNu+twSx0fYBYe8BgeC4O67GJbLfsxNcn9/waHJvmU5Ug==', '2023-07-29 15:08:30.000', '2023-08-05 15:08:30.000');


------!add personal information
--INSERT INTO PERSONAL_DETAILS VALUES (1, N'Trần Văn A', 'abc@gmail.com', '0966188620', '1990-01-01', N'Nam');
--INSERT INTO PERSONAL_DETAILS VALUES (2, N'Nguyễn Văn B', 'bibizero@gmail.com', '0966188621', '1999-02-01', N'Nữ');
--INSERT INTO PERSONAL_DETAILS VALUES (3, N'Ngô Bá K', 'meme13@gmail.com', '0966188622', '1980-01-03', N'Nam');
--INSERT INTO PERSONAL_DETAILS VALUES (4, N'Lê C', 'titanic9@gmail.com', '0966188623', '1990-01-05', N'Nữ');
--INSERT INTO PERSONAL_DETAILS VALUES (5, N'Trần D', 'gaianime@gmail.com', '0966188624', '1990-01-06', N'Nam');

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
	 N'temp 1');

INSERT INTO HOTEL VALUES(2, N'Nexus House Thao Dien',N'Việt Nam','HOMESTAY',N'Hồ Chí Minh City',
	N'8/9 Võ Trường Toản, An Phú, Quận 2, TP. Hồ Chí Minh, Việt Nam',
 	0, 9.5,
	N'Located 6.3 km from Vietnam History Museum, Nexus House Thao Dien offers a garden, a terrace and air-conditioned accommodation with a balcony and free WiFi.',
	N'temp 2');

INSERT INTO HOTEL VALUES(3, N'Landmark Plus Luxury - Vinhomes Central Park',N'Việt Nam','SINGLE_APARTMENT',N'Hồ Chí Minh City', 
	N'Phường Nguyễn Thái Bình 146- 148 Đường Ký Con, District 1, Ho Chi Minh City, Vietnam',
	0, 8.1, 
	N'Tọa lạc tại Thành phố Hồ Chí Minh, Landmark Plus Luxury - Vinhomes Central Park cung cấp chỗ nghỉ với hồ bơi ngoài trời, khu vườn, sảnh khách chung, sân hiên, quầy bar và tầm nhìn ra thành phố.',
	N'temp 3');

INSERT INTO HOTEL VALUES(4, N'Musketeers Guest House',N'Việt Nam','HOTEL',N'Hà Nội', 
	N'21 Ngõ 67 Tô Ngọc Vân Quảng An, Quận Tây Hồ, Hà Nội, Việt Nam',
	0, 9.7, 
	N'Located in Hanoi, 3.2 km from West Lake, Musketeers Guest House provides accommodation with a shared lounge, free private parking, a terrace and a bar. Among the facilities at this property are a 24-hour front desk and a concierge service, along with free WiFi throughout the property. Guests can enjoy garden views.',
	N'temp 4');

INSERT INTO HOTEL VALUES(5, N'Cristina Boutique Hotel',N'Việt Nam','HOTEL',N'Hà Nội', 
	N'4A Ngõ Phất Lộc, Quận Hoàn Kiếm, Hà Nội, Việt Nam',
	3, 9.1, 
	N'Situated conveniently in the centre of Hanoi, Cristina Boutique Hotel features 3-star accommodation close to Hanoi Old City Gate and Thang Long Water Puppet Theater. This 3-star hotel has air-conditioned rooms with a private bathroom. The accommodation offers a 24-hour front desk, airport transfers, room service and free WiFi.',
	N'temp 5');

INSERT INTO HOTEL VALUES(6, N'SMARANA Hanoi HERITAGE',N'Việt Nam','HOTEL',N'Hà Nội', 
	N'Phường Dịch Vọng Hầu, Quận Cầu Giấy Số 5, Ngõ 82/1 Dịch Vọng Hậu, Cau Giay, Hà Nội, Việt Nam',
	5, 9.7, 
	N'Tọa lạc tại thành phố Hà Nội, cách Bảo tàng Dân tộc học Việt Nam 2,4 km, SMARANA Hanoi HERITAGE có dịch vụ tiền sảnh, phòng nghỉ không hút thuốc, sân hiên, WiFi miễn phí trong toàn bộ khuôn viên và nhà hàng. Khách sạn 5 sao này cung cấp dịch vụ phòng, dịch vụ lễ tân 24 giờ, dịch vụ đưa đón sân bay và dịch vụ cho thuê xe đạp.',
	N'temp 6');

INSERT INTO HOTEL VALUES(7, N'An Hiên Homestay Hội An',N'Việt Nam','HOMESTAY',N'Hội An', 
	N'164 Lý Thái Tổ, phường Cẩm Châu, Cẩm Châu, Hội An, Việt Nam',
	0, 9.6, 
	N'Located in Hoi An, 1.2 km from Hoi An Historic Museum and 1.6 km from Assembly Hall of Chaozhou Chinese Congregation, An Hiên Homestay Hội An provides accommodation with free WiFi, air conditioning, free bikes and a garden.',
	N'temp 7');

INSERT INTO HOTEL VALUES(8, N'iHome Hoi An',N'Việt Nam','HOTEL',N'Hội An', 
	N'54 Nguyễn Tri Phương, Cẩm Nam, Hội An, Việt Nam',
	3, 9.2, 
	N'Tọa lạc tại thành phố Hội An, cách Hội quán Triều Châu 600 m, iHome Hoi An cung cấp chỗ nghỉ với trung tâm thể dục, chỗ đỗ xe riêng miễn phí, sân hiên và quầy bar. Khách sạn 3 sao này có dịch vụ phòng và lễ tân 24 giờ. Sân golf Montgomerie Links và CLB chơi golf Montgomerie Links Vietnam đều nằm trong bán kính 15 km từ khách sạn.',
	N'temp 8');

INSERT INTO HOTEL VALUES(9, N'Florida Nha Trang Hotel',N'Việt Nam','HOTEL',N'Nha Trang', 
	N'66 Quang Trung, Nha Trang, Việt Nam',
	5, 8.4, 
	N'Tọa lạc tại thành phố Nha Trang, cách Bãi biển Nha Trang 1,5 km, Florida Nha Trang Hotel cung cấp chỗ nghỉ với hồ bơi ngoài trời, chỗ đỗ xe riêng miễn phí, trung tâm thể dục và sảnh khách chung. Khách sạn 5 sao này có CLB trẻ em, dịch vụ phòng, WiFi miễn phí, sân hiên và tầm nhìn ra thành phố. Du khách có thể dùng bữa tại nhà hàng hoặc nhâm nhi đồ uống ở quầy bar.',
	N'temp 9');

INSERT INTO HOTEL VALUES(10, N'Crown Hotel Nha Trang',N'Việt Nam','HOTEL',N'Nha Trang', 
	N'19 Dã Tượng, Nha Trang, Việt Nam',
	4, 8.1, 
	N'Tọa lạc tại thành phố Nha Trang, cách Bãi biển Nha Trang 300 m, Crown Hotel Nha Trang cung cấp chỗ nghỉ với trung tâm thể dục, chỗ đỗ xe riêng miễn phí, sảnh khách chung và nhà hàng. Khách sạn 4 sao này có dịch vụ tiền sảnh, bàn đặt tour, lễ tân 24 giờ, dịch vụ đưa đón sân bay, dịch vụ phòng và WiFi miễn phí.',
	N'temp 10');


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
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(1, 2, N'Suite Nhìn Ra Thành Phố', 3, 32, 5670000,
	N'Suite này có 1 giường đôi cực lớn, 1 giường sofa, TV màn hình phẳng, máy điều hòa và ấm đun nước điện,minibar',
	N'Nhìn ra địa danh nổi tiếng,Nhìn ra thành phố',
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(1, 3, N'Suite Junior', 10, 28, 3150000,
	N'Suite này có 1 giường đôi cực lớn, 1 giường sofa, TV màn hình phẳng, máy điều hòa và ấm đun nước điện,minibar',
	N'Nhìn ra thành phố',
	'DOUBLE');

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
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(2, 2, N'Căn Hộ Có Ban Công', 5, 40,2380000,
	N'Căn hộ này có 1 giường đôi lớn,1 giường sofa, có ban công, nhà bếp',
	N'Ban công,Nhìn ra thành phố',
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(2, 3, N'Căn Hộ Studio', 5, 40,2422500,
	N'Căn hộ này có 1 giường đôi lớn,1 giường sofa, có ban công,lối vào riêng,nhà bếp',
	N'Ban công,Nhìn ra thành phố',
	'DOUBLE');

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
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(3, 2, N'Căn Hộ Có Ban Công', 20, 55,2500000,
	N'Căn hộ này có 1 giường đôi lớn,  ban công, sàn lát gạch/đá cẩm thạch và hồ bơi riêng.',
	N'Ban công,Sân hiên,Nhìn ra vườn,Nhìn ra hồ bơi,Nhìn ra địa danh nổi tiếng,Nhìn ra thành phố,Nhìn ra sông,Hướng nhìn sân trong,Sân trong',
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(3, 3, N'Căn Hộ 2 Phòng Ngủ', 8, 79,3240000,
	N'Căn hộ này có 2 giường đôi lớn,ban công, lối vào riêng và bếp nấu ăn.',
	N'Ban công,Sân hiên,Nhìn ra vườn,Nhìn ra hồ bơi,Nhìn ra địa danh nổi tiếng,Nhìn ra thành phố,Nhìn ra sông,Hướng nhìn sân trong,Sân trong',
	'DOUBLE');

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
	'TWIN');

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
	'DOUBLE_OR_TWIN');

INSERT INTO ROOM_TYPE VALUES(5, 3, N'Phòng Gia Đình Có Ban Công', 5, 30,2350000,
	N'Phòng gồm 1 giường đôi và 1 giường đơn, có ấm đun nước điện và máy lạnh.',
	N'Nhìn ra thành phố,Ban Công,Sân hiên',
	'DOUBLE_AND_SINGLE');

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
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(6, 2, N'Suite có giường cỡ King với ban công', 4, 42,5532705,
	N'Phòng gồm 1 giường đôi có ban công, máy pha trà/cà phê và ấm đun nước điện.',
	N'Ban công,Nhìn ra thành phố',
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(6, 3, N'Suite Hạng Tổng Thống', 3, 45, 6036300,
	N'Phòng gồm 1 giường đôi có ban công, hệ thống cách âm và ấm đun nước điện.',
	N'Ban công,Nhìn ra thành phố',
	'DOUBLE');

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
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(7, 2, N'Phòng Tiêu Chuẩn Có Giường Cỡ King', 3, 20,550000,
	N'Phòng giường đôi này có ban công, máy điều hòa và sàn lát gạch/đá cẩm thạch.',
	N'Ban công',
	'DOUBLE');

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
	'SINGLE');

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
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(9, 2, N'Senior Deluxe', 4, 45,2400000 ,
	N'Phòng giường đôi này có ban công, áo choàng tắm, TV truyền hình cáp và đồ nội thất được làm hoàn toàn bằng gỗ tự nhiên.',
	N'Nhìn ra núi,Nhìn ra biển,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(9, 3, N'Phòng Deluxe Giường Đôi/2 Giường Đơn Nhìn Ra Thành Phố', 10,28,1550000,
	N'Phòng giường đôi/2 giường đơn này có áo choàng tắm, minibar, hệ thống cách âm, TV màn hình phẳng và đồ nội thất được làm hoàn toàn bằng gỗ tự nhiên.',
	N'Nhìn ra núi,Nhìn ra thành phố,Nhìn ra địa danh nổi tiếng',
	'DOUBLE');
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
	'DOUBLE');

INSERT INTO ROOM_TYPE VALUES(10, 2, N'Phòng 2 Giường Đơn Nhìn Ra Biển', 5, 26,1650000,
	N'Phòng 2 Giường Đơn này có ban công, khu vực ăn uống và ấm đun nước điện.',
	N'Ban công,Sân hiên,Nhìn ra biển',
	'TWIN');

INSERT INTO ROOM_TYPE VALUES(10, 3, N'Phòng Superior Giường Đôi/2 Giường Đơn Nhìn Ra Thành Phố', 6, 24,1275000,
	N'Phòng Giường Đôi/2 Giường Đơn có ban công, khu vực ghế ngồi và TV truyền hình vệ tinh.',
	N'Ban công,Sân hiên,Nhìn ra thành phố',
	'DOUBLE_OR_TWIN');

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

--todo An Hiên Homestay Hội An
INSERT INTO ROOM_PICTURE VALUES(7,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Deluxe%20cho%203%20Ng%C6%B0%E1%BB%9Di1.jpg');
INSERT INTO ROOM_PICTURE VALUES(7,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Deluxe%20cho%203%20Ng%C6%B0%E1%BB%9Di2.jpg');
INSERT INTO ROOM_PICTURE VALUES(7,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Deluxe%20cho%203%20Ng%C6%B0%E1%BB%9Di3.jpg');

INSERT INTO ROOM_PICTURE VALUES(7,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Pho%CC%80ng%20Ti%C3%AAu%20Chu%C3%A2%CC%89n%20Co%CC%81%20Gi%C6%B0%C6%A1%CC%80ng%20C%C6%A1%CC%83%20King1.jpg');
INSERT INTO ROOM_PICTURE VALUES(7,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Pho%CC%80ng%20Ti%C3%AAu%20Chu%C3%A2%CC%89n%20Co%CC%81%20Gi%C6%B0%C6%A1%CC%80ng%20C%C6%A1%CC%83%20King2.jpg');
INSERT INTO ROOM_PICTURE VALUES(7,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Pho%CC%80ng%20Ti%C3%AAu%20Chu%C3%A2%CC%89n%20Co%CC%81%20Gi%C6%B0%C6%A1%CC%80ng%20C%C6%A1%CC%83%20King3.jpg');

INSERT INTO ROOM_PICTURE VALUES(7,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Superior%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i1.jpg');
INSERT INTO ROOM_PICTURE VALUES(7,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Superior%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i2.jpg');
INSERT INTO ROOM_PICTURE VALUES(7,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/SMARANA%20Hanoi%20HERITAGE/An%20Hi%C3%AAn%20Homestay%20H%E1%BB%99i%20An/Ph%C3%B2ng%20Superior%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i3.jpg');

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

--todo Florida Nha Trang Hotel
INSERT INTO ROOM_PICTURE VALUES(9,1,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Suite1.jpg');
INSERT INTO ROOM_PICTURE VALUES(9,1,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Suite2.jpg');
INSERT INTO ROOM_PICTURE VALUES(9,1,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Suite3.jpg');

INSERT INTO ROOM_PICTURE VALUES(9,2,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Senior%20Deluxe1.jpg');
INSERT INTO ROOM_PICTURE VALUES(9,2,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Senior%20Deluxe2.jpg');
INSERT INTO ROOM_PICTURE VALUES(9,2,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Senior%20Deluxe3.jpg');

INSERT INTO ROOM_PICTURE VALUES(9,3,1,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%911.jpg');
INSERT INTO ROOM_PICTURE VALUES(9,3,2,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%912.jpg');
INSERT INTO ROOM_PICTURE VALUES(9,3,3,'https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/iHome%20Hoi%20An/Florida%20Nha%20Trang%20Hotel/Ph%C3%B2ng%20Deluxe%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C3%B4i.2%20Gi%C6%B0%E1%BB%9Dng%20%C4%90%C6%A1n%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%913.jpg');

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