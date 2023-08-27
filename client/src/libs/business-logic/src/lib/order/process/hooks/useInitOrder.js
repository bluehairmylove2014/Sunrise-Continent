import { useOrderContext } from "../context";
import { setOrderLocalStorage } from "../helpers/localStorageOrder";

export const useInitOrder = () => {
  const { dispatch } = useOrderContext();

  const onInitOrder = (order) => {
    dispatch({
      type: "SET_ORDER",
      payload: order,
    });
    setOrderLocalStorage(order);
  };

  return {
    onInitOrder,
  };
};
