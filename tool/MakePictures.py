import os
import json
import urllib.parse

def generate_picture_link(hotel_name, image_index):
    encoded_hotel_name = urllib.parse.quote(hotel_name)
    picture_link = f"https://rialloer.sirv.com/Sunrise-Continent/hotels/{encoded_hotel_name}/image_{image_index}.jpeg"
    return picture_link

def main():
    province_city = input("Nhập tên tỉnh thành: ")

    with open('./data.json', 'r', encoding='utf-8') as hotel_data_file:
        hotel_data = json.load(hotel_data_file)
    
    with open('./hotels_with_rooms.json', 'r', encoding='utf-8') as room_data_file:
        room_data = json.load(room_data_file)

    result = []

    for hotel in hotel_data:
        if hotel['provinceCity'] == province_city:
            hotel_id = hotel['id']
            rooms = next((item for item in room_data if item['hotelId'] == hotel_id), None)
            if rooms:
                hotel_name = hotel['name']
                image_directory = f'./hoteldata/{province_city}/images/{hotel_name}/'
                image_files = [f for f in os.listdir(image_directory) if f.endswith('.jpeg')]
                max_images = len(image_files)
                total_rooms = len(rooms['rooms'])

                room_image_counts = [max_images // total_rooms] * total_rooms

                remaining_images = max_images - sum(room_image_counts)
                for i in range(remaining_images):
                    room_image_counts[i] += 1

                image_index = 0
                for room, image_count in zip(rooms['rooms'], room_image_counts):
                    room_id = room['roomId']
                    for _ in range(image_count):
                        picture_link = generate_picture_link(hotel_name, image_index)
                        room_entry = {
                            "hotelId": hotel_id,
                            "roomTypeId": room_id,
                            "id": image_index,
                            "pictureLink": picture_link
                        }
                        result.append(room_entry)
                        image_index += 1

    output_filename = f'room_pictures_{province_city}.json'
    with open(output_filename, 'w', encoding='utf-8') as output_file:
        json.dump(result, output_file, ensure_ascii=False, indent=4)

if __name__ == "__main__":
    main()
