import React from "react";
import { useContext } from "react";

export const SearchContext = React.createContext({
  state: {
    searchHistory: [],
    recommendProduct: [],
  },
  dispatch: () => undefined,
});

export const useSearchContext = () => {
  const context = useContext(SearchContext);
  if (context === undefined) {
    throw new Error("useSearchContext must be used within a SearchProvider");
  }
  return context;
};
