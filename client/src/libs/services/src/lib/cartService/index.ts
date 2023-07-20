import { AxiosResponse, axios, isAxiosError } from "../../config/axios";
import { Services } from "../../service";
import {
  AddToCartParams,
  AddToCartResponse,
  UpdateCartParams,
  UpdateCartResponse,
  DeleteFromCartParams,
  DecreaseItemQuantityParams,
  DeleteFromCartResponse,
  ClearCartResponse,
  GetCartParams,
  GetCartResponse,
  ClearCartParams,
  messageResponse,
} from "./type";

export * from "./type";
interface ICartService {
  get addToCartUrl(): string;
  addToCart(params: AddToCartParams): Promise<AddToCartResponse>;
}
export class CartService extends Services implements ICartService {
  API_URL = "";
  url: string = this.API_URL + "/cart";
  abortController?: AbortController;

  addToCartUrl: string = this.url + "/addToCart";
  updateCartUrl: string = this.url + "/updateCart";
  deleteFromCartUrl: string = this.url + "/deleteFromCart";
  decreaseItemQuantityUrl: string = this.url + "/decreaseItemQuantity"
  clearCartUrl: string = this.url + "/clearCart";
  getCartUrl: string = this.url + "/getCart";

  addToCart = async (params: AddToCartParams): Promise<AddToCartResponse> => {
    this.abortController = new AbortController();
    try {
      if (!params.accessToken) {
        return {
          message: "Authorization token is not valid"
        }
      }
      else {
        const response: AxiosResponse<AddToCartResponse> = await axios.post(
          this.addToCartUrl,
          {
            product: params.item,
            quantity: params.quantity
          },
          {
            headers: {
              Authorization: `Bearer ${params.accessToken}`
            },
            signal: this.abortController.signal
          }
        );
        return response.data;
      }

    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        throw error;
      }
      else if(isAxiosError(error)) {
        if(error.status === 404 && error.message === 'Cannot find cart') {
          // Handle here
          return {
            message: error.message
          }
        }
        else if(error.status === 401 && error.message === 'Product data is invalid') {
          // Handle here
          return {
            message: error.message
          }
        }
      }
      return {
        message: "Add to cart unknown error"
      }
    }
  };
  updateCart = async (params: UpdateCartParams): Promise<UpdateCartResponse> => {
    this.abortController = new AbortController();
    try {
      if (!params.accessToken) {
        return {
          message: "Authorization token is not valid"
        }
      }
      else {
        console.log("ADD: ", params.cart)
        const response: AxiosResponse<AddToCartResponse> = await axios.put(
          this.updateCartUrl,
          {
            cart: params.cart
          },
          {
            headers: {
              Authorization: `Bearer ${params.accessToken}`
            },
            signal: this.abortController.signal
          }
        );
        return response.data;
      }

    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        throw error;
      }
      else if(isAxiosError(error)) {
        if(error.status === 404 && error.message === 'Cannot find cart') {
          // Handle here
          return {
            message: error.message
          }
        }
        else if(error.status === 401 && error.message === 'Cart data is invalid or not exist!') {
          // Handle here
          return {
            message: error.message
          }
        }
      }
      return {
        message: "Update cart unknown error"
      }
    }
  };
  deleteFromCart = async (params: DeleteFromCartParams): Promise<DeleteFromCartResponse> => {
    this.abortController = new AbortController();
    try {
      if (!params.accessToken) {
        return {
          message: "Authorization token is not valid"
        }
      }
      else {
        const response: AxiosResponse<AddToCartResponse> = await axios.delete(
          this.deleteFromCartUrl,
          {
            params: {
              productId: params.productId
            },
            headers: {
              Authorization: `Bearer ${params.accessToken}`
            },
            signal: this.abortController.signal
          }
        );
        return response.data;
      }

    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        throw error;
      }
      else if(isAxiosError(error)) {
        if(error.status === 404 && error.message === 'Cannot find cart') {
          // Handle here
          return {
            message: error.message
          }
        }
        else if(error.status === 401 && error.message === 'Product id is invalid or not exist!') {
          // Handle here
          return {
            message: error.message
          }
        }
      }
      return {
        message: "Update cart unknown error"
      }
    }
  };
  decreaseItemQuantity = async (params: DecreaseItemQuantityParams): Promise<messageResponse> => {
    this.abortController = new AbortController();
    try {
      if (!params.accessToken) {
        return {
          message: "Authorization token is not valid"
        }
      }
      else {
        const response: AxiosResponse<AddToCartResponse> = await axios.delete(
          this.decreaseItemQuantityUrl,
          {
            params: {
              productId: params.productId,
              quantity: params.quantity
            },
            headers: {
              Authorization: `Bearer ${params.accessToken}`
            },
            signal: this.abortController.signal
          }
        );
        return response.data;
      }

    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        throw error;
      }
      else if(isAxiosError(error)) {
        if(error.status === 404 && error.message === 'Cannot find cart') {
          // Handle here
          return {
            message: error.message
          }
        }
        else if(error.status === 401 && error.message === 'Product id is invalid or not exist!') {
          // Handle here
          return {
            message: error.message
          }
        }
      }
      return {
        message: "Update cart unknown error"
      }
    }
  };
  clearCart = async (params: ClearCartParams): Promise<ClearCartResponse> => {
    this.abortController = new AbortController();
    try {
      if (!params.accessToken) {
        return {
          message: "Authorization token is not valid"
        }
      }
      else {
        const response: AxiosResponse<ClearCartResponse> = await axios.delete(
          this.clearCartUrl,
          {
            headers: {
              Authorization: `Bearer ${params.accessToken}`
            },
            signal: this.abortController.signal
          }
        );
        return response.data;
      }

    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        throw error;
      }
      else if(
        isAxiosError(error) &&
        error.status === 404 &&
        error.message === 'Cannot find cart'
      ) {
        return {
          message: error.message
        }
      }
      return {
        message: "Clear unknown error"
      }
    }
  };
  getCart = async (params: GetCartParams): Promise<GetCartResponse> => {
    this.abortController = new AbortController();
    try {
      const response: AxiosResponse<AddToCartResponse> = await axios.get(
        this.getCartUrl,
        {
          headers: {
            Authorization: `Bearer ${params}`
          },
          signal: this.abortController.signal
        }
      );
      return response.data;

    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        throw error;
      }
    }
    return {
      message: "Get cart unknown error"
    }
  };
}
