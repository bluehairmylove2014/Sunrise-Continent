import { useWishlistContext } from "../context";
import { useLocalWishlist } from "./useLocalWishlist";

export const useWishlist = () => {
  const { state, dispatch } = useWishlistContext();
  const { setLocalWishlist } = useLocalWishlist();

  const getWishlist = () => state.wishlist;
  const addToWishlist = (item) => {
    return new Promise((resolve, reject) => {
      if (!item) reject(new Error("Item is not valid"));
      try {
        if (Array.isArray(state.wishlist)) {
          if (state.wishlist.find((witem) => witem.id === item.id)) {
            reject(new Error("Khách sạn đã tồn tại"));
          } else {
            const newWishlist = [...state.wishlist, item];
            dispatch({
              type: "SET_WISHLIST",
              payload: newWishlist,
            });
            setLocalWishlist(newWishlist);
            resolve("Thêm vào yêu thích thành công");
          }
        } else {
          dispatch({
            type: "SET_WISHLIST",
            payload: [item],
          });
          setLocalWishlist([item]);
          resolve("Thêm vào yêu thích thành công");
        }
      } catch (error) {
        console.error(error);
        reject(new Error("Unknown error"));
      }
    });
  };
  const removeFromWishlist = (itemID) => {
    return new Promise((resolve, reject) => {
      if (!state.wishlist) reject(new Error("Wishlist is empty now"));
      else if (itemID === null || itemID === undefined)
        reject(new Error("itemID is not valid"));
      else {
        try {
          const newWishlist = state.wishlist.filter(
            (witem) => witem.id !== itemID
          );
          dispatch({
            type: "SET_WISHLIST",
            payload: newWishlist,
          });
          setLocalWishlist(newWishlist);
          resolve("Xoá yêu thích thành công");
        } catch (error) {
          console.error(error);
          reject(new Error("Unknown error"));
        }
      }
    });
  };

  return {
    getWishlist,
    addToWishlist,
    removeFromWishlist,
  };
};
