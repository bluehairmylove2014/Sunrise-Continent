// Importing necessary libraries and services
import { useSearchHotelMutation } from "../../fetching/mutation";

export const useSearch = () => {
  const searchMutation = useSearchHotelMutation();
  const onSearch = (searchContent) => {
    return new Promise((resolve, reject) => {
      let searchParams = {
        ...searchContent,
      };
      Object.keys(searchParams).forEach(spk => {
        if(Array.isArray(searchParams[spk])) {
          searchParams = {
            ...searchParams,
            [spk]: searchParams[spk].join(',')
          }
        }
      })
      if (searchParams["budget"]) {
        Object.assign(searchParams, {
          min_budget: searchContent.budget[0],
          max_budget: searchContent.budget[1],
        });
        delete searchParams["budget"];
      }
      // Handle keys here
      searchMutation
        .mutateAsync(searchParams)
        .then((res) => {
          resolve(res);
        })
        .catch((error) => {
          reject(error);
        });
    });
  };
  return { onSearch, isLoading: searchMutation.isLoading };
};
