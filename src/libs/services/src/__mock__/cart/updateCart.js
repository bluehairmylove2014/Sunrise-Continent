import { axiosMockAdapterInstance } from "../../config/axios";
import { CartService } from "../../lib";
import cartsData from "../data/cart.json";

const cartDataTest = cartsData[0];
axiosMockAdapterInstance
  .onPut(new CartService().updateCartUrl)
  .reply((config) => {
    const token = config.headers?.Authorization.replace("Bearer ", "");
    const data = JSON.parse(config.data);
    if (token) {
      if (!data.cart) {
        return [
          401,
          {
            message: `Cart data is invalid or not exist!`,
          },
        ];
      } else if (cartDataTest) {
        cartDataTest.items = data.cart.items;
        return [
          200,
          {
            message: `Update cart with ${data.cart.items?.length} products successfully`,
          },
        ];
      } else {
        return [
          404,
          {
            message: `Cannot find cart`,
          },
        ];
      }
    } else {
      return [
        401,
        {
          message: "Invalid credential",
        },
      ];
    }
  });
