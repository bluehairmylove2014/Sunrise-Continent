export interface AuthState {
  token: string | null;
}

export type AuthAction = {
  type: string;
  payload: AuthState["token"];
};

export type ProviderSetTokenType = React.Dispatch<React.SetStateAction<string | null>> | null;

export type AuthContextType = {
  state: AuthState;
  dispatch: React.Dispatch<AuthAction>;
  setProviderToken: ProviderSetTokenType
};
