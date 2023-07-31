import { axiosMockAdapterInstance } from "../../config/axios";
import { CartService } from "../../lib";
import cartsData from "../data/cart.json";

axiosMockAdapterInstance.onGet(new CartService().getCartUrl).reply((config) => {
  const token = config.headers?.Authorization.replace("Bearer ", "");
  if (token) {
    return cartsData
      ? [200, cartsData]
      : [
          404,
          {
            message: `Cannot find cart`,
          },
        ];
  } else {
    return [
      401,
      {
        message: "Invalid credential",
      },
    ];
  }
});
