// Importing necessary libraries and services
import { useGetSpecificRoomQuery } from "../../fetching/query";

export const useGetSpecificRoom = (hotelID, roomID) => {
  return useGetSpecificRoomQuery(hotelID, roomID);
};
