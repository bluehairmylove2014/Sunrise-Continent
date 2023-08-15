/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useReducer } from "react";
import { VoucherContext } from "../context/voucherContext";
import { orderReducer } from "../context/reducer";

export const ContextProvider = ({ children, accessToken }) => {
  const [state, dispatch] = useReducer(orderReducer, {
    voucher: null,
    accessToken: accessToken,
  });
  useEffect(() => {
    dispatch({
      type: "SET_TOKEN_ACTION",
      payload: accessToken,
    });
  }, [accessToken]);

  return (
    <VoucherContext.Provider value={{ state, dispatch }}>
      {children}
    </VoucherContext.Provider>
  );
};
