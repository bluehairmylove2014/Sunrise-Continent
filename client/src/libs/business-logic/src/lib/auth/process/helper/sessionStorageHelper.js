import { SESSION_STORAGE_KEY } from "../../../../configs/constants";
// Access token
export const setAccessTokenSessionStorage = (token) => {
  if (typeof window !== "undefined") {
    sessionStorage.setItem(SESSION_STORAGE_KEY.ACCESS_TOKEN, token);
  }
};

export const getAccessTokenSessionStorage = () => {
  if (typeof window !== "undefined") {
    return sessionStorage.getItem(SESSION_STORAGE_KEY.ACCESS_TOKEN);
  }
  return null;
};

export const removeAccessTokenSessionStorage = () => {
  if (typeof window !== "undefined") {
    sessionStorage.removeItem(SESSION_STORAGE_KEY.ACCESS_TOKEN);
  }
};

// Refresh token
export const setRefreshTokenSessionStorage = (refreshToken) => {
  if (typeof window !== "undefined") {
    sessionStorage.setItem(SESSION_STORAGE_KEY.REFRESH_TOKEN, refreshToken);
  }
};

export const getRefreshTokenSessionStorage = () => {
  if (typeof window !== "undefined") {
    return sessionStorage.getItem(SESSION_STORAGE_KEY.REFRESH_TOKEN);
  }
  return null;
};

export const removeRefreshTokenSessionStorage = () => {
  if (typeof window !== "undefined") {
    sessionStorage.removeItem(SESSION_STORAGE_KEY.REFRESH_TOKEN);
  }
};
