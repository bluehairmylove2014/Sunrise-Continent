import { useOrderContext } from "../context";

export const useInitOrder = () => {
  const { dispatch } = useOrderContext();

  const onInitOrder = (order) => {
    dispatch({
      type: "SET_ORDER",
      payload: order,
    });
  };

  return {
    onInitOrder,
  };
};
