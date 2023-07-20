// Importing necessary modules and functions
import { useUpdateCartMutation } from "../../fetching/mutation";
import { useCartContext } from "../context";
import { AxiosError, UpdateCartParams } from "@org/services";
import { useLocalCartAction } from "./useLocalCartAction";
import { setCartLocalstorage } from "../helper/localStorageHelper";
import { CONTEXT_ACTION } from "../../constants";
import { useGetCart } from "./useGetCart";

type UseGetCartType = {
    onUpdateCart: (cartData: UpdateCartParams) => Promise<string>,
    isLoading: boolean
};
export const useUpdateCart = (): UseGetCartType => {
    const { state, dispatch } = useCartContext();
    const updateCartMutation = useUpdateCartMutation();
    const { setCart } = useLocalCartAction();
    const { onGetCart } = useGetCart();

    const onUpdateCart = (cartData: UpdateCartParams): Promise<string> => {
        return new Promise((
            resolve,
            reject: (error: Error | AxiosError) => void
        ) => {
            
            dispatch({
                type: CONTEXT_ACTION.UPDATE_ACTION,
                payload: cartData.cart
            })
            
            if (state.accessToken) {
                updateCartMutation
                    .mutateAsync(cartData)
                    .then(data => {
                        setCartLocalstorage(cartData.cart);
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
                        reject(error)
                    })
            }
            else {
                setCart(cartData.cart)
                resolve("Update cart success")
            }
        })
    }

    return {
        onUpdateCart,
        isLoading: updateCartMutation.isLoading
    };
};
