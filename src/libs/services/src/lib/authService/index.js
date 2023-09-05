import { isAxiosError } from "../../config/axios";
import { getApiUrl } from "../../config/url";
import { Services } from "../../service";
import { authenticationResponseSchema, getUserResponseSchema } from "./schema";

const unknownError = "Unexpected error occurred";

export class AuthService extends Services {
  url = getApiUrl() + "/auth";
  abortController;

  registerUrl = "/auth/register";
  loginUrl = "/auth/login";
  refreshTokenUrl = "/auth/refresh-token";
  getUserUrl = "/account/current-account";

  register = async (data) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "POST",
        url: this.registerUrl,
        schema: authenticationResponseSchema,
        data,
        signal: this.abortController.signal,
        transformResponse: (res) => res,
        isProduction: true,
      });
      return response;
    } catch (error) {
      if (this.isCancel(error)) {
        // Handle other errors
        throw error;
      } else if (isAxiosError(error)) {
        throw new Error(
          error.response ? error.response.data.message : unknownError
        );
      }
      throw new Error(unknownError);
    }
  };
  login = async (data) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "POST",
        url: this.loginUrl,
        schema: authenticationResponseSchema,
        data,
        signal: this.abortController.signal,
        transformResponse: (res) => res,
        isProduction: true,
      });
      // console.log(response)
      return response;
    } catch (error) {
      if (this.isCancel(error)) {
        // Handle other errors
        throw error;
      } else if (isAxiosError(error)) {
        throw new Error(
          error.response ? error.response.data.message : unknownError
        );
      }
      throw new Error(unknownError);
    }
  };
  refreshToken = async (refreshToken) => {
    this.abortController = new AbortController();
    console.log("REFRESH TOKEN: ", refreshToken);
    try {
      const response = await this.fetchApi({
        method: "POST",
        url: this.refreshTokenUrl,
        schema: authenticationResponseSchema,
        data: { refreshToken },
        headers: { Authorization: `Bearer ${refreshToken}` },
        signal: this.abortController.signal,
        transformResponse: (res) => res,
        isProduction: true,
      });
      return {
        token: response.token,
      };
    } catch (error) {
      if (this.isCancel(error)) {
        // Handle other errors
        throw error;
      } else if (isAxiosError(error)) {
        throw new Error(
          error.response ? error.response.data.message : unknownError
        );
      }
      throw new Error(unknownError);
    }
  };
  getUser = async (token) => {
    this.abortController = new AbortController();
    try {
      if (!token) return null;
      const response = await this.fetchApi({
        method: "GET",
        url: this.getUserUrl,
        schema: getUserResponseSchema,
        headers: { Authorization: `Bearer ${token}` },
        signal: this.abortController.signal,
        transformResponse: (res) => res,
        isProduction: true,
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Check if it's cannot refresh error?
        if (isAxiosError(error)) {
          throw new Error(
            error.response ? error.response.data.message : unknownError
          );
        }
        throw new Error(unknownError);
      }
      console.error(error);
      return { message: unknownError };
    }
  };
}
