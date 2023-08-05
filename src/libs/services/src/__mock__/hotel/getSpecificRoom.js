import { axiosMockAdapterInstance } from "../../config/axios";
import { HotelService } from "../../lib";
import roomsData from "../data/rooms.json";

axiosMockAdapterInstance
  .onGet(new HotelService().getSpecificRoomUrl)
  .reply((config) => {
    return [200, roomsData[0]];
  });
