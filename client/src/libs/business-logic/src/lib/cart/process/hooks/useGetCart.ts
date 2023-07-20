// Importing necessary modules and functions
import { ICart } from "libs/services/src/entities";
import { useGetCartMutation } from "../../fetching/mutation";
import { useCartContext } from "../context";
import { AxiosError, isAxiosError } from "@org/services";
import { getCartLocalstorage } from "../helper/localStorageHelper";
import { CONTEXT_ACTION } from "../../constants";
import { useLocalCartAction } from "./useLocalCartAction";

type UseGetCartType = {
  onGetCart: () => Promise<ICart | null>, 
  isLoading: boolean
};
export const useGetCart = ():UseGetCartType => {
  const { state, dispatch } = useCartContext();
  const getCartMutation = useGetCartMutation();
  const { setCart } = useLocalCartAction();

  const onGetCart = ():Promise<ICart | null>  => {
    return new Promise((
      resolve, 
      reject: (error: Error | AxiosError) => void
    ) => {
      if(state.accessToken) {
        // Nếu có token thì gọi server để lấy cart
        getCartMutation.mutateAsync(state.accessToken)
          .then(data => {
            // Lấy thì kiểm tra coi data có phải là messageResponse hay không
            const cart = (!data || 'message' in data) ? null : data;
            if(cart) {
              // Nếu có cart thì cập nhật lại cart dưới state và localstorage
              setCart(cart)
            }
            resolve(cart); // trả về cart cho component
          })
          .catch((err: AxiosError | Error) => {
            if(
              isAxiosError(err) && 
              err.response?.status === 404 && 
              err.response.data === "Cannot find cart"
            ) {
              resolve(null);
            }
            else {
              console.error("Error get cart in hook: ", err)
              reject(err)
            }
          })
      }
      else {
        // Nếu không thì lấy cart từ localstorage
        const cart = getCartLocalstorage();
        // Cập nhật lại cart trong context
        dispatch({
          type: CONTEXT_ACTION.SET_CART_ACTION,
          payload: cart
        })

        resolve(cart);
      }
    })
  }

  return {
    onGetCart, 
    isLoading: getCartMutation.isLoading
  }; 
};
