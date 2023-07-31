// Import necessary modules and functions
import { useOrderContext } from "../context";

export const useGetOrder = () => {
  const { state } = useOrderContext();
  return state.order;
};
