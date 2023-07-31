import React from 'react';

import HotelCard from '../../components/common/HotelCard';

const TrendingHotel = ({hotelShortDescribeList}) => {

    const trending_hotels = hotelShortDescribeList.map(hsd => {
        return (
            <HotelCard hotelData={hsd} key={hsd.id}/>
        )
    })

    return (
        <React.Fragment>{trending_hotels}</React.Fragment>
    );
}

export default TrendingHotel;
