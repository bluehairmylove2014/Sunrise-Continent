import { axiosMockAdapterInstance } from "../../config/axios";
import { HotelService } from "../../lib";
import roomsData from "../data/rooms.json";
import { getApiUrl } from "../../config/url";

axiosMockAdapterInstance
  .onGet(getApiUrl(false) + new HotelService().getSpecificRoomUrl)
  .reply((config) => {
    return [200, roomsData[0]];
  });
