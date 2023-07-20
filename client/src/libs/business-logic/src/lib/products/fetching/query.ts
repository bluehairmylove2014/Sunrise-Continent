import { GetProductResponse, ProductService } from "@org/services";
import { useQuery } from "@tanstack/react-query";

const productServices = new ProductService();

export const useGetAllProductsQuery = (products?: GetProductResponse) => {
  return useQuery({
    queryKey: ["getAllProducts"],
    queryFn: productServices.getAllProducts,
    initialData: products
  });
};
