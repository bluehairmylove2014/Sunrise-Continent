import React, { useState } from "react";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";
import { icon, nationality } from "./Data";
import { combineAddress } from "./../../utils/helpers/Address";
import { useGetOrder } from "./../../libs/business-logic/src/lib/order/process/hooks/useGetOrder";
import {
  useGetHotelDetail,
  useGetRooms,
} from "../../libs/business-logic/src/lib/hotel/process/hooks";

import "../../styles/component/successOrder.scss";
import SunriseLoader from "../../components/common/Loader/SunriseLoader";
import { formatDate } from "../../utils/helpers/ShortenDatetime";
import { calcNight } from "../../utils/helpers/Datetime";
import { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { PAGES } from "../../constants/Link.constants";

const calculateTotal = (rooms, voucher, nightCount) => {
  let total = rooms.reduce((acc, roomData) => {
    if (roomData && roomData.price) {
      return acc + roomData.price * nightCount;
    }
    return acc;
  }, 0);

  total -= voucher ? voucher.value : 0;
  return total;
};

const SuccessOrder = () => {
  const selectedRoomsObject = useGetOrder();
  const navigate = useNavigate();
  // Extract common fields from the first order
  const {
    hotelId,
    numberOfRoom: rooms,
    checkIn: start_date,
    checkOut: end_date,
  } = selectedRoomsObject.orders[0];
  // Map room types to an array of room IDs
  const roomIds = selectedRoomsObject.orders.map((order) => order.roomTypeId);
  const { data: hotelData } = useGetHotelDetail(hotelId);
  const allRoomData = useGetRooms(hotelId);
  const roomsData =
    Array.isArray(allRoomData) && Array.isArray(roomIds)
      ? allRoomData.filter((rd) => roomIds.includes(rd.id))
      : [];
  const startDateFormatted = formatDate(start_date);
  const endDateFormatted = formatDate(end_date);
  const night = calcNight(start_date, end_date);
  const [total, setTotal] = useState(0);

  useEffect(() => {
    setTotal(calculateTotal(roomsData, 0, night));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [roomsData]);

  return hotelData && Array.isArray(roomsData) ? (
    <main className="pre-checkout">
      <div className="container">
        <h3>ĐẶT PHÒNG THÀNH CÔNG!</h3>
        <h3>Thông tin đặt phòng</h3>
        <form noValidate>
          <section className="contact">
            <p>
              Họ và tên: <span>{selectedRoomsObject.fullName}</span>
            </p>
            <p>
              Quốc tịch:{" "}
              <span>
                {
                  nationality.find(
                    (n) => n.value === selectedRoomsObject.nation
                  ).label
                }
              </span>
            </p>
            <p>
              Ngày sinh:{" "}
              <span>
                {formatDate(selectedRoomsObject.dateOfBirth).dateMonthYear}
              </span>
            </p>
            <p>
              Email: <span>{selectedRoomsObject.email}</span>
            </p>
            <p>
              Số điện thoại: <span>{selectedRoomsObject.phoneNumber}</span>
            </p>

            <div className="contact__other-option">
              <h5>Yêu cầu riêng cho khách sạn</h5>
              <p>
                Lưu ý tất cả các yêu cầu chỉ được đáp ứng tùy theo khách sạn
              </p>

              {selectedRoomsObject.specialNeeds &&
                selectedRoomsObject.specialNeeds.split(", ").map((sn) => (
                  <div className="other-option__check" key={sn}>
                    <i className="fi fi-sr-checkbox"></i>
                    <span>{sn}</span>
                  </div>
                ))}
            </div>

            <h5>
              <i className="fi fi-br-comment-alt"></i>
              Yêu cầu đặc biệt: <span>hello</span>
            </h5>
          </section>
          <section className="submit">
            <button
              id="checkout"
              type="button"
              onClick={() => navigate(PAGES.HOME)}
            >
              VỀ TRANG CHỦ
            </button>
          </section>
        </form>
        <section className="checkout-infor">
          <div className="checkout-infor__hotel">
            <img src={hotelData.image} alt="htoel-room" />
            <div className="hotel__title">
              <h4>{hotelData.name}</h4>
              <p>
                {combineAddress(
                  hotelData.address,
                  hotelData.provinceCity,
                  hotelData.country
                )}
              </p>
            </div>
          </div>
          <hr />
          <div className="checkout-infor__detail">
            <div className="detail__row">
              <div className="row__label">
                <img src={icon.startDateIcon} alt="start" />
                <span>Ngày nhận phòng:</span>
              </div>

              <p>
                {startDateFormatted.days +
                  ", " +
                  startDateFormatted.dateMonthYear}
              </p>
            </div>
            <div className="detail__row">
              <div className="row__label">
                <img src={icon.startDateIcon} alt="end" />
                <span>Ngày trả phòng:</span>
              </div>

              <p>
                {endDateFormatted.days + ", " + endDateFormatted.dateMonthYear}
              </p>
            </div>
            {/* <div className="detail__row">
              <div className="row__label">
                <img src={icon.guestIcon} alt="guest" />
                <span>Số khách:</span>
              </div>

              <p>
                {adults} người lớn
                {childrens > 0 ? `, ${childrens} trẻ em` : ""}
              </p>
            </div> */}
            <div className="detail__row">
              <div className="row__label">
                <img src={icon.bedIcon} alt="guest" />
                <span>Số phòng:</span>
              </div>

              <p>{rooms} phòng</p>
            </div>
            <hr />
            {Array.isArray(roomsData) ? (
              roomsData.map((rd) => (
                <div className="detail__row" key={rd.id}>
                  <div className="row__label">
                    <span>
                      {rooms} phòng x {night} đêm <br />
                      {rd.name}
                    </span>
                  </div>
                  <p className="price primary">
                    {convertNumberToCurrency("vietnamdong", rd.price * night)}
                  </p>
                </div>
              ))
            ) : (
              <></>
            )}
            <hr />
            <div className="detail__row">
              <div className="row__label">
                <span>Tổng tiền: </span>
              </div>

              <p className="price total">
                {convertNumberToCurrency("vietnamdong", total)}
              </p>
            </div>
          </div>
        </section>
      </div>
    </main>
  ) : (
    <SunriseLoader />
  );
};

export default SuccessOrder;
