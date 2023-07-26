import React, { useState, useEffect } from 'react';
import SmallPageLoader from '../../components/common/SmallPageLoader';
import { combineAddress } from '../../utils/helpers/Address';
import { pointToLabel } from '../../utils/helpers/Rating';
import { convertNumberToCurrency } from '../../utils/helpers/MoneyConverter';
import '../../styles/scss/hotelDetail.scss';
import { icon } from './Data';
import { ACCOMMODATION_FACILITIES, ROOM_OPTIONS } from '../../constants/filter.constants';
import map_img from '../../assets/images/graphics/image 31.png'
import Rooms from './Rooms';
import { useGetRooms } from '../../libs/business-logic/src/lib/hotel/process/hooks';

const HotelDetail = () => {
    const [hotelDetail, setHotelDetail] = useState(null);
    const urlParams = new URLSearchParams(window.location.search);
    const hotelId = urlParams.get('id');
    console.log("Hotel ID: ", hotelId)
    const roomsData = useGetRooms("2")

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
            amenities: [
                "SWIMMING_POOL", 
                "AIRPORT_SHUTTLE", 
                "PARKING", 
                "RECEPTION_24H",
                "FAMILY_FRIENDLY",
                "NON_SMOKING",
                "SPA_SAUNA",
                "PETS_ALLOWED"
            ],
            services: ["BREAKFAST_INCLUDED", "DINNER_INCLUDED"]
        })
    }, [])

    const renderAmenities = (amenities) => {
        if(!Array.isArray(amenities)) return <></>
        return amenities.map(am => {
            const icon = ACCOMMODATION_FACILITIES[am].ICON;
            const label = ACCOMMODATION_FACILITIES[am].LABEL
            return (
                <div className="amenities-wrapper" key={ACCOMMODATION_FACILITIES[am].LABEL}>
                    <img src={icon} alt="amentities" />
                    <span>{label}</span>
                </div>
            )
        })
    }

    const renderRoomOptions = (room_options) => {
        if(!Array.isArray(room_options)) return <></>
        return room_options.map(sv => {
            const icon = ROOM_OPTIONS[sv].ICON;
            const label = ROOM_OPTIONS[sv].LABEL
            return (
                <div className="room-option-wrapper" key={ROOM_OPTIONS[sv].LABEL}>
                    <i className={icon}></i>
                    <span>{label}</span>
                </div>
            )
        })
    }

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
            <div className="container">
                <section className="hotel-detail__gallery">
                    <button>
                        <img 
                            src={hotelDetail.image} 
                            alt="hotel 1" 
                        />
                    </button>
                    <button>
                        <img 
                        src={`https://rialloer.sirv.com/Sunrise-Continent/hotels/7%20La%20Siesta%20Premium%20Sai%20Gon/409186486.jpg`} 
                        alt="hotel 2" 
                    />
                    </button>
                    <button>
                        <img 
                        src={`https://rialloer.sirv.com/Sunrise-Continent/hotels/7%20La%20Siesta%20Premium%20Sai%20Gon/408965408.jpg`} 
                        alt="hotel 1" 
                    />
                    </button>
                    <button>
                        <img 
                        src={`https://rialloer.sirv.com/Sunrise-Continent/hotels/7%20La%20Siesta%20Premium%20Sai%20Gon/408965292.jpg`} 
                        alt="hotel 1" 
                    />
                    </button>
                    <button>
                        <img 
                        src={`https://rialloer.sirv.com/Sunrise-Continent/hotels/7%20La%20Siesta%20Premium%20Sai%20Gon/462028749.jpg`} 
                        alt="hotel 1" 
                    />
                    </button>

                    <button className='gallery__view-all-btn'>Xem tất cả ảnh</button>
                </section>
                <div className="custom-line-template">
                    <img src={icon.lineIcon} alt="lineIcon" />
                </div>
                <section className="hotel-detail__description">
                    <h3>Giới thiệu</h3>
                    <p>Tọa lạc tại Manhattan, New York, HI New York City cách Công viên Trung tâm và Đại học Columbia 15 phút đi bộ. Các tiện nghi nổi bật bao gồm quầy lễ tân phục vụ 24/24, dịch vụ giữ hành lý và dịch vụ giặt là. Khách sạn này có 5 phòng họp trống</p>

                    
                    <div className="description__room-options">
                        {renderRoomOptions(hotelDetail.services)}
                    </div>

                    <div className="description__moreinfo-wrapper">
                        <div className="moreinfo-wrapper__amenities">
                            <h5>Tiện nghi</h5>
                            {renderAmenities(hotelDetail.amenities)}
                        </div>
                    </div>

                </section>
                <div className="custom-line-template">
                    <img src={icon.lineIcon} alt="lineIcon" />
                </div>
                <section className="hotel-detail__neighborhood">
                    <h3>Thành Phố và Khu Vực Lân Cận</h3>

                    <img src={map_img} alt="ggmap" />

                    <h5>Gần với</h5>

                    <div className="neighborhood__location-list">
                        <p>
                            <span>Nhà thờ Trinity Lutheran của Manhattan</span> 
                            &nbsp;-&nbsp;
                            <span>4 phút</span>&nbsp;đi bộ
                        </p>
                        <p>
                            <span>Nhà thờ St. Michael</span> 
                            &nbsp;-&nbsp;
                            <span>7 phút</span>&nbsp;đi bộ
                        </p>
                        <p>
                            <span>Đài phun nước Hòa bình</span> 
                            &nbsp;-&nbsp;
                            <span>9 phút</span>&nbsp;đi bộ
                        </p>
                        <p>
                            <span>Bảo tàng Nicholas Roerich</span> 
                            &nbsp;-&nbsp;
                            <span>14 phút</span>&nbsp;đi bộ
                        </p>
                        <p>
                            <span>Dinh thự Schinasi</span> 
                            &nbsp;-&nbsp;
                            <span>25 phút</span>&nbsp;đi bộ
                        </p>
                        <p>
                            <span>Leonard Nimoy Thalia tại Symphony Space</span> 
                            &nbsp;-&nbsp;
                            <span>18 phút</span>&nbsp;đi bộ
                        </p>
                        <p>
                            <span>Không gian Giao hưởng</span> 
                            &nbsp;-&nbsp;
                            <span>23 phút</span>&nbsp;đi bộ
                        </p>
                    </div>
                </section>
                <div className="custom-line-template">
                    <img src={icon.lineIcon} alt="lineIcon" />
                </div>
                <section className="hotel-detail__reviews">
                    <h3>Đánh giá</h3>

                    <div className="reviews__total-result">
                        <strong>{hotelDetail.rating}</strong>
                        <p className='total-result__label'>{pointToLabel(hotelDetail.rating)}</p>
                        <p>Dựa trên <span>10,300</span> Đánh giá đã được kiểm định</p>
                    </div>

                    <div className="reviews__user-review">
                        <div className="user-review__avatar-wrapper">
                            <img 
                                className="user-review__avatar" 
                                src={`https://rialloer.sirv.com/Sunrise-Continent/Users/andre-tan-nX0mSJ999Og-unsplash.jpg?cw=60&ch=60&w=60&h=60`} 
                                alt='user'
                            />
                        </div>
                        <div className="user-review__main">
                            <div className="user-review__rating">
                                <strong>{hotelDetail.rating}</strong>
                                <span className='total-result__label'>{pointToLabel(hotelDetail.rating)}</span>

                                &nbsp;|&nbsp;

                                <p>Nataliya, Tháng 2 2023</p>
                            </div>
                            <div className="user-review__content">
                                <p>Giá rất tốt cho chỗ ở NYC. Phòng rộng rãi và có nhiều chỗ để hành lý. Giường thoải mái và cơ sở vật chất sạch sẽ.
