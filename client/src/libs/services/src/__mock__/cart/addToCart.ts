import { axiosMockAdapterInstance } from "../../config/axios";
import { AddToCartParams, AddToCartResponse, CartService } from "../../lib";
import cartsData from "../data/cart.json";

axiosMockAdapterInstance
  .onPost(new CartService().addToCartUrl)
  .reply((config) => {
    const token = config.headers?.Authorization.replace("Bearer ", "");
    const data = JSON.parse(config.data) as AddToCartParams;
    console.log(token)
    if(token) {
      if(!data.item || !data.quantity || data.quantity <= 0 || typeof data.quantity !== 'number') {
        return [
          401, 
          `Product data is invalid`
        ]
      }
      if(cartsData[0]) {
        if(Array.isArray(cartsData[0].products)) {
          if(cartsData[0].products.length === 0) {
            cartsData[0].products = [{
              product: data.item,
              quantity: data.quantity
            }]
          }
          else {
            cartsData[0].products.forEach(cp => {
              if(cp.product.id === data.item.id) {
                cp.quantity += data.quantity;
              }
            })
          }
        }
        return [
          200, 
          {
            message: `Add ${data.quantity} product ${data.item.id} to cart successfully`
          } as AddToCartResponse
        ]
      }
      else {
        return [
          404, 
          `Cannot find cart`
        ]
      }
    }
    else {
      return [
        401,
        "Invalid credential"
      ]
    }
  });