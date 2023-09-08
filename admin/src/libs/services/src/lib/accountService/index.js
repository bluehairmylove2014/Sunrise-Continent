import { isAxiosError } from "../../config/axios";
import { Services } from "../../service";
import { searchAccountSchema } from "./schema";

const unknownError = "Unexpected error occurred";

export class AccountService extends Services {
  abortController;

  searchAccountUrl = "/account/search";

  searchAccount = async ({ token, params }) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "GET",
        url: this.searchAccountUrl,
        schema: searchAccountSchema,
        params,
        headers: { Authorization: `Bearer ${token}` },
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
          error.response ? error.response.data?.message : unknownError
        );
      }
      throw new Error(unknownError);
    }
  };
}
