import { HotelService } from "../../../../../services/src";
import { useQuery } from "@tanstack/react-query";
import { QUERY_KEYS } from "../constants";

const hotelService = new HotelService();

export const useGetHotelDetailQuery = (hotelID) => {
  return useQuery([QUERY_KEYS.GET_HOTEL_DETAIL, hotelID], () =>
    hotelService.getHotelDetail(hotelID)
  );
};
export const useGetRoomQuery = (hotelID) => {
  return useQuery([QUERY_KEYS.GET_ROOMS, hotelID], () =>
    hotelService.getRooms(hotelID)
  );
};
export const useGetSpecificRoomQuery = (hotelID, roomID) => {
  return useQuery([QUERY_KEYS.GET_SPECIFIC_ROOM, { hotelID, roomID }], () =>
    hotelService.getSpecificRoom(hotelID, roomID)
  );
};
export const useGetHotHotelQuery = () => {
  return useQuery([QUERY_KEYS.GET_SPECIFIC_ROOM], () =>
    hotelService.getHotHotel()
  );
};
export const useGetPicturesQuery = (hotelID) => {
  return useQuery([QUERY_KEYS.GET_PICTURE, hotelID], () =>
    hotelService.getPictures(hotelID)
  );
};
export const useGetReviewQuery = ({ hotelId }) => {
  return useQuery([QUERY_KEYS.GET_PICTURE, hotelId], () =>
    hotelService.getReview({ hotelId })
  );
};
