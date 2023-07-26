import { HotelService } from "../../../../../services/src";
import { useQuery } from "@tanstack/react-query";
import { QUERY_KEYS } from "../constants";

const hotelService = new HotelService();

export const useGetRoomQuery = (hotelID) => {
    return useQuery(
        [QUERY_KEYS.GET_ROOMS],
        () => hotelService.getRooms(hotelID),
    );
};

