// Importing necessary libraries and services
import { useAuthContext } from "../context";
import React from 'react'

// Hook to check if the user is logged in
export const useIsLogged = () => {
  const { state } = useAuthContext();
  return React.useMemo(() => ({
    isLogin: Boolean(state.token)
  }), [state.token]);
};
