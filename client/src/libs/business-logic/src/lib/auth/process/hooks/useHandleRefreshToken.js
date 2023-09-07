// Importing necessary constants
import { COOKIE_KEY } from "../../../../configs/constants";
import { CONTEXT_ACTION, TOKEN_EXPIRY_DAYS } from "../../constants";
// Importing authentication context
import { useAuthContext } from "../context";
// Importing cookie helper functions
import { deleteCookie, getCookie, setCookie } from "../helper/cookieHelper";
// Importing local storage helper functions
import {
  getIsRememberMeLocalStorage,
  setIsRememberMeLocalStorage,
  removeIsRememberMeLocalStorage,
} from "../helper/localStorageHelper";
// Importing session storage helper functions
import {
  setRefreshTokenSessionStorage,
  getRefreshTokenSessionStorage,
  removeRefreshTokenSessionStorage,
} from "../helper/sessionStorageHelper";

// Function to get the token
export const getRefreshToken = () => {
  // Checking if the user has chosen to be remembered
  const isRememberMe = getIsRememberMeLocalStorage();
  if (isRememberMe) {
    return getCookie(COOKIE_KEY.REFRESH_TOKEN);
  } else {
    // Otherwise, get the token from the session storage
    return getRefreshTokenSessionStorage();
  }
};

export const useHandleRefreshToken = () => {
  // Getting the dispatch function from the authentication context
  const { dispatch } = useAuthContext();

  // Function to set the token
  const setRefreshToken = (newToken, isRememberMe) => {
    if (isRememberMe) {
      // If the user has chosen to be remembered, save the token to the cookies
      setCookie(COOKIE_KEY.REFRESH_TOKEN, newToken, TOKEN_EXPIRY_DAYS.REMEMBER);
    } else {
      // Otherwise, save the token to the session storage
      setRefreshTokenSessionStorage(newToken);
    }
    // Save the remember me option to the local storage
    setIsRememberMeLocalStorage(isRememberMe);
    // Dispatch the new token to the context
    dispatch({
      type: CONTEXT_ACTION.SET_REFRESH_ACTION,
      payload: newToken,
    });
  };

  // Function to reset the token
  const resetRefreshToken = (newToken) => {
    // Checking if the user has chosen to be remembered
    const isRememberMe = getIsRememberMeLocalStorage();
    if (isRememberMe) {
      // If so, save the new token to the cookies
      setCookie(COOKIE_KEY.REFRESH_TOKEN, newToken, TOKEN_EXPIRY_DAYS.REMEMBER);
    } else {
      // Otherwise, save the new token to the session storage
      setRefreshTokenSessionStorage(newToken);
    }
    // Dispatch the new token to the context
    dispatch({
      type: CONTEXT_ACTION.SET_REFRESH_ACTION,
      payload: newToken,
    });
  };

  // Function to delete the token
  const deleteRefreshToken = () => {
    // Checking if the user has chosen to be remembered
    const isRememberMe = getIsRememberMeLocalStorage();
    if (isRememberMe) {
      // If so, delete the token from the cookies
      deleteCookie(COOKIE_KEY.REFRESH_TOKEN);
    } else {
      // Otherwise, remove the token from the session storage
      removeRefreshTokenSessionStorage();
    }
    // Remove the remember me option from the local storage
    removeIsRememberMeLocalStorage();
    // Remove the token from the context
    dispatch({
      type: CONTEXT_ACTION.SET_REFRESH_ACTION,
      payload: null,
    });
  };

  // Returning the hook functions
  return {
    getRefreshToken,
    setRefreshToken,
    resetRefreshToken,
    deleteRefreshToken,
  };
};
