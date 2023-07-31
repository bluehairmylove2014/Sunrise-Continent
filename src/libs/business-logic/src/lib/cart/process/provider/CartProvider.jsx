import React from "react";
import { withTokenFromContext } from "../../../dataCoordinator";
import { ContextProvider } from "./ContextProvider";

export const CartProvider = ({ children }) => {
  const EnhancedProvider = withTokenFromContext(ContextProvider);
  return <EnhancedProvider>{children}</EnhancedProvider>;
};
