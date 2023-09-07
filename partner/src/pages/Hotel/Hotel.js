import React, { useEffect, useRef, useState } from "react";
import "../../styles/pages/hotel.scss";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";
import {
  ACCOMMODATION_FACILITIES,
  ROOM_OPTIONS,
} from "../../constants/filter.constants";
import SunriseLoader from "../../components/common/Loader/SunriseLoader";
import Rooms from "../../components/common/Room/Rooms";
import { formatDate } from "../../utils/helpers/ShortenDatetime";
import {
  useGetHotelDetail,
  useGetPictures,
  useGetRooms,
  useGetReview,
} from "../../libs/business-logic/src/lib/hotel/process/hooks";
import { combineAddress } from "../../utils/helpers/Address";
import Gallery from "../../components/common/Gallery/Gallery";
import {
  handleNextPage,
  handlePrevPage,
  isDisableNext,
  isDisablePrev,
  slicePaginationData,
} from "../../utils/helpers/Pagination";
import { pointToLabel } from "../../utils/helpers/Rating";
import { emptyRoom } from "./Data";
import HotelEdit from "../../components/organisms/HotelEdit/HotelEdit";
import { toggleClass } from "../../utils/helpers/ToggleClass";
import { useGetUser } from "../../libs/business-logic/src/lib/auth/process/hooks";
import Empty from "../../components/common/Empty/Empty";
import { generateImageVersion } from "../../utils/helpers/imageVersion";

const maximumReviewPerPage = 4;
const defaultReviewStartPage = 1;

