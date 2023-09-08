import React from "react";
import { useContext } from "react";

export const AccountContext = React.createContext({
  state: {
    accessToken: null,
  },
  dispatch: () => undefined,
});

export const useAccountContext = () => {
  const context = useContext(AccountContext);
  if (context === undefined) {
    throw new Error("useAccountContext must be used within a AccountProvider");
  }
  return context;
};
