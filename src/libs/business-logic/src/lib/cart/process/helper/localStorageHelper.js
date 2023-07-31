import { LOCAL_STORAGE_KEY } from "../../constants";

// This function will get the cart from localStorage
export const getCartLocalStorage = () => {
  if (typeof window !== "undefined") {
    const storedValue = localStorage.getItem(LOCAL_STORAGE_KEY.CART_ADDRESS);
    return storedValue ? JSON.parse(storedValue) : null;
  }
  return null;
};

// This function will save the cart to localStorage
export const setCartLocalStorage = (cart) => {
  if (typeof window !== "undefined") {
    localStorage.setItem(LOCAL_STORAGE_KEY.CART_ADDRESS, JSON.stringify(cart));
  }
};

// This function will delete the cart from localStorage
export const deleteCartLocalStorage = () => {
  if (typeof window !== "undefined") {
    localStorage.removeItem(LOCAL_STORAGE_KEY.CART_ADDRESS);
  }
};
