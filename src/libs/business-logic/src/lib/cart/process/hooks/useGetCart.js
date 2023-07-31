// Import necessary modules and functions
import { useGetCartMutation } from "../../fetching/mutation";
import { useCartContext } from "../context";
import { isAxiosError } from "../../../../../../services/src";
import { getCartLocalStorage } from "../helper/localStorageHelper";
import { useLocalCartAction } from "./useLocalCartAction";

export const useGetCart = () => {
  const { state, dispatch } = useCartContext();
  const getCartMutation = useGetCartMutation();
  const { setCart } = useLocalCartAction();

  const onGetCart = (token) => {
    return new Promise((resolve, reject) => {
      const accessToken = token ? token : state.accessToken;
      if (accessToken) {
        // If token exists, call server to get cart
        getCartMutation
          .mutateAsync(accessToken)
          .then((data) => {
            // Check if data is a messageResponse
            const cart = !data || "message" in data ? null : data;
            if (cart) {
              // If cart exists, update cart in state and localStorage
              setCart(cart);
            }
            resolve(cart); // return cart to component
          })
          .catch((err) => {
            if (
              isAxiosError(err) &&
              err.response.status === 404 &&
              err.response.data === "Cannot find cart"
            ) {
              resolve(null);
            } else {
              console.error("Error getting cart in hook: ", err);
              reject(err);
            }
          });
      } else {
        // If not, get cart from localStorage
        const cart = getCartLocalStorage();
        // Update cart in context
        dispatch({
          type: "SET_CART_ACTION",
          payload: cart,
        });

        resolve(cart);
      }
    });
  };

  return {
    onGetCart,
    isLoading: getCartMutation.isLoading,
  };
};
