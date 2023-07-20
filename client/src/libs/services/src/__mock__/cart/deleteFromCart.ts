import { axiosMockAdapterInstance } from "../../config/axios";
import { ICart } from "../../entities";
import { CartService, ClearCartResponse } from "../../lib";
import cartsData from "../data/cart.json";

axiosMockAdapterInstance
    .onDelete(new CartService().deleteFromCartUrl)
    .reply((config) => {
        const token = config.headers?.Authorization.replace("Bearer ", "");
        if (token) {
            const productID = config.params.productId;
            const cartDataTest:ICart = cartsData[0];
            if (cartDataTest?.items) {
                cartDataTest.items = cartDataTest.items.filter(p => p.item.id !== productID);
                return [
                    200,
                    {
                        message: `Delete product with ID: ${productID} from cart successfully`
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