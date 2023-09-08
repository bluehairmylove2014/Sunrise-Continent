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

const bookingSchema = z.boolean();

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
const getPictureSchema = z.array(
  z.object({
    hotelId: z.number(),
    roomTypeId: z.number(),
    id: z.number(),
    pictureLink: z.string(),
  })
);
const getReviewSchema = z.array(
  z.object({
    id: z.number(),
    userName: z.string(),
    userAvatar: z.string(),
    reviewDate: z.string(),
    points: z.number(),
    content: z.string(),
  })
);
const createHotelSchema = z.object({
  message: z.string(),
});
const editHotelSchema = z.object({
  message: z.string(),
});
const createRoomSchema = z.object({
  message: z.string(),
});
const editRoomSchema = z.object({
  message: z.string(),
});
const deleteRoomSchema = z.object({
  message: z.string(),
});
const getYearlyRevenueSchema = z.array(
  z.object({
    months: z.number(),
    thisYear: z.number(),
    lastYear: z.number(),
  })
);
const getWeeklyRevenueSchema = z.object({
  revenue: z.array(
    z.object({
      dayInWeek: z.number(),
      thisWeek: z.number(),
      lastWeek: z.number(),
    })
  ),
  accounts: z.array(
    z.object({
      accountId: z.number(),
      fullName: z.string(),
      emailAddress: z.string(),
      phoneNumber: z.string(),
      dateOfBirth: z.string(),
      gender: z.string(),
      image: z.string(),
      rank: z.string(),
      point: z.number(),
      role: z.string(),
      hotelId: z.number(),
      active: z.boolean(),
      totalSpent: z.number(),
    })
  ),
  totalRevenue: z.number(),
  totalReview: z.number(),
  totalOrder: z.number(),
  lastRevenue: z.number(),
  lastReview: z.number(),
  lastOrder: z.number(),
});
export {
  searchSchema,
  hotelDetailSchema,
  bookingSchema,
  getSpecificRoomSchema,
  getHotHotelSchema,
  getRoomsSchema,
  getPictureSchema,
  getReviewSchema,
  createHotelSchema,
  editHotelSchema,
  createRoomSchema,
  editRoomSchema,
  deleteRoomSchema,
  getYearlyRevenueSchema,
  getWeeklyRevenueSchema,
};
