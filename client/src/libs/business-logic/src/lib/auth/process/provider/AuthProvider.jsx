/* eslint-disable no-unused-vars */
import { axios } from "../../../../../../services/src";
import React from "react";
import { authConfig } from "../../../../configs";
import { useRefreshToken } from "../hooks/useRefreshToken";
import { BroadcastProvider } from "./BroadcastProvider";
import { AuthContextProvider } from "./ContextProvider";
import { useFacebookLogin, useGoogleLogin, useLogout } from "../hooks";
import { withAuthenticateUrl } from "./withAuthenticateUrl";
import { useHandleRefreshToken } from "../hooks/useHandleRefreshToken";

const EnhancedContextProvider = withAuthenticateUrl(AuthContextProvider);
// This is the AuthProvider for the entire app
export const AuthProvider = ({ children }) => {
  // Get the resetToken and getToken functions from useAccessToken
  const { getRefreshToken } = useHandleRefreshToken();
  const { onRefreshToken } = useRefreshToken();
  const { onFacebookLogin } = useFacebookLogin();
  const { onGoogleLogin } = useGoogleLogin();
  const { onLogout } = useLogout();

  // Use axios interceptor to handle response
  axios.interceptors.response.use(
    (response) => {
      // If response is successful, return the response
      return response;
    },
    (error) => {
      // If the response status is 401 and the message is "Invalid credential"
      // It means token is expired now! Need to refresh
      if (
        error.response?.status === 401 &&
        // error.response.data?.message === "Invalid credential" &&
        authConfig.isNeedRefreshToken
      ) {
        // Get the token
        const refreshToken = getRefreshToken();
        if (refreshToken) {
          // If token exists, refresh the token
          onRefreshToken(refreshToken)
            .then((res) => {
              // Check if res.token is undefined
              if (!res.token) {
                return Promise.reject(error);
              }

              // Update the new token for the request
              error.config.headers["Authorization"] = "Bearer " + res.token;
            })
            .catch((err) => {
              onLogout();
            })
            .finally(() => {
              // Resend the request with the new token
              return axios(error.config);
            });
        } else {
          onLogout();
        }
      }
      // If any other error, reject the promise
      return Promise.reject(error);
    }
  );

  // Return the AuthContextProvider and BroadcastProvider with children
  return (
    <EnhancedContextProvider>
      <BroadcastProvider>{children}</BroadcastProvider>
    </EnhancedContextProvider>
  );
};
