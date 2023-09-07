import { axiosMockAdapterInstance } from "../../config/axios";
import { HotelService } from "../../lib";
import hotHotelData from "../data/hotHotel.json";
import { getApiUrl } from "../../config/url";

axiosMockAdapterInstance
  .onGet(getApiUrl(false) + new HotelService().getHotHotelUrl)
  .reply((config) => {
    return [200, hotHotelData];
  });
