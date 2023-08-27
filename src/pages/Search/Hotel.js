import React from "react";
import { ROOM_OPTIONS } from "../../constants/filter.constants";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";
import { Link } from "react-router-dom";
import { PAGES } from "../../constants/Link.constants";
import { BANNER_INPUT } from "../../constants/Variables.constants";

const keys = [
  ...BANNER_INPUT.DATE_TIME_DOUBLE.INPUT_NAME,
  ...BANNER_INPUT.PEOPLE_AND_ROOM.INPUT_NAME,
];

const maxAmenities = 6;
const maxService = 6;
const Hotel = ({ data, criteria }) => {
  const renderAmenities = (facilities) => {
    if (!Array.isArray(facilities)) return <></>;
    const moreOptions = facilities.length - maxAmenities;
    const result = facilities.slice(0, maxAmenities).map((am) => {
      return (
        <div className="infor__amenity" key={`amenity@${am}`}>
          {am}
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
  const href = keys.reduce((acc, value) => {
    acc += criteria[value] ? `&${value}=${criteria[value]}` : "";
    return acc;
  }, `${PAGES.HOTEL_DETAIL}?id=${data.id}`);
  return (
    <Link className="hotel" to={href}>
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
          <small>Giá mỗi đêm chỉ từ</small>
          <p className="hotel-price__real">
            {convertNumberToCurrency("vietnamdong", data.price)}
          </p>
        </div>
      </div>
    </Link>
  );
};

export default Hotel;
