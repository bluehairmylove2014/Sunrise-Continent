
/**
 * Format the given date and time string to a short version.
 * @param {string} datetime - The date and time string to format.
 * @returns {string} - The formatted date in a short version.
 */
export function shortenDatetime(input) {
  const dateObj = new Date(input);

  const isDatetime = input.includes('T');

  const options = {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
    hour: isDatetime ? 'numeric' : undefined,
    minute: isDatetime ? 'numeric' : undefined,
  };

  return dateObj.toLocaleDateString(undefined, options);
}

/**
 * Revert a date string from format "MMM D, YYYY, h:mm A" to "YYYY-MM-DDThh:mm".
 * @param {string} datetime - The date string to convert.
 * @returns {string} - The converted date string.
 */
export function revertShortenedDatetime(datetime) {
  const dateObj = new Date(datetime);
  const year = dateObj.getFullYear();
  const month = String(dateObj.getMonth() + 1).padStart(2, '0');
  const day = String(dateObj.getDate()).padStart(2, '0');
  const hour = String(dateObj.getHours()).padStart(2, '0');
  const minute = String(dateObj.getMinutes()).padStart(2, '0');

  return `${year}-${month}-${day}T${hour}:${minute}`;
}


export function formatDate(dateObj) {
  if (!dateObj) return {
    dateMonthYear: null,
    days: null
  };
  const dateRaw = new Date(dateObj);
  let days = ['Chủ Nhật', 'Thứ Hai', 'Thứ Ba', 'Thứ Tư', 'Thứ Năm', 'Thứ Sáu', 'Thứ Bảy'];
  let dayOfWeek = days[dateRaw.getDay()];
  let date = dateRaw.getDate();
  let month = dateRaw.getMonth() + 1; // Months are zero based
  let year = dateRaw.getFullYear();

  return {
    dateMonthYear: `${date} tháng ${month} ${year}`,
    days: dayOfWeek
  };
}

