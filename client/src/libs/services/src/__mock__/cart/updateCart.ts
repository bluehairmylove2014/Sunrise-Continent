import { axiosMockAdapterInstance } from "../../config/axios";
import { ICart } from "../../entities";
import { CartService, UpdateCartParams, UpdateCartResponse } from "../../lib";
import cartsData from "../data/cart.json";

const cartDataTest:ICart = cartsData[0];
axiosMockAdapterInstance
    .onPut(new CartService().updateCartUrl)
    .reply((config) => {
        const token = config.headers?.Authorization.replace("Bearer ", "");
        const data = JSON.parse(config.data) as UpdateCartParams;
        if (token) {
            if (!data.cart) {
                return [
                    401,
                    {
                        message: `Cart data is invalid or not exist!`
                    } as UpdateCartResponse
                ]
            }
            else if (cartDataTest) {
                cartDataTest.items = data.cart.items;
                return [
                    200,
                    {
                        message: `Update cart with ${data.cart.items?.length} products successfully`
                    } as UpdateCartResponse
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