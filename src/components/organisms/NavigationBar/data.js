import sunriseHorizontalLogo from "../../../assets/images/logos/sc-horizontal.png";
import { PAGES } from "../../../constants/Link.constants";

export const logo = {
  sunriseHorizontalLogo,
};

export const navigator = [
  {
    id: 1,
    icon: "fi fi-sr-pulse",
    label: "Bảng điều khuyển",
    pathName: PAGES.DASHBOARD,
  },
  {
    id: 2,
    icon: "fi fi-ss-mobile",
    label: "Đơn đặt phòng",
    pathName: PAGES.ORDERS,
  },
  {
    id: 3,
    icon: "fi fi-ss-hotel",
    label: "Quản lý khách sạn",
    pathName: PAGES.HOTEL,
  },
  {
    id: 4,
    icon: "fi fi-ss-ticket",
    label: "Quản lý voucher",
    pathName: PAGES.VOUCHER,
  },
];
