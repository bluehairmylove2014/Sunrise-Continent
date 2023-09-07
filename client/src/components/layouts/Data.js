import { PAGES } from "../../constants/Link.constants";

const foreignCountries = [
  "Thái Lan",
  "Pháp",
  "Ý",
  "Nhật Bản",
  "Úc",
  "Hoa Kỳ",
  "Canada",
  "Mexico",
  "Argentina",
  "Ai Cập",
  "Nam Phi",
  "Ấn Độ",
  "Campuchia",
  "Indonesia",
  "Malaysia",
  "Singapore",
];
const vietnamFamousTravelProvinces = [
  "Sapa",
  "Hạ Long",
  "Hội An",
  "Đà Nẵng",
  "Nha Trang",
  "Đà Lạt",
  "Phú Quốc",
  "Cần Thơ",
  "Hà Nội",
  "Hồ Chí Minh",
];

export const categories = [
  {
    category_name: "Trong nước",
    icon: "fi fi-sr-home-heart",
    href: null,
    options: vietnamFamousTravelProvinces.map((country) => ({
      option_url: PAGES.SEARCH + `?location=${country}`,
      option_name: country,
    })),
  },
  {
    category_name: "Ra thế giới",
    icon: "fi fi-sr-home-heart",
    href: null,
    options: foreignCountries.map((country) => ({
      option_url: PAGES.COUNTRY + `?name=${country}`,
      option_name: country,
    })),
  },
  {
    category_name: "Khuyến mãi",
    icon: "fi fi-ss-gift-card",
    href: PAGES.VOUCHER_SHOP,
    options: [],
  },
];
export const partner = {
  category_name: "Kênh đối tác",
  icon: "fi fi-sr-chart-user",
  href: PAGES.PARTNER,
};
export const languages = [
  {
    option_name: "Tiếng Việt",
    option_url: "/vi",
  },
];
