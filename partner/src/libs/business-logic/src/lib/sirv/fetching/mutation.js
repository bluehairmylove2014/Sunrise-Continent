import { useMutation } from "@tanstack/react-query";
import { SirvService } from "../../../../../services/src/sirvService";

const sirvService = new SirvService();

export const useUploadMutation = () => {
  return useMutation(sirvService.upload);
};
