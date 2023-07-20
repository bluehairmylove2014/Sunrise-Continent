import { ICart } from "libs/services/src/entities";

export interface CartState {
  cart: ICart | null;
  accessToken: string | null;
}

type deleteItemPayload = {productId: string, quantity?: number}

export type CartAction = {
  type: string;
  payload: CartState["cart"] | CartState["accessToken"] | deleteItemPayload;
};

export type CartContextType = {
  state: CartState;
  dispatch: React.Dispatch<CartAction>;
};
