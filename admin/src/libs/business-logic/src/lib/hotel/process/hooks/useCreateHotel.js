// Importing necessary libraries and services
import { useAccessToken } from "../../../auth/process/hooks/useAccessToken";
import { useCreateHotelMutation } from "../../fetching/mutation";
import { queryClient } from "./../../../../provider/ReactQueryProvider";

export const useCreateHotel = () => {
  const createHotelMutation = useCreateHotelMutation();
  const { getToken } = useAccessToken();
  const onCreateHotel = ({
    name,
    country,
    hotelType,
    provinceCity,
    address,
    stars,
    description,
    image,
  }) => {
    return new Promise((resolve, reject) => {
      const token = getToken();
      queryClient.clear();
      // Handle keys here
      createHotelMutation
        .mutateAsync({
          data: {
            name,
            country,
            hotelType,
            provinceCity,
            address,
            stars,
            description,
            image,
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
    onCreateHotel,
    isLoading: createHotelMutation.isLoading,
  };
};
