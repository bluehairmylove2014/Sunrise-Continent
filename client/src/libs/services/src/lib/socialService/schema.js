import { z } from "zod";

const updateAccountResponseSchema = z.object({
  message: z.string(),
  token: z.string(),
  refreshToken: z.string(),
});

export { updateAccountResponseSchema };
