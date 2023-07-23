import { HotelService } from "../../../../../services/src";
import { useQuery } from "@tanstack/react-query";
import { QUERY_KEYS } from "../constants";

const hotelService = new HotelService();

export const useGetHotelDetailQuery = (hotelID) => {
    return useQuery(
        [QUERY_KEYS.GET_HOTEL_DETAIL],
        () => hotelService.getHotelDetail(hotelID),
    );
};
export const useGetRoomQuery = (hotelID) => {
    return useQuery(
        [QUERY_KEYS.GET_ROOMS],
        () => hotelService.getRooms(hotelID),
    );
};
export const useGetSpecificRoomQuery = (hotelID, roomID) => {
    return useQuery(
        [QUERY_KEYS.GET_SPECIFIC_ROOM],
        () => hotelService.getSpecificRoom(hotelID, roomID),
    );
};

