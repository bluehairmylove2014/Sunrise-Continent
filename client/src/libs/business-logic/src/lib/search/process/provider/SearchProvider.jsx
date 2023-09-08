import React from "react";
import { ContextProvider } from "./ContextProvider";

export const SearchProvider = ({ children }) => {
  return <ContextProvider>{children}</ContextProvider>;
};
