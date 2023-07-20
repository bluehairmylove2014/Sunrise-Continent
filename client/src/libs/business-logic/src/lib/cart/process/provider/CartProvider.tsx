import React from "react";
import { ContextProvider } from "./ContextProvider";

export type CartProviderType = {
  children: React.ReactNode;
  accessToken: string | null;
};
export const CartProvider: React.FC<CartProviderType> = ({ 
  children, accessToken 
}) => {
  return (
    <ContextProvider accessToken={accessToken}>
      {children}
    </ContextProvider>
  );
};
