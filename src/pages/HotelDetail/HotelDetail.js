import React, { useEffect, useState } from "react";
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
  useGetReview,
} from "../../libs/business-logic/src/lib/hotel/process/hooks";
import Gallery from "../../components/common/Gallery";
import { useGetPictures } from "../../libs/business-logic/src/lib/hotel/process/hooks/useGetPictures";
// import {
//   // hotelDetailMockData,
//   // pictureMockData,
//   // roomsMockData,
//   // hotelReviewMockData,
// } from "./MockData";
import { formatDate } from "../../utils/helpers/ShortenDatetime";
import {
  handleNextPage,
  handlePrevPage,
  isDisableNext,
  isDisablePrev,
  slicePaginationData,
} from "../../utils/helpers/Pagination";
import { useWishlist } from "../../libs/business-logic/src/lib/wishlist/process/hooks";
import { toast } from "react-hot-toast";

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

const maximumPreviewImage = 5;
const maximumReviewPerPage = 4;
const defaultReviewStartPage = 1;

const HotelDetail = () => {
  const { addToWishlist } = useWishlist();
  const urlParams = new URLSearchParams(window.location.search);
  const hotelId = urlParams.get("id");
  const { data: hotelData } = useGetHotelDetail(hotelId);
  const roomsData = useGetRooms(hotelId);
  const picturesData = useGetPictures({ id: hotelId });
  // const hotelData = hotelDetailMockData;
  // const roomsData = roomsMockData;
  // const picturesData = pictureMockData;
  // const hotelReview = hotelReviewMockData;
  const hotelReview = useGetReview({ hotelId });
  const [isGalleryOpen, setIsGalleryOpen] = useState(false);
  const previewImage = picturesData
    ? [...picturesData.slice(0, maximumPreviewImage)]
    : null;
  const [roomGallery, setRoomGallery] = useState(null);
  const [reviewPagination, setReviewPagination] = useState({
    currentPage: 1,
    maxPage: 1,
  });

  useEffect(() => {
    setReviewPagination({
      currentPage: defaultReviewStartPage,
      maxPage: hotelReview
        ? Math.ceil(hotelReview.length / maximumReviewPerPage)
        : defaultReviewStartPage,
    });
  }, [hotelReview]);

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

  const handleAddToWishlist = (e, hotel) => {
    e.stopPropagation();
    addToWishlist(hotel)
      .then((message) => {
        toast.success(message);
      })
      .catch((error) => {
        toast.error(error.message);
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
                <button onClick={(e) => handleAddToWishlist(e, hotelData)}>
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
              <button key={`room` + pi.roomTypeId + `picture` + pi.id}>
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

          {hotelReview ? (
            <>
              <div className="reviews__total-result">
                <strong>{hotelData.rating.toFixed(1)}</strong>
                <p className="total-result__label">
                  {pointToLabel(hotelData.rating)}
                </p>
                <p>
                  Dựa trên <span>{hotelReview.length}</span> đánh giá từ khách
                  hàng
                </p>
              </div>
              {slicePaginationData(
                hotelReview,
                reviewPagination.currentPage,
                reviewPagination.maxPage,
                maximumReviewPerPage
              ).map((hr) => (
                <div className="reviews__user-review" key={hr.id}>
                  <div className="user-review__avatar-wrapper">
                    <img
                      className="user-review__avatar"
                      src={hr.userAvatar}
                      alt="user"
                    />
                  </div>
                  <div className="user-review__main">
                    <div className="user-review__rating">
                      <strong>{hr.points.toFixed(1)}</strong>
                      <span className="total-result__label">
                        {pointToLabel(hr.points)}
                      </span>
                      &nbsp;|&nbsp;
                      <p>
                        {hr.userName}, {formatDate(hr.reviewDate).dateMonthYear}
                      </p>
                    </div>
                    <div className="user-review__content">
                      <p>{hr.content}</p>
                    </div>
                  </div>
                </div>
              ))}

              <div className="reviews__pagination">
                <button
                  disabled={isDisablePrev({
                    currentPage: reviewPagination.currentPage,
                  })}
                  className="pagination__coordination"
                  onClick={() =>
                    handlePrevPage(reviewPagination, setReviewPagination)
                  }
                >
                  Prev
                </button>
                <p>
                  {reviewPagination.currentPage} trên {reviewPagination.maxPage}
                </p>
                <button
                  disabled={isDisableNext({
                    currentPage: reviewPagination.currentPage,
                    maxPage: reviewPagination.maxPage,
                  })}
                  className="pagination__coordination"
                  onClick={() =>
                    handleNextPage(reviewPagination, setReviewPagination)
                  }
                >
                  Next
                </button>
              </div>
            </>
          ) : (
            <></>
          )}
        </section>
        <div className="custom-line-template">
          <img src={icon.lineIcon} alt="lineIcon" />
        </div>
        <section id="rooms-section" className="hotel-detail__rooms">
          <h3>Chọn phòng</h3>

          <Rooms
            hotelData={hotelData}
            roomsData={roomsData}
            openGallery={openRoomGallery}
          />
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
