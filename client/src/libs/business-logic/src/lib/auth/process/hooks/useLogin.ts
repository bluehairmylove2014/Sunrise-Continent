// Importing necessary modules and functions
import { AuthenticationResponse, AxiosError, LoginParams } from "@org/services";
import { BROADCAST_MESSAGE } from "../../constants";
import { useLoginMutation } from "../../fetching/mutation";
import { useAccessToken } from "./useAccessToken";
import { useAuthBroadcastChannel } from "./useAuthBroadcastChannel";

// Defining the type for the useLogin hook
type UseLoginType = {
  onLogin: (params: LoginParams) => Promise<AuthenticationResponse>;
  isLoading: boolean;
};

export const useLogin = (): UseLoginType => {
  const { postMessage } = useAuthBroadcastChannel();
  // Defining the login mutation
  const loginMutation = useLoginMutation();

  // Getting the setToken function from useAccessToken
  const { setToken } = useAccessToken();

  const onLogin = (params: LoginParams): Promise<AuthenticationResponse> => {
    return new Promise(
      (resolve, reject: (error: Error | AxiosError) => void) => {
        loginMutation
          .mutateAsync(params)
          .then((response: AuthenticationResponse) => {
            // If the response is successful and a token is received, set the token and broadcast it
            if (response.statusCode === 200 && response.token) {
              setToken(response.token, params.isRememberMe);
              // Broadcasting the login message
              postMessage({
                message: BROADCAST_MESSAGE.SEND_TOKEN,
                token: response.token,
                isRemember: params.isRememberMe
              });
            }

            // Resolving the promise with the response
            resolve({
              statusCode: response.statusCode,
              message: response.message
            });
          })
          .catch((error: Error | AxiosError) => {
            // Rejecting the promise in case of an error
            reject(error);
          });
      }
    );
  };

  // Returning the onLogin function and the loading state
  return {
    onLogin,
    isLoading: loginMutation.isLoading
  };
};
