import { axiosMockAdapterInstance } from "../../config/axios";
import { ICart } from "../../entities";
import { CartService, ClearCartResponse } from "../../lib";
import cartsData from "../data/cart.json";

const cartDataTest:ICart = cartsData[0];
axiosMockAdapterInstance
    .onDelete(new CartService().clearCartUrl)
    .reply((config) => {
        const token = config.headers?.Authorization.replace("Bearer ", "");
        if (token) {
            if (cartDataTest) {
                cartDataTest.items = [];
                return [
                    200,
                    {
                        message: `Clear cart successfully`
                    } as ClearCartResponse
                ]
            }
            else {
                return [
                    404,
                    {
                        message: `Cannot find cart`
                    } as ClearCartResponse
                ]
            }
        }
        else {
            return [
                401,
                {
                    message: `Invalid credential`
                } as ClearCartResponse
            ]
        }
    });