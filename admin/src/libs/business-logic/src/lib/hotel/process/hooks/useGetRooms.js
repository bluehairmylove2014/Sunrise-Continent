// Importing necessary libraries and services
import { useGetRoomQuery } from "../../fetching/query";

export const useGetRooms = (hotelID) => {
  const { data, refetch: queryRefetch } = useGetRoomQuery(hotelID);

  const refetch = () => {
    setTimeout(() => {
      queryRefetch();
    }, 500);
  };

  return { data, refetch };
};
