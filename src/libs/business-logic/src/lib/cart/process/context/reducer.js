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
        let localCart = state.cart;
        if (action.payload.type === "room") {
          const targetHotelIndex = localCart.findIndex(
            (cartItem) => cartItem.hotel.id === action.payload.id.hotelId
          );
          const targetHotel = localCart[targetHotelIndex];
          targetHotel.room = targetHotel.room.filter(
            (r) => r.id !== action.payload.id.roomId
          );
          if (!targetHotel.room || targetHotel.room.length === 0) {
            localCart.splice(targetHotelIndex, 1);
          } else {
            localCart[targetHotelIndex] = targetHotel;
          }
        } else if (action.payload.type === "hotel") {
          localCart = localCart.filter((p) => p.hotel.id !== action.payload.id);
        }
        return {
          ...state,
          cart: localCart,
        };

      default:
        return state;
    }
  } catch (error) {
    console.error("Error in cartReducer: ", error);
    return state;
  }
};
