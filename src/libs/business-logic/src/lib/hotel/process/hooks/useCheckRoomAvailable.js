// Importing necessary libraries and services
import { useCheckRoomAvailableMutation } from "../../fetching/mutation";

export const useCheckRoomAvailable = () => {
  const checkRoomAvailableMutation = useCheckRoomAvailableMutation();
  const onCheckRoomAvailable = ({
    HotelId,
    RoomTypeId,
    NumberOfRoom,
    CheckIn,
    CheckOut,
  }) => {
    return new Promise((resolve, reject) => {
      // Handle keys here
      checkRoomAvailableMutation
        .mutateAsync({ HotelId, RoomTypeId, NumberOfRoom, CheckIn, CheckOut })
        .then((res) => {
          resolve(res.message);
        })
        .catch((error) => {
          reject(error);
        });
    });
  };
  return {
    onCheckRoomAvailable,
    isLoading: checkRoomAvailableMutation.isLoading,
  };
};
