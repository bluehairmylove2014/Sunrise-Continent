import React, { useRef, useState } from "react";
import {
  ACCOMMODATION_FACILITIES,
  BED_TYPES,
  ROOM_OPTIONS,
} from "../../constants/filter.constants";
import { icon } from "./Data";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";
import { useLocation } from "react-router-dom";
import { useForm } from "react-hook-form";
import { toggleClass } from "../../utils/helpers/ToggleClass";
import { parseSearchParams } from "../../utils/helpers/params";
import OrderDetailPicker from "../../components/common/OrderDetailPicker";
import { useAddToCart } from "../../libs/business-logic/src/lib/cart";
import { toast } from "react-hot-toast";
import DotSpinner from "../../components/common/Loader/DotSpinner";

const Rooms = ({ hotelData, roomsData, openGallery }) => {
  let room = null;
  const { id, ...dateTimeParams } = parseSearchParams(useLocation().search);
  const pickerFormDefaultValue = {
    start_date: dateTimeParams["start_date"] ?? "",
    end_date: dateTimeParams["end_date"] ?? "",
    rooms: dateTimeParams["rooms"] ?? 1,
    adults: dateTimeParams["adults"] ?? 1,
    childrens: dateTimeParams["childrens"] ?? 0,
  };
  const pickerForm = useForm({
    defaultValues: pickerFormDefaultValue,
  });
  const [isAddToCartLoading, setIsAddToCartLoading] = useState(false);
  const pickerRef = useRef(null);
  const { onAddToCart } = useAddToCart();

  const handleAddToCart = (rdata) => {
    setIsAddToCartLoading(true);
    onAddToCart({
      hotel: {
        id: hotelData.id,
        inputName: "hotel4",
        name: hotelData.name,
        country: hotelData.country,
        provinceCity: hotelData.provinceCity,
        address: hotelData.address,
        image: hotelData.image,
      },
      room: [
        {
          id: rdata.id,
          inputName: `hotel${hotelData.id}room${rdata.id}`,
          name: rdata.name,
          price: rdata.price,
        },
      ],
    })
      .then((message) => {
        toast.success(message);
      })
      .catch((err) => {
        toast.error(err.message);
      })
      .finally(() => setIsAddToCartLoading(false));
  };

  if (Array.isArray(roomsData)) {
    room = roomsData.map((rd) => {
      return (
        <div className="room__wrapper" key={`room@${rd.id}`}>
          <h5>{rd.name}</h5>

          <div className="room__content">
            <div className="room__main-infor">
              <h6>Loại phòng</h6>

              <div className="main-infor__img-wrapper">
                {rd.picture.map((rp) => {
                  return (
                    <img
                      src={rp.link}
                      alt="room_picture"
                      key={`picture@${rp.id}`}
                    />
                  );
                })}
              </div>
              <button
                className="main-infor__view-all-img"
                onClick={() => openGallery(rd.picture)}
              >
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

                <div className="room-view-wrapper">
                  {rd.roomView
                    .split(",")
                    .slice(0, 3)
                    .map((rv) => (
                      <span key={`room@${rd.id}view@${rv}`}>{rv}</span>
                    ))}
                  {rd.roomView.split(",").length > 3 ? (
                    <span>+ {rd.roomView.split(",").length - 3} more</span>
                  ) : (
                    <></>
                  )}
                </div>
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
                    {/* {pickerForm.getValues().start_date.length &&
                    pickerForm.getValues().end_date.length ? (
                      <p>
                        Kể từ
                        {
                          formatDate(pickerForm.getValues().start_date)
                            .dateMonthYear
                        }
                        đến
                        {
                          formatDate(pickerForm.getValues().end_date)
                            .dateMonthYear
                        }
                      </p>
                    ) : (
                      <></>
                    )} */}
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
                <div className="btn__wrapper">
                  <button
                    onClick={() => {
                      toggleClass(pickerRef.current);
                    }}
                    className={rd.vacancy ? "booking" : "change"}
                  >
                    {rd.vacancy ? "Đặt ngay" : "Đổi ngày"}
                  </button>
                  <button
                    className="cart"
                    disabled={isAddToCartLoading}
                    onClick={() => handleAddToCart(rd)}
                  >
                    {isAddToCartLoading ? (
                      <DotSpinner />
                    ) : (
                      <i className="fi fi-sr-shopping-cart-add"></i>
                    )}
                  </button>
                </div>
              </div>
            </div>
          </div>
          <OrderDetailPicker
            ref={pickerRef}
            form={pickerForm}
            defaultValues={pickerFormDefaultValue}
            roomDetail={rd}
          />
        </div>
      );
    });
  }
  return <>{room}</>;
};

export default Rooms;
