import { CartService, GetCartParams } from "@org/services";
import { useQuery } from "@tanstack/react-query";
import { QUERY_KEYS } from "../constants";

// Khởi tạo service
const cartService = new CartService();

export const useGetCartQuery = (params: GetCartParams) => {
    return useQuery(
        [QUERY_KEYS.GET_CART, params],
        () => cartService.getCart(params),
    );
};