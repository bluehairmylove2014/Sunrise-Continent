import random
import json

# Load thông tin từ các tệp đã được tạo
with open("room_names.json", "r") as f:
    room_names = json.load(f)["room_names"]

with open("room_descriptions.json", "r", encoding="utf-8") as f:
    room_descriptions = json.load(f)["room_descriptions"]

# Các giá trị cho mảng room_view
room_views = [
    "Hướng biển", "Hướng núi", "Hướng sân golf", "Hướng thành phố",
    "Hướng hồ bơi", "Hướng vườn hoa", "Hướng sông", "Hướng cảnh quan tự nhiên", "Hướng hồ"
]

# Số lượng khách sạn cần tạo
n_hotels = int(input("Nhập số lượng khách sạn cần tạo: "))

hotels = []

for hotel_id in range(1, n_hotels + 1):
    num_rooms = random.randint(1, 5)  # Số lượng phòng từ 1 tới 5
    hotel_rooms = []
    
    for i in range(1, num_rooms + 1):
        room = {
            "hotelId": hotel_id,
            "roomId": i,
            "name": random.choice(room_names),
            "vacancy": random.randint(1, 5),
            "size": random.randint(20, 45),
            "price": random.randint(200000, 1200000),
            "room_info": random.choice(room_descriptions),
            "room_view": random.sample(room_views, random.randint(1, 3)),
            "bed_type": random.choice(['DOUBLE', 'SINGLE_OR_TWIN', 'LARGE', 'LARGE_DOUBLE', 'BUNK']),
            "picture": ""
        }
        hotel_rooms.append(room)
    
    hotels.append({
        "hotelId": hotel_id,
        "rooms": hotel_rooms
    })

# Lưu dữ liệu vào tệp JSON
with open("hotels_with_rooms.json", "w", encoding="utf-8") as json_file:
    json.dump(hotels, json_file, indent=4, ensure_ascii=False)

print("Các thông tin khách sạn và phòng đã được lưu vào tệp hotels_with_rooms.json")
