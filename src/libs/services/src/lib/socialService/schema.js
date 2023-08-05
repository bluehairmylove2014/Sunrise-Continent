import { z } from "zod";

const updateAccountResponseSchema = z.object({
  message: z.string(),
});

export { updateAccountResponseSchema };
