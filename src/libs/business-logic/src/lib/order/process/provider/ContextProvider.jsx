/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useReducer } from "react";
import { OrderContext } from "../context/orderContext";
import { orderReducer } from "../context/reducer";
import { defaultOrder } from "../../constants";

export const ContextProvider = ({ children, accessToken }) => {
  const [state, dispatch] = useReducer(orderReducer, {
    order: null,
    accessToken: accessToken,
  });
  useEffect(() => {
    dispatch({
      type: "SET_TOKEN_ACTION",
      payload: accessToken,
    });
  }, [accessToken]);

  useEffect(() => {
    if (!state.order) {
      dispatch({
        type: "SET_ORDER",
        payload: defaultOrder,
      });
    }
  }, []);

  return (
    <OrderContext.Provider value={{ state, dispatch }}>
      {children}
    </OrderContext.Provider>
  );
};
