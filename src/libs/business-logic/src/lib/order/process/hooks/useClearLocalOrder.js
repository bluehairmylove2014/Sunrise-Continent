// Import necessary modules and functions
import { useOrderContext } from "../context";
import { deleteOrderLocalStorage } from "../helpers/localStorageOrder";

export const useClearLocalOrder = () => {
  const { dispatch } = useOrderContext();

  const onClearLocalOrder = () => {
    deleteOrderLocalStorage();
    dispatch({
      type: "SET_ORDER",
      payload: null,
    });
  };

  return {
    onClearLocalOrder,
  };
};
