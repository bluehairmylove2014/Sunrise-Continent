import React, { memo } from "react";

// svg image
import star from "../../assets/images/icons/star.svg";

import { combineAddress } from "../../utils/helpers/Address";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";

// hotelData: { id, name, imgUrl, star, rating, location, price, sale }
const HotelCard = ({ hotelData }) => {
  const renderStar = (numberOfStar) => {
    let starList = [];
    for (let i = 0; i < numberOfStar; i++) {
      starList.push(<img src={star} alt="star" key={`star@${i}`} />);
    }
    return starList;
  };

  return (
    <div className="common-component__hotel-card--vertical">
      {/* v: vertical, cc: common-component */}
      <div className="cc-hotel-card__top--v">
        <img src={hotelData.image} alt="hotel" />
      </div>
      <div className="cc-hotel-card__body--v">
        <div className="cc-hotel-card-body__title">
          <h4>{hotelData.name}</h4>
          <button>
            <i className="fi fi-rs-heart"></i>
          </button>
          {/* <i class="fi fi-ss-heart"></i> */}
        </div>
        <div className="cc-hotel-card-body__rating">
          {hotelData.stars && hotelData.stars > 0 && (
            <div className="hotel-card-body-rating__star">
              {renderStar(hotelData.stars)}
            </div>
          )}
          <div className="hotel-card-body-rating__review">
            {/* <small>{hotelData.rating.reviews} reviews</small> */}
            <small>
              {2014} <br /> đánh giá
            </small>
            <div className="rating-review__score">
              <p>{hotelData.rating}</p>
            </div>
          </div>
        </div>
        <div className="cc-hotel-card-body__location">
          <i className="fi fi-ss-map-marker"></i>
          <span>
            {combineAddress(
              hotelData.address,
              hotelData.provinceCity,
              hotelData.country
            )}
          </span>
        </div>
        <div className="cc-hotel-card-body__price">
          <p>Chỉ từ</p>
          <div className="cc-hotel-card-body-price__money">
            <p>{convertNumberToCurrency("vietnamdong", hotelData.price)}</p>
            <small> / đêm</small>
          </div>
        </div>
        <div className="cc-hotel-card-body__interact">
          <button className="cc-hotel-card-body__report-btn">!</button>
          <button className="cc-hotel-card-body__detail-btn">
            Xem chi tiết
            <i className="fi fi-rr-caret-right"></i>
          </button>
        </div>
      </div>
    </div>
  );
};

export default memo(HotelCard);
