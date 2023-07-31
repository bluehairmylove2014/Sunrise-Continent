import { axios, isAxiosError } from "../../config/axios";
import { Services } from "../../service";

export class CartService extends Services {
  API_URL = "";
  url = this.API_URL + "/cart";
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
      if (!params.accessToken) {
        return {
          message: "Authorization token is not valid",
        };
      } else {
        const response = await axios.post(
          this.addToCartUrl,
          {
            product: params.item,
            quantity: params.quantity,
          },
          {
            headers: {
              Authorization: `Bearer ${params.accessToken}`,
            },
            signal: this.abortController.signal,
          }
        );
        return response.data;
      }
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        throw error;
      } else if (isAxiosError(error)) {
        if (error.status === 404 && error.message === "Cannot find cart") {
          // Handle here
          return {
            message: error.message,
          };
        } else if (
          error.status === 401 &&
          error.message === "Product data is invalid"
        ) {
          // Handle here
          return {
            message: error.message,
          };
        }
      }
      return {
        message: "Add to cart unknown error",
      };
    }
  };
  updateCart = async (params) => {
    this.abortController = new AbortController();
    try {
      if (!params.accessToken) {
        return {
          message: "Authorization token is not valid",
        };
      } else {
        const response = await axios.put(
          this.updateCartUrl,
          {
            cart: params.cart,
          },
          {
            headers: {
              Authorization: `Bearer ${params.accessToken}`,
            },
            signal: this.abortController.signal,
          }
        );
        return response.data;
      }
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        throw error;
      } else if (isAxiosError(error)) {
        if (error.status === 404 && error.message === "Cannot find cart") {
          // Handle here
          return {
            message: error.message,
          };
        } else if (
          error.status === 401 &&
          error.message === "Cart data is invalid or not exist!"
        ) {
          // Handle here
          return {
            message: error.message,
          };
        }
      }
      return {
        message: "Update cart unknown error",
      };
    }
  };
  deleteFromCart = async (params) => {
    this.abortController = new AbortController();
    try {
      if (!params.accessToken) {
        return {
          message: "Authorization token is not valid",
        };
      } else {
        const response = await axios.delete(this.deleteFromCartUrl, {
          params: {
            productId: params.productId,
          },
          headers: {
            Authorization: `Bearer ${params.accessToken}`,
          },
          signal: this.abortController.signal,
        });
        return response.data;
      }
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        throw error;
      } else if (isAxiosError(error)) {
        if (error.status === 404 && error.message === "Cannot find cart") {
          // Handle here
          return {
            message: error.message,
          };
        } else if (
          error.status === 401 &&
          error.message === "Product id is invalid or not exist!"
        ) {
          // Handle here
          return {
            message: error.message,
          };
        }
      }
      return {
        message: "Update cart unknown error",
      };
    }
  };
  decreaseItemQuantity = async (params) => {
    this.abortController = new AbortController();
    try {
      if (!params.accessToken) {
        return {
          message: "Authorization token is not valid",
        };
      } else {
        const response = await axios.delete(this.decreaseItemQuantityUrl, {
          params: {
            productId: params.productId,
            quantity: params.quantity,
          },
          headers: {
            Authorization: `Bearer ${params.accessToken}`,
          },
          signal: this.abortController.signal,
        });
        return response.data;
      }
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        throw error;
      } else if (isAxiosError(error)) {
        if (error.status === 404 && error.message === "Cannot find cart") {
          // Handle here
          return {
            message: error.message,
          };
        } else if (
          error.status === 401 &&
          error.message === "Product id is invalid or not exist!"
        ) {
          // Handle here
          return {
            message: error.message,
          };
        }
      }
      return {
        message: "Update cart unknown error",
      };
    }
  };
  clearCart = async (params) => {
    this.abortController = new AbortController();
    try {
      if (!params.accessToken) {
        return {
          message: "Authorization token is not valid",
        };
      } else {
        const response = await axios.delete(this.clearCartUrl, {
          headers: {
            Authorization: `Bearer ${params.accessToken}`,
          },
          signal: this.abortController.signal,
        });
        return response.data;
      }
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        throw error;
      } else if (
        isAxiosError(error) &&
        error.status === 404 &&
        error.message === "Cannot find cart"
      ) {
        return {
          message: error.message,
        };
      }
      return {
        message: "Clear unknown error",
      };
    }
  };
  getCart = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await axios.get(this.getCartUrl, {
        headers: {
          Authorization: `Bearer ${params}`,
        },
        signal: this.abortController.signal,
      });
      return response.data;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        throw error;
      }
    }
    return {
      message: "Get cart unknown error",
    };
  };
}
