import { axios, isAxiosError } from "../../config/axios";
import { Services } from "../../service";
import { API_URL } from "../../config/url";

const unknownError = "Unexpected error occurred";

export class AuthService extends Services {
  url = API_URL + "/auth";
  abortController;

  registerUrl = this.url + "/register";
  loginUrl = this.url + "/login";
  refreshTokenUrl = this.url + "/refresh-token";
  getUserUrl = this.url + "/get-user";

  register = async (data) => {
    this.abortController = new AbortController();
    try {
      const response = await axios.post(this.registerUrl, data, {
        signal: this.abortController.signal,
      });

      return {
        statusCode: response.status,
        message: response.data.message,
        token: response.data.token,
      };
    } catch (error) {
      if (!this.isCancel(error)) {
        // Check if it's email exist error?
        if (
          !isAxiosError(error) ||
          !error.response ||
          error.response.status !== 401
        )
          throw error;
        return { message: error.response.data.message || unknownError };
      }
      console.error(error);
      return { message: unknownError };
    }
  };
  login = async (data) => {
    this.abortController = new AbortController();
    try {
      const response = await axios.post(this.loginUrl, data, {
        signal: this.abortController.signal,
      });

      return {
        statusCode: response.status,
        message: response.data.message,
        token: response.data.token,
      };
    } catch (error) {
      if (!this.isCancel(error)) {
        // Check if it's wrong email password error?
        if (
          !isAxiosError(error) ||
          !error.response ||
          error.response.status !== 401
        )
          throw error;
        return { message: error.response.data.message || unknownError };
      }
      console.error(error);
      return { message: unknownError };
    }
  };
  refreshToken = async (data) => {
    this.abortController = new AbortController();
    try {
      const response = await axios.post(
        this.refreshTokenUrl,
        {},
        {
          headers: { Authorization: `Bearer ${data}` },
          signal: this.abortController.signal,
        }
      );
      return {
        statusCode: response.status,
        message: response.data.message,
        token: response.data.token,
      };
    } catch (error) {
      if (!this.isCancel(error)) {
        // Check if it's cannot refresh error?
        if (
          !isAxiosError(error) ||
          !error.response ||
          error.response.status !== 401
        )
          throw error;
        return { message: error.response.data.message || unknownError };
      }
      console.error(error);
      return { message: unknownError };
    }
  };
  getUser = async (token) => {
    this.abortController = new AbortController();
    try {
      if (!token) return null;
      const response = await axios.get(this.getUserUrl, {
        headers: { Authorization: `Bearer ${token}` },
        signal: this.abortController.signal,
      });
      return response.data;
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
