import { axiosMockAdapterInstance } from "../../config/axios";
import { ICart } from "../../entities";
import { CartService, ClearCartResponse } from "../../lib";
import cartsData from "../data/cart.json";

axiosMockAdapterInstance
    .onDelete(new CartService().decreaseItemQuantityUrl)
    .reply((config) => {
        const token = config.headers?.Authorization.replace("Bearer ", "");
        if (token) {
            const productID = config.params.productId;
            const quantity = config.params.quantity;
            const cartDataTest:ICart = cartsData[0];
            if (cartDataTest?.items) {
                cartDataTest.items = cartDataTest.items.filter(p => {
                    if(p.item.id === productID) {
                        if(p.quantity > quantity) {
                            p.quantity -= quantity;
                            return true;
                        }
                        else {
                            return false;
                        }
                    }
                    return true;
                });
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