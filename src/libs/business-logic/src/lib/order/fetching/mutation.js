import { OrderService } from "../../../../../services/src";
import { useMutation } from "@tanstack/react-query";
import { mutationConfig } from "../../../configs";

const orderService = new OrderService();

export const useGetOrderMutation = () => {
  return useMutation(orderService.getOrder, {
    retry: mutationConfig.retry,
  });
};
export const useGetShippingMutation = () => {
  return useMutation(orderService.getShipping, {
    retry: mutationConfig.retry,
  });
};
export const useGetTaxMutation = () => {
  return useMutation(orderService.getTax, {
    retry: mutationConfig.retry,
  });
};
export const useGetCouponMutation = () => {
  return useMutation(orderService.getCoupon, {
    retry: mutationConfig.retry,
  });
};
export const useUpdateOrderMutation = () => {
  return useMutation(orderService.updateOrder, {
    retry: mutationConfig.retry,
  });
};
