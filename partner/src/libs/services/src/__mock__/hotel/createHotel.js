import { axiosMockAdapterInstance } from "../../config/axios";
import { HotelService } from "../../lib";
import { getApiUrl } from "../../config/url";

axiosMockAdapterInstance
  .onPost(getApiUrl(false) + new HotelService().createHotelUrl)
  .reply((config) => {
    return [200, { message: "Success" }];
  });
