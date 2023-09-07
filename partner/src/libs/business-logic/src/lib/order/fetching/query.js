import { OrderService } from "../../../../../services/src";
import { useQuery } from "@tanstack/react-query";
import { QUERY_KEYS } from "../constants";

const orderService = new OrderService();

export const useGetUserOrdersQuery = (token) => {
  return useQuery([QUERY_KEYS.GET_ORDERS, token], () =>
    orderService.getOrders(token)
  );
};