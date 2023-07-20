import { axiosMockAdapterInstance } from "../config/axios";
import { ICategory } from "../entities";
import { CategoryService, GetCategoriesResponse } from "../lib";
import categoriesData from "./data/categories.json";

const categories: Array<ICategory> = categoriesData;

axiosMockAdapterInstance
  .onGet(new CategoryService().getAllCategoryUrl)
  .reply(() => {
    return [200, categories as unknown as GetCategoriesResponse];
  });
