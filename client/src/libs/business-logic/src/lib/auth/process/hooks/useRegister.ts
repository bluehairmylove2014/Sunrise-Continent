// Import necessary modules and hooks
import { AuthenticationResponse, RegisterParams } from "@org/services";
import { BROADCAST_MESSAGE } from "../../constants";
import { useRegisterMutation } from "../../fetching/mutation";
import { useAccessToken } from "./useAccessToken";
import { useAuthBroadcastChannel } from "./useAuthBroadcastChannel";

const isRememberMeDefault = false;
const failMessage = "Registration failed";
// Define useRegister hook
type UseRegisterType = {
  onRegister: (params: RegisterParams) => Promise<AuthenticationResponse>;
  isLoading: boolean;
};
export const useRegister = (): UseRegisterType => {
  const { postMessage } = useAuthBroadcastChannel();
  const { setToken } = useAccessToken();
  // Define mutation for register function with retry and success/error handlers
  const registerMutation = useRegisterMutation();

  // Define onRegister function to handle registration
  const onRegister = (
    params: RegisterParams
  ): Promise<AuthenticationResponse> => {
    return new Promise((resolve, reject) => {
      registerMutation
        .mutateAsync(params)
        .then((response: AuthenticationResponse) => {
          // On success, if token is present, store it in session storage and update context

          if (response.statusCode === 200 && response.token) {
            setToken(response.token, isRememberMeDefault);
            postMessage({
              message: BROADCAST_MESSAGE.SEND_TOKEN,
              token: response.token,
              isRemember: isRememberMeDefault
            });
            resolve({
              statusCode: response.statusCode,
              message: response.message
            });
          } else {
            reject({
              statusCode: response.statusCode,
              message: failMessage
            });
          }
        })
        .catch((error: Error) => {
          reject(error);
        });
    });
  };

  // Return onRegister function and loading status
  return {
    onRegister,
    isLoading: registerMutation.isLoading
  };
};
