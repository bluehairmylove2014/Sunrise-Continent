import React from "react";

import HotelCard from "../../components/common/HotelCard";
import { HOTEL_TYPE } from "../../constants/Variables.constants";

const TrendingHotel = ({ hotelShortDescribeList }) => {
  const trending_hotels = hotelShortDescribeList.map((hsd) => {
    return (
      <HotelCard hotelData={hsd} key={hsd.id} type={HOTEL_TYPE.VERTICAL} />
    );
  });

  return <React.Fragment>{trending_hotels}</React.Fragment>;
};

export default TrendingHotel;
