import { isAxiosError } from "axios";
import { Services } from "../../service";
import { getVoucherSchema, messageResponseSchema } from "./schema";

export class VoucherService extends Services {
  abortController;

  getVoucherUrl = "/voucher";
  deleteVoucherUrl = "/voucher";
  redeemVoucherUrl = "/voucher/redeem";
  createVoucherUrl = "/voucher";

  getVoucher = async (token, rank) => {
    this.abortController = new AbortController();
    try {
      if (!token) {
        return null;
      } else {
        const response = await this.fetchApi({
          method: "GET",
          url: this.getVoucherUrl,
          schema: getVoucherSchema,
          headers: {
            Authorization: `Bearer ${token}`,
          },
          params: {
            rank,
          },
          signal: this.abortController.signal,
          transformResponse: (res) => res,
          isProduction: true,
        });
        return response;
      }
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
  deleteVoucher = async ({ token, voucherId }) => {
    this.abortController = new AbortController();
    try {
      if (!token) {
        return null;
      } else {
        const response = await this.fetchApi({
          method: "DELETE",
          url: this.deleteVoucherUrl,
          schema: messageResponseSchema,
          headers: {
            Authorization: `Bearer ${token}`,
          },
          params: {
            voucherId,
          },
          signal: this.abortController.signal,
          transformResponse: (res) => res.message,
          isProduction: true,
        });
        return response;
      }
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
  redeemVoucher = async ({ token, voucherId, quantity }) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "POST",
        url: this.redeemVoucherUrl,
        schema: messageResponseSchema,
        headers: {
          Authorization: `Bearer ${token}`,
        },
        data: {
          voucherId,
          quantity,
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
  createVoucher = async ({ token, voucherData }) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "POST",
        url: this.createVoucherUrl,
        schema: messageResponseSchema,
        headers: {
          Authorization: `Bearer ${token}`,
        },
        data: voucherData,
        signal: this.abortController.signal,
        transformResponse: (res) => res.message,
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
