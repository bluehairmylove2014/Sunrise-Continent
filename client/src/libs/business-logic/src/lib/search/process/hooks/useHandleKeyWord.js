// Import necessary modules and functions
import { maximumSearchHistories } from "../../config";
import { useSearchContext } from "../context";
import {
  deleteSearchHistoryLocalStorage,
  setSearchHistoryLocalStorage,
} from "../helper/localStorageHelper";

export const useHandleKeyWord = () => {
  const { state, dispatch } = useSearchContext();

  const onSaveKeyWord = (keyword) => {
    const newHistory = [
      keyword,
      ...state.searchHistory
        .filter((ch) => {
          return !ch.includes(keyword) && !keyword.includes(ch);
        })
        .slice(0, maximumSearchHistories - 1),
    ];
    dispatch({
      type: "SET_SEARCH_HISTORY",
      payload: newHistory,
    });
    setSearchHistoryLocalStorage(newHistory);
  };
  const onDeleteKeyWord = (keyword) => {
    const newSearchHistory = state.searchHistory.filter((sh) => sh !== keyword);
    dispatch({
      type: "SET_SEARCH_HISTORY",
      payload: newSearchHistory,
    });
    setSearchHistoryLocalStorage(newSearchHistory);
  };
  const onClearKeyWord = () => {
    if (state.searchHistory) {
      dispatch({
        type: "SET_SEARCH_HISTORY",
        payload: [],
      });
    }
    deleteSearchHistoryLocalStorage();
  };

  return {
    onSaveKeyWord,
    onDeleteKeyWord,
    onClearKeyWord,
  };
};
