import { isAxiosError } from "../../config/axios";
import { getApiUrl } from "../../config/url";
import { Services } from "../../service";
import { searchProductSchema } from "./schema";

export class SearchService extends Services {
  url = getApiUrl();
  abortController;

  searchProductsUrl = "/search";

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
          error.response ? error.response.data?.message : "Unknown Error"
        );
      }
      throw new Error("Unknown Error");
    }
  };
}
