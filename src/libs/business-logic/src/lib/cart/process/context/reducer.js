export const cartReducer = (state, action) => {
  try {
    switch (action.type) {
      case "SET_CART_ACTION":
        return {
          ...state,
          cart: action.payload,
        };
      case "SET_TOKEN_ACTION":
        return {
          ...state,
          accessToken: action.payload,
        };
      case "DELETE_ACTION":
        if (!state.cart || !action.payload.id) return state;
        state.cart = state.cart.filter((p) => p.id !== action.payload.id);
        return {
          ...state,
        };

      default:
        return state;
    }
  } catch (error) {
    console.error("Error in cartReducer: ", error);
    return state;
  }
};
