import { ICart, IProduct } from "../../entities";

export type messageResponse = {
  message: string
};
export type AddToCartParams = {
  accessToken?: string | null,
  item: IProduct,
  quantity: number
};
export type AddToCartResponse = messageResponse;

export type GetCartParams = string;
export type GetCartResponse = ICart | messageResponse;

export type UpdateCartParams = {
  accessToken?: string | null,
  cart: ICart
};
export type UpdateCartResponse = messageResponse;

export type DecreaseItemQuantityParams = {
  accessToken?: string | null,
  productId: string,
  quantity: number
};
export type DeleteFromCartParams = {
  accessToken?: string | null,
  productId: string
};
export type DeleteFromCartResponse = messageResponse;

export type ClearCartParams = {
  accessToken: string | null,
};
export type ClearCartResponse = messageResponse;

