import { generateSecureHash } from "../helper/hash";

export const LOCAL_STORAGE_KEYS = {
  WISHLIST: generateSecureHash("WISHLIST"),
  IS_REMEMBER: generateSecureHash("LOCAL_IS_REMEMBER"),
  IS_POPUP_OPEN: generateSecureHash("LOCAL_IS_POPUP_OPEN"),
  CART_ADDRESS: generateSecureHash("LOCAL_STORAGE_KEY_CART_ADDRESS"),
  ORDER: generateSecureHash("LOCAL_STORAGE_KEY_ORDER"),
  CAN_SUCCESS_ORDER: generateSecureHash("CAN_SUCCESS_ORDER"),
  SEARCH_HISTORY: generateSecureHash("SEARCH_HISTORY"),
};
export const SESSION_STORAGE_KEY = {
  ACCESS_TOKEN: generateSecureHash("SESSION_ACCESS_TOKEN"),
  REFRESH_TOKEN: generateSecureHash("SESSION_REFRESH_TOKEN"),
};
export const COOKIE_KEY = {
  ACCESS_TOKEN: generateSecureHash("COOKIE_ACCESS_TOKEN"),
  REFRESH_TOKEN: generateSecureHash("COOKIE_REFRESH_TOKEN"),
};
