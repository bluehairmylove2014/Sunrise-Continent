// Importing necessary libraries and services
import { useDeleteVoucherMutation } from "../../fetching/mutation";
import { useVoucherContext } from "../context/voucherContext";
import { useLocalVoucher } from "./useLocalVoucher";

export const useDeleteVoucher = () => {
  const { state } = useVoucherContext();
  const { deleteVouchers } = useLocalVoucher();
  const deleteVoucherMutation = useDeleteVoucherMutation();
  const onDeleteVoucher = ({ voucherIdList }) => {
    return new Promise((resolve, reject) => {
      if (!state.accessToken) {
        reject(new Error("Unauthorized!"));
      } else {
        deleteVouchers({ voucherIdList });
        // Handle keys here
        const mutationList = voucherIdList.map((voucherId) =>
          deleteVoucherMutation.mutateAsync({
            token: state.accessToken,
            voucherId,
          })
        );
        Promise.all(mutationList)
          .then((res) => {
            resolve(res);
          })
          .catch((error) => {
            reject(error);
          });
      }
    });
  };
  return { onDeleteVoucher, isLoading: deleteVoucherMutation.isLoading };
};
