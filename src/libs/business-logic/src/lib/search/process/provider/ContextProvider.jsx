/* eslint-disable react-hooks/exhaustive-deps */
import React, { useReducer } from "react";
import { cartReducer } from "../context/reducer";
import { SearchContext } from "../context/searchContext";
import { getSearchHistoryLocalStorage } from "../helper/localStorageHelper";

export const ContextProvider = ({ children }) => {
  const [state, dispatch] = useReducer(cartReducer, {
    searchHistory: getSearchHistoryLocalStorage(),
    recommendProduct: [],
  });

  return (
    <SearchContext.Provider value={{ state, dispatch }}>
      {children}
    </SearchContext.Provider>
  );
};
