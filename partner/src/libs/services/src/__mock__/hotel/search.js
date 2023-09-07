import { axiosMockAdapterInstance } from "../../config/axios";
import { HotelService } from "../../lib";
import hotelData from "../data/searchHotel.json";
import { getApiUrl } from "../../config/url";

const hotels = hotelData;

axiosMockAdapterInstance
  .onGet(getApiUrl(false) + new HotelService().searchUrl)
  .reply((config) => {
    return [200, hotels];
  });
