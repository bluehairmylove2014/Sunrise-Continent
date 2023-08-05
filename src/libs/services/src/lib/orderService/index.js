import { isAxiosError } from "../../config/axios";
import { API_URL } from "../../config/url";
import { Services } from "../../service";
import {
  getCouponResponseSchema,
  getOrderTaxResponseSchema,
  getShippingResponseSchema,
  updateOrderResponseSchema,
} from "./schema";

const unknownErrorMsg = "Order service unknown error";

export class OrderService extends Services {
  url = API_URL + "/order";
  abortController;

  getOrderUrl = this.url + "/get-order";
  getShippingUrl = this.url + "/get-shipping";
  getTaxUrl = this.url + "/get-tax";
  getCouponUrl = this.url + "/get-coupon";
  updateOrderUrl = this.url + "/get-update-order";

  getShipping = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "GET",
        url: this.getShippingUrl,
        schema: getShippingResponseSchema,
        params: {
          address: params.address,
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
          error.response ? error.response.data.message : unknownErrorMsg
        );
      }
      throw new Error(unknownErrorMsg);
    }
  };
  getTax = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "GET",
        url: this.getTaxUrl,
        schema: getOrderTaxResponseSchema,
        params: {
          country: params.country,
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
          error.response ? error.response.data.message : unknownErrorMsg
        );
      }
      throw new Error(unknownErrorMsg);
    }
  };
  getCoupon = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "GET",
        url: this.getCouponUrl,
        schema: getCouponResponseSchema,
        params: {
          couponCode: params.couponCode,
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
          error.response ? error.response.data.message : unknownErrorMsg
        );
      }
      throw new Error(unknownErrorMsg);
    }
  };
  createOrder = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "POST",
        url: this.updateOrderUrl,
        schema: updateOrderResponseSchema,
        data: params.order,
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
          error.response ? error.response.data.message : unknownErrorMsg
        );
      }
      throw new Error(unknownErrorMsg);
    }
  };
}
