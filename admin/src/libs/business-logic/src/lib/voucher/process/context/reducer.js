export const orderReducer = (state, action) => {
  try {
    switch (action.type) {
      case "SET_VOUCHER":
        return {
          ...state,
          voucher: action.payload,
        };
      case "SET_TOKEN_ACTION":
        return {
          ...state,
          accessToken: action.payload,
        };
      default:
        return state;
    }
  } catch (error) {
    console.error("Error in orderReducer: ", error);
    return state;
  }
};
