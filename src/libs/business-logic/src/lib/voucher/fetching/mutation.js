import { VoucherService } from "../../../../../services/src";
import { useMutation } from "@tanstack/react-query";
import { mutationConfig } from "../../../configs";

const voucherService = new VoucherService();

export const useGetVoucherMutation = () => {
  return useMutation(voucherService.getVoucher, {
    retry: mutationConfig.RETRY,
  });
};
