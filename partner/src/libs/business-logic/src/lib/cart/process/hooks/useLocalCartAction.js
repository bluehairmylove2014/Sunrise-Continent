// Importing necessary modules and functions
import { useCartContext } from "../context";
import {
  getCartLocalStorage,
  setCartLocalStorage,
} from "../helper/localStorageHelper";

export const useLocalCartAction = () => {
  const { dispatch } = useCartContext();

  const setCart = (cartData) => {
    dispatch({
      type: "SET_CART_ACTION",
      payload: cartData,
    });
    setCartLocalStorage(cartData);
  };
  const addToCart = (product) => {
    const localCart = getCartLocalStorage(); // Get cart from LocalStorage
    if (localCart) {
      // Case if cart is in LocalStorage
      let newCart = [...localCart]; // Make a copy
      if (!newCart || !newCart.length) {
        // If cart does not have product
        // Or if product variable is an empty array
        // Then set new
        newCart = [product];
      } else {
        // Cart already has other products then find if the product
        // Need to add is already in the cart or not, if yes then add
        // The quantity. Not yet then push to the top (for user to see :V)
        const productInCart = newCart.find(
          (p) => p.hotel.id === product.hotel.id
        );
        if (!productInCart) {
          newCart.unshift(product);
        } else if (
          productInCart.room.findIndex((rd) => rd.id === product.room[0].id) !==
          -1
        ) {
          return {
            isSuccess: false,
            msg: "Sản phẩm đã tồn tại",
          };
        } else {
          newCart = newCart.filter(
            (cartItem) => cartItem.hotel.id !== product.hotel.id
          );
          productInCart.room.push(product.room[0]);
          newCart.push(productInCart);
        }
      }
      setCart(newCart);
    } else {
      // Otherwise, set new for both
      setCart([product]);
    }

    return {
      isSuccess: true,
      msg: "Thêm vào giỏ hàng thành công",
    };
  };
  const deleteFromCartLocalStorage = (productID) => {
    const localCart = getCartLocalStorage(); // Get cart from LocalStorage
    if (localCart) {
      // Case if cart is in LocalStorage
      setCartLocalStorage(localCart.filter((p) => p.id !== productID));
    }
  };

  return {
    setCart,
    addToCart,
    deleteFromCartLocalStorage: deleteFromCartLocalStorage,
  };
};
