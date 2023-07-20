import { AxiosResponse, axios } from "../../config/axios";
import { API_URL } from "../../config/url";
import { Services } from "../../service";
import { GetProductResponse } from "./type";

export * from "./type";

interface IProductService {
  get getAllProductsUrl(): string;
  getAllProducts(): Promise<GetProductResponse>;
}

export class ProductService extends Services implements IProductService {
  readonly url: string = API_URL + "/products";
  abortController?: AbortController;
  getAllProductsUrl: string = this.url + "/fetch-all";

  getAllProducts = async (): Promise<GetProductResponse> => {
    this.abortController = new AbortController();
    try {
      const response: AxiosResponse<GetProductResponse> = await axios.get(
        this.getAllProductsUrl,
        {
          signal: this.abortController.signal
        }
      );
      return response.data;
    } catch (error) {
      console.error("Error getting all products:", error);
      throw error;
    }
  };
}

export type * from "./type";
