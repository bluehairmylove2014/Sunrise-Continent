import React from "react";
import { withCartFromContext } from "../../../dataCoordinator";
import { ContextProvider } from "./ContextProvider";

export const OrderProvider = ({ children }) => {
  const EnhancedProvider = withCartFromContext(ContextProvider);
  return <EnhancedProvider>{children}</EnhancedProvider>;
};
