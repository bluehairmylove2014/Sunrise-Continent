import React, { useState } from "react";
import SunriseLoader from "../../components/common/Loader/SunriseLoader";
import { combineAddress } from "../../utils/helpers/Address";
import { pointToLabel } from "../../utils/helpers/Rating";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";
import "../../styles/component/hotelDetail.scss";
import { icon } from "./Data";
import {
  ACCOMMODATION_FACILITIES,
  ROOM_OPTIONS,
} from "../../constants/filter.constants";
// import map_img from "../../assets/images/graphics/image 31.png";
import Rooms from "./Rooms";
import {
  useGetHotelDetail,
  useGetRooms,
} from "../../libs/business-logic/src/lib/hotel/process/hooks";
import Gallery from "../../components/common/Gallery";
import { useGetPictures } from "../../libs/business-logic/src/lib/hotel/process/hooks/useGetPictures";
// import {
//   hotelDetailMockData,
//   pictureMockData,
//   roomsMockData,
// } from "./MockData";

function numberToWord(number) {
  const words = [
    "zero",
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
    "ten",
  ];

  if (number >= 0 && number < words.length) {
    return words[number];
  } else {
    return "Invalid number";
  }
}

const HotelDetail = () => {
  const urlParams = new URLSearchParams(window.location.search);
  const hotelId = urlParams.get("id");
  const { data: hotelData } = useGetHotelDetail(hotelId);
  const roomsData = useGetRooms(hotelId);
  const picturesData = useGetPictures({ id: hotelId });
  // const hotelData = hotelDetailMockData;
  // const roomsData = roomsMockData;
  // const picturesData = pictureMockData;
  const [isGalleryOpen, setIsGalleryOpen] = useState(false);
  const previewImage = picturesData ? [...picturesData.slice(0, 5)] : null;
  const [roomGallery, setRoomGallery] = useState(null);

  const openRoomGallery = (roomPicture) => {
    setRoomGallery(roomPicture);
    setIsGalleryOpen(true);
  };

  const handleCloseGallery = (value) => {
    setIsGalleryOpen(value);
    setTimeout(() => setRoomGallery(null), 500);
  };

  const renderAmenities = (facilities) => {
    if (!Array.isArray(facilities)) return <></>;
    return facilities.map((am) => {
      const icon = ACCOMMODATION_FACILITIES[am].ICON;
      const label = ACCOMMODATION_FACILITIES[am].LABEL;
      return (
        <div
          className="facilities-wrapper"
          key={ACCOMMODATION_FACILITIES[am].LABEL}
        >
          <img src={icon} alt="amentities" />
          <span>{label}</span>
        </div>
      );
    });
  };

  const renderRoomOptions = (room_options) => {
    if (!Array.isArray(room_options)) return <></>;
    return room_options.map((sv) => {
      const icon = ROOM_OPTIONS[sv].ICON;
      const label = ROOM_OPTIONS[sv].LABEL;
      return (
        <div className="room-option-wrapper" key={ROOM_OPTIONS[sv].LABEL}>
          <i className={icon}></i>
          <span>{label}</span>
        </div>
      );
    });
  };

  return hotelData ? (
    <main className="hotel-detail">
      <section className="hotel-detail__overall-wrapper">
        <div className="container">
          <div className="hotel-detail__overall">
            <div className="overall__infor">
              <h4 className="overall-infor__name">{hotelData.name}</h4>
              <p className="overall-infor__address">
                {combineAddress(
                  hotelData.address,
                  hotelData.provinceCity,
                  hotelData.country
                )}
              </p>
              <div className="overall-infor__review">
                <div className="review__point">
                  {hotelData.rating.toFixed(1)}
                </div>
                <div className="review__label">
                  {pointToLabel(hotelData.rating)}
                </div>
                <div className="review__count">{`1250 Reviews`}</div>
              </div>
            </div>
            <div className="overall__booking-price">
              <p className="booking-price__price-per-night">
                <span>
                  {convertNumberToCurrency("vietnamdong", hotelData.price)}
                </span>
                &nbsp;/ night
              </p>
              <div className="booking-price__interact">
                <button>
                  <i className="fi fi-rr-heart"></i>
                  Yêu thích
                </button>
                <button
                  onClick={() =>
                    document
                      .getElementById("rooms-section")
                      .scrollIntoView({ behavior: "smooth" })
                  }
                >
                  Xem phòng ngay
                </button>
              </div>
            </div>
          </div>
        </div>
      </section>
      <div className="container">
        <section
          className={`hotel-detail__gallery ${numberToWord(
            picturesData ? previewImage.length : 0
          )}`}
        >
          {previewImage ? (
            previewImage.map((pi) => (
              <button key={pi.id}>
                <img src={pi.pictureLink} alt={hotelData.name} />
              </button>
            ))
          ) : (
            <></>
          )}

          <button
            className="gallery__view-all-btn"
            onClick={() => setIsGalleryOpen(true)}
          >
            Xem tất cả ảnh
          </button>
        </section>
        <div className="custom-line-template">
          <img src={icon.lineIcon} alt="lineIcon" />
        </div>
        <section className="hotel-detail__description">
          <h3>Giới thiệu</h3>
          <p>{hotelData.description}</p>

          <div className="description__room-options">
            {renderRoomOptions(hotelData.services)}
          </div>

          <div className="description__moreinfo-wrapper">
            <div className="moreinfo-wrapper__amenities">
              <h5>Tiện nghi</h5>
              {renderAmenities(hotelData.facilities)}
            </div>
          </div>
        </section>
        <div className="custom-line-template">
          <img src={icon.lineIcon} alt="lineIcon" />
        </div>
        {/* <section className="hotel-detail__neighborhood">
          <h3>Thành Phố và Khu Vực Lân Cận</h3>

          <img src={map_img} alt="ggmap" />

          <h5>Gần với</h5>

          <div className="neighborhood__location-list">
            <p>
              <span>Nhà thờ Trinity Lutheran của Manhattan</span>
              &nbsp;-&nbsp;
              <span>4 phút</span>&nbsp;đi bộ
            </p>
            <p>
              <span>Nhà thờ St. Michael</span>
              &nbsp;-&nbsp;
              <span>7 phút</span>&nbsp;đi bộ
            </p>
            <p>
              <span>Đài phun nước Hòa bình</span>
              &nbsp;-&nbsp;
              <span>9 phút</span>&nbsp;đi bộ
            </p>
            <p>
              <span>Bảo tàng Nicholas Roerich</span>
              &nbsp;-&nbsp;
              <span>14 phút</span>&nbsp;đi bộ
            </p>
            <p>
              <span>Dinh thự Schinasi</span>
              &nbsp;-&nbsp;
              <span>25 phút</span>&nbsp;đi bộ
            </p>
            <p>
              <span>Leonard Nimoy Thalia tại Symphony Space</span>
              &nbsp;-&nbsp;
              <span>18 phút</span>&nbsp;đi bộ
            </p>
            <p>
              <span>Không gian Giao hưởng</span>
              &nbsp;-&nbsp;
              <span>23 phút</span>&nbsp;đi bộ
            </p>
          </div>
        </section>
        <div className="custom-line-template">
          <img src={icon.lineIcon} alt="lineIcon" />
        </div> */}
        <section className="hotel-detail__reviews">
          <h3>Đánh giá</h3>

          <div className="reviews__total-result">
            <strong>{hotelData.rating.toFixed(1)}</strong>
            <p className="total-result__label">
              {pointToLabel(hotelData.rating)}
            </p>
            <p>
              Dựa trên <span>10,300</span> Đánh giá đã được kiểm định
            </p>
          </div>

          <div className="reviews__user-review">
            <div className="user-review__avatar-wrapper">
              <img
                className="user-review__avatar"
                src={`https://rialloer.sirv.com/Sunrise-Continent/Users/andre-tan-nX0mSJ999Og-unsplash.jpg?cw=60&ch=60&w=60&h=60`}
                alt="user"
              />
            </div>
            <div className="user-review__main">
              <div className="user-review__rating">
                <strong>{hotelData.rating.toFixed(1)}</strong>
                <span className="total-result__label">
                  {pointToLabel(hotelData.rating)}
                </span>
                &nbsp;|&nbsp;
                <p>Nataliya, Tháng 2 2023</p>
              </div>
              <div className="user-review__content">
                <p>
                  Giá rất tốt cho chỗ ở NYC. Phòng rộng rãi và có nhiều chỗ để
                  hành lý. Giường thoải mái và cơ sở vật chất sạch sẽ. Đây là
                  lần đầu tiên tôi đi du lịch một mình và nhờ có ký túc xá HI mà
                  tôi đã có một chuyến đi tuyệt vời. Ký túc xá giúp dễ dàng giao
                  lưu và kết bạn mới. Tôi đã kết bạn với vô số người bạn mới và
                  những người bạn này đã thực hiện chuyến đi của tôi.
                </p>
              </div>
            </div>
          </div>
          <div className="reviews__user-review">
            <div className="user-review__avatar-wrapper">
              <img
                className="user-review__avatar"
                src={`https://rialloer.sirv.com/Sunrise-Continent/Users/Untitled-UaAu9kQf7-transformed.jpeg?cw=60&ch=60&w=60&h=60`}
                alt="user"
              />
            </div>
            <div className="user-review__main">
              <div className="user-review__rating">
                <strong>{hotelData.rating.toFixed(1)}</strong>
                <span className="total-result__label">
                  {pointToLabel(hotelData.rating)}
                </span>
                &nbsp;|&nbsp;
                <p>Nataliya, Tháng 2 2023</p>
              </div>
              <div className="user-review__content">
                <p>
                  Giá rất tốt cho chỗ ở NYC. Phòng rộng rãi và có nhiều chỗ để
                  hành lý. Giường thoải mái và cơ sở vật chất sạch sẽ. Đây là
                  lần đầu tiên tôi đi du lịch một mình và nhờ có ký túc xá HI mà
                  tôi đã có một chuyến đi tuyệt vời. Ký túc xá giúp dễ dàng giao
                  lưu và kết bạn mới. Tôi đã kết bạn với vô số người bạn mới và
                  những người bạn này đã thực hiện chuyến đi của tôi.
                </p>
              </div>
            </div>
          </div>
          <div className="reviews__user-review">
            <div className="user-review__avatar-wrapper">
              <img
                className="user-review__avatar"
                src={`https://rialloer.sirv.com/Sunrise-Continent/Users/IMG_0615-min%20(1).jpg?cw=60&ch=60&w=60&h=60`}
                alt="user"
              />
            </div>
            <div className="user-review__main">
              <div className="user-review__rating">
                <strong>{hotelData.rating.toFixed(1)}</strong>
                <span className="total-result__label">
                  {pointToLabel(hotelData.rating)}
                </span>
                &nbsp;|&nbsp;
                <p>Nataliya, Tháng 2 2023</p>
              </div>
              <div className="user-review__content">
                <p>
                  Giá rất tốt cho chỗ ở NYC. Phòng rộng rãi và có nhiều chỗ để
                  hành lý. Giường thoải mái và cơ sở vật chất sạch sẽ. Đây là
                  lần đầu tiên tôi đi du lịch một mình và nhờ có ký túc xá HI mà
                  tôi đã có một chuyến đi tuyệt vời. Ký túc xá giúp dễ dàng giao
                  lưu và kết bạn mới. Tôi đã kết bạn với vô số người bạn mới và
                  những người bạn này đã thực hiện chuyến đi của tôi.
                </p>

                {/* <div className="content__media">
                  <div className="content__img-wrapper">
                    <img
                      src={`https://rialloer.sirv.com/Sunrise-Continent/hotels/7%20La%20Siesta%20Premium%20Sai%20Gon/408965175.jpg`}
                      alt="review"
                    />
                  </div>
                  <div className="content__img-wrapper max">
                    <img
                      src={`https://rialloer.sirv.com/Sunrise-Continent/hotels/7%20La%20Siesta%20Premium%20Sai%20Gon/462028697.jpg`}
                      alt="review"
                    />
                  </div>
                  <div className="content__img-wrapper">
                    <img
                      src={`https://rialloer.sirv.com/Sunrise-Continent/hotels/7%20La%20Siesta%20Premium%20Sai%20Gon/462028749.jpg`}
                      alt="review"
                    />
                  </div>
                </div> */}
              </div>
            </div>
          </div>

          <div className="reviews__pagination">
            <button disabled={true} className="pagination__coordination">
              Prev
            </button>
            <p>
              {`1`} trên {`8`}
            </p>
            <button disabled={false} className="pagination__coordination">
              Next
            </button>
          </div>
        </section>
        <div className="custom-line-template">
          <img src={icon.lineIcon} alt="lineIcon" />
        </div>
        <section id="rooms-section" className="hotel-detail__rooms">
          <h3>Chọn phòng</h3>

          <Rooms rooms_data={roomsData} openGallery={openRoomGallery} />
        </section>
      </div>
      <Gallery
        data={roomGallery || picturesData}
        isOpen={isGalleryOpen}
        openCallback={handleCloseGallery}
      />
    </main>
  ) : (
    <SunriseLoader />
  );
};

export default HotelDetail;
