import z from "zod";

const getUserResponseSchema = z.object({
  accountId: z.number(),
  fullName: z.string(),
  emailAddress: z.string(),
  phoneNumber: z.string(),
  dateOfBirth: z.string().optional,
  gender: z.string().optional,
  image: z.string(),
  rank: z.string(),
});

const authenticationResponseSchema = z.object({
  statusCode: z.number().optional(),
  message: z.string(),
  token: z.string().optional(),
});

export { authenticationResponseSchema, getUserResponseSchema };
