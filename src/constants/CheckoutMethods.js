import mastercardLogo from "../assets/images/logos/MasterCard Logo.png";
import visaLogo from "../assets/images/logos/visa.png";
import momoLogo from "../assets/images/logos/momo-primary-logo/momo_square_pinkbg.svg";

export const checkoutMethods = {
  MOMO: {
    id: 1,
    icon: momoLogo,
    qr: "https://rialloer.sirv.com/Sunrise-Continent/checkout/366749059_1318877345712982_7945545350493039276_n.jpg",
  },
  VISA: {
    id: 2,
    icon: visaLogo,
  },
  MASTERCARD: {
    id: 3,
    icon: mastercardLogo,
  },
};
