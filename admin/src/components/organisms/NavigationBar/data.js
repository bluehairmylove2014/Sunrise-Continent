import sunriseHorizontalLogo from "../../../assets/images/logos/sc-horizontal.png";
import { PAGES } from "../../../constants/Link.constants";

export const logo = {
  sunriseHorizontalLogo,
};

export const navigator = [
  {
    id: 1,
    icon: "fi fi-sr-pulse",
    label: "Trung tâm",
    pathName: PAGES.DASHBOARD,
  },
  {
    id: 2,
    icon: "fi fi-sr-users",
    label: "Tài khoản",
    pathName: PAGES.USERS,
  },
  {
    id: 3,
    icon: "fi fi-ss-hotel",
    label: "Đối tác",
    pathName: PAGES.HOTEL,
  },
  {
    id: 4,
    icon: "fi fi-ss-ticket",
    label: "Voucher",
    pathName: PAGES.VOUCHER,
  },
];
