import React from 'react';
import { ACCOMMODATION_FACILITIES, BED_TYPES, ROOM_OPTIONS } from '../../constants/filter.constants';
import { icon } from './Data';
import {
    convertNumberToCurrency
} from '../../utils/helpers/MoneyConverter'
import { PAGES } from '../../constants/Link.constants';
import { Link } from 'react-router-dom';

const Rooms = ({rooms_data}) => {
    let room = null;

    if(Array.isArray(rooms_data)) {
        room = rooms_data.map(rd => {
            return (
                <div className='room__wrapper' key={`room@${rd.id}`}>
                    <h5>{ rd.name }</h5>

                    <div className="room__content">
                        <div className="room__main-infor">
                            <h6>Loại phòng</h6>

                            <div className="main-infor__img-wrapper">
                                {
                                    rd.picture.map(rp => {
                                        return <img src={rp} alt="room_picture" key={rp}/>
                                    })
                                }
                            </div>
                            <button className='main-infor__view-all-img'>
                                Xem tất cả ảnh
                            </button>
                            
                            <div className="main-infor__hightlight">
                                <img src={BED_TYPES[rd.bedType].ICON} alt="bedtype" />
                                <span>{BED_TYPES[rd.bedType].LABEL}</span>
                            </div>
                            <div className="main-infor__hightlight">
                                <img src={icon.roomSizeIcon} alt="room size"/>

                                <span>Kích thước: {rd.size} ㎡</span>
                            </div>
                            <div className="main-infor__hightlight" style={{opacity: 1}}>
                                <img src={icon.viewIcon} alt="view"/>

                                <span>{rd.roomView}</span>
                            </div>
                            

                        </div>
                        <div className="room__facilities-services">
                            <h6>Giá này đã bao gồm</h6>

                            <div className="facilities">
                                <small>Tiện nghi</small>
                                {
                                    rd.facility.map(fa => {
                                        return <>
                                            <div className="facilities__item" key={fa}>
                                                <img src={ACCOMMODATION_FACILITIES[fa].ICON} alt="fa"/>
                                                <p>{ACCOMMODATION_FACILITIES[fa].LABEL}</p>
                                            </div>
                                        </>
                                    })
                                }
                            </div>
                            <div className="services">
                                <small>Dịch vụ</small>
                                {
                                    rd.service.map(sv => {
                                        return <>
                                            <div className="services__item" key={sv}>
                                                <i className={ROOM_OPTIONS[sv].ICON}></i>
                                                <span>{ROOM_OPTIONS[sv].LABEL}</span>
                                            </div>
                                        </>
                                    })
                                }
                            </div>
                        </div>
                        <div className="room__description">
                            <h6>Mô tả</h6>
                            
                            <div className="short__description">
                                <p>{rd.roomInfo}</p>
                                <p>
                                    <i className="fi fi-sr-bed-alt"></i>
                                    Số phòng trống: {rd.vacancy}
                                </p>
                            </div>
                        </div>
                        <div className="room__price">
                            <h6>Giá chỉ</h6>
                            
                            <div className="price__wrapper">
                                <p><span>{convertNumberToCurrency('vietnamdong', rd.price)}</span> / đêm</p>
                            
                                <Link 
                                    to={
                                        PAGES.PRE_CHECKOUT + 
                                        `?hotelId=${rd.hotelId}&id=${rd.id}` + 
                                        `&from="2023-07-23"&to="2023-07-27"` + 
                                        `&adult=2&children=1&rooms=2`
                                    }
                                >
                                    Đặt phòng ngay
                                </Link>
                            </div>
                        </div>
                    </div>
                </div>
            )
        })
    }
    return (
        <>{room}</>
    );
}

export default Rooms;
