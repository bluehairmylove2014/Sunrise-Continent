import z from "zod";

const messageResponseSchema = z.object({
  message: z.string(),
});

const getVoucherSchema = z.array(
  z.object({
    voucherId: z.number(),
    name: z.string(),
    value: z.number(),
    point: z.number(),
    quantity: z.number(),
    requiredRank: z.string(),
  })
);

export { getVoucherSchema, messageResponseSchema };
