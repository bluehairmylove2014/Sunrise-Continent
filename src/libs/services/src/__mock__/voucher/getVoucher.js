import { axiosMockAdapterInstance } from "../../config/axios";
import { VoucherService } from "../../lib";
import voucherData from "../data/voucher.json";
import { getApiUrl } from "../../config/url";

axiosMockAdapterInstance
  .onGet(getApiUrl(false) + new VoucherService().getVoucherUrl)
  .reply((config) => {
    const token = config.headers?.Authorization.replace("Bearer ", "");

    if (token) {
      return [200, voucherData];
    } else {
      return [
        401,
        {
          message: "Invalid credential",
        },
      ];
    }
  });
