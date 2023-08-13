// Importing necessary libraries and services
import { useRedeemVoucherMutation } from "../../fetching/mutation";
import { useVoucherContext } from "../context/voucherContext";
import { useLocalVoucher } from "./useLocalVoucher";

export const useRedeem = () => {
  const { state } = useVoucherContext();
  const { addVoucher } = useLocalVoucher();
  const redeemVoucherMutation = useRedeemVoucherMutation();
  const onRedeemVoucher = ({ voucherData, quantity }) => {
    return new Promise((resolve, reject) => {
      if (!state.accessToken) {
        reject(new Error("Unauthorized!"));
      } else {
        // Handle keys here
        redeemVoucherMutation
          .mutateAsync({
            token: state.accessToken,
            voucherId: voucherData.voucherId,
            quantity,
          })
          .then((res) => {
            addVoucher({ voucherData, quantity });
            resolve(res);
          })
          .catch((error) => {
            reject(error);
          });
      }
    });
  };
  return { onRedeemVoucher, isLoading: redeemVoucherMutation.isLoading };
};
