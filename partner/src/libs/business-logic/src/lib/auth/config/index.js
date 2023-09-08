import DefaultLoader from "../../../configs/components/defaultLoader";

export const authUrls = [
  // {
  //   authUrl: "/dashboard",
  //   redirectUrl: "/auth",
  // },
  {
    authUrl: "/revenue",
    redirectUrl: "/auth",
  },
  {
    authUrl: "/orders",
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
  {
    authUrl: "/create-hotel",
    redirectUrl: "/auth",
  },
];

export const Loader = DefaultLoader;
