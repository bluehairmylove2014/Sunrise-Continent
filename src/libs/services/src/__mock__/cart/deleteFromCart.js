/* eslint-disable no-unused-vars */
import { axiosMockAdapterInstance } from "../../config/axios";
import { CartService } from "../../lib";
import cartsData from "../data/cart.json";

axiosMockAdapterInstance
  .onDelete(new CartService().deleteFromCartUrl)
  .reply((config) => {
    const token = config.headers?.Authorization.replace("Bearer ", "");
    if (token) {
      const id = config.params.id;
      let cartDataTest = cartsData;
      cartDataTest = cartDataTest.filter((p) => p.id !== id);
      return [
        200,
        {
          message: `Delete hotel successfully`,
        },
      ];
    } else {
      return [
        401,
        {
          message: `Invalid credential`,
        },
      ];
    }
  });
