from bs4 import BeautifulSoup
import re, random, json, requests, os

# Đọc tên lớp từ file JSON
with open('targetClassName.json', 'r') as f:
    class_names = json.load(f)
# Đọc url file JSON
with open('url.json', 'r') as f:
    links = json.load(f)

for link in links:
    url = link

    response = requests.get(url)
    soup = BeautifulSoup(response.content, "html.parser")

    # Lưu nội dung của soup vào một tệp văn bản
    with open("soup_content.txt", "w", encoding="utf-8") as file:
        file.write(str(soup))

    # Đọc nội dung từ tệp và tạo soup mới để xử lý tiếp
    with open("soup_content.txt", "r", encoding="utf-8") as file:
        saved_soup = BeautifulSoup(file.read(), "html.parser")


    # Tên khách sạn
    hotel_name = saved_soup.find("h1").text.strip()

    # Tìm tất cả thẻ img có src chứa "ik.imagekit.io" và đuôi là .jpeg
    img_tags = saved_soup.find_all('img', src=re.compile(r'ik\.imagekit\.io.*\.jpeg'))

    # Lấy các giá trị src chỉ đến .jpeg
    src_list = [re.search(r'(https://ik\.imagekit\.io/.*\.jpeg)', img['src']).group(1) for img in img_tags]

    # Tìm thẻ div có style tương ứng và lấy text bên trong
    def match_style(style):
        if style is None:
            return False
        return "font-family:MuseoSans,-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol;font-size:14px" in style

    description_tag = saved_soup.find('div', style=match_style)
    if description_tag is not None:
        description = description_tag.text.strip()
    else:
        description = ""
    # Lấy địa chỉ
    # Tìm thẻ script chứa JSON
    script_tag = soup.find('script', {'type': 'application/ld+json'})
    if script_tag:
        # Lấy nội dung JSON từ thẻ script
        json_data = json.loads(script_tag.string)

        # Trích xuất thông tin từ JSON
        addressLocality = json_data['address']['addressLocality']
        addressCountry = json_data['address']['addressCountry']
        addressRegion = json_data['address']['addressRegion']
        streetAddress = json_data['address']['streetAddress']


    # Đọc dữ liệu từ tệp JSON hiện có
    with open("data.json", "r", encoding="utf-8") as json_file:
        existing_data = json.load(json_file)

    # Tạo danh sách facilities và services mẫu
    facilities_list = ['BREAKFAST_INCLUDED', 'DINNER_INCLUDED', 'FREE_SNACKS', 'LUNCH_INCLUDED', 'AFTERNOON_TEA']
    services_list = ['SWIMMING_POOL', 'INTERNET', 'PARKING', 'AIRPORT_SHUTTLE', 'GYM', 'RECEPTION_24H', 'FAMILY_FRIENDLY',
                    'NON_SMOKING', 'SPA_SAUNA', 'RESTAURANT', 'SMOKING_AREA', 'PETS_ALLOWED', 'NIGHT_CLUB',
                    'DISABLED_FACILITIES', 'WORK_FACILITIES', 'GOLF_COURSE']

    # Thêm dữ liệu mới vào mảng đã đọc
    new_data = {
        "id": len(existing_data),  # Sử dụng id dựa trên số lượng phần tử trong mảng hiện có
        "name": hotel_name,
        "country": addressCountry,
        "hotelType": "Hotel",
        "provinceCity": addressRegion,
        "address": addressLocality,
        "stars": random.randint(0, 5),
        "rating": round(random.uniform(7.0, 10.0), 1),
        "description": description,
        "image": "",
        "price": random.randint(200000, 1200000),
        "facilities": random.sample(facilities_list, random.randint(1, len(facilities_list))),
        "services": random.sample(services_list, random.randint(1, len(services_list)))
    }

    existing_data.append(new_data)

    # Ghi lại dữ liệu vào tệp JSON
    with open("data.json", "w", encoding="utf-8") as json_file:
        json.dump(existing_data, json_file, indent=4, ensure_ascii=False)

    print("Dữ liệu đã được thêm vào tệp existing_data.json")


    # Tải ảnh
    # Tạo thư mục nếu chưa tồn tại
    folder_path = f'./images/{hotel_name}/'
    os.makedirs(folder_path, exist_ok=True)

    # Tải xuống và lưu ảnh từ danh sách src
    for index, img_src in enumerate(src_list):
        response = requests.get(img_src)
        if response.status_code == 200:
            img_extension = img_src.split('.')[-1]
            img_filename = f'image_{index}.{img_extension}'
            img_path = os.path.join(folder_path, img_filename)

            with open(img_path, 'wb') as img_file:
                img_file.write(response.content)

            print(f"Đã tải xuống và lưu ảnh {img_filename}")
        else:
            print(f"Lỗi khi tải xuống ảnh {img_src}")