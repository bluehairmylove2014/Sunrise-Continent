// Importing necessary libraries and services
import { useAccessToken } from "../../../auth/process/hooks/useAccessToken";
import { useBanHotelMutation } from "../../fetching/mutation";

export const useBanHotel = () => {
  const banHotelMutation = useBanHotelMutation();
  const { getToken } = useAccessToken();
  const onBanHotel = ({ hotelId }) => {
    return new Promise((resolve, reject) => {
      const token = getToken();
      if (!token) {
        reject(new Error("Unauthorized!"));
      } else {
        banHotelMutation
          .mutateAsync({
            hotelId,
            token,
          })
          .then((data) => {
            resolve(data);
          })
          .catch((error) => {
            reject(error);
          });
      }
    });
  };
  return {
    onBanHotel,
    isLoading: banHotelMutation.isLoading,
  };
};
