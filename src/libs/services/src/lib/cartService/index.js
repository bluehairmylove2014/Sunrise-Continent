import { isAxiosError } from "../../config/axios";
import { API_URL } from "../../config/url";
import { Services } from "../../service";
import { cartSchema, messageResponseSchema } from "./schema";

const unknownErrorMessage = "Cart service unknown error";
export class CartService extends Services {
  url = API_URL + "/cart";
  abortController;

  addToCartUrl = this.url + "/addToCart";
  updateCartUrl = this.url + "/updateCart";
  deleteFromCartUrl = this.url + "/deleteFromCart";
  decreaseItemQuantityUrl = this.url + "/decreaseItemQuantity";
  clearCartUrl = this.url + "/clearCart";
  getCartUrl = this.url + "/getCart";

  addToCart = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "POST",
        url: this.addToCartUrl,
        schema: messageResponseSchema,
        data: {
          item: params.item,
          quantity: params.quantity,
        },
        headers: {
          Authorization: `Bearer ${params.accessToken}`,
        },
        signal: this.abortController.signal,
        transformResponse: (res) => res,
      });
      return response;
    } catch (error) {
      if (this.isCancel(error)) {
        throw error;
      } else if (isAxiosError(error)) {
        throw new Error(
          error.response ? error.response.data.message : unknownErrorMessage
        );
      }
      throw new Error(unknownErrorMessage);
    }
  };
  updateCart = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "PUT",
        url: this.updateCartUrl,
        schema: messageResponseSchema,
        data: {
          cart: params.cart,
        },
        headers: {
          Authorization: `Bearer ${params.accessToken}`,
        },
        signal: this.abortController.signal,
        transformResponse: (res) => res,
      });
      return response;
    } catch (error) {
      if (this.isCancel(error)) {
        throw error;
      } else if (isAxiosError(error)) {
        throw new Error(
          error.response ? error.response.data.message : unknownErrorMessage
        );
      }
      throw new Error(unknownErrorMessage);
    }
  };
  deleteFromCart = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "DELETE",
        url: this.deleteFromCartUrl,
        schema: messageResponseSchema,
        params: {
          productId: params.productId,
        },
        headers: {
          Authorization: `Bearer ${params.accessToken}`,
        },
        signal: this.abortController.signal,
        transformResponse: (res) => res,
      });
      return response;
    } catch (error) {
      if (this.isCancel(error)) {
        // Handle other errors
        throw error;
      } else if (isAxiosError(error)) {
        throw new Error(
          error.response ? error.response.data.message : unknownErrorMessage
        );
      }
      throw new Error(unknownErrorMessage);
    }
  };
  decreaseItemQuantity = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "DELETE",
        url: this.decreaseItemQuantityUrl,
        schema: messageResponseSchema,
        params: {
          productId: params.productId,
          quantity: params.quantity,
        },
        headers: {
          Authorization: `Bearer ${params.accessToken}`,
        },
        signal: this.abortController.signal,
        transformResponse: (res) => res,
      });
      return response;
    } catch (error) {
      if (this.isCancel(error)) {
        throw error;
      } else if (isAxiosError(error)) {
        throw new Error(
          error.response ? error.response.data.message : unknownErrorMessage
        );
      }
      throw new Error(unknownErrorMessage);
    }
  };
  clearCart = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "DELETE",
        url: this.clearCartUrl,
        schema: messageResponseSchema,
        headers: {
          Authorization: `Bearer ${params.accessToken}`,
        },
        signal: this.abortController.signal,
        transformResponse: (res) => res,
      });
      return response;
    } catch (error) {
      if (this.isCancel(error)) {
        throw error;
      } else if (isAxiosError(error)) {
        throw new Error(
          error.response ? error.response.data.message : unknownErrorMessage
        );
      }
      throw new Error(unknownErrorMessage);
    }
  };
  getCart = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "GET",
        url: this.getCartUrl,
        schema: cartSchema,
        headers: {
          Authorization: `Bearer ${params}`,
        },
        signal: this.abortController.signal,
        transformResponse: (res) => res,
      });
      return response;
    } catch (error) {
      if (this.isCancel(error)) {
        throw error;
      } else if (isAxiosError(error)) {
        throw new Error(
          error.response ? error.response.data.message : unknownErrorMessage
        );
      }
      throw new Error(unknownErrorMessage);
    }
  };
}
