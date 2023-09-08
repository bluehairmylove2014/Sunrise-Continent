import sunriseHorizontalLogo from "../../../assets/images/logos/sc-non-white -short.png";
import { PAGES } from "../../../constants/Link.constants";

export const logo = {
  sunriseHorizontalLogo,
};

export const navigator = [
  {
    id: 1,
    icon: "fi fi-sr-pulse",
    label: "Trung Tâm",
    pathName: PAGES.DASHBOARD,
  },
  {
    id: 2,
    icon: "fi fi-ss-mobile",
    label: "Đơn đặt",
    pathName: PAGES.ORDERS,
  },
  {
    id: 3,
    icon: "fi fi-ss-hotel",
    label: "Khách sạn",
    pathName: PAGES.HOTEL,
  },
  {
    id: 4,
    icon: "fi fi-ss-ticket",
    label: "Voucher",
    pathName: PAGES.VOUCHER,
  },
];
