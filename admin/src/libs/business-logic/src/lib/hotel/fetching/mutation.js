import { HotelService } from "../../../../../services/src";
import { useMutation } from "@tanstack/react-query";
import { mutationConfig } from "../../../configs";

const hotelService = new HotelService();

export const useSearchHotelMutation = () => {
  return useMutation(hotelService.search, {
    retry: mutationConfig.RETRY,
  });
};
export const useCheckRoomAvailableMutation = () => {
  return useMutation(hotelService.checkRoomAvailable, {
    retry: mutationConfig.RETRY,
  });
};
export const useCreateHotelMutation = () => {
  return useMutation(hotelService.createHotel, {
    retry: mutationConfig.RETRY,
  });
};
export const useEditHotelMutation = () => {
  return useMutation(hotelService.editHotel, {
    retry: mutationConfig.RETRY,
  });
};
export const useCreateRoomMutation = () => {
  return useMutation(hotelService.createRoom, {
    retry: mutationConfig.RETRY,
  });
};
export const useEditRoomMutation = () => {
  return useMutation(hotelService.editRoom, {
    retry: mutationConfig.RETRY,
  });
};
export const useDeleteRoomMutation = () => {
  return useMutation(hotelService.deleteRoom, {
    retry: mutationConfig.RETRY,
  });
};
export const useBanHotelMutation = () => {
  return useMutation(hotelService.banHotel, {
    retry: mutationConfig.RETRY,
  });
};
