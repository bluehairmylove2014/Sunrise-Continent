import { useGetReviewQuery } from "../../fetching/query";

export const useGetReview = ({ hotelId }) => {
  const { data } = useGetReviewQuery({ hotelId: Number(hotelId) });
  return data;
};