Đây là lần đầu tiên tôi đi du lịch một mình và nhờ có ký túc xá HI mà tôi đã có một chuyến đi tuyệt vời. Ký túc xá giúp dễ dàng giao lưu và kết bạn mới. Tôi đã kết bạn với vô số người bạn mới và những người bạn này đã thực hiện chuyến đi của tôi.</p>
                            </div>
                        </div>
                    </div>
                    <div className="reviews__user-review">
                        <div className="user-review__avatar-wrapper">
                            <img 
                                className="user-review__avatar" 
                                src={`https://rialloer.sirv.com/Sunrise-Continent/Users/Untitled-UaAu9kQf7-transformed.jpeg?cw=60&ch=60&w=60&h=60`} 
                                alt='user'
                            />
                        </div>
                        <div className="user-review__main">
                            <div className="user-review__rating">
                                <strong>{hotelDetail.rating}</strong>
                                <span className='total-result__label'>{pointToLabel(hotelDetail.rating)}</span>

                                &nbsp;|&nbsp;

                                <p>Nataliya, Tháng 2 2023</p>
                            </div>
                            <div className="user-review__content">
                                <p>Giá rất tốt cho chỗ ở NYC. Phòng rộng rãi và có nhiều chỗ để hành lý. Giường thoải mái và cơ sở vật chất sạch sẽ.
