import { AxiosResponse, axios } from "../../config/axios";
import { API_URL } from "../../config/url";
import { Services } from "../../service";
import { GetCategoriesResponse } from "./type";

export * from "./type";

interface ICategoryService {
  get getAllCategoryUrl(): string;
  getAllCategory(): Promise<GetCategoriesResponse>;
}

export class CategoryService extends Services implements ICategoryService {
  readonly url: string = API_URL + "/category";
  abortController?: AbortController;
  getAllCategoryUrl: string = this.url + "/fetch-all";

  getAllCategory = async (): Promise<GetCategoriesResponse> => {
    this.abortController = new AbortController();
    try {
      const response: AxiosResponse<GetCategoriesResponse> = await axios.get(
        this.getAllCategoryUrl,
        {
          signal: this.abortController.signal
        }
      );
      return response.data;
    } catch (error) {
      console.error("Error getting all category:", error);
      throw error;
    }
  };
}
