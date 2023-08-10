import { Services } from "../../service";
import { getVoucherSchema } from "./schema";

export class VoucherService extends Services {
  abortController;

  getVoucherUrl = "/voucher/bag";

  getVoucher = async (token) => {
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
          signal: this.abortController.signal,
          transformResponse: (res) => res,
          // isProduction: true,
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
}
