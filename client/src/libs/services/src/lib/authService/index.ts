import { AxiosResponse, axios } from "../../config/axios";
import { Services } from "../../service";
import {
  LoginParams,
  RegisterParams,
  AccessToken,
  AuthenticationResponse
} from "./type";

interface IAuthService {
  get registerUrl(): string;
  register(data: RegisterParams): Promise<AuthenticationResponse>;

  get loginUrl(): string;
  login(data: LoginParams): Promise<AuthenticationResponse>;

  get refreshTokenUrl(): string;
  refreshToken(data: AccessToken): Promise<AuthenticationResponse>;
}
export class AuthService extends Services implements IAuthService {
  API_URL = "";
  url: string = this.API_URL + "/auth";
  abortController?: AbortController;

  registerUrl: string = this.url + "/register";
  loginUrl: string = this.url + "/login";
  refreshTokenUrl: string = this.url + "/refreshToken";

  register = async (data: RegisterParams): Promise<AuthenticationResponse> => {
    this.abortController = new AbortController();
    try {
      const response: AxiosResponse<AuthenticationResponse> = await axios.post(
        this.registerUrl,
        data,
        {
          signal: this.abortController.signal
        }
      );

      if (response.status === 200) {
        return {
          statusCode: response.status,
          message: response.data.message,
          token: response.data.token ?? ""
        };
      } else {
        throw new Error("Error register service on resolve");
      }
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error");
        throw error;
      }
    }
    return {
      statusCode: 500,
      message: "Unexpected error occurred"
    };
  };
  login = async (data: LoginParams): Promise<AuthenticationResponse> => {
    this.abortController = new AbortController();
    try {
      const response: AxiosResponse<AuthenticationResponse> = await axios.post(
        this.loginUrl,
        data,
        {
          signal: this.abortController.signal
        }
      );

      if (response.status === 200) {
        return {
          statusCode: response.status,
          message: response.data.message,
          token: response.data.token ?? ""
        };
      } else {
        throw new Error("Error login service on resolve");
      }
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        throw error;
      }
    }
    return {
      statusCode: 500,
      message: "Unexpected error occurred"
    };
  };
  refreshToken = async (data: AccessToken): Promise<AuthenticationResponse> => {
    this.abortController = new AbortController();
    try {
      const response: AxiosResponse<AuthenticationResponse> = await axios.post(
        this.refreshTokenUrl,
        {},
        {
          headers: { Authorization: `Bearer ${data}` },
          signal: this.abortController.signal
        }
      );
      if (response.status === 200) {
        return {
          statusCode: response.status,
          message: response.data.message,
          token: response.data.token ?? ""
        };
      } else {
        throw new Error("Error is-logged-in service on resolve");
      }
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        throw error;
      }
    }
    return {
      statusCode: 500,
      message: "Unexpected error occurred"
    };
  };
}
export * from "./type";
