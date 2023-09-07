// Importing necessary libraries and services
import { useAccessToken } from "../../../auth/process/hooks/useAccessToken";
import { useReviewHotelMutation } from "../../fetching/mutation";

export const useReviewHotel = () => {
  const reviewHotelMutation = useReviewHotelMutation();
  const { getToken } = useAccessToken();
  const onReview = ({ hotelId, points, content }) => {
    return new Promise((resolve, reject) => {
      const token = getToken();
      if (!token) {
        reject(new Error("Bạn chưa đăng nhập"));
      } else {
        reviewHotelMutation
          .mutateAsync({ data: { hotelId, points, content }, token })
          .then((res) => {
            resolve(res);
          })
          .catch((error) => {
            reject(error);
          });
      }
    });
  };
  return { onReview, isLoading: reviewHotelMutation.isLoading };
};
