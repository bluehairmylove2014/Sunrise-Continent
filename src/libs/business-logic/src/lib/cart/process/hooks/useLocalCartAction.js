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
  const addToCart = (product, quantity) => {
    const localCart = getCartLocalStorage(); // Get cart from LocalStorage
    if (localCart) {
      // Case if cart is in LocalStorage
      const newCart = { ...localCart }; // Make a copy
      if (!newCart.items || !newCart.items.length) {
        // If cart does not have product
        // Or if product variable is an empty array
        // Then set new
        newCart.items = [{ item: product, quantity }];
      } else {
        // Cart already has other products then find if the product
        // Need to add is already in the cart or not, if yes then add
        // The quantity. Not yet then push to the top (for user to see :V)
        const productInCart = newCart.items.find(
          (p) => p.item.id === product.id
        );
        if (productInCart) {
          productInCart.quantity += quantity;
        } else {
          newCart.items.unshift({ item: product, quantity });
        }
      }
      setCart(newCart);
    } else {
      // Otherwise, set new for both
      setCart({
        items: [{ item: product, quantity }],
      });
    }
  };
  const decreaseItemQuantityLocalStorage = (productID, quantity) => {
    const localCart = getCartLocalStorage(); // Get cart from LocalStorage
    if (localCart?.items) {
      // Case if cart is in LocalStorage
      const targetProduct = localCart.items.find(
        (p) => p.item.id === productID
      );
      if (targetProduct) {
        targetProduct.quantity -= quantity;
      }

      setCartLocalStorage(localCart);
    }
  };
  const deleteFromCartLocalStorage = (productID) => {
    const localCart = getCartLocalStorage(); // Get cart from LocalStorage
    if (localCart?.items) {
      // Case if cart is in LocalStorage
      localCart.items = localCart.items.filter((p) => p.item.id !== productID);

      setCartLocalStorage(localCart);
    }
  };

  return {
    setCart,
    addToCart,
    decreaseItemQuantityLocalStorage: decreaseItemQuantityLocalStorage,
    deleteFromCartLocalStorage: deleteFromCartLocalStorage,
  };
};
