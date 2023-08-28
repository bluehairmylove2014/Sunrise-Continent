import json

data_array = []

while True:
    input_data = input("Nhập dữ liệu (hoặc 'exit' để kết thúc): ")
    
    if input_data.lower() == 'exit':
        break
    
    data_array.append(input_data)

# Ghi mảng dữ liệu vào tệp JSON
with open('url.json', 'w') as json_file:
    json.dump(data_array, json_file, indent=4)

print("Dữ liệu đã được ghi vào tệp data.json.")
