// Importing necessary libraries and services
import { queryClient } from "../../../../provider/ReactQueryProvider";
import { useAccessToken } from "../../../auth/process/hooks/useAccessToken";
import { useDeleteRoomMutation } from "../../fetching/mutation";

export const useDeleteRoom = () => {
  const deleteRoomMutation = useDeleteRoomMutation();
  const { getToken } = useAccessToken();
  const onDeleteRoom = ({ id, hotelId }) => {
    return new Promise((resolve, reject) => {
      const token = getToken();
      // Handle keys here
      deleteRoomMutation
        .mutateAsync({
          data: {
            roomTypeId: id,
            hotelId,
          },
          token: token,
        })
        .then((data) => {
          queryClient.clear();
          resolve(data);
        })
        .catch((error) => {
          reject(error);
        });
    });
  };
  return {
    onDeleteRoom,
    isLoading: deleteRoomMutation.isLoading,
  };
};
