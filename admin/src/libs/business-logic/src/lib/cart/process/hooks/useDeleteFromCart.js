// Import necessary modules and functions
import { useDeleteFromCartMutation } from "../../fetching/mutation";
import { useCartContext } from "../context";
import { useGetCart } from "./useGetCart";
import { useLocalCartAction } from "./useLocalCartAction";

export const useDeleteFromCart = () => {
  const { state, dispatch } = useCartContext();
  const deleteFromCartMutation = useDeleteFromCartMutation();
  const { deleteFromCartLocalStorage, setCart } = useLocalCartAction();
  const { onGetCart } = useGetCart();

  const onDeleteItem = (id) => {
    return new Promise((resolve, reject) => {
      dispatch({
        type: "DELETE_ACTION",
        payload: { id },
      });
      if (state.accessToken) {
        deleteFromCartMutation
          .mutateAsync({
            accessToken: state.accessToken,
            productId: id,
          })
          .then((data) => {
            deleteFromCartLocalStorage(id);
            resolve(data.message);
          })
          .catch((error) => {
            // If error, update state according to local
            onGetCart()
              .then((cartData) => {
                // This hook automatically updates state and localStorage
              })
              .catch((err) => {
                // If error, clear the entire cart
                setCart([]);
              });
            reject(error);
          });
      } else {
        deleteFromCartLocalStorage(id);
        resolve("Delete from cart success");
      }
    });
  };

  return {
    onDeleteItem,
    isLoading: deleteFromCartMutation.isLoading,
  };
};
