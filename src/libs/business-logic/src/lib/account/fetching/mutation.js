import { AccountService } from "../../../../../services/src";
import { useMutation } from "@tanstack/react-query";
import { mutationConfig } from "../../../configs";

const accountService = new AccountService();

export const useSearchAccountMutation = () => {
  return useMutation(accountService.searchAccount, {
    retry: mutationConfig.RETRY,
  });
};
