import React from "react";
import "../../styles/pages/order.scss";
import { formatDate } from "../../utils/helpers/ShortenDatetime";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";
import { useGetUser } from "../../libs/business-logic/src/lib/auth/process/hooks";
import { useGetRooms } from "../../libs/business-logic/src/lib/hotel/process/hooks";
import Empty from "../../components/common/Empty/Empty";
import { useGetUserOrders } from "../../libs/business-logic/src/lib/order/process/hooks";

const Orders = () => {
  const partnerDetail = useGetUser();
  const hotelId = partnerDetail.hotelId;
  const { data: roomsData } = useGetRooms(hotelId);
  const orderList = useGetUserOrders();
  return (
    <div className="order">
      <h3>Quản lý đơn hàng</h3>

      {Array.isArray(orderList) &&
      Array.isArray(roomsData) &&
      orderList.length > 0 ? (
        <table border={1}>
          <thead>
            <tr>
              <th>Tên phòng</th>
              <th>Thông tin người đặt</th>
              <th>Ngày đặt</th>
              <th>Yêu cầu thêm</th>
              <th>Tình trạng</th>
              <th>Đơn giá</th>
            </tr>
          </thead>
          <tbody>
            {orderList.reverse().map((orderDetail) => (
              <tr key={orderDetail.orderId}>
                <td>
                  {orderDetail.orderItems.map((od, index) => {
                    const name =
                      (roomsData.find((rd) => od.roomTypeId === rd.id).name ??
                        "") + `  ( x${od.numberOfRoom} )`;
                    return (
                      <div key={"roomType@" + index}>
                        {name}
                        <br />
                      </div>
                    );
                  })}
                </td>
                <td>
                  <b>Họ tên:</b> {orderDetail.fullName} <br />
                  <b>Email:</b> {orderDetail.email} <br />
                  <b>Ngày sinh:</b>{" "}
                  {formatDate(orderDetail.dateOfBirth).dateMonthYear} <br />
                  <b>Quốc tịch:</b> {orderDetail.nation} <br />
                  <b>Điện thoại:</b> {orderDetail.phoneNumber}
                </td>
                <td>{formatDate(orderDetail.createdAt).dateMonthYear}</td>
                <td>
                  {(!orderDetail.specialNeeds ||
                    !orderDetail.specialNeeds.length) &&
                  (!orderDetail.notes || !orderDetail.notes.length) ? (
                    "Không có"
                  ) : (
                    <>
                      {orderDetail.specialNeeds.length && (
                        <>
                          <b>Đặc biệt:</b> {orderDetail.specialNeeds} <br />
                        </>
                      )}
                      {orderDetail.notes.length && (
                        <>
                          <b>Ghi chú:</b> {orderDetail.notes}
                        </>
                      )}
                    </>
                  )}
                </td>
                <td>
                  {orderDetail.paid ? "Đã thanh toán" : "Chưa thanh toán"}
                </td>
                <td className="price">
                  {convertNumberToCurrency("vietnamdong", orderDetail.total)}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      ) : (
        <div className="no-data">
          <Empty label={"Không có dữ liệu"} />
        </div>
      )}
    </div>
  );
};

export default Orders;
