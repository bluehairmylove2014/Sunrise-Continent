import React, { useState, useEffect } from 'react';
import SmallPageLoader from '../../components/common/SmallPageLoader';
import { combineAddress } from '../../utils/helpers/Address';
import { pointToLabel } from '../../utils/helpers/Rating';
import { convertNumberToCurrency } from '../../utils/helpers/MoneyConverter';
import '../../styles/scss/_hotelDetail.scss';

const HotelDetail = ({hotelID}) => {
    const [hotelDetail, setHotelDetail] = useState(null);

    useEffect(() => {
        setHotelDetail({
            id: 1,
            name: "Khách sạn Caravelle Saigon",
            country: "Việt Nam",
            provinceCity: "Hồ Chí Minh",
            address: "17 Công Trường Lam Sơn, Quận 1",
            stars: 5,
            rating: 9.1,
            description: "Một khách sạn cao cấp tọa lạc tại trung tâm Thành phố Hồ Chí Minh với dịch vụ chất lượng và tầm nhìn tuyệt đẹp.",
            image: "https://rialloer.sirv.com/Sunrise-Continent/hotels/7%20La%20Siesta%20Premium%20Sai%20Gon/462029553.jpg",
            price: 350000,
            amenities: ["Bể bơi", "Internet", "Bãi để xe"],
            services: ["BREAKFAST_INCLUDED", "DINNER_INCLUDED"]
        })
    }, [])

    return (
        hotelDetail ? 
        <main className='hotel-detail'>
            <section className='hotel-detail__overall-wrapper'>
                <div className="container">
                    <div className="hotel-detail__overall">
                        <div className="overall__infor">
                            <h4 className="overall-infor__name">
                                {hotelDetail.name}
                            </h4>
                            <p className="overall-infor__address">
                                {combineAddress(hotelDetail.address, hotelDetail.provinceCity, hotelDetail.country)}
                            </p>
                            <div className="overall-infor__review">
                                <div className="review__point">
                                    {hotelDetail.rating}
                                </div>
                                <div className="review__label">
                                    {pointToLabel(hotelDetail.rating)}
                                </div>
                                <div className="review__count">
                                    {`1250 Reviews`}
                                </div>
                            </div>
                        </div>
                        <div className="overall__booking-price">
                            <p className="booking-price__price-per-night">
                                <span>{convertNumberToCurrency("vietnamdong", hotelDetail.price)}</span>
                                &nbsp;/ night
                            </p>
                            <div className="booking-price__interact">
                                <button>
                                    <i className="fi fi-rr-heart"></i>
                                    Yêu thích
                                </button>
                                <button>
                                    Show available room
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section className="hotel-detail__gallery container">
                <img 
                    src={hotelDetail.image} 
                    alt="hotel 1" 
                    className="gallery__main" 
                />
                <img 
                    src={hotelDetail.image} 
                    alt="hotel 2" 
                    className="gallery__image--top-left" 
                />
                <img 
                    src={hotelDetail.image} 
                    alt="hotel 1" 
                    className="gallery__image--top-right" 
                />
                <img 
                    src={hotelDetail.image} 
                    alt="hotel 1" 
                    className="gallery__image--bottom-left" 
                />
                <img 
                    src={hotelDetail.image} 
                    alt="hotel 1" 
                    className="gallery__image--bottom-right" 
                />
            </section>
        </main> : <SmallPageLoader/>
    );
}

export default HotelDetail;
