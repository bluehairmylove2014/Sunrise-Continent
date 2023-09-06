// Importing necessary libraries and services
import { useCreateVoucherMutation } from "../../fetching/mutation";
import { useVoucherContext } from "../context/voucherContext";
import { useLocalVoucher } from "./useLocalVoucher";

export const useCreateVoucher = () => {
  const { state } = useVoucherContext();
  const { addVoucher } = useLocalVoucher();
  const createVoucherMutation = useCreateVoucherMutation();

  const onCreateVoucher = ({ name, quantity, value, point, requiredRank }) => {
    return new Promise((resolve, reject) => {
      if (!state.accessToken) {
        reject(new Error("Unauthorized!"));
      } else {
        addVoucher({
          voucherData: { name, value, point, requiredRank, quantity },
        });
        // Handle keys here
        createVoucherMutation
          .mutateAsync({
            token: state.accessToken,
            voucherData: { name, quantity, value, point, requiredRank },
          })
          .then((res) => {
            resolve(res);
          })
          .catch((error) => {
            reject(error);
          });
      }
    });
  };
  return { onCreateVoucher, isLoading: createVoucherMutation.isLoading };
};
