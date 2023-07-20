import { CartService } from "@org/services";
import { useMutation } from "@tanstack/react-query";
import { MUTATION } from "../constants";

// Initialize CartService
const cartService = new CartService();

/**
 * Use this mutation to add to the cart
 */
export const useAddToCartMutation = () => {
  return useMutation(cartService.addToCart, {
    retry: MUTATION.RETRY_TIMES
  });
};

/**
 * Use this mutation to update the cart
 */
export const useUpdateCartMutation = () => {
  return useMutation(cartService.updateCart, {
    retry: MUTATION.RETRY_TIMES
  });
};

/**
 * Use this mutation to delete from the cart
 */
export const useDeleteFromCartMutation = () => {
  return useMutation(cartService.deleteFromCart, {
    retry: MUTATION.RETRY_TIMES
  });
};
export const useDecreaseItemQuantityMutation = () => {
  return useMutation(cartService.decreaseItemQuantity, {
    retry: MUTATION.RETRY_TIMES
  });
};

/**
 * Use this mutation to clear the cart
 */
export const useClearCartMutation = () => {
  return useMutation(cartService.clearCart, {
    retry: MUTATION.RETRY_TIMES
  });
};

/**
 * Use this mutation to get the cart
 */
export const useGetCartMutation = () => {
  return useMutation(cartService.getCart, {
    retry: MUTATION.RETRY_TIMES
  });
};
