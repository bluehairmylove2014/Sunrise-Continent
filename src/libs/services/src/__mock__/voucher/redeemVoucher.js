import { axiosMockAdapterInstance } from "../../config/axios";
import { VoucherService } from "../../lib";
import voucherData from "../data/voucher.json";
import { getApiUrl } from "../../config/url";

axiosMockAdapterInstance
  .onPost(getApiUrl(false) + new VoucherService().redeemVoucherUrl)
  .reply((config) => {
    const token = config.headers?.Authorization.replace("Bearer ", "");
    const { voucherId, quantity } = JSON.parse(config.data);
    const voucher = voucherData.find((vd) => vd.voucherId === voucherId);
    voucher.quantity += quantity;
    if (token) {
      return [
        200,
        {
          message: "Redeem Success",
        },
      ];
    } else {
      return [
        401,
        {
          message: "Invalid credential",
        },
      ];
    }
  });
