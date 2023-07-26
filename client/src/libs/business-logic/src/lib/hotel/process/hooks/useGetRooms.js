// Importing necessary libraries and services
import { useGetRoomQuery } from "../../fetching/query";

export const useGetRooms = (hotelID) => {
    const hotelRooms = useGetRoomQuery(hotelID);
    return hotelRooms.data
};
