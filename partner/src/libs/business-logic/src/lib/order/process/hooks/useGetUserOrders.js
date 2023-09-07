// Import necessary modules and functions
import { useGetUserOrdersQuery } from "../../fetching/query";
import { useOrderContext } from "../context";

export const useGetUserOrders = () => {
  const { state } = useOrderContext();
  const { data } = useGetUserOrdersQuery(state.accessToken)

  return data;
};
