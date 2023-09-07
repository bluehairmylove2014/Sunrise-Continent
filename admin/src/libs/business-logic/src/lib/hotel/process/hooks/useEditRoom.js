// Importing necessary libraries and services
import { useAccessToken } from "../../../auth/process/hooks/useAccessToken";
import { useEditRoomMutation } from "../../fetching/mutation";

export const useEditRoom = () => {
  const editRoomMutation = useEditRoomMutation();
  const { getToken } = useAccessToken();
  const onEditRoom = ({
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
      editRoomMutation
        .mutateAsync({
          data: {
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
    onEditRoom,
    isLoading: editRoomMutation.isLoading,
  };
};
