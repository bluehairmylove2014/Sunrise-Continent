import random
import json

# Danh sách các từ ngữ để tạo tên phòng
adjectives = ["Superior", "Deluxe", "Luxury", "Elegant", "Charming", "Cozy", "Spacious", "Modern", "Stylish", "Grand"]
room_types = ["Single", "Double", "Twin", "Triple", "Family", "Suite", "Studio"]
features = ["Ocean View", "City View", "Mountain View", "Poolside", "Garden View", "Executive", "Premium"]

# Số lượng tên phòng cần tạo
n = int(input("Nhập số lượng tên phòng cần tạo: "))

room_names = []

for _ in range(n):
    room_name = random.choice(adjectives) + " " + random.choice(room_types)
    
    # Có một xác suất nhỏ để thêm tính năng
    if random.random() < 0.3:
        room_name += " " + random.choice(features)
    
    room_names.append(room_name)

# Ghi vào tệp JSON
data = {"room_names": room_names}

with open("room_names.json", "w") as json_file:
    json.dump(data, json_file, indent=4)

print("Các tên phòng khách sạn đã được lưu vào tệp room_names.json")
