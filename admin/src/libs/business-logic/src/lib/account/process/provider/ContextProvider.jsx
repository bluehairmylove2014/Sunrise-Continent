/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useReducer } from "react";
import { AccountContext } from "../context/accountContext";
import { accountReducer } from "../context/reducer";

export const ContextProvider = ({ children, accessToken }) => {
  const [state, dispatch] = useReducer(accountReducer, {
    accessToken: accessToken,
  });
  useEffect(() => {
    dispatch({
      type: "SET_TOKEN_ACTION",
      payload: accessToken,
    });
  }, [accessToken]);

  return (
    <AccountContext.Provider value={{ state, dispatch }}>
      {children}
    </AccountContext.Provider>
  );
};
