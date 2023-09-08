import { useGetPicturesQuery } from "../../fetching/query";

export const useGetPictures = ({ id }) => {
  const { data } = useGetPicturesQuery({ hotelId: Number(id) });
  return data;
};
