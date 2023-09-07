import { VoucherService } from "../../../../../services/src";
import { useQuery } from "@tanstack/react-query";
import { QUERY_KEYS } from "../constants";

const voucherService = new VoucherService();

export const useGetVoucherQuery = (token, rank) => {
  return useQuery([QUERY_KEYS.GET_VOUCHER, token, rank], () =>
    voucherService.getVoucher(token, rank)
  );
};
