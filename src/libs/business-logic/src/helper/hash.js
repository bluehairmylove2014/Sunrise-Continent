import CryptoJS from "crypto-js";

export const generateSecureHash = (key) => {
  const currentDomain = window.location.hostname;
  const combinedString = key + currentDomain;

  const hashedString = CryptoJS.SHA256(combinedString).toString();
  return hashedString;
};
