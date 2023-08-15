import React, { useEffect, useState } from "react";
import "../../styles/component/checkout.scss";
import { useGetOrder } from "../../libs/business-logic/src/lib/order/process/hooks";
import { useGetCheckoutUrl } from "../../libs/business-logic/src/lib/checkout/process/hooks";
import sunriseHorizontalLogo from "../../assets/images/logos/sc-horizontal.png";
import { checkoutMethods } from "../../constants/CheckoutMethods";
import {
  useGetHotelDetail,
  useGetSpecificRoom,
} from "../../libs/business-logic/src/lib/hotel/process/hooks";
import { combineAddress } from "../../utils/helpers/Address";
import { formatDate } from "../../utils/helpers/ShortenDatetime";
import SunriseLoader from "../../components/common/Loader/SunriseLoader";
import { calcNight } from "../../utils/helpers/Datetime";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";

// const mockData = {
//   fullName: "Phan Phúc Đạt",
//   nation: "vietnam",
//   dateOfBirth: "2023-08-08",
//   email: "phucdat4102@gmail.com",
//   phoneNumber: "+84337839146",
//   specialNeeds: "",
//   notes: "Không",
//   voucherId: 0,
//   total: 980000,
//   orders: [
//     {
//       hotelId: 1,
//       roomTypeId: 3,
//       checkIn: "2023-08-15T13:37",
//       checkOut: "2023-08-17T13:37",
//       numberOfRoom: 1,
//     },
//   ],
// };

