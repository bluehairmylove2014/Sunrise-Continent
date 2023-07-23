// Importing necessary libraries and services
import { useGetSpecificRoomQuery } from "../../fetching/query";

export const useGetSpecificRoom = (hotelID, roomID) => {
    const hotelRoom = useGetSpecificRoomQuery(hotelID, roomID);
    return hotelRoom
};
