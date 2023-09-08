import React from "react";
import "../../styles/component/orders.scss";
import { useGetUserOrders } from "../../libs/business-logic/src/lib/order/process/hooks/useGetUserOrders";
import { formatDate } from "./../../utils/helpers/ShortenDatetime";
import { convertNumberToCurrency } from "./../../utils/helpers/MoneyConverter";
import Empty from "./../../components/common/Empty";
import { combineAddress } from "./../../utils/helpers/Address";
import { BED_TYPES } from "../../constants/filter.constants";
import SunriseLoader from "../../components/common/Loader/SunriseLoader";

const Orders = () => {
  const ordersData = useGetUserOrders();
  return (
    <div className="container orders">
      <h3>
        <i className="fi fi-sr-search-alt"></i>&nbsp;&nbsp;Đơn đặt phòng của bạn
      </h3>
      <p>Xem lại các đơn đặt phòng để an tâm hơn trước mỗi chuyến đi nhé!</p>

      {Array.isArray(ordersData) && ordersData.length > 0 ? (
        <table border={1}>
          <thead>
            <tr>
              <th>Mã đơn hàng</th>
              <th>Thông tin người đặt</th>
              <th>Thông tin phòng</th>
              <th>Thông tin thêm</th>
              <th>Phương thức thanh toán</th>
              <th>Tình trạng</th>
              <th>Tổng tiền</th>
            </tr>
          </thead>
          <tbody>
            {ordersData.reverse().map((orderDetail) => (
              <tr key={orderDetail.orderId}>
                <td>{orderDetail.orderId}</td>
                <td>
                  <p>
                    <i className="fi fi-sr-id-card-clip-alt"></i>
                    {orderDetail.fullName}
                  </p>
                  <p>
                    <i
                      style={{ marginRight: "4px" }}
                      className="fi fi-sr-envelope"
                    ></i>{" "}
                    {orderDetail.email}
                  </p>
                  <p>
                    <i className="fi fi-sr-calendar-minus"></i>
                    {formatDate(orderDetail.dateOfBirth).dateMonthYear}
                  </p>
                  <p style={{ textTransform: "Capitalize" }}>
                    <i
                      style={{ marginRight: "4px" }}
                      className="fi fi-ss-flag"
                    ></i>{" "}
                    {orderDetail.nation}
                  </p>
                  <p>
                    <i className="fi fi-sr-phone-call"></i>
                    {orderDetail.phoneNumber}
                  </p>
                </td>
                <td className="booking">
                  {Array.isArray(orderDetail.orderItems) &&
                    orderDetail.orderItems.map((item, index) => (
                      <div
                        className="booking-wrapper"
                        key={"Booking@" + item.orderId + "-number@" + index}
                      >
                        <div className="hotel">
                          <img src={item.image} alt={item.hotelName} />
                          <div className="hotel__info">
                            <h6>{item.hotelName}</h6>
                            <p>
                              {item.address.includes(item.provinceCity) &&
                              item.address.includes(item.country)
                                ? item.address
                                : combineAddress(
                                    item.address,
                                    item.provinceCity,
                                    item.country
                                  )}
                            </p>
                          </div>
                        </div>
                        <div className="room">
                          <p>
                            <i className="fi fi-ss-bed"></i>
                            <b>Loại giường:</b> {BED_TYPES[item.bedType].LABEL}
                          </p>
                          <p>
                            <i className="fi fi-bs-calendar-clock"></i>
                            <b>Ngày đến:</b>{" "}
                            {formatDate(item.checkIn).time24 +
                              ", " +
                              formatDate(item.checkIn).dateMonthYear}
                          </p>
                          <p>
                            <i className="fi fi-ss-calendar-clock"></i>
                            <b>Ngày đi:</b>{" "}
                            {formatDate(item.checkOut).time24 +
                              ", " +
                              formatDate(item.checkOut).dateMonthYear}
                          </p>
                        </div>
                        {index + 1 < orderDetail.orderItems.length ? (
                          <hr />
                        ) : (
                          <></>
                        )}
                      </div>
                    ))}
                </td>
                <td>
                  {(!orderDetail.specialNeeds ||
                    !orderDetail.specialNeeds.length) &&
                  (!orderDetail.notes || !orderDetail.notes.length) ? (
                    "Không có"
                  ) : (
                    <>
                      {orderDetail.specialNeeds.length && (
                        <>
                          <b>Đặc biệt:</b>{" "}
                          {orderDetail.specialNeeds === "null"
                            ? "Không"
                            : orderDetail.specialNeeds}{" "}
                          <br />
                        </>
                      )}
                      {orderDetail.notes.length && (
                        <>
                          <b>Ghi chú:</b>{" "}
                          {orderDetail.notes === "null"
                            ? "Không"
                            : orderDetail.notes}
                        </>
                      )}
                    </>
                  )}
                </td>
                <td>Thanh toán online</td>
                <td className="actions">
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
          {" "}
          {typeof ordersData === "undefined" ? (
            <SunriseLoader />
          ) : (
            <Empty label={"Không có dữ liệu"} />
          )}
        </div>
      )}
    </div>
  );
};

export default Orders;