const Checkout = () => {
  const [selectedMethod, setSelectedMethod] = useState(checkoutMethods.VISA.id);
  const orderDetail = useGetOrder();
  // const orderDetail = mockData;
  const hotelId =
    orderDetail && orderDetail.orders[0] ? orderDetail.orders[0].hotelId : null;
  const roomId =
    orderDetail && orderDetail.orders[0]
      ? orderDetail.orders[0].roomTypeId
      : null;
  const { data: hotelData } = useGetHotelDetail(hotelId);
  const { data: roomsData } = useGetSpecificRoom(hotelId, roomId);
  const { onGetCheckoutUrl, isLoading: isGettingCheckoutUrl } =
    useGetCheckoutUrl();

  const momoCheckout = ({ QR }) => {
    return (
      <div className="momo">
        <h6>Cách thanh toán</h6>
        <div className="how-to-checkout">
          <img src={QR} alt="qr" />
        </div>
      </div>
    );
  };

  const handleVisaCheckout = (total) => {
    onGetCheckoutUrl(total)
      .then((data) => {
        window && (window.location.href = data);
      })
      .catch((err) => {
        console.error(err);
      });
  };

  const visaCheckout = ({ total }) => {
    return (
      <div className="visa">
        <h6>Cách thanh toán</h6>
        <div className="how-to-checkout">
          <button
            disabled={isGettingCheckoutUrl}
            onClick={() => handleVisaCheckout(total)}
          >
            {isGettingCheckoutUrl ? `Chờ một chút...` : `Thực hiện thanh toán`}
          </button>
        </div>
      </div>
    );
  };

  return orderDetail && hotelData && roomsData ? (
    <div className="checkout container">
      <div className="checkout__info-wrapper">
        <h6>Thanh toán</h6>
        <div className="checkout__info">
          <nav className="checkout__methods">
            <img src={sunriseHorizontalLogo} alt="sunrise-continent" />
            <hr />
            <ul>
              <li
                className={`${
                  selectedMethod === checkoutMethods.VISA.id ? "active" : ""
                }`}
              >
                <button
                  onClick={() => setSelectedMethod(checkoutMethods.VISA.id)}
                >
                  <img
                    src={checkoutMethods.MASTERCARD.icon}
                    alt="mastercardLogo"
                  />
                  <img src={checkoutMethods.VISA.icon} alt="visaLogo" />
                </button>
              </li>
              <li
                className={`${
                  selectedMethod === checkoutMethods.MOMO.id ? "active" : ""
                }`}
              >
                <button
                  onClick={() => setSelectedMethod(checkoutMethods.MOMO.id)}
                >
                  <img src={checkoutMethods.MOMO.icon} alt="momoLogo" />
                </button>
              </li>
            </ul>
          </nav>
          <div className="checkout__detail">
            {selectedMethod === checkoutMethods.MOMO.id ? (
              momoCheckout({ QR: checkoutMethods.MOMO.qr })
            ) : selectedMethod === checkoutMethods.VISA.id ? (
              visaCheckout({ total: orderDetail.total })
            ) : (
              <></>
            )}
            <div className="checkout__total">
              <p>Tổng tiền:</p>
              <p>
                {convertNumberToCurrency(
                  "vietnamdong",
                  orderDetail ? orderDetail.total : "Đang tính toán"
                )}
              </p>
            </div>
            <div className="checkout__confirm">
              <p>
                Hãy đảm bảo rằng mọi thông tin đều chính xác{" "}
                <b>trước khi xác nhận thanh toán !</b>
              </p>
            </div>
          </div>
        </div>
      </div>
      <div className="checkout__order-wrapper">
        <h6>Thông tin đặt phòng</h6>
        {hotelData && roomsData && orderDetail ? (
          <div className="checkout__order">
            <h6>Kiểm tra thông tin</h6>

            <p>
              <i className="fi fi-ss-hotel"></i>
              {hotelData.name}
            </p>
            <p>
              <i className="fi fi-ss-bed-alt"></i>
              Loại phòng: {roomsData.name}
            </p>
            <p>
              <i className="fi fi-ss-marker"></i>
              {combineAddress(
                hotelData.address,
                hotelData.provinceCity,
                hotelData.country
              )}
            </p>
            <p>
              <i className="fi fi-ss-calendar"></i>
              {formatDate(orderDetail.orders[0].checkIn).dateMonthYear}
              &nbsp;&nbsp; - &nbsp;&nbsp;
              {formatDate(orderDetail.orders[0].checkOut).dateMonthYear}
              &nbsp;&nbsp;
              <b>
                ({" "}
                {calcNight(
                  orderDetail.orders[0].checkIn,
                  orderDetail.orders[0].checkOut
                )}{" "}
                đêm )
              </b>
            </p>
            <p>
              <i className="fi fi-sr-bed"></i>
              Số phòng: <b>{orderDetail.orders[0].numberOfRoom} phòng</b>
            </p>
            <p>
              <i className="fi fi-sr-sack-dollar"></i>
              Đơn giá:{" "}
              <b>
                {convertNumberToCurrency("vietnamdong", roomsData.price)} / đêm
              </b>
            </p>

            <hr />
            <h6>Chi tiết người liên hệ</h6>
            <p>
              <i className="fi fi-ss-user"></i>
              {orderDetail.fullName}
            </p>
            <p>
              <i className="fi fi-sr-phone-call"></i>
              {orderDetail.phoneNumber}
            </p>
            <p>
              <i className="fi fi-sr-envelope"></i>
              {orderDetail.email}
            </p>
            <p>
              <i className="fi fi-sr-calendar"></i>
              {formatDate(orderDetail.dateOfBirth).dateMonthYear}
            </p>
            <p>
              <i className="fi fi-br-world"></i>
              Quốc tịch: {orderDetail.nation}
            </p>
            <p>
              <i className="fi fi-sr-comment-pen"></i>
              Ghi chú: {orderDetail.notes}
            </p>
            <p>
              <i className="fi fi-sr-notebook"></i>
              Yêu cầu đặc biệt:{" "}
              {orderDetail.specialNeeds && orderDetail.specialNeeds.length
                ? orderDetail.specialNeeds
                : "Không"}
            </p>
          </div>
        ) : (
          <div className="loading">
            <SunriseLoader />
          </div>
        )}
      </div>
    </div>
  ) : (
    <SunriseLoader />
  );
};

export default Checkout;
