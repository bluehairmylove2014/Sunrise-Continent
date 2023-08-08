import React from "react";
import { withTokenFromContext } from "../../../../configs/withContext";
import { ContextProvider } from "./ContextProvider";

export const OrderProvider = ({ children }) => {
  const EnhancedProvider = withTokenFromContext(ContextProvider);
  return <EnhancedProvider>{children}</EnhancedProvider>;
};
