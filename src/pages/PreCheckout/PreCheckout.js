import React, { useRef, useState } from "react";
import {
  useGetHotelDetail,
  useGetSpecificRoom,
} from "../../libs/business-logic/src/lib/hotel/process/hooks";
import { Controller, useForm } from "react-hook-form";
import "../../styles/component/preCheckout.scss";
import Checkbox from "../../components/common/Checkbox";
import SunriseLoader from "../../components/common/Loader/SunriseLoader";
import { combineAddress } from "../../utils/helpers/Address";
import { icon, nationality } from "./Data";
import { formatDate } from "../../utils/helpers/ShortenDatetime";
import { calcNight } from "../../utils/helpers/Datetime";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";
// import { calculateDiscountedPrice } from "../../utils/helpers/Discount";
import {
  parseSearchParams,
  stringifySearchParams,
} from "../../utils/helpers/params";
import { toast } from "react-hot-toast";
import { toggleClass } from "../../utils/helpers/ToggleClass";
import OrderDetailPicker from "../../components/common/OrderDetailPicker";
import { PAGES } from "../../constants/Link.constants";
import SelectVoucer from "./SelectVoucer";
import { CONVERSION_FACTOR } from "../../constants/Variables.constants";
import { useNavigate } from "react-router-dom";
import { useInitOrder } from "../../libs/business-logic/src/lib/order/process/hooks";

