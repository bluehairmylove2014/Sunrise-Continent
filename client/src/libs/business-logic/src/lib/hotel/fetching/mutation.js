import { HotelService } from "../../../../../services/src";
import { useMutation } from "@tanstack/react-query";
import { mutationConfig } from "../../../configs";

const hotelService = new HotelService();



export const useSearchHotelMutation = () => {
  return useMutation(hotelService.search, {
    retry: mutationConfig.retryTimes
  });
};

