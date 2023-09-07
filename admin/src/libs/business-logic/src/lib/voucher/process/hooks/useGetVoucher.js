/* eslint-disable react-hooks/exhaustive-deps */
import { useVoucherContext } from "../context";
import { useGetVoucherMutation } from "../../fetching/mutation";

export const useGetVoucher = (rank) => {
  const { state, dispatch } = useVoucherContext();
  const getVoucherMutation = useGetVoucherMutation();

  const onGetVoucher = (token) => {
    return new Promise((resolve, reject) => {
      if (!state.accessToken && !token) {
        reject(new Error("Unauthorized!"));
      } else {
        // Handle keys here
        getVoucherMutation
          .mutateAsync(token ? token : state.accessToken)
          .then((res) => {
            dispatch({
              type: "SET_VOUCHER",
              payload: res,
            });
            resolve(res);
          })
          .catch((error) => {
            reject(error);
          });
      }
    });
  };
  return { onGetVoucher, isLoading: getVoucherMutation.isLoading };
};
