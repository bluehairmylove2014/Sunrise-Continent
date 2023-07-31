/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useReducer } from "react";
import { OrderContext } from "../context/orderContext";
import { orderReducer } from "../context/reducer";
import { useInitOrder } from "../hooks";


export const ContextProvider = ({
  children,
  accessToken,
  cart
}) => {
  const [state, dispatch] = useReducer(orderReducer, {
    order: null,
    accessToken: accessToken
  });
  const { onInitOrder } = useInitOrder();
  useEffect(() => {
    dispatch({
      type: "SET_TOKEN_ACTION",
      payload: accessToken
    });
    if (accessToken) {
      onInitOrder(accessToken)
        .then((data) => {
          if (data) {
            dispatch({
              type: "SET_ORDER",
              payload: {
                ...data,
                orderSummary: cart?.items ?? data.orderSummary
              }
            });
          }
        })
        .catch((err) => {
          console.error("Error get order context provider: ", err);
        });
    }
  }, [accessToken]);

  useEffect(() => {
    if (state.order) {
      dispatch({
        type: "SET_ORDER",
        payload: {
          ...state.order,
          orderSummary: cart?.items ?? state.order.orderSummary
        }
      });
    }
  }, [cart]);

  return (
    <OrderContext.Provider value={{ state, dispatch }}>
      {children}
    </OrderContext.Provider>
  );
};
