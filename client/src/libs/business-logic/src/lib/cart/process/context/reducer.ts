
import { CartAction, CartState } from ".";
import { CONTEXT_ACTION } from "../../constants";

export const cartReducer = (
  state: CartState,
  action: CartAction
): CartState => {
  try {
    switch (action.type) {
      case CONTEXT_ACTION.GET_ACTION:
        return state;
      case CONTEXT_ACTION.SET_CART_ACTION:
        if (typeof action.payload !== 'string' && (action.payload === null || 'items' in action.payload)) {
          return {
            ...state,
            cart: action.payload,
          };
        } else {
          return state;
        }
      case CONTEXT_ACTION.SET_TOKEN_ACTION:
        if (typeof action.payload === 'string') {
          return {
            ...state,
            accessToken: action.payload,
          };
        } else {
          return state;
        }
      case CONTEXT_ACTION.DELETE_ACTION:
        if (
          action.payload &&
          typeof action.payload !== 'string' &&
          'productId' in action.payload
        ) {

          if (state.cart?.items?.length) {
            if (action.payload.quantity) {
              state.cart.items = state.cart.items.map(p => {
                if(p.item.id === action.payload.productId) {
                  p.quantity -= action.payload.quantity
                }
                return p;
              });
              return {
                ...state
              };
            }
            else {
              state.cart.items = state.cart.items.filter(p => p.item.id !== action.payload.productId);
              return {
                ...state
              };
            }
          }
        }
        return state;

      default:
        return state;
    }
  } catch (error) {
    console.error("Error in cartReducer: ", error);
    return state;
  }
};
