import random
import json
from datetime import datetime, timedelta

# Function to generate review content
def generate_review_content():
    opening_phrases = [
        "Tôi rất hài lòng với khách sạn này.",
        "Mọi thứ ở đây đều xuất sắc.",
        "Đây là lần đầu tôi đến đây và tôi đã thật sự ấn tượng.",
        "Nơi này thực sự đáng để trải nghiệm.",
        "Khách sạn này đã mang đến cho tôi những trải nghiệm đáng nhớ."
    ]

    aspects = [
        "Phòng ngủ",
        "Dịch vụ",
        "Nhân viên",
        "Vị trí",
        "Ẩm thực",
        "Tiện nghi",
        "Không gian",
        "Giá trị",
        "Không gian công cộng"
    ]

    content = f"{random.choice(opening_phrases)} "
    content += f"Tôi muốn nói về {random.choice(aspects)} của khách sạn. "
    content += f"Tôi cảm thấy {random.choice(['rất hài lòng', 'hài lòng', 'khá hài lòng', 'chưa hài lòng', 'rất không hài lòng'])} về {random.choice(aspects)}. "
    content += f"Không gian ở đây thật sự {random.choice(['đẹp', 'ấn tượng', 'rộng rãi', 'thú vị'])}. "
    content += f"Tôi thích cách {random.choice(['nhân viên', 'dịch vụ'])} phục vụ tận tâm và nhiệt tình. "
    content += f"Tôi đã có {random.choice(['kỳ nghỉ', 'chuyến đi', 'trải nghiệm'])} tuyệt vời tại đây."

    return content

# Main function
def main():
    reviews_data = []

    account_ids = list(range(1, 601))
    current_review_id = 1

    for hotel_id in range(1, 151):
        num_reviews = random.randint(8, 13)  # Generate random number of reviews per hotel

        # Ensure each account can review only once per hotel
        available_account_ids = account_ids.copy()

        for _ in range(num_reviews):
            if not available_account_ids:
                break  # Stop if no more available account IDs

            account_id = random.choice(available_account_ids)
            available_account_ids.remove(account_id)

            review_date = datetime(2014, 1, 1) + timedelta(days=random.randint(1, 700))

            points = round(random.uniform(6.0, 10.0), 1)
            content = generate_review_content()

            review = {
                "reviewId": current_review_id,
                "accountId": str(account_id),
                "hotelId": str(hotel_id),
                "reviewDate": review_date.strftime('%Y-%m-%dT%H:%M:%S.%fZ'),
                "points": points,
                "content": content
            }

            reviews_data.append(review)
            current_review_id += 1

    # Write reviews data to JSON file
    with open('reviews_data.json', 'w', encoding='utf-8') as json_file:
        json.dump(reviews_data, json_file, ensure_ascii=False, indent=4)

if __name__ == "__main__":
    main()
