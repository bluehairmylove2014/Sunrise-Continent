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
});

const authenticationResponseSchema = z.object({
  message: z.string().optional(),
  token: z.string(),
  refreshToken: z.string().optional(),
  role: z.string().optional(),
});

export { authenticationResponseSchema, getUserResponseSchema };
