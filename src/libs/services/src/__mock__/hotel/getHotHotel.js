import { axiosMockAdapterInstance } from "../../config/axios";
import { HotelService } from "../../lib";
import hotHotelData from "../data/hotHotel.json";

axiosMockAdapterInstance
  .onGet(new RegExp(`${new HotelService().getHotHotelUrl}`))
  .reply((config) => {
    return [200, hotHotelData];
  });
