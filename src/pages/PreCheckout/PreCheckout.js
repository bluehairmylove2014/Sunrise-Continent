/* eslint-disable react-hooks/exhaustive-deps */
import React, { useRef, useState } from "react";
import {
  useGetHotelDetail,
  useGetRooms,
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
// import { stringifySearchParams } from "../../utils/helpers/params";
import { toast } from "react-hot-toast";
import { toggleClass } from "../../utils/helpers/ToggleClass";
import OrderDetailPicker from "../../components/common/OrderDetailPicker";
import { PAGES } from "../../constants/Link.constants";
import SelectVoucer from "./SelectVoucer";
import { useNavigate } from "react-router-dom";
import { useInitOrder } from "../../libs/business-logic/src/lib/order/process/hooks";
import { getOrderLocalStorage } from "../../libs/business-logic/src/lib/order/process/helpers/localStorageOrder";
import { useEffect } from "react";
import { isEqual } from "lodash";
import { isValidEmail } from "../../utils/validators/email.validator";
import { isValidPhoneNumber } from "../../utils/validators/phoneNumber.validator";
import { useGetUser } from "../../libs/business-logic/src/lib/auth/process/hooks";

const calculateTotal = (rooms, voucher, nightCount, numberOfRoom) => {
  let total = rooms.reduce((acc, roomData) => {
    if (roomData && roomData.price) {
      return acc + roomData.price * nightCount * numberOfRoom;
    }
    return acc;
  }, 0);
  // total -= voucher ? voucher.value * total : 0;
  return total;
};

const PreCheckout = () => {
  const userData = useGetUser();
  const selectedRoomsObject = getOrderLocalStorage();
  const [oldOrderDetail, setOldOrderDetail] = useState(selectedRoomsObject);
  // Extract common fields from the first order
  const {
    hotelId,
    adults,
    childrens,
    numberOfRoom: rooms,
    checkIn: start_date,
    checkOut: end_date,
  } = selectedRoomsObject.orders[0];
  // Map room types to an array of room IDs
  const roomIds = selectedRoomsObject.orders.map((order) => order.roomTypeId);

  const navigate = useNavigate();

  const pickerRef = useRef(null);
  const { onInitOrder } = useInitOrder();

  const { data: hotelData } = useGetHotelDetail(hotelId);
  const allRoomData = useGetRooms(hotelId);
  const roomsData =
    Array.isArray(allRoomData) && Array.isArray(roomIds)
      ? allRoomData.filter((rd) => roomIds.includes(rd.id))
      : [];
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

  const [startDateFormatted, setStartDateFormatted] = useState(
    formatDate(bookingFormValue.start_date)
  );
  const [endDateFormatted, setEndDateFormatted] = useState(
    formatDate(bookingFormValue.end_date)
  );
  const [night, setNight] = useState(
    calcNight(bookingFormValue.start_date, bookingFormValue.end_date)
  );

  const [total, setTotal] = useState(
    calculateTotal(roomsData, sunriseVoucher, night, rooms)
  );

  useEffect(() => {
    if (userData) {
      contactForm.setValue("fullName", userData.fullName);
      typeof userData.dateOfBirth === "string" &&
        userData.dateOfBirth.length > 0 &&
        contactForm.setValue("dob", userData.dateOfBirth.substring(0, 10));
      contactForm.setValue("email", userData.emailAddress);
    }
  }, [userData]);

  useEffect(() => {
    if (selectedRoomsObject && !isEqual(selectedRoomsObject, oldOrderDetail)) {
      setOldOrderDetail(selectedRoomsObject);
    }
  }, [selectedRoomsObject]);

  useEffect(() => {
    setBookingFormValue({
      start_date,
      end_date,
      rooms,
      adults,
      childrens,
    });
    setStartDateFormatted(formatDate(start_date));
    setEndDateFormatted(formatDate(end_date));

    const nightCount = calcNight(start_date, end_date);
    const total = calculateTotal(roomsData, sunriseVoucher, nightCount, rooms);
    setNight(nightCount);
    setTotal(total);
  }, [oldOrderDetail]);

  useEffect(() => {
    setTotal(
      calculateTotal(roomsData, sunriseVoucher, night, bookingFormValue.rooms)
    );
  }, [roomsData, sunriseVoucher]);

  const today = new Date();
  const minDate = new Date(today);
  minDate.setFullYear(minDate.getFullYear() - 18);
  const formattedMinDate = `${minDate.getFullYear()}-${String(
    minDate.getMonth() + 1
  ).padStart(2, "0")}-${String(minDate.getDate()).padStart(2, "0")}`;

  const handleEdit = (data) => {
    // window.history.pushState(
    //   null,
    //   null,
    //   PAGES.PRE_CHECKOUT +
    //     stringifySearchParams({
    //       hotelId,
    //       roomID: roomIds[0],
    //       ...data,
    //     })
    // );
    setStartDateFormatted(formatDate(data.start_date));
    setEndDateFormatted(formatDate(data.end_date));

    const nightCount = calcNight(data.start_date, data.end_date);
    const total = calculateTotal(
      roomsData,
      sunriseVoucher,
      nightCount,
      data.rooms
    );
    setNight(nightCount);
    setTotal(total);

    onInitOrder({
      fullName: null,
      nation: null,
      dateOfBirth: null,
      email: null,
      phoneNumber: null,
      specialNeeds: null,
      notes: null,
      voucherId: null,
      total: null,
      orders: roomsData.map((rdata) => ({
        hotelId: hotelId,
        roomTypeId: rdata.id,
        checkIn: data.start_date,
        checkOut: data.end_date,
        numberOfRoom: data.rooms,
        adults: data.adults,
        childrens: data.childrens,
      })),
    });
    setBookingFormValue(data);
  };
  const getSelectedOptions = (formData) => {
    const selectedOptions = [];

    if (formData.isNeedHighFloor) {
      selectedOptions.push("Tôi muốn phòng ở tầng cao");
    }
    if (formData.isNeedCrib) {
      selectedOptions.push("Thêm nôi trẻ em (phụ phí)");
    }
    if (formData.isNeedBreezeRoom) {
      selectedOptions.push("Tôi muốn phòng hướng gió");
    }
    if (formData.isNeedGoodView) {
      selectedOptions.push("Tôi muốn phòng view đẹp");
    }

    return selectedOptions;
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
    onInitOrder({
      fullName: data.fullName,
      nation: data.nationality,
      dateOfBirth: data.dob,
      email: data.email,
      phoneNumber: data.phone,
      specialNeeds: getSelectedOptions(contactForm.getValues()).join(", "),
      notes: data.otherRequirements,
      voucherId: sunriseVoucher ? sunriseVoucher.voucherId : 0,
      total: Math.floor(
        total - (sunriseVoucher ? sunriseVoucher.value * total : 0)
      ),
      orders: roomsData.map((rdata) => ({
        hotelId: hotelId,
        roomTypeId: rdata.id,
        checkIn: bookingFormValue.start_date,
        checkOut: bookingFormValue.end_date,
        numberOfRoom: bookingFormValue.rooms,
        adults: bookingFormValue.adults,
        childrens: bookingFormValue.childrens,
      })),
    });
    navigate(PAGES.CHECKOUT);
    // navigate(PAGES.SUCCESS_ORDER);
  };
  const onContactFormError = (error) => {
    toast.error(error[Object.keys(error)[0]].message);
  };
  return hotelData && Array.isArray(roomsData) ? (
    <main className="pre-checkout">
      <div className="container">
        <h3>Điền thông tin liên hệ</h3>
        <h3>Thông tin đặt phòng</h3>
        <form
          onSubmit={contactForm.handleSubmit(
            onContactFormSubmit,
            onContactFormError
          )}
          noValidate
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
                <div
                  className="contact__input-data"
                  onClick={(e) => {
                    const dobInput = e.target.querySelector("input");
                    if (dobInput) {
                      dobInput.showPicker();
                    }
                  }}
                >
                  <label htmlFor="dob">Ngày sinh *</label>
                  <input
                    {...field}
                    type="date"
                    id="dob"
                    onFocus={(e) => handleFocus(e.target)}
                    onBlur={(e) => handleBlur(e.target)}
                    max={formattedMinDate}
                    onKeyDown={(e) => e.preventDefault()} // Prevent typing
                    onKeyUp={(e) => e.preventDefault()} // Prevent typing
                  />
                </div>
              )}
            />
            <Controller
              name="email"
              control={contactForm.control}
              rules={{
                required: "Bạn chưa nhập Email kìa",
                validate: (value) =>
                  isValidEmail(value) || "Email không hợp lệ",
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
                validate: (value) =>
                  isValidPhoneNumber(value) || "Số điện thoại không hợp lệ",
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
                checkboxSize={"14px"}
              />
              <Checkbox
                form={contactForm}
                name={"isNeedCrib"}
                label={"Thêm nôi trẻ em (phụ phí)"}
                checkboxSize={"14px"}
              />
              <Checkbox
                form={contactForm}
                name={"isNeedBreezeRoom"}
                label={"Tôi muốn phòng hướng gió"}
                checkboxSize={"14px"}
              />
              <Checkbox
                form={contactForm}
                name={"isNeedGoodView"}
                label={"Tôi muốn phòng view đẹp"}
                checkboxSize={"14px"}
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
                    placeholder="Nhập gì đó đi..."
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
                "Tôi đồng ý với chính sách huỷ đặt phòng của Sunrise Continent"
              }
              checkboxSize={"16px"}
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
                {startDateFormatted.time24 +
                  ", " +
                  startDateFormatted.days +
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
                {endDateFormatted.time24 +
                  ", " +
                  endDateFormatted.days +
                  ", " +
                  endDateFormatted.dateMonthYear}
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
            {Array.isArray(roomsData) ? (
              roomsData.map((rd) => (
                <div className="detail__row" key={rd.id}>
                  <div className="row__label">
                    <span>
                      {bookingFormValue.rooms} phòng x {night} đêm <br />
                      {rd.name}
                    </span>
                  </div>
                  <p className="price primary">
                    {roomsData
                      ? convertNumberToCurrency(
                          "vietnamdong",
                          rd.price * night * bookingFormValue.rooms
                        )
                      : "Đang tính toán"}
                  </p>
                </div>
              ))
            ) : (
              <></>
            )}
            {/* <div className="detail__row">
              <div className="row__label">
                <span>Giảm giá của khách sạn: </span>
              </div>

              <p>Không</p>
            </div> */}
            <div className="detail__row">
              <div className="row__label">
                <span>Thêm voucher: </span>
              </div>
              {sunriseVoucher ? (
                <p className="price fee">
                  -{" "}
                  {convertNumberToCurrency(
                    "vietnamdong",
                    sunriseVoucher ? sunriseVoucher.value * total : 0
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
                  total - (sunriseVoucher ? sunriseVoucher.value * total : 0)
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
        roomDetail={roomsData}
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
