// Import necessary modules and functions
import { useGetOrderMutation } from "../../fetching/mutation";
import { useOrderContext } from "../context";

export const useInitOrder = () => {
  const { state, dispatch } = useOrderContext();
  const getOrderMutation = useGetOrderMutation();

  const onInitOrder = (initAccessToken) => {
    return new Promise((resolve, reject) => {
      const accessToken = initAccessToken ? initAccessToken : state.accessToken;
      if (accessToken) {
        getOrderMutation
          .mutateAsync({
            accessToken,
          })
          .then((res) => {
            dispatch({
              type: "SET_ORDER",
              payload: res.orders,
            });
            resolve(res.orders);
          })
          .catch((err) => {
            reject(err);
          });
      } else {
        reject(new Error("Authorization token is not valid"));
      }
    });
  };

  return {
    onInitOrder,
    isLoading: getOrderMutation.isLoading,
  };
};
