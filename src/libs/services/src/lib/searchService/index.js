import { isAxiosError } from "../../config/axios";
import { API_URL } from "../../config/url";
import { Services } from "../../service";
import { searchProductSchema } from "./schema";

const unknownErrorMsg = "Order service unknown error";

export class SearchService extends Services {
  url = API_URL;
  abortController;

  searchProductsUrl = this.url + "/search";

  searchProducts = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "GET",
        url: this.searchProductsUrl,
        schema: searchProductSchema,
        params: {
          keyword: params.keyword,
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
