import { axiosMockAdapterInstance } from "../../config/axios";
import { HotelService } from "../../lib";
import hotelData from "../data/searchHotel.json";

const hotels = hotelData;

axiosMockAdapterInstance
  .onPost(new HotelService().searchUrl)
  .reply((config) => {
    return [200, hotels];
  });
