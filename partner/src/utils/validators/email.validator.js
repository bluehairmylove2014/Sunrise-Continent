import { REGEX } from "./../../constants/Regex";
/**
 * Check if the provided email is valid.
 * @param {string} email - The email to validate.
 * @returns {boolean} True if the email is valid, false otherwise.
 */
export function isValidEmail(email) {
  // If email is undefined or null
  if (!email) {
    return false;
  }
  // Use a regular expression to validate the email format
  const emailRegex = REGEX.VALID_EMAIL;
  return emailRegex.test(email);
}
