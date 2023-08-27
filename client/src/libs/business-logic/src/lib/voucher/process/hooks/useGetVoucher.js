/* eslint-disable react-hooks/exhaustive-deps */
import { useVoucherContext } from "../context";
import { useGetVoucherQuery } from "../../fetching/query";

export const useGetVoucher = (rank) => {
  const { state } = useVoucherContext();
  const { data } = useGetVoucherQuery(state.accessToken, rank);

  return data;
};
