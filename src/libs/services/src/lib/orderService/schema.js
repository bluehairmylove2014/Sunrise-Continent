import z from "zod";

const getShippingResponseSchema = z.object({
  shipping: z.number(),
});

const getOrderTaxResponseSchema = z.object({
  tax: z.number(),
});

const getCouponResponseSchema = z.object({
  coupon: z.number(),
});

const updateOrderResponseSchema = z.object({
  message: z.string(),
});
const getOrdersSchema = z.array(
  z.object({
    orderId: z.number(),
    accountId: z.number(),
    fullName: z.string(),
    nation: z.string(),
    dateOfBirth: z.string(),
    email: z.string(),
    phoneNumber: z.string(),
    specialNeeds: z.string(),
    notes: z.string(),
    voucherId: z.number(),
    total: z.number(),
    paid: z.boolean(),
    createAt: z.string(),
    orderItems: z.array(
      z.object({
        checkIn: z.string(),
        checkOut: z.string(),
        numberOfRoom: z.number(),
        roomTypeId: z.number(),
        hotelId: z.number(),
        hotelName: z.string(),
        country: z.string(),
        hotelType: z.string(),
        provinceCity: z.string(),
        address: z.string(),
        stars: z.number(),
        rating: z.number(),
        image: z.string(),
        roomName: z.string(),
        vacancy: z.number(),
        roomInfo: z.string(),
        roomView: z.string(),
        bedType: z.string(),
      })
    ),
  })
);

export {
  getShippingResponseSchema,
  getOrderTaxResponseSchema,
  getCouponResponseSchema,
  updateOrderResponseSchema,
  getOrdersSchema,
};
