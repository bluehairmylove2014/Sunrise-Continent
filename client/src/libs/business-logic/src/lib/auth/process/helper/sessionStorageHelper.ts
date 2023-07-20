import { SESSION_STORAGE_KEY } from "../../constants";

export const setAccessTokenSessionStorage = (token: string): void => {
  if (typeof window !== "undefined") {
    sessionStorage.setItem(SESSION_STORAGE_KEY.ACCESS_TOKEN, token);
  }
};

export const getAccessTokenSessionStorage = (): string | null => {
  if (typeof window !== "undefined") {
    return sessionStorage.getItem(SESSION_STORAGE_KEY.ACCESS_TOKEN);
  }
  return null;
};

export const removeAccessTokenSessionStorage = (): void => {
  if (typeof window !== "undefined") {
    sessionStorage.removeItem(SESSION_STORAGE_KEY.ACCESS_TOKEN);
  }
};
