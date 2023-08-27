import z from "zod";

const productSchema = z.object({
  id: z.string(),
  name: z.string(),
  price: z.number(),
  imageSrc: z.string(),
  description: z.string(),
  imageAlt: z.string(),
  href: z.string().optional(),
  color: z.string().optional(),
  measures: z.string().optional(),
  wishlist: z.boolean().optional(),
  date: z.number(),
  category: z.string(),
  categoryChild: z.string(),
  sale: z.number().optional(),
  page: z.number().optional(),
});

const searchProductSchema = z.array(productSchema);

export { searchProductSchema };
