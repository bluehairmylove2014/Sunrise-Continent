import z from "zod";

const searchSchema = z.array(
  z.object({
    id: z.number(),
    name: z.string(),
    country: z.string(),
    provinceCity: z.string(),
    address: z.string(),
    stars: z.number(),
    rating: z.number(),
    description: z.string(),
    image: z.string(),
    price: z.number(),
    facilities: z.array(z.string()),
    services: z.array(z.string()),
  })
);

const hotelDetailSchema = z.object({
  id: z.number(),
  name: z.string(),
  country: z.string(),
  hotelType: z.string(),
  provinceCity: z.string(),
  address: z.string(),
  stars: z.number(),
  rating: z.number(),
  description: z.string(),
  image: z.string(),
  price: z.number(),
  facilities: z.array(z.string()),
  services: z.array(z.string()),
});

const bookingSchema = z.object({
  message: z.string(),
});

const getSpecificRoomSchema = z.object({
  hotelId: z.number(),
  id: z.number(),
  name: z.string(),
  vacancy: z.number(),
  size: z.number(),
  price: z.number(),
  roomInfo: z.string(),
  roomView: z.string(),
  bedType: z.string(),
  picture: z.array(
    z.object({
      id: z.number(),
      link: z.string(),
    })
  ),
  facility: z.array(z.string()),
  service: z.array(z.string()),
});
const getRoomsSchema = z.array(getSpecificRoomSchema);

const getHotHotelSchema = z.array(hotelDetailSchema);

export {
  searchSchema,
  hotelDetailSchema,
  bookingSchema,
  getSpecificRoomSchema,
  getHotHotelSchema,
  getRoomsSchema,
};
