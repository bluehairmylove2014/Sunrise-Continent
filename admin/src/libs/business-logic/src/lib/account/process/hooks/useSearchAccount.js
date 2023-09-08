// Importing necessary libraries and services
import { useSearchAccountMutation } from "../../fetching/mutation";
import { useAccountContext } from "../context";

export const useSearchAccount = () => {
  const searchAccountMutation = useSearchAccountMutation();
  const { state } = useAccountContext();
  const onSearchAccount = (searchContent) => {
    return new Promise((resolve, reject) => {
      if (!state.accessToken) {
        reject(new Error("!Unauthorized"));
      } else {
        let searchParams = {
          ...searchContent,
        };
        Object.keys(searchParams).forEach((spk) => {
          if (Array.isArray(searchParams[spk])) {
            searchParams = {
              ...searchParams,
              [spk]: searchParams[spk].join(","),
            };
          }
        });
        // Handle keys here
        searchAccountMutation
          .mutateAsync({ token: state.accessToken, params: searchParams })
          .then((res) => {
            resolve(res);
          })
          .catch((error) => {
            reject(error);
          });
      }
    });
  };
  return { onSearchAccount, isLoading: searchAccountMutation.isLoading };
};
