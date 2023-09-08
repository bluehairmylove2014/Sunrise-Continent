import z from "zod";

const getUserResponseSchema = z.object({
  accountId: z.number(),
  fullName: z.string(),
  emailAddress: z.string(),
  phoneNumber: z.string(),
  dateOfBirth: z.string(),
  gender: z.string(),
  image: z.string(),
  rank: z.string(),
  point: z.number(),
  hotelId: z.union([z.number(), z.nullable()]).optional(),
});

const authenticationResponseSchema = z.object({
  statusCode: z.number().optional(),
  message: z.string(),
  token: z.string().optional(),
  role: z.string().optional(),
});

export { authenticationResponseSchema, getUserResponseSchema };
