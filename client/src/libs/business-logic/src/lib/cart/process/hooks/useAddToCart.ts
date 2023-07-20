// Importing necessary modules and functions
import { useAddToCartMutation } from "../../fetching/mutation";
import { useCartContext } from "../context";
import { AddToCartParams, AxiosError, isAxiosError } from "@org/services";
import { debouncePromise } from "../helper/debounce";
import { getCartLocalstorage } from "../helper/localStorageHelper";
import { useLocalCartAction } from "./useLocalCartAction";
import { useGetCart } from "./useGetCart";
import { useUpdateCart } from "./useUpdateCart";


const debounceDelayTime = 1000;

type UseAddToCartType = {
    onAddToCart: (params: AddToCartParams) => Promise<string>,
    isLoading: boolean
};
export const useAddToCart = (): UseAddToCartType => {
    const { state } = useCartContext();
    const addToCartMutation = useAddToCartMutation();
    const { setCart, addToCart } = useLocalCartAction();
    const { onGetCart } = useGetCart();
    const { onUpdateCart } = useUpdateCart();
    
    const onAddToCart = debouncePromise<string, AddToCartParams>((
        params: AddToCartParams, accumulate: number
    ): Promise<string> => {
        return new Promise((
          resolve, 
          reject: (error: Error | AxiosError) => void
        ) => {
            // params.quantity *= accumulate;
            if(!state.accessToken) {
                // NOT LOGGED IN
                // Add to cart under localstorage & context

                addToCart(params.item, params.quantity)
                resolve("Add to cart local success")
            }
            else {
                // LOGGED IN
                // Add to cart on server
                // Update cart first to change the interface first
               if(getCartLocalstorage()?.items?.length) {
                    // Check if there is a cart in localstorage yet
                    // If there is and the cart currently has products then 
                    // update the cart in the database with this cart
                    addToCart(params.item, params.quantity);
                    // Get the new cart with the added product from localstorage 
                    const localCart = getCartLocalstorage();
                    console.log("params.quantity: ", params.quantity)
                    console.log("TYPE: ", typeof params.quantity)
                    console.log("CART: ", localCart)
                    if(localCart?.items?.length) {
                        onUpdateCart({
                            accessToken: state.accessToken,
                            cart: localCart
                        }).then(message => {
                            resolve("Add to cart update from local cart to server success");
                        })
                        .catch((error: AxiosError | Error) => {
                            console.error(error);
                            reject(error);
                        })
                    }
                    else {
                        reject(new Error("Some error in update from local cart to server"));
                    }
                }
                else {
                    // Push the product into the db cart
                    addToCart(params.item, params.quantity);
                    addToCartMutation
                    .mutateAsync({
                        accessToken: state.accessToken,
                        item: params.item,
                        quantity: params.quantity
                    })
                    .then(data => {
                        resolve(data.message);
                    })
                    .catch((err: AxiosError | Error) => {
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

                        if (
                            isAxiosError(err) &&
                            err.response?.status === 404 &&
                            err.response.data === "Cannot find cart"
                        ) {
                            // If there is an Axios error and the response status is 404 and the response data is "Cannot find cart"
                        
                            resolve("Cannot find cart");
                        }
                        else {
                            console.error("Error get cart in hook: ", err)
                            reject(err)
                        }
                    })
                }
            }
        })
    }, debounceDelayTime)

    return {
        onAddToCart,
        isLoading: addToCartMutation.isLoading
    };
};


