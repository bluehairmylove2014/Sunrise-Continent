import React, { memo, useEffect, useState } from 'react';

// svg image
import star from '../../assets/images/icons/star.svg';

// import helper
import {
    calculateDiscountedPrice,
    formatCurrency
} from '../../utils/helpers/Discount'

// hotelData: { id, name, imgUrl, star, rating, location, price, sale }
const HotelCard = ({hotelData}) => {
    // {discountedPrice, amountToPay}
    const [priceDetail, setPriceDetail] = useState([]);

    const renderStar = (numberOfStar) => {
        let starList = [];
        for(let i = 0; i < numberOfStar; i++) {
            starList.push(
                <img src={star} alt="star" />
            );
        }
        return starList;
    }

    useEffect(() => {
        const {discountedPrice, amountToPay} = calculateDiscountedPrice(hotelData.price, hotelData.discountAmount);
        setPriceDetail({
            discountedPrice: formatCurrency(discountedPrice),
            amountToPay: formatCurrency(amountToPay)
        });
    }, [hotelData]);
    
    return (
        <div className='common-component__hotel-card--vertical'>
            {/* v: vertical, cc: common-component */}
            <div className="cc-hotel-card__top--v"> 
                <img src={hotelData.imgUrl} alt="hotel" />
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
                    <div className="hotel-card-body-rating__star">
                        {renderStar(hotelData.stars)}
                    </div>
                    <div className="hotel-card-body-rating__review">
                        <small>{hotelData.rating.reviews} reviews</small>
                        <div className="rating-review__score">
                            <p>{hotelData.rating.score}</p>
                        </div>
                    </div>
                </div>
                <div className="cc-hotel-card-body__location">
                    <i className="fi fi-ss-map-marker"></i>
                    <span>{hotelData.location}</span>
                </div>
                <div className="cc-hotel-card-body__price">
                    <p>From</p>
                    <div className='cc-hotel-card-body-price__money'>
                        <p>{priceDetail.amountToPay}</p>
                        <small>{priceDetail.discountedPrice}</small>
                    </div>
                    <small>You have save {priceDetail.amountToPay}</small>
                </div>
                <div className="cc-hotel-card-body__interact">
                    <button className="cc-hotel-card-body__report-btn">
                        !
                    </button>
                    <button className="cc-hotel-card-body__detail-btn">
                        View detail
                        <i className="fi fi-rr-caret-right"></i>
                    </button>
                </div>
            </div>
        </div>
    );
}

export default memo(HotelCard);
