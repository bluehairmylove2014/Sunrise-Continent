import { axiosMockAdapterInstance } from "../../config/axios";
import { HotelService } from "../../lib";

axiosMockAdapterInstance
  .onPost(new HotelService().checkRoomAvailableUrl)
  .reply((config) => {
    return [
      200,
      {
        message: "Success",
      },
    ];
  });
