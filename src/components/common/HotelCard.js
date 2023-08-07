import React, { memo } from "react";

import star from "../../assets/images/icons/star.svg";
import love from "../../assets/images/icons/add (1).png";

import { combineAddress } from "../../utils/helpers/Address";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";
import "../../styles/common/hotelCard.scss";
import { Link } from "react-router-dom";
import { PAGES } from "../../constants/Link.constants";
import { useWishlist } from "../../libs/business-logic/src/lib/wishlist";
import { toast } from "react-hot-toast";

// hotelData: { id, name, imgUrl, star, rating, location, price, sale }
const HotelCard = ({ hotelData }) => {
  const { addToWishlist } = useWishlist();
  const renderStar = (numberOfStar) => {
    let starList = [];
    for (let i = 0; i < numberOfStar; i++) {
      starList.push(<img src={star} alt="star" key={`star@${i}`} />);
    }
    return starList;
  };
  const handleAddToWishlist = (e, hotel) => {
    e.stopPropagation();
    addToWishlist(hotel)
      .then((message) => {
        toast.success(message);
      })
      .catch((error) => {
        toast.error(error.message);
      });
  };
  return (
    <div className="common-component__hotel-card--vertical">
      <div className="cc-hotel-card__top--v">
        <img src={hotelData.image} alt="hotel" />
      </div>
      <div className="cc-hotel-card__body--v">
        <div className="cc-hotel-card-body__title">
          <h4>{hotelData.name}</h4>
          {/* <button>
            <i className="fi fi-rs-heart"></i>
          </button> */}
          {/* <i className="fi fi-ss-heart"></i> */}
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
              <p>{hotelData.rating.toFixed(1)}</p>
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
          <button
            className="cc-hotel-card-body__detail-btn"
            onClick={(e) => {
              handleAddToWishlist(e, hotelData);
            }}
          >
            <img src={love} alt="love" />
          </button>
          <Link to={PAGES.HOTEL_DETAIL + `?id=${hotelData.id}`}>
            Xem chi tiết
            <i className="fi fi-rr-caret-right"></i>
          </Link>
        </div>
      </div>
    </div>
  );
};

export default memo(HotelCard);
