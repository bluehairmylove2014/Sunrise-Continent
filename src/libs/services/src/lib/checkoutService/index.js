import { isAxiosError } from "axios";
import { Services } from "../../service";
import { getCheckoutUrlSchema } from "./schema";

export class CheckoutService extends Services {
  abortController;

  getUrlCheckoutUrl = "/payment";

  getCheckoutUrl = async ({ accessToken, totalPay }) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "POST",
        url: this.getUrlCheckoutUrl,
        schema: getCheckoutUrlSchema,
        params: {
          totalPay,
        },
        headers: {
          Authorization: `Bearer ${accessToken}`,
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
