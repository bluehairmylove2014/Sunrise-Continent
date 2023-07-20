

// Importing necessary modules and functions
import { ICart, IProduct } from "libs/services/src/entities";
import { CONTEXT_ACTION } from "../../constants";
import { useCartContext } from "../context";
import { getCartLocalstorage, setCartLocalstorage } from "../helper/localStorageHelper";

type UseLocalCartActionType = {
    setCart: (cartData: ICart) => void,
    addToCart: (productData: IProduct, quantity: number) => void,
    decreaseItemQuantityLocalstorage: (productID: string, quantity: number) => void,
    deleteFromCartLocalstorage: (productID: string) => void,
};
export const useLocalCartAction = (): UseLocalCartActionType => {
    const { dispatch } = useCartContext();

    const setCart = (cartData: ICart) => {
        dispatch({
            type: CONTEXT_ACTION.SET_CART_ACTION,
            payload: cartData
        })
        setCartLocalstorage(cartData);
    }
    const addToCart = (product: IProduct, quantity: number) => {
        const localCart = getCartLocalstorage(); // Lấy cart từ localstorage
        if(localCart) {
            // Trường hợp nếu cart có trong localstorage
            const newCart = {...localCart}; // Make 1 cái copy
            if(!newCart.items || !newCart.items.length) {
                // Nếu cart chưa có product
                // Hoặc nếu biến product là 1 array rỗng
                // Thì set mới
                newCart.items = [{item: product, quantity}]
            }
            else {
                // Cart đã có các sản phẩm khác thì tìm coi sản phẩm
                // Cần thêm đã có trong cart hay chưa, nếu có thì cộng
                // Dồn số lượng vào. Chưa thì đẩy vô đầu (cho user thấy :V)
                const productInCart = newCart.items.find(p => p.item.id === product.id);
                if (productInCart) {
                    productInCart.quantity += quantity;
                } else {
                    newCart.items.unshift({item: product, quantity});
                }
            }
            setCart(newCart);
        }
        else {
            // Ngược lại thì set mới cho cả hai
            setCart({
                items: [{item: product, quantity}]
            });
        }
    }
    const decreaseItemQuantityLocalstorage = (productID: string, quantity: number) => {
        const localCart = getCartLocalstorage(); // Lấy cart từ localstorage
        if(localCart?.items) {
            // Trường hợp nếu cart có trong localstorage
            const targetProduct = localCart.items.find(p => p.item.id === productID);
            if(targetProduct) {
              targetProduct.quantity -= quantity;
            }

            setCartLocalstorage(localCart);
        }
    }
    const deleteFromCartLocalstorage = (productID: string) => {
        const localCart = getCartLocalstorage(); // Lấy cart từ localstorage
        if(localCart?.items) {
            // Trường hợp nếu cart có trong localstorage
            localCart.items = localCart.items.filter(p => p.item.id !== productID);

            setCartLocalstorage(localCart);
        }
    }

    return {
        setCart,
        addToCart,
        decreaseItemQuantityLocalstorage,
        deleteFromCartLocalstorage
    };
};
