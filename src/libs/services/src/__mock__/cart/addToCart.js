import { axiosMockAdapterInstance } from "../../config/axios";
import { CartService } from "../../lib";
import cartsDataRaw from "../data/cart.json";

const cartsData = cartsDataRaw;

axiosMockAdapterInstance
  .onPost(new CartService().addToCartUrl)
  .reply((config) => {
    const token = config.headers?.Authorization.replace("Bearer ", "");
    const data = JSON.parse(config.data);
    if (token) {
      if (
        !data.item ||
        !data.quantity ||
        data.quantity <= 0 ||
        typeof data.quantity !== "number"
      ) {
        return [
          401,
          {
            message: `Product data is invalid`,
          },
        ];
      }
      if (cartsData) {
        if (Array.isArray(cartsData.items)) {
          if (cartsData.items.length === 0) {
            cartsData.items = [
              {
                item: data.item,
                quantity: data.quantity,
              },
            ];
          } else {
            cartsData.items.forEach((cp) => {
              if (cp.item.id === data.item.id) {
                cp.quantity += data.quantity;
              }
            });
          }
        }
        return [
          200,
          {
            message: `Add ${data.quantity} product ${data.item.id} to cart successfully`,
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
