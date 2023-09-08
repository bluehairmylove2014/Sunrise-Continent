export function isDateGreaterThan(dateCheck, dateTarget) {
  if (!dateCheck || !dateTarget) return false;
  const check = new Date(dateCheck);
  const target = new Date(dateTarget);

  return check > target;
}
export function calcNight(startDate, endDate) {
  if (!startDate || !endDate) return 0;

  const startDateRaw = new Date(startDate);
  const endDateRaw = new Date(endDate);

  // Tính hiệu của hai ngày
  const timeDifference = endDateRaw.getTime() - startDateRaw.getTime();

  // Chuyển đổi thành số đêm (mili giây trong một ngày)
  const oneDayInMilliseconds = 1000 * 60 * 60 * 24;
  const night = Math.round(timeDifference / oneDayInMilliseconds);
  return night || 1;
}
export function isCheckInValid(start_date, end_date, amount) {
  // Chuyển đổi các chuỗi ngày thành đối tượng ngày JavaScript
  const startDate = new Date(start_date);
  const endDate = new Date(end_date);

  // Tính khoảng thời gian giữa ngày đến và ngày đi (ở đơn vị giờ)
  const timeDifferenceInHours = (endDate - startDate) / (1000 * 3600);

  // Kiểm tra nếu khoảng thời gian ít nhất là amount giờ
  return timeDifferenceInHours >= amount;
}
export function getCurrentDateTime() {
  const now = new Date();

  // Lấy thông tin ngày, tháng, năm, giờ và phút
  const year = now.getFullYear();
  const month = String(now.getMonth() + 1).padStart(2, "0"); // Thêm '0' ở trước nếu cần
  const day = String(now.getDate()).padStart(2, "0");
  const hours = String(now.getHours()).padStart(2, "0");
  const minutes = String(now.getMinutes()).padStart(2, "0");

  // Tạo chuỗi ngày giờ theo định dạng "YYYY-MM-DDTHH:mm"
  const currentDateTime = `${year}-${month}-${day}T${hours}:${minutes}`;

  return currentDateTime;
}
