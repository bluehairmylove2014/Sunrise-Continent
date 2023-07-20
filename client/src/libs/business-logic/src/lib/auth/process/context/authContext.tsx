import React from "react";
import { useContext } from "react";
import { AuthContextType } from "./type";

export const AuthContext = React.createContext<AuthContextType>({
  state: { 
    token: null
  },
  dispatch: () => undefined,
  setProviderToken: null
});

export const useAuthContext = () => {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error("useAuthContext must be used within a AuthProvider");
  }
  return context;
};
