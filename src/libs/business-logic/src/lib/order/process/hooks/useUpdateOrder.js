// Import necessary modules and functions
import { useUpdateOrderMutation } from "../../fetching/mutation";
import { useOrderContext } from "../context";
import { useInitOrder } from "./useInitOrder";

export const useUpdateOrder = () => {
  const { state, dispatch } = useOrderContext();
  const updateOrderMutation = useUpdateOrderMutation();
  const { onInitOrder } = useInitOrder();

  const onUpdateOrder = (order) => {
    return new Promise((resolve, reject) => {
      const accessToken = state.accessToken;
      const needUpdateOrder = order ? order : state.order;
      if (!accessToken) reject(new Error("Authorization token is not valid"));
      else if (!needUpdateOrder) reject(new Error("Order is not valid"));
      else {
        updateOrderMutation
          .mutateAsync({
            accessToken,
            order: needUpdateOrder,
          })
          .then((res) => {
            resolve(res.message);
          })
          .catch((err) => {
            onInitOrder()
              .then((refreshOrder) => {
                dispatch({
                  type: "SET_ORDER",
                  payload: refreshOrder,
                });
              })
              .catch((err) => {
                console.error("Cannot refresh order: ", err);
              });
            reject(err);
          });
      }
    });
  };

  return {
    onUpdateOrder,
    isLoading: updateOrderMutation.isLoading,
  };
};
