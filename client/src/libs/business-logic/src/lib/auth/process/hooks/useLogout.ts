import { BROADCAST_MESSAGE } from "../../constants";
import { useAccessToken } from "./useAccessToken";
import { useAuthBroadcastChannel } from "./useAuthBroadcastChannel";

type UseLogoutType = {
  onLogout: () => boolean;
};
export const useLogout = (): UseLogoutType => {
  const { postMessage } = useAuthBroadcastChannel();
  const { deleteToken } = useAccessToken();

  const onLogout = (): boolean => {
    try {
      // Logout success
      deleteToken();
      // Broadcast logout message
      postMessage({
        message: BROADCAST_MESSAGE.NEED_LOGOUT
      });
      return true;
    } catch (error) {
      // If any error occurs in logout process, return false to client
      return false;
    }
  };

  return {
    onLogout
  };
};
