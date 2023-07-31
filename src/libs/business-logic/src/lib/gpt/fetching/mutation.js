import { GptService } from "../../../../../services/src";
import { useMutation } from "@tanstack/react-query";
import { mutationConfig } from "../../../configs";

const gptService = new GptService();
export const useGptMutation = () => {
  return useMutation(gptService.chat, {
    retry: mutationConfig.RETRY
  });
};