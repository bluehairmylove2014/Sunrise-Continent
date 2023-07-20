import { axiosMockAdapterInstance } from "../config/axios";
import { IProduct } from "../entities";
import { GetProductResponse, ProductService } from "../lib";
import productsData from "./data/products.json";

const products: Array<IProduct> = productsData;

axiosMockAdapterInstance
  .onGet(new ProductService().getAllProductsUrl)
  .reply(() => {
    return [200, products as GetProductResponse];
  });
