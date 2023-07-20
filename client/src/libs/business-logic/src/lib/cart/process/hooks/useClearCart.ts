// Importing necessary modules and functions
import { useCartContext } from "../context";
import { AxiosError } from "@org/services";
import { setCartLocalstorage } from "../helper/localStorageHelper";
import { CONTEXT_ACTION } from "../../constants";
import { useClearCartMutation } from "../../fetching/mutation";
import { useGetCart } from "./useGetCart";
import { useLocalCartAction } from "./useLocalCartAction";

type UseClearCartType = {
  onClearCart: () => Promise<string>,
  isLoading: boolean
};
export const useClearCart = ():UseClearCartType => {
  const { state, dispatch } = useCartContext();
  const { onGetCart } = useGetCart();
  const clearCartMutation = useClearCartMutation();
  const { setCart } = useLocalCartAction();

  const onClearCart = ():Promise<string>  => {
    return new Promise((
      resolve, 
      reject: (error: Error | AxiosError) => void
    ) => {
      // Clear cart trên state trước để giao diện update trước
      dispatch({
        type: CONTEXT_ACTION.SET_CART_ACTION,
        payload: null
      })

      if(state.accessToken) {
        // Clear cart cả trên server
        clearCartMutation
        .mutateAsync({
          accessToken: state.accessToken
        })
        .then(data => {
          // Nếu không lỗi thì clear cart dưới local luôn
          setCartLocalstorage(null);
          resolve(data.message)
        })
        .catch((error: AxiosError | Error) => {
          // If an error occurs, call the api to get the cart to update the cart
          onGetCart()
          .then(cartData => {
              // This hook automatically updates the state and localstorage
              console.log("Refresh cart data: ", cartData)
          })
          .catch(err => {
              console.error("Get refresh cart error: ", err)
              // If there is an error, clear the entire cart
              setCart({
                  items: []
              })
          })
          reject(error);
        })
      }
      else {
        // CHƯA ĐĂNG NHẬP => Xoá cart local
        setCartLocalstorage(null);
      }
    })
  }

  return {
    onClearCart, 
    isLoading: clearCartMutation.isLoading
  }; 
};
