import z from "zod";

// Schema for IMessageResponse
const messageResponseSchema = z.object({
  message: z.string(),
});

// Schema for IProduct
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

// Schema for ICartItem
const cartItemSchema = z.object({
  item: productSchema,
  quantity: z.number(),
});

// Schema for ICart
const cartSchema = z.object({
  items: z.array(cartItemSchema).nullable(),
});

export { messageResponseSchema, cartSchema };
