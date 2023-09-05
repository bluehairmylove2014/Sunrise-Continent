export const cartReducer = (state, action) => {
  try {
    switch (action.type) {
      case "SET_SEARCH_HISTORY":
        return {
          ...state,
          searchHistory: action.payload,
        };
      case "SET_RECOMMEND_PRODUCT":
        return {
          ...state,
          recommendProduct: action.payload,
        };

      default:
        return state;
    }
  } catch (error) {
    console.error("Error in cartReducer: ", error);
    return state;
  }
};
