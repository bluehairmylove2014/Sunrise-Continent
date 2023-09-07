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
  {
    authUrl: "/orders",
    redirectUrl: "/login",
  },
];
export const needLocalOrderUrls = [
  {
    authUrl: "/provide-information",
    redirectUrl: "/",
  },
  {
    authUrl: "/success-order",
    redirectUrl: "/",
  },
  {
    authUrl: "/checkout",
    redirectUrl: "/",
  },
];

export const Loader = DefaultLoader;
