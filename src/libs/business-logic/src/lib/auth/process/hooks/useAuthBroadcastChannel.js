/* eslint-disable react-hooks/exhaustive-deps */
// Importing the SESSION_STORAGE_KEY from constants
import { authConfig } from "../../../../configs";
import { useCallback, useEffect } from "react";
import { BROADCAST_CHANNEL, BROADCAST_MESSAGE } from "../../constants";
import { useAuthContext } from "../context";
import { getIsRememberMeLocalStorage } from "../helper/localStorageHelper";
import { useAccessToken } from "./useAccessToken";
import { useHandleRefreshToken } from "./useHandleRefreshToken";

let bc = null;

export const useAuthBroadcastChannel = () => {
  const tokenController = useAccessToken();
  const { setRefreshToken, deleteRefreshToken, getRefreshToken } =
    useHandleRefreshToken();
  const { state } = useAuthContext();

  // Method to post messages
  const postMessage = useCallback((message) => {
    bc && bc.postMessage(message);
  }, []);

  useEffect(() => {
    if (authConfig.isNeedBroadcast && !bc) {
      bc = new BroadcastChannel(BROADCAST_CHANNEL.AUTH_CHANNEL);
    }
    // Method to handle incoming messages
    const handleMessage = (event) => {
      if (typeof window !== "undefined" && event.source !== window.self) {
        switch (event.data.message) {
          case BROADCAST_MESSAGE.SEND_TOKEN:
            // If the token is present and different from the current one, update it
            if (
              event.data.token &&
              event.data.refreshToken &&
              state.token !== event.data.token
            ) {
              tokenController.setToken(event.data.token, event.data.isRemember);
              setRefreshToken(event.data.refreshToken, event.data.isRemember);
            }
            break;
          case BROADCAST_MESSAGE.NEED_TOKEN: {
            const rememberMeOption = getIsRememberMeLocalStorage();
            const token = tokenController.getToken();
            const refreshToken = getRefreshToken();
            if (token) {
              postMessage({
                message: BROADCAST_MESSAGE.SEND_TOKEN,
                token,
                refreshToken,
                isRemember: rememberMeOption,
              });
            }
            break;
          }
          case BROADCAST_MESSAGE.NEED_LOGOUT:
            tokenController.deleteToken();
            deleteRefreshToken();
            break;
          default:
            break;
        }
      }
    };

    bc && authConfig.isNeedBroadcast && (bc.onmessage = handleMessage);
  }, []);

  return { postMessage };
};
