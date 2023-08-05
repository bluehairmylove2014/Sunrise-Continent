import { axiosMockAdapterInstance } from "../../config/axios";
import { HotelService } from "../../lib";
import hotelData from "../data/hotel.json";

axiosMockAdapterInstance
  .onGet(new RegExp(new HotelService().getHotelDetailUrl))
  .reply((config) => {
    return [200, hotelData];
  });
