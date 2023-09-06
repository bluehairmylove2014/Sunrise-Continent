import z from "zod";

const searchAccountSchema = z.object({
  accounts: z.array(
    z.object({
      accountId: z.number(),
      fullName: z.string(),
      emailAddress: z.string(),
      phoneNumber: z.string(),
      dateOfBirth: z.string(),
      gender: z.string(),
      image: z.string().url(),
      rank: z.string(),
      point: z.number(),
      role: z.string(),
      hotelId: z.number(),
      active: z.boolean(),
    })
  ),
  pageSize: z.number(),
  currentPage: z.number(),
  totalPages: z.number(),
  hasNext: z.boolean(),
  hasPrevious: z.boolean(),
  totalCount: z.number(),
});

export { searchAccountSchema };
