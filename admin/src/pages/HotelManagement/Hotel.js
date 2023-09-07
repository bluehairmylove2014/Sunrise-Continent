/* eslint-disable no-unused-vars */
import React, { useRef, useState } from "react";
import { ROOM_OPTIONS } from "../../constants/filter.constants";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";
import { Link } from "react-router-dom";
import { PAGES } from "../../constants/Link.constants";
import { BANNER_INPUT } from "../../constants/Variables.constants";
import { ACCOMMODATION_FACILITIES } from "./../../constants/filter.constants";
import YesNoPopup from "../../components/common/YesNoPopup/YesNoPopup";
import { toggleClassNoListener } from "../../utils/helpers/ToggleClass";
import { useBanHotel } from "../../libs/business-logic/src/lib/hotel/process/hooks/useBanHotel";
import { toast } from "react-hot-toast";

const keys = [
  ...BANNER_INPUT.DATE_TIME_DOUBLE.INPUT_NAME,
  ...BANNER_INPUT.PEOPLE_AND_ROOM.INPUT_NAME,
];

const maxAmenities = 6;
const maxService = 6;
const Hotel = ({ data, criteria }) => {
  const popupRef = useRef(null);
  const [isBanned, setIsBanned] = useState(false);
  const { onBanHotel } = useBanHotel();

  const renderAmenities = (facilities) => {
    if (!Array.isArray(facilities)) return <></>;
    const moreOptions = facilities.length - maxAmenities;
    const result = facilities.slice(0, maxAmenities).map((am) => {
      return (
        <div className="infor__amenity" key={`amenity@${am}`}>
          {ACCOMMODATION_FACILITIES[am].LABEL}
        </div>
      );
    });
    return (
      <>
        {result}
        {moreOptions > 0 ? <p>Và +{moreOptions} dịch vụ khác</p> : <></>}
      </>
    );
  };
  const renderServices = (services) => {
    if (!Array.isArray(services)) return <></>;
    const moreOptions = services.length - maxService;
    const result = services.slice(0, maxService).map((sv) => {
      return (
        <div
          className="infor__service-item"
          key={`service@${ROOM_OPTIONS[sv].LABEL}`}
        >
          <i className={ROOM_OPTIONS[sv].ICON}></i>
          <span>{ROOM_OPTIONS[sv].LABEL}</span>
        </div>
      );
    });

    return (
      <>
        {result}
        {moreOptions > 0 ? <p>Và +{moreOptions} dịch vụ khác</p> : <></>}
      </>
    );
  };
  // const href = isBanned
  //   ? ""
  //   : keys.reduce((acc, value) => {
  //       acc += criteria[value] ? `&${value}=${criteria[value]}` : "";
  //       return acc;
  //     }, `${PAGES.HOTEL_DETAIL}?id=${data.id}`);

  const handleBanHotel = (popupStatus) => {
    if (popupStatus) {
      onBanHotel({
        hotelId: data.accountId,
      })
        .then((msg) => {
          toast.success(msg);
          setIsBanned(true);
        })
        .catch((error) => console.error(error));
    }
    toggleClassNoListener(popupRef.current, "active");
  };
  const handleUnBanHotel = () => {
    setIsBanned(false);
  };

  return (
    <div className={`hotel ${isBanned ? "banned" : ""}`}>
      <div className="hotel__images">
        <img src={data.image} alt="hotel" />
      </div>
      <div className="hotel__infor">
        <h4>{data.name}</h4>
        <div className="infor__location">
          <i className="fi fi-rs-marker"></i>
          <p>{data.address + " " + data.country + " " + data.provinceCity}</p>
        </div>
        <div className="infor__amenities">
          {renderAmenities(data.facilities)}
        </div>
        <div className="infor__services">{renderServices(data.services)}</div>
      </div>
      <div className="hotel__rating-price">
        <div className="hotel__rating">
          <div className="rating__infor">
            <p>Tuyệt vời</p>
            <small>5.460 Nhận xét</small>
          </div>
          <div className="rating__point">{data.rating.toFixed(1)}</div>
        </div>
        <div className="hotel__price">
          <small>Giá trung bình mỗi đêm</small>
          <p className="hotel-price__real">
            {convertNumberToCurrency("vietnamdong", data.price)}
          </p>
        </div>
        {!isBanned ? (
          <div className="hotel__admin-interact">
            <button
              onClick={() => toggleClassNoListener(popupRef.current, "active")}
            >
              <i className="fi fi-bs-ban"></i>
              Cấm
            </button>
          </div>
        ) : (
          <></>
        )}
      </div>
      {isBanned ? (
        <div className="hotel__ban-wrapper">
          <i className="fi fi-bs-ban"></i>
        </div>
      ) : (
        <></>
      )}
      <YesNoPopup
        label={"Xác nhận cấm khách sạn này?"}
        ref={popupRef}
        callback={handleBanHotel}
      />
    </div>
  );
};

export default Hotel;
