import { VoucherService } from "../../../../../services/src";
import { useMutation } from "@tanstack/react-query";
import { mutationConfig } from "../../../configs";

const voucherService = new VoucherService();

export const useGetVoucherMutation = () => {
  return useMutation(voucherService.getVoucher, {
    retry: mutationConfig.RETRY,
  });
};
export const useRedeemVoucherMutation = () => {
  return useMutation(voucherService.redeemVoucher, {
    retry: mutationConfig.RETRY,
  });
};
export const useDeleteVoucherMutation = () => {
  return useMutation(voucherService.deleteVoucher, {
    retry: mutationConfig.RETRY,
  });
};
export const useCreateVoucherMutation = () => {
  return useMutation(voucherService.createVoucher, {
    retry: mutationConfig.RETRY,
  });
};
