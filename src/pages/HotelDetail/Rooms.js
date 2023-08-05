import React, { useRef } from "react";
import {
  ACCOMMODATION_FACILITIES,
  BED_TYPES,
  ROOM_OPTIONS,
} from "../../constants/filter.constants";
import { icon } from "./Data";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";
import { PAGES } from "../../constants/Link.constants";
import { useLocation, useNavigate } from "react-router-dom";
import { useForm } from "react-hook-form";
import BannerInput from "../../components/common/BannerInput";
import { BANNER_INPUT } from "../../constants/Variables.constants";
import { toggleClass } from "../../utils/helpers/ToggleClass";
import { parseSearchParams } from "../../utils/helpers/params";
import { useIsLogged } from "../../libs/business-logic/src/lib/auth/process/hooks";
import { setRedirectUrl } from "../../utils/helpers/RedirectUrlSaver";
import { useCheckRoomAvailable } from "../../libs/business-logic/src/lib/hotel/process/hooks/useCheckRoomAvailable";
import { toast } from "react-hot-toast";
import TypingLoader from "../../components/common/Loader/TypingLoader";

const Rooms = ({ rooms_data }) => {
  let room = null;
  const { id, ...dateTimeParams } = parseSearchParams(useLocation().search);
  const pickerFormDefaultValue = {
    start_date: dateTimeParams["start_date"] ?? "",
    end_date: dateTimeParams["end_date"] ?? "",
    rooms: BANNER_INPUT.PEOPLE_AND_ROOM.MIN_VALUE[0],
    adults: BANNER_INPUT.PEOPLE_AND_ROOM.MIN_VALUE[1],
    childrens: BANNER_INPUT.PEOPLE_AND_ROOM.MIN_VALUE[2],
  };
  const pickerForm = useForm({
    defaultValues: pickerFormDefaultValue,
  });
  const pickerRef = useRef(null);
  const navigate = useNavigate();
  const isLoggedIn = useIsLogged();
  const { onCheckRoomAvailable, isLoading: isCheckingRoomAvailable } =
    useCheckRoomAvailable();

  const onPreCheckout = (data, rd) => {
    if (!isLoggedIn) {
      setRedirectUrl(window.location.pathname + window.location.search);
      navigate("/login");
    } else {
      if (data.start_date.length === 0 || data.end_date.length === 0) {
        toast.error("Hãy chọn ngày bắt đầu và ngày kết thúc");
        return;
      }
      // Check room available
      onCheckRoomAvailable({
        HotelId: rd.hotelId,
        RoomTypeId: rd.id,
        NumberOfRoom: data.rooms,
        CheckIn: data.start_date,
        CheckOut: data.end_date,
      })
        .then((message) => {
          toast.success(message);
          navigate(
            PAGES.PRE_CHECKOUT +
              `?hotelID=${rd.hotelId}&roomID=${rd.id}` +
              `&start_date=${data.start_date}&end_date=${data.end_date}` +
              `&adult=${pickerFormDefaultValue.adults}` +
              `&children=${pickerFormDefaultValue.childrens}` +
              `&rooms=${pickerFormDefaultValue.rooms}`
          );
        })
        .catch((error) => {
          toast.error(error.message);
        });
    }
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
                      <b>
                        <i className="fi fi-sr-bed-alt"></i>
                        Còn trống: {rd.vacancy} phòng
                      </b>
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
                  onClick={() => {
                    toggleClass(pickerRef.current);
                  }}
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
            {isCheckingRoomAvailable && (
              <div className="pre-checkout-picker__loading">
                <TypingLoader />
              </div>
            )}
            <div className="pre-checkout-picker__title">
              <button
                className="close-btn"
                onClick={() => {
                  BANNER_INPUT.DATE_TIME_DOUBLE.INPUT_NAME.forEach((iname) =>
                    pickerForm.setValue(iname, pickerFormDefaultValue[iname])
                  );
                  BANNER_INPUT.PEOPLE_AND_ROOM.INPUT_NAME.forEach(
                    (iname, index) =>
                      pickerForm.setValue(
                        iname,
                        BANNER_INPUT.PEOPLE_AND_ROOM.MIN_VALUE[index]
                      )
                  );
                  toggleClass(pickerRef.current);
                }}
                type="button"
              >
                <i className="fi fi-rr-left"></i>
              </button>
              <p>Thông tin cần thiết</p>
              <div></div>
            </div>
            <div className="criteria-board__input-wrapper">
              <h6>Ngày đặt phòng</h6>
              <BannerInput
                name={BANNER_INPUT.DATE_TIME_DOUBLE.INPUT_NAME}
                type={BANNER_INPUT.DATE_TIME_DOUBLE.TYPE}
                form={pickerForm}
                background={"#fdeee6"}
              />
              <br />
              <h6>Chi tiết phòng</h6>
              <BannerInput
                name={BANNER_INPUT.PEOPLE_AND_ROOM.INPUT_NAME}
                title={BANNER_INPUT.PEOPLE_AND_ROOM.TITLE}
                description={BANNER_INPUT.PEOPLE_AND_ROOM.DESCRIPTION}
                type={BANNER_INPUT.PEOPLE_AND_ROOM.TYPE}
                min={BANNER_INPUT.PEOPLE_AND_ROOM.MIN_VALUE}
                form={pickerForm}
                background={"#fdeee6"}
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
