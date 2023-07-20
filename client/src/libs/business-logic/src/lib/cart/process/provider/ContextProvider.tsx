import React, { useEffect, useReducer } from "react";
import { CartContext } from "../context/cartContext";
import { cartReducer } from "../context/reducer";
import { CONTEXT_ACTION } from "../../constants";

type ContextProviderType = {
  children: React.ReactNode;
  accessToken: string | null;
};
export const ContextProvider: React.FC<ContextProviderType> = ({
  children, accessToken
}) => {
  const [state, dispatch] = useReducer(cartReducer, {
    cart: null,
    accessToken: accessToken
  });
  
  useEffect(() => {
    dispatch({
      type: CONTEXT_ACTION.SET_TOKEN_ACTION,
      payload: accessToken
    })
  }, [accessToken])

  return (
    <CartContext.Provider value={{ state, dispatch }}>
      {children}
    </CartContext.Provider>
  );
};
