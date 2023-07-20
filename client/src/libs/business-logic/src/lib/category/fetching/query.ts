import { CategoryService, GetCategoriesResponse } from "@org/services";
import { useQuery } from "@tanstack/react-query";

const categoryServices = new CategoryService();

export const useGetCategoryQuery = (category?: GetCategoriesResponse) => {
  const data = useQuery({
    queryKey: ["getAllCategories"],
    queryFn: categoryServices.getAllCategory,
    initialData: category
  });
  return data
};
