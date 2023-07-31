// Importing necessary libraries and services
import { useGetHotelDetailQuery } from "../../fetching/query";

export const useGetHotelDetail = (hotelID) => {
    return useGetHotelDetailQuery(hotelID);
};
