import { axiosMockAdapterInstance } from "../../config/axios";
import { VoucherService } from "../../lib";
import voucherData from "../data/voucher.json";
import { getApiUrl } from "../../config/url";

axiosMockAdapterInstance
  .onGet(getApiUrl(false) + new VoucherService().getVoucherUrl)
  .reply((config) => {
    const token = config.headers?.Authorization.replace("Bearer ", "");
    const rank = config.params.rank;
    const voucherList = rank
      ? voucherData.filter((vd) => vd.requiredRank === rank)
      : voucherData;
    if (token) {
      return [200, voucherList];
    } else {
      return [
        401,
        {
          message: "Invalid credential",
        },
      ];
    }
  });
