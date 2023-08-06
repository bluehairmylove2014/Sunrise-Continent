import { axiosMockAdapterInstance } from "../../config/axios";
import { HotelService } from "../../lib";
import hotelData from "../data/hotel.json";
import { getApiUrl } from "../../config/url";

axiosMockAdapterInstance
  .onGet(getApiUrl(false) + new HotelService().getHotelDetailUrl)
  .reply((config) => {
    return [200, hotelData];
  });
