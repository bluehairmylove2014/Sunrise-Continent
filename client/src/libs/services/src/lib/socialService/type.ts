import { IAccount } from "../../entities";

export type ValidateTokenResponse = {
  email?: string;
  email_verified?: string;
  expires_in?: string;
}
export type GoogleValidateTokenResponse = {
  azp: string;
  aud: string;
  sub: string;
  scope: string; // "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile openid"
  exp: string; // "1689045290"
  expires_in: string; // "3597"
  email: string; // "abc@gmail.com"
  email_verified: string; // "true"
  access_type: string; // "online"
}
export type UpdateAccountParams = Pick<
  IAccount,
  "email" | "firstName" | "lastName"
>;
export type UpdateAccountResponse = {
  message: string
}
export type GoogleGetUserInfoResponse = {
  names: [
    {
      displayName: string;
      familyName: string;
      givenName: string;
      displayNameLastFirst: string;
      unstructuredName: string;
    }
  ];
  emailAddresses: [
    {
      value: string;
    }
  ];
};
export type GetUserInforResponse = {
  email: string,
  firstName: string,
  lastName: string
};
export type GetFBAccessTokenParams = {
  clientId: string,
  clientSecret: string,
  redirectUri: string,
  code: string
}
export type GetFBAccessTokenResponse = {
  access_token: string, 
  token_type: string,
  expires_in:  string
}