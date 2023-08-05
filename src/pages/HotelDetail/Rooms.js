import React, { useRef } from "react";
import {
  ACCOMMODATION_FACILITIES,
  BED_TYPES,
  ROOM_OPTIONS,
} from "../../constants/filter.constants";
import { icon } from "./Data";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";
import { PAGES } from "../../constants/Link.constants";
import { useNavigate } from "react-router-dom";
import { useForm } from "react-hook-form";
import BannerInput from "../../components/common/BannerInput";
import { BANNER_INPUT } from "../../constants/Variables.constants";
import {
  toggleClass,
  toggleClassNoListener,
} from "../../utils/helpers/ToggleClass";

const Rooms = ({ rooms_data }) => {
  let room = null;
  const pickerForm = useForm();
  const pickerRef = useRef(null);
  const navigate = useNavigate();

  const togglePicker = (target) => {
    target && toggleClassNoListener(target, "active");
  };

  const onPreCheckout = (data, rd) => {
    navigate(
      PAGES.PRE_CHECKOUT +
        `?hotelId=${rd.hotelId}&id=${rd.id}` +
        `&from=${data.start_date}&to=${data.end_date}` +
        `&adult=2&children=1&rooms=2`
    );
  };

  if (Array.isArray(rooms_data)) {
    room = rooms_data.map((rd) => {
      return (
        <div className="room__wrapper" key={`room@${rd.id}`}>
          <h5>{rd.name}</h5>

          <div className="room__content">
            <div className="room__main-infor">
              <h6>Loại phòng</h6>

              <div className="main-infor__img-wrapper">
                {rd.picture.map((rp) => {
                  return (
                    <img src={rp} alt="room_picture" key={`picture@${rp}`} />
                  );
                })}
              </div>
              <button className="main-infor__view-all-img">
                Xem tất cả ảnh
              </button>

              <div className="main-infor__hightlight">
                <img src={BED_TYPES[rd.bedType].ICON} alt="bedtype" />
                <span>{BED_TYPES[rd.bedType].LABEL}</span>
              </div>
              <div className="main-infor__hightlight">
                <img src={icon.roomSizeIcon} alt="room size" />

                <span>Kích thước: {rd.size} ㎡</span>
              </div>
              <div className="main-infor__hightlight" style={{ opacity: 1 }}>
                <img src={icon.viewIcon} alt="view" />

                <span>{rd.roomView}</span>
              </div>
            </div>
            <div className="room__facilities-services">
              <h6>Giá này đã bao gồm</h6>

              <div className="facilities">
                <small>Tiện nghi</small>
                {rd.facility.map((fa) => {
                  return (
                    <div className="facilities__item" key={fa}>
                      <img src={ACCOMMODATION_FACILITIES[fa].ICON} alt="fa" />
                      <p>{ACCOMMODATION_FACILITIES[fa].LABEL}</p>
                    </div>
                  );
                })}
              </div>
              <div className="services">
                <small>Dịch vụ</small>
                {rd.service.map((sv) => {
                  return (
                    <div className="services__item" key={sv}>
                      <i className={ROOM_OPTIONS[sv].ICON}></i>
                      <span>{ROOM_OPTIONS[sv].LABEL}</span>
                    </div>
                  );
                })}
              </div>
            </div>
            <div className="room__description">
              <h6>Mô tả</h6>

              <div className="short__description">
                <p>{rd.roomInfo}</p>
                {rd.vacancy ? (
                  <>
                    <p>
                      <i className="fi fi-sr-bed-alt"></i>
                      Còn trống: {rd.vacancy} phòng
                    </p>
                  </>
                ) : (
                  <div className="no-vacancy">
                    <img src={icon.noVacancyIcon} alt="no-vacancy" />
                  </div>
                )}
              </div>
            </div>
            <div className="room__price">
              <h6>Giá chỉ</h6>

              <div className="price__wrapper">
                <p>
                  <span>
                    {convertNumberToCurrency("vietnamdong", rd.price)}
                  </span>{" "}
                  / đêm
                </p>
                <button
                  onClick={() => toggleClass(pickerRef.current)}
                  className={rd.vacancy ? "booking" : "change"}
                >
                  {rd.vacancy ? "Đặt phòng ngay" : "Đổi ngày đặt"}
                </button>
              </div>
            </div>
          </div>
          <form
            className="room__pre-checkout-picker"
            ref={pickerRef}
            onSubmit={pickerForm.handleSubmit((data) =>
              onPreCheckout(data, rd)
            )}
          >
            <div className="pre-checkout-picker__title">
              <button
                className="close-btn"
                onClick={() => togglePicker(pickerRef.current)}
                type="button"
              >
                <i className="fi fi-rr-left"></i>
              </button>
              <p>Thông tin cần thiết</p>
              <div></div>
            </div>
            <div className="criteria-board__input-wrapper">
              <BannerInput
                name={BANNER_INPUT.DATE_TIME_DOUBLE.INPUT_NAME}
                type={BANNER_INPUT.DATE_TIME_DOUBLE.TYPE}
                form={pickerForm}
              />

              <BannerInput
                name={BANNER_INPUT.PEOPLE_AND_ROOM.INPUT_NAME}
                title={BANNER_INPUT.PEOPLE_AND_ROOM.TITLE}
                description={BANNER_INPUT.PEOPLE_AND_ROOM.DESCRIPTION}
                type={BANNER_INPUT.PEOPLE_AND_ROOM.TYPE}
                min={BANNER_INPUT.PEOPLE_AND_ROOM.MIN_VALUE}
                form={pickerForm}
              />
            </div>
            <button type="submit" className="search__submit-btn">
              Xác nhận
            </button>
          </form>
        </div>
      );
    });
  }
  return <>{room}</>;
};

export default Rooms;
