// Importing necessary modules and functions
import { useDecreaseItemQuantityMutation, useDeleteFromCartMutation } from "../../fetching/mutation";
import { useCartContext } from "../context";
import { AxiosError, DecreaseItemQuantityParams } from "@org/services";
import { useLocalCartAction } from "./useLocalCartAction";
import { CONTEXT_ACTION } from "../../constants";
import { useGetCart } from "./useGetCart";
import { debouncePromise } from "../helper/debounce";

const debounceDelayTime = 1000;
type UseDeleteFromType = {
    onDecreaseItemQuantity: (params: DecreaseItemQuantityParams) => Promise<string>,
    onDeleteItem: (productID: string) => Promise<string>
    isLoading: boolean
};
export const useDeleteFromCart = (): UseDeleteFromType => {
    const { state, dispatch } = useCartContext();
    const deleteFromCartMutation = useDeleteFromCartMutation();
    const decreaseItemQuantityMutation = useDecreaseItemQuantityMutation();
    const { 
        deleteFromCartLocalstorage, 
        setCart, 
        decreaseItemQuantityLocalstorage 
    } = useLocalCartAction();
    const { onGetCart } = useGetCart();

    const onDecreaseItemQuantity = debouncePromise<string, DecreaseItemQuantityParams>((
        params: DecreaseItemQuantityParams
    ): Promise<string> => {
        return new Promise((
            resolve,
            reject: (error: Error | AxiosError) => void
        ) => {

            const targetProduct = state.cart?.items?.find(ci => ci.item.id === params.productId);
            if(targetProduct && targetProduct.quantity > params.quantity) {
                dispatch({
                    type: CONTEXT_ACTION.DELETE_ACTION,
                    payload: {
                        productId: params.productId,
                        quantity: params.quantity
                    }
                })
                
                if (state.accessToken) {
                    decreaseItemQuantityMutation
                        .mutateAsync({
                            accessToken: state.accessToken,
                            productId: params.productId,
                            quantity: params.quantity
                        })
                        .then(data => {
                            decreaseItemQuantityLocalstorage(params.productId, params.quantity);
                            resolve(data.message)
                        })
                        .catch((error: AxiosError | Error) => {
                            // Nếu lỗi thì cập nhật lại state theo local
                            
                            onGetCart()
                            .then(cartData => {
                                // Hook này tự động cập nhật lại state và localstorage
                                console.log("Refresh cart data: ", cartData)
                            })
                            .catch(err => {
                                console.error("Get refresh cart error: ", err)
                                // Lỗi thì clear toàn bộ cart
                                setCart({
                                    items: []
                                })
                            })
                            reject(error)
                        })
                }
                else {
                    decreaseItemQuantityLocalstorage(params.productId, params.quantity);
                    resolve("Delete from cart success")
                }
            }
            else {
                onDeleteItem(params.productId)
                .then(data => resolve(data))
                .catch(err => reject(err))
            }
        })
    }, debounceDelayTime)
    const onDeleteItem = (productID: string): Promise<string> => {
        return new Promise((
            resolve,
            reject: (error: Error | AxiosError) => void
        ) => {
            
            dispatch({
                type: CONTEXT_ACTION.DELETE_ACTION,
                payload: {
                    productId: productID
                }
            })
            
            if (state.accessToken) {
                deleteFromCartMutation
                    .mutateAsync({
                        accessToken: state.accessToken,
                        productId: productID
                    })
                    .then(data => {
                        deleteFromCartLocalstorage(productID);
                        resolve(data.message)
                    })
                    .catch((error: AxiosError | Error) => {
                        // Nếu lỗi thì cập nhật lại state theo local
                        
                        onGetCart()
                        .then(cartData => {
                            // Hook này tự động cập nhật lại state và localstorage
                            console.log("Refresh cart data: ", cartData)
                        })
                        .catch(err => {
                            console.error("Get refresh cart error: ", err)
                            // Lỗi thì clear toàn bộ cart
                            setCart({
                                items: []
                            })
                        })
                        reject(error)
                    })
            }
            else {
                deleteFromCartLocalstorage(productID);
                resolve("Delete from cart success")
            }
        })
    }

    return {
        onDecreaseItemQuantity,
        onDeleteItem,
        isLoading: deleteFromCartMutation.isLoading
    };
};
