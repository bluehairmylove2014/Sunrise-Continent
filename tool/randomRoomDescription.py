import random
import json

# Các từ và cụm từ để tạo mô tả phòng
room_descriptors = [
    "Phòng đẹp",
    "Phòng sang trọng",
    "Phòng ấm cúng",
    "Phòng thoải mái",
    "Phòng tiện nghi",
    "Phòng rộng rãi",
    "Phòng yên tĩnh",
    "Phòng có view tuyệt đẹp",
    "Phòng trang nhã",
    "Phòng được trang bị đầy đủ tiện nghi",
    "Phòng ấp áp giữa thiên nhiên xanh",
    "Phòng với không gian thoáng đãng",
    "Phòng tinh tế với nội thất hiện đại",
    "Phòng với không gian làm việc tiện nghi",
]

room_features = [
    "với ban công riêng",
    "và giường đôi lớn",
    "với view ra biển tuyệt đẹp",
    "với không gian làm việc riêng",
    "và khu vực nghỉ dưỡng thoải mái",
    "với phòng tắm riêng tiện nghi",
    "với phòng khách riêng thoải mái",
    "với cửa sổ lớn cho ánh sáng tự nhiên",
    "và bàn làm việc tiện nghi dành cho công việc và học tập",
    "với không gian ấm cúng, đẹp mắt và thoải mái",
    "với không gian nghỉ ngơi tách biệt, tạo cảm giác riêng tư",
    "với trang thiết bị hiện đại và phòng tắm sang trọng",
    "với thiết kế tinh tế kết hợp cùng tiện nghi đẳng cấp",
]

# Số lượng mô tả cần tạo
num_descriptions = int(input("Nhập số lượng mô tả cần tạo: "))

# Tạo danh sách mô tả
descriptions = []

for _ in range(num_descriptions):
    descriptor = random.choice(room_descriptors)
    feature = random.choice(room_features)
    description = f"{descriptor} {feature}."
    descriptions.append(description)

# Ghi vào tệp JSON
data = {"room_descriptions": descriptions}

# Lưu danh sách mô tả vào tệp JSON
with open("room_descriptions.json", "w", encoding="utf-8") as json_file:
    json.dump(data, json_file, ensure_ascii=False, indent=4)

print(f"Các mô tả phòng đã được lưu vào tệp room_descriptions.json")
