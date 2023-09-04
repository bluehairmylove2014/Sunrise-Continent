import DefaultLoader from "../../../configs/components/defaultLoader";

export const authUrls = [
  {
    authUrl: "/provide-information",
    redirectUrl: "/login",
  },
  {
    authUrl: "/success-order",
    redirectUrl: "/login",
  },
  {
    authUrl: "/voucher-shop",
    redirectUrl: "/login",
  },
];

export const Loader = DefaultLoader;
