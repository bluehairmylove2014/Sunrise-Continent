import { axiosMockAdapterInstance } from "../../config/axios";
import { getApiUrl } from "../../config/url";
import { HotelService } from "../../lib";

axiosMockAdapterInstance
  .onPost(getApiUrl(false) + new HotelService().checkRoomAvailableUrl)
  .reply((config) => {
    return [
      200,
      {
        message: "Success",
      },
    ];
  });
