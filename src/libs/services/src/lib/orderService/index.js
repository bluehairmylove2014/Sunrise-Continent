import { axios, isAxiosError } from "../../config/axios";
import { Services } from "../../service";

const unknownErrorMsg = "Order service unknown error";

export class OrderService extends Services {
  API_URL = "";
  url = this.API_URL + "/order";
  abortController;

  getOrderUrl = this.url + "/get-order";
  getShippingUrl = this.url + "/get-shipping";
  getTaxUrl = this.url + "/get-tax";
  getCouponUrl = this.url + "/get-coupon";
  updateOrderUrl = this.url + "/get-update-order";

  getOrder = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await axios.get(this.getOrderUrl, {
        headers: {
          Authorization: `Bearer ${params.accessToken}`,
        },
        signal: this.abortController.signal,
      });
      return response.data;
    } catch (error) {
      if (this.isCancel(error)) {
        // Handle other errors
        throw error;
      } else if (isAxiosError(error)) {
        throw new Error(
          error.response ? error.response.data.message : unknownErrorMsg
        );
      }
      throw new Error(unknownErrorMsg);
    }
  };
  getShipping = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await axios.get(this.getShippingUrl, {
        params: {
          address: params.address,
        },
        headers: {
          Authorization: `Bearer ${params.accessToken}`,
        },
        signal: this.abortController.signal,
      });
      return response.data;
    } catch (error) {
      if (this.isCancel(error)) {
        // Handle other errors
        throw error;
      } else if (isAxiosError(error)) {
        throw new Error(
          error.response ? error.response.data.message : unknownErrorMsg
        );
      }
      throw new Error(unknownErrorMsg);
    }
  };
  getTax = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await axios.get(this.getTaxUrl, {
        params: {
          country: params.country,
        },
        headers: {
          Authorization: `Bearer ${params.accessToken}`,
        },
        signal: this.abortController.signal,
      });
      return response.data;
    } catch (error) {
      if (this.isCancel(error)) {
        // Handle other errors
        throw error;
      } else if (isAxiosError(error)) {
        throw new Error(
          error.response ? error.response.data.message : unknownErrorMsg
        );
      }
      throw new Error(unknownErrorMsg);
    }
  };
  getCoupon = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await axios.get(this.getCouponUrl, {
        params: {
          coupon: params.couponCode,
        },
        headers: {
          Authorization: `Bearer ${params.accessToken}`,
        },
        signal: this.abortController.signal,
      });
      return response.data;
    } catch (error) {
      if (this.isCancel(error)) {
        throw error;
      } else if (isAxiosError(error)) {
        throw new Error(
          error.response ? error.response.data.message : unknownErrorMsg
        );
      }
      throw new Error(unknownErrorMsg);
    }
  };
  updateOrder = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await axios.post(this.updateOrderUrl, params.order, {
        headers: {
          Authorization: `Bearer ${params.accessToken}`,
        },
        signal: this.abortController.signal,
      });
      return response.data;
    } catch (error) {
      if (this.isCancel(error)) {
        // Handle other errors
        throw error;
      } else if (isAxiosError(error)) {
        throw new Error(
          error.response ? error.response.data.message : unknownErrorMsg
        );
      }
      throw new Error(unknownErrorMsg);
    }
  };
}