Đây là lần đầu tiên tôi đi du lịch một mình và nhờ có ký túc xá HI mà tôi đã có một chuyến đi tuyệt vời. Ký túc xá giúp dễ dàng giao lưu và kết bạn mới. Tôi đã kết bạn với vô số người bạn mới và những người bạn này đã thực hiện chuyến đi của tôi.</p>

                                <div className="content__media">
                                    <div className="content__img-wrapper">
                                        <img 
                                            src={`https://rialloer.sirv.com/Sunrise-Continent/hotels/7%20La%20Siesta%20Premium%20Sai%20Gon/409185038.jpg`} 
                                            alt="review" 
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="reviews__user-review">
                        <div className="user-review__avatar-wrapper">
                            <img 
                                className="user-review__avatar" 
                                src={`https://rialloer.sirv.com/Sunrise-Continent/Users/IMG_0615-min%20(1).jpg?cw=60&ch=60&w=60&h=60`} 
                                alt='user'
                            />
                        </div>
                        <div className="user-review__main">
                            <div className="user-review__rating">
                                <strong>{hotelDetail.rating}</strong>
                                <span className='total-result__label'>{pointToLabel(hotelDetail.rating)}</span>

                                &nbsp;|&nbsp;

                                <p>Nataliya, Tháng 2 2023</p>
                            </div>
                            <div className="user-review__content">
                                <p>Giá rất tốt cho chỗ ở NYC. Phòng rộng rãi và có nhiều chỗ để hành lý. Giường thoải mái và cơ sở vật chất sạch sẽ.
Đây là lần đầu tiên tôi đi du lịch một mình và nhờ có ký túc xá HI mà tôi đã có một chuyến đi tuyệt vời. Ký túc xá giúp dễ dàng giao lưu và kết bạn mới. Tôi đã kết bạn với vô số người bạn mới và những người bạn này đã thực hiện chuyến đi của tôi.</p>
                            
                                <div className="content__media">
                                    <div className="content__img-wrapper">
                                        <img 
                                            src={`https://rialloer.sirv.com/Sunrise-Continent/hotels/7%20La%20Siesta%20Premium%20Sai%20Gon/408965175.jpg`} 
                                            alt="review" 
                                        />
                                    </div>
                                    <div className="content__img-wrapper max">
                                        <img 
                                            src={`https://rialloer.sirv.com/Sunrise-Continent/hotels/7%20La%20Siesta%20Premium%20Sai%20Gon/462028697.jpg`} 
                                            alt="review" 
                                        />
                                    </div>
                                    <div className="content__img-wrapper">
                                        <img 
                                            src={`https://rialloer.sirv.com/Sunrise-Continent/hotels/7%20La%20Siesta%20Premium%20Sai%20Gon/462028749.jpg`} 
                                            alt="review" 
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="reviews__pagination">
                        <button disabled={true} className='pagination__coordination'>Prev</button>
                        <p>{`1`} trên {`8`}</p>
                        <button disabled={false} className='pagination__coordination'>Next</button>
                    </div>
                </section>
                <div className="custom-line-template">
                    <img src={icon.lineIcon} alt="lineIcon" />
                </div>
                <section className="hotel-detail__rooms">
                    <h3>Chọn phòng</h3>

                    <Rooms rooms_data={roomsData}/>
                </section>
            </div>
        </main> : <SmallPageLoader/>
    );
}

export default HotelDetail;
