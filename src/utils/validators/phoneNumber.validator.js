/**
 * Check if the provided phone number is a valid Vietnamese phone number.
 * @param {string} phoneNumber - The phone number to validate.
 * @returns {boolean} True if the phone number is valid, false otherwise.
 */
export function isValidPhoneNumber(phoneNumber) {
  // If phoneNumber is undefined or null
  if (!phoneNumber) {
    return false;
  }

  // Use a regular expression to validate the phone number format
  const phoneRegex = /(84|0[3|5|7|8|9])+([0-9]{8})\b/;
  return phoneRegex.test(phoneNumber);
}
