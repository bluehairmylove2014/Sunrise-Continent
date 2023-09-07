import { LOCAL_STORAGE_KEYS } from "../../../../configs/constants";

// This function will get the cart from localStorage
export const getSearchHistoryLocalStorage = () => {
  if (typeof window !== "undefined") {
    const storedValue = localStorage.getItem(LOCAL_STORAGE_KEYS.SEARCH_HISTORY);
    return storedValue ? JSON.parse(storedValue) : [];
  }
  return [];
};

// This function will save the cart to localStorage
export const setSearchHistoryLocalStorage = (searchHistory) => {
  if (typeof window !== "undefined") {
    localStorage.setItem(
      LOCAL_STORAGE_KEYS.SEARCH_HISTORY,
      JSON.stringify(searchHistory)
    );
  }
};

// This function will delete the cart from localStorage
export const deleteSearchHistoryLocalStorage = () => {
  setSearchHistoryLocalStorage([]);
};
