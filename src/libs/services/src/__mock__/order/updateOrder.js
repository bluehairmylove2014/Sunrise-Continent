import { axiosMockAdapterInstance } from "../../config/axios";
import { OrderService } from "../../lib";
import cartRawData from "../data/cart.json";
import ordersRawData from "../data/order.json";

axiosMockAdapterInstance
  .onPost(new OrderService().updateOrderUrl)
  .reply((config) => {
    const token = config.headers?.Authorization.replace("Bearer ", "");
    const data = JSON.parse(config.data);

    if (token) {
      const cart = cartRawData[0];
      const orders = ordersRawData;
      Object.assign(orders, data);
      cart.items = data.orderSummary;
      return [
        200,
        {
          message: "Update success",
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
