import { IAccount } from "../../entities";

export type GetAccountParams = void;
export type GetAccountResponse = IAccount[];

export type AccessToken = string;
export type RegisterParams = Pick<
  IAccount,
  "email" | "firstName" | "lastName" | "password"
>;
export type LoginParams = {
  isRememberMe: boolean;
  account: Pick<IAccount, "email" | "password">;
};

export type AuthenticationResponse = {
  statusCode?: number;
  message: string;
  token?: string;
}

export type GoogleLoginResponse = {
  accessToken: string;
  expiresIn: number;
}
