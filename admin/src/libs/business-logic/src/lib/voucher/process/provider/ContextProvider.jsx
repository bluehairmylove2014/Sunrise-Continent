/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useReducer } from "react";
import { VoucherContext } from "../context/voucherContext";
import { orderReducer } from "../context/reducer";
import { useGetVoucher } from "../hooks";

export const ContextProvider = ({ children, accessToken }) => {
  const [state, dispatch] = useReducer(orderReducer, {
    voucher: undefined,
    accessToken: accessToken,
  });
  const { onGetVoucher } = useGetVoucher();
  useEffect(() => {
    dispatch({
      type: "SET_TOKEN_ACTION",
      payload: accessToken,
    });
    if (accessToken) {
      onGetVoucher(accessToken)
        .then((data) => {
          dispatch({
            type: "SET_VOUCHER",
            payload: data,
          });
        })
        .catch((error) => {
          console.error(error);
        });
    }
  }, [accessToken]);

  return (
    <VoucherContext.Provider value={{ state, dispatch }}>
      {children}
    </VoucherContext.Provider>
  );
};
