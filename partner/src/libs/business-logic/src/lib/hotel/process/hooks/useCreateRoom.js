// Importing necessary libraries and services
import { useAccessToken } from "../../../auth/process/hooks/useAccessToken";
import { useCreateRoomMutation } from "../../fetching/mutation";

export const useCreateRoom = () => {
  const createRoomMutation = useCreateRoomMutation();
  const { getToken } = useAccessToken();
  const onCreateRoom = ({
    id,
    hotelId,
    name,
    vacancy,
    size,
    price,
    roomInfo,
    roomView,
    bedType,
    picture,
    facility,
    service,
  }) => {
    return new Promise((resolve, reject) => {
      const token = getToken();
      // Handle keys here
      createRoomMutation
        .mutateAsync({
          data: {
            id: 1,
            hotelId,
            name,
            vacancy,
            size,
            price,
            roomInfo,
            roomView,
            bedType,
            picture,
            facility,
            service,
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
    onCreateRoom,
    isLoading: createRoomMutation.isLoading,
  };
};