const PreCheckout = () => {
  const { hotelID, roomID, start_date, end_date, adults, childrens, rooms } =
    parseSearchParams(window.location.search);

  const navigate = useNavigate();

  const pickerRef = useRef(null);
  const { onInitOrder } = useInitOrder();

  const { data: hotelData } = useGetHotelDetail(hotelID);
  const { data: roomData } = useGetSpecificRoom(hotelID, roomID);
  const [sunriseVoucher, setSunriseVoucher] = useState(null);
  const [isChoosingVoucher, setIsChoosingVoucher] = useState(false);

  const contactForm = useForm({
    defaultValues: {
      fullName: "",
      nationality: "",
      dob: "",
      email: "",
      phone: "",
      isPersonalBooking: true,
      isNeedHighFloor: false,
      isNeedCrib: false,
      isNeedBreezeRoom: false,
      isNeedGoodView: false,
      otherRequirements: "",
      isAcceptPolicy: false,
    },
  });
  const [bookingFormValue, setBookingFormValue] = useState({
    start_date,
    end_date,
    rooms,
    adults,
    childrens,
  });
  const bookingForm = useForm({
    defaultValues: bookingFormValue,
  });

  const startDateFormatted = formatDate(bookingFormValue.start_date);
  const endDateFormatted = formatDate(bookingFormValue.end_date);
  const night = calcNight(
    bookingFormValue.start_date,
    bookingFormValue.end_date
  );

  const handleEdit = (data) => {
    setBookingFormValue(data);
    window.history.pushState(
      null,
      null,
      PAGES.PRE_CHECKOUT +
        stringifySearchParams({
          hotelID,
          roomID,
          ...data,
        })
    );
  };

  const handleFocus = (target) => {
    if (target && target.parentNode) {
      const labelEl = target.parentNode.querySelector("label");
      labelEl && labelEl.classList.remove("active");
    }
  };
  const handleBlur = (target) => {
    if (target && target.parentNode) {
      const labelEl = target.parentNode.querySelector("label");
      if (labelEl && !target.value.length) {
        labelEl.classList.add("active");
      }
    }
  };
  const onContactFormSubmit = (data) => {
    if (!data.isAcceptPolicy) {
      toast.error("Hãy đồng ý với điều khoản và chính sách nhé!");
      return;
    }
    navigate(PAGES.CHECKOUT);
    onInitOrder({
      fullName: data.fullName,
      nation: data.nationality,
      dateOfBirth: data.dob,
      email: data.email,
      phoneNumber: data.phone,
      specialNeeds: "",
      notes: data.otherRequirements,
      voucherId: sunriseVoucher ? sunriseVoucher.voucherId : 0,
      total:
        roomData.price * night -
        (sunriseVoucher ? sunriseVoucher.value * CONVERSION_FACTOR.VOUCHER : 0),
      orders: [
        {
          hotelId: hotelID,
          roomTypeId: roomID,
          checkIn: bookingFormValue.start_date,
          checkOut: bookingFormValue.end_date,
          numberOfRoom: bookingFormValue.rooms,
        },
      ],
    });
  };
  const onContactFormError = (error) => {
    toast.error(error[Object.keys(error)[0]].message);
  };
  return hotelData && roomData ? (
    <main className="pre-checkout">
      <div className="container">
        <h3>Điền thông tin liên hệ</h3>
        <h3>Thông tin đặt phòng</h3>
        <form
          onSubmit={contactForm.handleSubmit(
            onContactFormSubmit,
            onContactFormError
          )}
        >
          <section className="contact">
            <Controller
              name="fullName"
              control={contactForm.control}
              rules={{
                required: "Hãy nhập họ và tên",
              }}
              render={({ field }) => (
                <div className="contact__input-data">
                  <label htmlFor="name">Họ và tên *</label>
                  <input
                    {...field}
                    type="text"
                    id="name"
                    onFocus={(e) => handleFocus(e.target)}
                    onBlur={(e) => handleBlur(e.target)}
                  />
                </div>
              )}
            />
            <Controller
              name="nationality"
              control={contactForm.control}
              rules={{
                required: "Hãy chọn quốc tịch",
              }}
              render={({ field }) => (
                <div className="contact__input-data">
                  <label htmlFor="nationality">Quốc tịch *</label>
                  <select
                    {...field}
                    id="nationality"
                    style={{ width: "100%" }}
                    onFocus={(e) => handleFocus(e.target)}
                    onBlur={(e) => handleBlur(e.target)}
                  >
                    <option value="">-- Chọn quốc tịch --</option>
                    {nationality.map((nat) => (
                      <option value={nat.value} key={nat.id}>
                        {nat.label}
                      </option>
                    ))}
                  </select>
                </div>
              )}
            />
            <Controller
              name="dob"
              control={contactForm.control}
              rules={{
                required: "Hãy cho tôi biết ngày sinh của bạn",
              }}
              render={({ field }) => (
                <div className="contact__input-data">
                  <label htmlFor="dob">Ngày sinh *</label>
                  <input
                    {...field}
                    type="date"
                    id="dob"
                    onFocus={(e) => handleFocus(e.target)}
                    onBlur={(e) => handleBlur(e.target)}
                  />
                </div>
              )}
            />
            <Controller
              name="email"
              control={contactForm.control}
              rules={{
                required: "Bạn chưa nhập Email kìa",
              }}
              render={({ field }) => (
                <div className="contact__input-data">
                  <label htmlFor="email">Email *</label>
                  <input
                    {...field}
                    type="email"
                    id="email"
                    onFocus={(e) => handleFocus(e.target)}
                    onBlur={(e) => handleBlur(e.target)}
                  />
                </div>
              )}
            />
            <Controller
              name="phone"
              control={contactForm.control}
              rules={{
                required: "Cho chúng tôi số điện thoại để liên hệ nhé",
              }}
              render={({ field }) => (
                <div className="contact__input-data">
                  <label htmlFor="phone">Số điện thoại *</label>
                  <input
                    {...field}
                    type="text"
                    id="phone"
                    onFocus={(e) => handleFocus(e.target)}
                    onBlur={(e) => handleBlur(e.target)}
                  />
                </div>
              )}
            />
            <Controller
              name="isPersonalBooking"
              control={contactForm.control}
              render={({ field }) => (
                <div className="contact__input-data horizontal">
                  <input
                    {...field}
                    type="radio"
                    id="isPersonalBooking"
                    onFocus={(e) => handleFocus(e.target)}
                    onBlur={(e) => handleBlur(e.target)}
                    defaultChecked={true}
                  />
                  <label htmlFor="isPersonalBooking">
                    Tôi là khách lưu trú
                  </label>
                </div>
              )}
            />
            <Controller
              name="isPersonalBooking"
              control={contactForm.control}
              render={({ field }) => (
                <div className="contact__input-data horizontal">
                  <input
                    {...field}
                    type="radio"
                    id="isBookingForAnother"
                    onFocus={(e) => handleFocus(e.target)}
                    onBlur={(e) => handleBlur(e.target)}
                  />
                  <label htmlFor="isBookingForAnother">
                    Tôi đặt cho người khác
                  </label>
                </div>
              )}
            />

            <div className="contact__other-option">
              <h5>Hãy cho chúng tôi biết Quý khách cần gì?</h5>
              <p>
                Lưu ý tất cả các yêu cầu chỉ được đáp ứng tùy theo khách sạn
              </p>

              <Checkbox
                form={contactForm}
                name={"isNeedHighFloor"}
                label={"Tôi muốn phòng ở tầng cao"}
              />
              <Checkbox
                form={contactForm}
                name={"isNeedCrib"}
                label={"Thêm nôi trẻ em (phụ phí)"}
              />
              <Checkbox
                form={contactForm}
                name={"isNeedBreezeRoom"}
                label={"Tôi muốn phòng hướng gió"}
              />
              <Checkbox
                form={contactForm}
                name={"isNeedGoodView"}
                label={"Tôi muốn phòng view đẹp"}
              />
            </div>

            <h5>
              <i className="fi fi-br-comment-alt"></i>
              Yêu cầu đặc biệt
            </h5>
            <Controller
              name="otherRequirements"
              control={contactForm.control}
              render={({ field }) => (
                <div className="contact__input-data">
                  <textarea
                    {...field}
                    type="text"
                    id="otherRequirements"
                    onFocus={(e) => handleFocus(e.target)}
                    onBlur={(e) => handleBlur(e.target)}
                  />
                </div>
              )}
            />
          </section>
          <section className="policy">
            <h3>Chính sách hủy đặt phòng</h3>
            <div className="policy__content">
              <p>
                Đặt phòng này <b>không thể hoàn tiền và không thể đổi lịch.</b>
              </p>
            </div>
          </section>
          <section className="submit">
            <Checkbox
              form={contactForm}
              name={"isAcceptPolicy"}
              label={
                "Tôi đồng ý với điều khoản và chính sách bảo mật của Sunrise Continent"
              }
            />
            <button id="checkout" type="submit">
              THANH TOÁN NGAY
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
            <div className="detail__row">
              <div className="row__label">
                <img src={icon.guestIcon} alt="guest" />
                <span>Số khách:</span>
              </div>

              <p>
                {bookingFormValue.adults} người lớn
                {bookingFormValue.childrens > 0
                  ? `, ${bookingFormValue.childrens} trẻ em`
                  : ""}
              </p>
            </div>
            <div className="detail__row">
              <div className="row__label">
                <img src={icon.bedIcon} alt="guest" />
                <span>Số phòng:</span>
              </div>

              <p>{bookingFormValue.rooms} phòng</p>
            </div>
            <div className="detail__row">
              <div className="row__label">
                <img src={icon.roomIcon} alt="room" />
                <span>Loại phòng:</span>
              </div>

              <p>{roomData.name}</p>
            </div>
            <div className="detail__row">
              <div className="row__label"></div>

              <button
                className="checkout-infor__edit-btn"
                onClick={() => {
                  toggleClass(pickerRef.current);
                }}
              >
                <i className="fi fi-ss-user-pen"></i>
                Chỉnh sửa
              </button>
            </div>
            <hr />
            <div className="detail__row">
              <div className="row__label">
                <span>
                  {bookingFormValue.rooms} phòng x {night} đêm
                </span>
              </div>

              <p className="price primary">
                {roomData
                  ? convertNumberToCurrency(
                      "vietnamdong",
                      roomData.price * night
                    )
                  : "Đang tính toán"}
              </p>
            </div>
            <div className="detail__row">
              <div className="row__label">
                <span>Giảm giá của khách sạn: </span>
              </div>

              <p>Không</p>
            </div>
            <div className="detail__row">
              <div className="row__label">
                <span>Thêm voucher: </span>
              </div>
              {sunriseVoucher ? (
                <p className="price fee">
                  -{" "}
                  {convertNumberToCurrency(
                    "vietnamdong",
                    // calculateDiscountedPrice(
                    //   roomData.price * night,
                    //   sunriseVoucher.value
                    // ).discountedPrice
                    sunriseVoucher
                      ? sunriseVoucher.value * CONVERSION_FACTOR.VOUCHER
                      : 0
                  )}
                </p>
              ) : (
                <button onClick={() => setIsChoosingVoucher(true)}>
                  <i className="fi fi-br-plus-small"></i>
                  Voucher
                </button>
              )}
            </div>
            <hr />
            <div className="detail__row">
              <div className="row__label">
                <span>Tổng tiền: </span>
              </div>

              <p className="price total">
                {convertNumberToCurrency(
                  "vietnamdong",
                  roomData.price * night -
                    (sunriseVoucher
                      ? sunriseVoucher.value * CONVERSION_FACTOR.VOUCHER
                      : 0)
                  // calculateDiscountedPrice(
                  //   roomData.price * night,
                  //   sunriseVoucher
                  // ).amountToPay
                )}
              </p>
            </div>
          </div>
        </section>
      </div>
      <OrderDetailPicker
        ref={pickerRef}
        form={bookingForm}
        defaultValues={bookingFormValue}
        roomDetail={roomData}
        edit={true}
        editCallback={handleEdit}
      />

      <SelectVoucer
        isOpen={isChoosingVoucher}
        chooseVoucherCallback={(voucher) => {
          setIsChoosingVoucher(false);
          setSunriseVoucher(voucher);
        }}
        closeCallback={() => setIsChoosingVoucher(false)}
      />
    </main>
  ) : (
    <SunriseLoader />
  );
};

export default PreCheckout;
