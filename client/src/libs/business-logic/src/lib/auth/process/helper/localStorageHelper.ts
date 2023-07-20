import { LOCAL_STORAGE_KEY } from "../../constants";

export const setIsRememberMeLocalstorage = (value: boolean): void => {
  if (typeof window !== "undefined") {
    localStorage.setItem(LOCAL_STORAGE_KEY.IS_REMEMBER, JSON.stringify(value));
  }
};

export const getIsRememberMeLocalStorage = (): boolean | null => {
  if (typeof window !== "undefined") {
    const storedValue = localStorage.getItem(LOCAL_STORAGE_KEY.IS_REMEMBER);
    return storedValue ? JSON.parse(storedValue) : null;
  }
  return null;
};

export const removeIsRememberMeLocalstorage = (): void => {
  if (typeof window !== "undefined") {
    localStorage.removeItem(LOCAL_STORAGE_KEY.IS_REMEMBER);
  }
};
