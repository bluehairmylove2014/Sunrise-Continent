// Import necessary modules and functions
import { debounce } from "../../../../helper";
import { useSearchContext } from "../context";
import { convertViToEn } from "../helper/viToEn";
import { locations } from "./../../constants";

export const useSearchRecommend = () => {
  const { dispatch } = useSearchContext();

  const onSearchRecommend = debounce((keyword) => {
    const lowercaseKeyword = convertViToEn(keyword, true);

    const matchingLocations = [];

    locations.forEach((location) => {
      const lowercaseLocationName = convertViToEn(location.name, true);

      if (lowercaseLocationName.includes(lowercaseKeyword)) {
        matchingLocations.push(location);
      }
    });
    dispatch({
      type: "SET_RECOMMEND_PRODUCT",
      payload: matchingLocations,
    });
    return matchingLocations;
  }, 300);

  return {
    onSearchRecommend,
  };
};
