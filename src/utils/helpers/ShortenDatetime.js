/**
 * Format the given date and time string to a short version.
 * @param {string} dateTime - The date and time string to format.
 * @returns {string} - The formatted date in a short version.
 */
export function shortenDateTime(dateTime) {
  const dateObj = new Date(dateTime);

  const isDateTime = dateTime.includes("T");

  const options = {
    year: "numeric",
    month: "short",
    day: "numeric",
    hour: isDateTime ? "numeric" : undefined,
    minute: isDateTime ? "numeric" : undefined,
  };

  return dateObj.toLocaleDateString(undefined, options);
}

/**
 * Revert a date string from format "MMM D, YYYY, h:mm A" to "YYYY-MM-DDThh:mm".
 * @param {string} dateTime - The date string to convert.
 * @returns {string} - The converted date string.
 */
export function revertShortenedDateTime(dateTime) {
  const dateObj = new Date(dateTime);
  const year = dateObj.getFullYear();
  const month = String(dateObj.getMonth() + 1).padStart(2, "0");
  const day = String(dateObj.getDate()).padStart(2, "0");
  const hour = String(dateObj.getHours()).padStart(2, "0");
  const minute = String(dateObj.getMinutes()).padStart(2, "0");

  return `${year}-${month}-${day}T${hour}:${minute}`;
}

export function formatDate(dateObj) {
  if (!dateObj)
    return {
      dateMonthYear: null,
      days: null,
      time24: null, // Thêm giá trị thời gian 24 giờ
    };

  const dateRaw = new Date(dateObj);

  let days = [
    "Chủ Nhật",
    "Thứ Hai",
    "Thứ Ba",
    "Thứ Tư",
    "Thứ Năm",
    "Thứ Sáu",
    "Thứ Bảy",
  ];

  let dayOfWeek = days[dateRaw.getDay()];
  let date = dateRaw.getDate();
  let month = dateRaw.getMonth() + 1; // Months are zero based
  let year = dateRaw.getFullYear();

  let hours = dateRaw.getHours();
  let minutes = dateRaw.getMinutes();

  // Định dạng số giờ/phút thành chuỗi có 2 chữ số
  const formattedHours = hours.toString().padStart(2, "0");
  const formattedMinutes = minutes.toString().padStart(2, "0");

  return {
    dateMonthYear: `${date} tháng ${month} ${year}`,
    days: dayOfWeek,
    time24: `${formattedHours}:${formattedMinutes}`, // Thời gian 24 giờ
  };
}
