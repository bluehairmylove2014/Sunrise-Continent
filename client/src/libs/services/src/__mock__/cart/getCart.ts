import { axiosMockAdapterInstance } from "../../config/axios";
import { CartService, GetCartResponse } from "../../lib";
import cartsData from "../data/cart.json";

axiosMockAdapterInstance
  .onGet(new CartService().getCartUrl)
  .reply((config) => {
    const token = config.headers?.Authorization.replace("Bearer ", "");
    if(token) {
      return cartsData[0] ? [
          200, 
          cartsData[0] as GetCartResponse
      ] : [
          404, 
          `Cannot find cart`
      ];
    }
    else {
      return [
        401,
        "Invalid credential"
      ]
    }
  });