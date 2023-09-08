// Importing necessary libraries and services
import { useGetPartnerMutation } from "../../fetching/mutation";
import { useAccessToken } from "./useAccessToken";

export const useGetPartner = () => {
  const getPartnerMutation = useGetPartnerMutation();
  const { getToken } = useAccessToken();
  const onGetPartner = () => {
    return new Promise((resolve, reject) => {
      // Handle keys here
      getPartnerMutation
        .mutateAsync(getToken())
        .then((data) => {
          resolve(data);
        })
        .catch((error) => {
          reject(error);
        });
    });
  };
  return {
    onGetPartner,
    isLoading: getPartnerMutation.isLoading,
  };
};
