import React from 'react';
import { ROOM_OPTIONS } from '../../constants/filter.constants';
import {
    convertNumberToCurrency
} from '../../utils/helpers/MoneyConverter';

const Hotel = ({data}) => {

    const renderAmenities = (amenities) => {
        if (!Array.isArray(amenities)) return <></>;
        return amenities.map(am => {
            return (
                <div className='infor__amenity'>
                    {am}
                </div>
            )
        })
    }
    const renderServices = (services) => {
        if (!Array.isArray(services)) return <></>;
        return services.map(sv => {
            return (
                <div className='infor__service-item'>
                    <i className={ROOM_OPTIONS[sv].ICON}></i>
                    <span>{ROOM_OPTIONS[sv].LABEL}</span>
                </div>
            )
        })
    }

    return (
        <div className='hotel'>
            <div className="hotel__images">
                <img src={data.image} alt="hotel-image" />
            </div>
            <div className="hotel__infor">
                <h4>{data.name}</h4>
                <div className="infor__location">
                    <i className="fi fi-rs-marker"></i>
                    <p>{
                        data.address + " " + 
                        data.country + " " + 
                        data.provinceCity
                    }</p>
                </div>
                <div className='infor__amenities'>
                    {renderAmenities(data.amenities)}
                </div>
                <div className='infor__services'>
                    {renderServices(data.services)}
                </div>
            </div>
            <div className="hotel__rating-price">
                <div className="hotel__rating">
                    <div className="rating__infor">
                        <p>Tuyệt vời</p>
                        <small>5.460 Nhận xét</small>
                    </div>
                    <div className="rating__point">
                        {data.rating}
                    </div>
                </div>
                <div className="hotel__price">
                    <small>Giá mỗi đêm chỉ từ</small>
                    <p className="hotel-price__real">
                        {convertNumberToCurrency("vietnamdong", data.price)}
                    </p>
                </div>
            </div>
        </div>
    );
}

export default Hotel;
