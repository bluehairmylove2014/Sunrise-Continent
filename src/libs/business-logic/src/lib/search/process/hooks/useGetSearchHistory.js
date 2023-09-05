// Import necessary modules and functions
import { useMemo } from "react";
import { useSearchContext } from "../context";

export const useGetSearchHistory = () => {
  const { state } = useSearchContext();
  return useMemo(() => state.searchHistory, [state.searchHistory]);
};
