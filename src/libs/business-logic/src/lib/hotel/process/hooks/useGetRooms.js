// Importing necessary libraries and services
import { useGetRoomQuery } from "../../fetching/query";

export const useGetRooms = (hotelID) => {
    const { data } = useGetRoomQuery(hotelID);
    return data
};
