import { isAxiosError } from "../../config/axios";
import { Services } from "../../service";
import {
  getCouponResponseSchema,
  getOrderTaxResponseSchema,
  getShippingResponseSchema,
  updateOrderResponseSchema,
} from "./schema";

export class OrderService extends Services {
  abortController;

  getOrderUrl = "/order/get-order";
  getShippingUrl = "/order/get-shipping";
  getTaxUrl = "/order/get-tax";
  getCouponUrl = "/order/get-coupon";
  updateOrderUrl = "/order/get-update-order";

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
          error.response ? error.response.data?.message : "Unknown Error"
        );
      }
      throw new Error("Unknown Error");
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
          error.response ? error.response.data?.message : "Unknown Error"
        );
      }
      throw new Error("Unknown Error");
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
        // Handle other errors
        throw error;
      } else if (isAxiosError(error)) {
        throw new Error(
          error.response ? error.response.data?.message : "Unknown Error"
        );
      }
      throw new Error("Unknown Error");
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
        isProduction: true,
      });
      return response;
    } catch (error) {
      if (this.isCancel(error)) {
        // Handle other errors
        throw error;
      } else if (isAxiosError(error)) {
        throw new Error(
          error.response ? error.response.data?.message : "Unknown Error"
        );
      }
      throw new Error("Unknown Error");
    }
  };
}
