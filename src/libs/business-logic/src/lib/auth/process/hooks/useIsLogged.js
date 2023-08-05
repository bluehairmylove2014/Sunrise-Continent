/* eslint-disable react-hooks/exhaustive-deps */
// Importing necessary libraries and services
import { useAuthContext } from "../context";
import React from "react";
import { useAccessToken } from "./useAccessToken";

// True: User is logged in and has a valid token
// False: User is NOT logged in or has an invalid (or expired) token
// Hook to check if the user is logged in
export const useIsLogged = () => {
  const { state } = useAuthContext();
  const { getToken } = useAccessToken();
  return React.useMemo(() => Boolean(state.token || getToken()), [state.token]);
};