const Hotel = () => {
  const [hotelThumbnailVersion, setHotelThumbnailVersion] = useState(
    generateImageVersion()
  );
  const partnerDetail = useGetUser();
  const hotelId = partnerDetail ? partnerDetail.hotelId : null;
  const hotelData = useGetHotelDetail(hotelId);
  const { data: roomsData, refetch: roomsDataRefetch } = useGetRooms(hotelId);
  const picturesData = useGetPictures({ id: hotelId });
  const [isCreatingRoom, setIsCreatingRoom] = useState(false);
  emptyRoom.hotelId = hotelId;

  const [reviewPagination, setReviewPagination] = useState({
    currentPage: 1,
    maxPage: 1,
  });
  const hotelReview = useGetReview({ hotelId });
  const [isGalleryOpen, setIsGalleryOpen] = useState(false);
  const [roomGallery, setRoomGallery] = useState(null);
  const editHotelRef = useRef(null);

  const openRoomGallery = (roomPicture) => {
    setRoomGallery(roomPicture);
    setIsGalleryOpen(true);
  };
  const handleCloseGallery = (value) => {
    setIsGalleryOpen(value);
    setTimeout(() => setRoomGallery(null), 500);
  };

  useEffect(() => {
    setReviewPagination({
      currentPage: defaultReviewStartPage,
      maxPage: hotelReview
        ? Math.ceil(hotelReview.length / maximumReviewPerPage)
        : defaultReviewStartPage,
    });
  }, [hotelReview]);

  return hotelData && roomsData ? (
    <div className="hotel">
      <div className="hotel__introduction">
        <div className="background">
          <img src={hotelData.image + hotelThumbnailVersion} alt="backgound" />
          <div className="overlay"></div>
          <div className="text">
            <h2>{hotelData.name}</h2>
            <p>{hotelData.description}</p>
          </div>
          <p className="location">
            <span>
              {combineAddress(
                hotelData.address,
                hotelData.provinceCity,
                hotelData.country
              )}
            </span>
            <i className="fi fi-ss-map-marker-check"></i>
          </p>
          <button
            className="gallery"
            onClick={() => openRoomGallery(picturesData)}
          >
            <i className="fi fi-sr-graphic-style"></i>
            <span>Thư viện</span>
          </button>
          <button
            className="edit"
            onClick={() => toggleClass(editHotelRef.current, "active")}
          >
            <i className="fi fi-sr-user-pen"></i>
            <span>Chỉnh sửa</span>
          </button>
        </div>
        <div className="management">
          <div className="amenities">
            <h6>Tiện nghi</h6>
            <div className="amenity__list">
              {hotelData.facilities.length > 0 ? (
                hotelData.facilities.map((am) => (
                  <div className="amenity" key={am}>
                    <img
                      src={ACCOMMODATION_FACILITIES[am].ICON}
                      alt={ACCOMMODATION_FACILITIES[am].ICON}
                    />
                    <p>{ACCOMMODATION_FACILITIES[am].LABEL}</p>
                  </div>
                ))
              ) : (
                <p>Không có dữ liệu</p>
              )}
            </div>
          </div>
          <div className="facilities">
            <h6>Dịch vụ</h6>
            <div className="facility__list">
              {hotelData.services.length > 0 ? (
                hotelData.services.map((fa) => (
                  <div className="facility" key={fa}>
                    <div>
                      <i className={ROOM_OPTIONS[fa].ICON}></i>
                    </div>
                    <p>{ROOM_OPTIONS[fa].LABEL}</p>
                  </div>
                ))
              ) : (
                <p>Không có dữ liệu</p>
              )}
            </div>
          </div>
          <div className="price-and-rating">
            <div className="rating">
              <div className="rating__info">
                <span>Tuyệt vời</span>
                <small>
                  {Array.isArray(hotelReview) ? hotelReview.length : 0} Đánh giá
                </small>
              </div>
              <div className="point">{hotelData.rating.toFixed(2)}</div>
            </div>
            <div className="price">
              <small>Trung bình</small>
              <strong>
                {convertNumberToCurrency("vietnamdong", hotelData.price)} / đêm
              </strong>
            </div>
          </div>
        </div>
      </div>
      <div className="hotel__room-list">
        <h3>
          Danh sách phòng
          <button
            className={isCreatingRoom ? `cancel` : `add`}
            onClick={() => setIsCreatingRoom(!isCreatingRoom)}
          >
            {isCreatingRoom ? `x Huỷ` : `+ Thêm phòng`}
          </button>
        </h3>
        {isCreatingRoom ? (
          <Rooms
            roomsData={emptyRoom}
            openGallery={openRoomGallery}
            hotelData={hotelData}
            closeCreateCallback={() => setIsCreatingRoom(!isCreatingRoom)}
            refetchCallback={roomsDataRefetch}
          />
        ) : (
          <></>
        )}

        {Array.isArray(roomsData) && roomsData.length > 0 ? (
          <Rooms
            roomsData={roomsData}
            openGallery={openRoomGallery}
            hotelData={hotelData}
            refetchCallback={roomsDataRefetch}
          />
        ) : (
          <div className="empty" style={{ marginTop: "2rem" }}>
            <Empty label={"Không có dữ liệu"} />
          </div>
        )}
        {/* <Rooms
          roomsData={roomsData}
          openGallery={openRoomGallery}
          hotelData={hotelData}
        /> */}
      </div>

      <section className="hotel-detail__reviews">
        <h3>Đánh giá</h3>

        {Array.isArray(hotelReview) && hotelReview.length > 0 ? (
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
          <div className="empty" style={{ marginTop: "2rem" }}>
            <Empty label={"Không có dữ liệu"} />
          </div>
        )}
      </section>

      <Gallery
        data={roomGallery || picturesData}
        isOpen={isGalleryOpen}
        openCallback={handleCloseGallery}
      />

      <HotelEdit
        hotelDetail={hotelData}
        ref={editHotelRef}
        callback={() => {
          setHotelThumbnailVersion(generateImageVersion());
        }}
      />
    </div>
  ) : (
    <div className="empty">
      {" "}
      <SunriseLoader />{" "}
    </div>
  );
};

export default Hotel;
