import { IProduct } from "./product";

export interface ICartItem {
  item: IProduct,
  quantity: number
}

export interface ICart {
  items: ICartItem[] | null;
}
