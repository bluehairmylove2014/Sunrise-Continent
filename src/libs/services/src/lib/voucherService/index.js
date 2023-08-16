import { Services } from "../../service";
import { getVoucherSchema, messageResponseSchema } from "./schema";

export class VoucherService extends Services {
  abortController;

  getVoucherUrl = "/voucher/bag";
  redeemVoucherUrl = "/voucher/redeem";

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
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error voucher ", error);
        throw error;
      }
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
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error voucher ", error);
        throw error;
      }
    }
  };
}
