// Importing necessary libraries and services
import { useAccessToken } from "../../../auth/process/hooks/useAccessToken";
import { useEditHotelMutation } from "../../fetching/mutation";

export const useEditHotel = () => {
  const editHotelMutation = useEditHotelMutation();
  const { getToken } = useAccessToken();
  const onEditHotel = ({
    id,
    name,
    country,
    hotelType,
    provinceCity,
    address,
    stars,
    rating,
    description,
    image,
    price,
  }) => {
    return new Promise((resolve, reject) => {
      const token = getToken();
      // Handle keys here
      editHotelMutation
        .mutateAsync({
          data: {
            id,
            name,
            country,
            hotelType,
            provinceCity,
            address,
            stars,
            rating,
            description,
            image,
            price,
          },
          token: token,
        })
        .then((data) => {
          resolve(data);
        })
        .catch((error) => {
          reject(error);
        });
    });
  };
  return {
    onEditHotel,
    isLoading: editHotelMutation.isLoading,
  };
};
