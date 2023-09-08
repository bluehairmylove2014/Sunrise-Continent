// Import necessary modules and functions
import { useMemo } from "react";
import { useSearchContext } from "../context";

export const useGetRecommendProduct = () => {
  const { state } = useSearchContext();
  return useMemo(() => state.recommendProduct, [state.recommendProduct]);
};
