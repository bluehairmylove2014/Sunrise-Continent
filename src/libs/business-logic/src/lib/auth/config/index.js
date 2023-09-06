// import DefaultLoader from "../../../configs/components/defaultLoader";
import CustomLoader from "../../../../../../components/common/Loader/PageLoader";

export const authUrls = [
  {
    authUrl: "/dashboard",
    redirectUrl: "/auth",
  },
  {
    authUrl: "/revenue",
    redirectUrl: "/auth",
  },
  {
    authUrl: "/users",
    redirectUrl: "/auth",
  },
  {
    authUrl: "/hotel",
    redirectUrl: "/auth",
  },
  {
    authUrl: "/voucher",
    redirectUrl: "/auth",
  },
];

export const Loader = CustomLoader;
