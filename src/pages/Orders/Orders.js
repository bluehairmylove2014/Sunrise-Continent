import React from "react";
import "../../styles/pages/order.scss";
import { formatDate } from "../../utils/helpers/ShortenDatetime";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";

const Orders = () => {
  const roomsData = [
    {
      hotelId: 1,
      id: 1,
      name: "Suite Deluxe",
      vacancy: 5,
      size: 32,
      price: 4950000,
      roomInfo:
        "Suite này có 1 giường đôi cực lớn, 1 giường sofa, TV màn hình phẳng, máy điều hòa và ấm đun nước điện,minibar",
      roomView: "Hướng nhìn sân trong",
      bedType: "LARGE_DOUBLE",
      picture: [
        {
          id: 1,
          link: "https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Deluxe1.jpg",
        },
        {
          id: 2,
          link: "https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Deluxe2.jpg",
        },
        {
          id: 3,
          link: "https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Deluxe3.jpg",
        },
      ],
      facility: [
        "INTERNET",
        "AIRPORT_SHUTTLE",
        "GYM",
        "RECEPTION_24H",
        "NON_SMOKING",
        "WORK_FACILITIES",
      ],
      service: ["BREAKFAST_INCLUDED", "FREE_SNACKS"],
    },
    {
      hotelId: 1,
      id: 2,
      name: "Suite Nhìn Ra Thành Phố",
      vacancy: 3,
      size: 32,
      price: 5670000,
      roomInfo:
        "Suite này có 1 giường đôi cực lớn, 1 giường sofa, TV màn hình phẳng, máy điều hòa và ấm đun nước điện,minibar",
      roomView: "Nhìn ra địa danh nổi tiếng,Nhìn ra thành phố",
      bedType: "LARGE_DOUBLE",
      picture: [
        {
          id: 1,
          link: "https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%911.jpg",
        },
        {
          id: 2,
          link: "https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%912.jpg",
        },
        {
          id: 3,
          link: "https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Nh%C3%ACn%20Ra%20Th%C3%A0nh%20Ph%E1%BB%913.jpg",
        },
      ],
      facility: [
        "INTERNET",
        "AIRPORT_SHUTTLE",
        "GYM",
        "RECEPTION_24H",
        "NON_SMOKING",
        "WORK_FACILITIES",
      ],
      service: ["BREAKFAST_INCLUDED", "FREE_SNACKS", "AFTERNOON_TEA"],
    },
    {
      hotelId: 1,
      id: 3,
      name: "Suite Junior",
      vacancy: 10,
      size: 28,
      price: 3150000,
      roomInfo:
        "Suite này có 1 giường đôi cực lớn, 1 giường sofa, TV màn hình phẳng, máy điều hòa và ấm đun nước điện,minibar",
      roomView: "Nhìn ra thành phố",
      bedType: "LARGE_DOUBLE",
      picture: [
        {
          id: 1,
          link: "https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Junior1.jpg",
        },
        {
          id: 2,
          link: "https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Junior2.jpg",
        },
        {
          id: 3,
          link: "https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Triple%20E%20Hotel%20Metro%20Ben%20Thanh/Suite%20Junior3.jpg",
        },
      ],
      facility: [
        "INTERNET",
        "AIRPORT_SHUTTLE",
        "GYM",
        "RECEPTION_24H",
        "NON_SMOKING",
        "WORK_FACILITIES",
      ],
      service: ["BREAKFAST_INCLUDED"],
    },
  ];
  const orderList = [
    {
      orderId: 1,
      accountId: 101,
      fullName: "Nguyễn Văn A",
      nation: "Việt Nam",
      dateOfBirth: "1990-05-15T00:00:00.000Z",
      email: "nguyenvana@example.com",
      phoneNumber: "0901234567",
      specialNeeds: "None",
      notes: "Please deliver on time.",
      voucherId: 0,
      total: 1200000,
      paid: true,
      orders: [
        {
          hotelId: 1,
          roomTypeId: 1,
          checkIn: "2023-08-17T15:50:19.551Z",
          checkOut: "2023-08-17T15:50:19.551Z",
          numberOfRoom: 2,
        },
        {
          hotelId: 1,
          roomTypeId: 2,
          checkIn: "2023-08-17T15:50:19.551Z",
          checkOut: "2023-08-17T15:50:19.551Z",
          numberOfRoom: 1,
        },
      ],
      createdAt: "2023-08-17T08:00:00.000Z",
    },
    {
      orderId: 2,
      accountId: 102,
      fullName: "Trần Thị B",
      nation: "Việt Nam",
      dateOfBirth: "1985-10-22T00:00:00.000Z",
      email: "tranthib@example.com",
      phoneNumber: "0912345678",
      specialNeeds: "Vegetarian food",
      notes: "Arrival time: 2 PM",
      voucherId: 0,
      total: 1800000,
      paid: true,
      orders: [
        {
          hotelId: 1,
          roomTypeId: 2,
          checkIn: "2023-08-17T15:50:19.551Z",
          checkOut: "2023-08-17T15:50:19.551Z",
          numberOfRoom: 1,
        },
      ],
      createdAt: "2023-08-16T10:30:00.000Z",
    },
    {
      orderId: 3,
      accountId: 103,
      fullName: "John Smith",
      nation: "United States",
      dateOfBirth: "1988-03-12T00:00:00.000Z",
      email: "john.smith@example.com",
      phoneNumber: "+1 123-456-7890",
      specialNeeds: "Allergic to nuts",
      notes: "Room preference: Non-smoking",
      voucherId: 0,
      total: 2500000,
      paid: false,
      orders: [
        {
          hotelId: 1,
          roomTypeId: 3,
          checkIn: "2023-08-17T15:50:19.551Z",
          checkOut: "2023-08-17T15:50:19.551Z",
          numberOfRoom: 1,
        },
      ],
      createdAt: "2023-08-15T15:15:00.000Z",
    },
  ];

  return (
    <div className="order">
      <h3>Quản lý đơn hàng</h3>

      <table border={1}>
        <thead>
          <tr>
            <th>Tên phòng</th>
            <th>Thông tin người đặt</th>
            <th>Ngày đặt</th>
            <th>Yêu cầu thêm</th>
            <th>Tình trạng</th>
            <th>Hành động</th>
            <th>Đơn giá</th>
          </tr>
        </thead>
        <tbody>
          {Array.isArray(orderList) && orderList.length > 0 ? (
            orderList.map((orderDetail) => (
              <tr key={orderDetail.orderId}>
                <td>
                  {orderDetail.orders.map((od) => {
                    const name =
                      (roomsData.find((rd) => od.roomTypeId === rd.id).name ??
                        "") + `  (x${od.numberOfRoom})`;
                    return (
                      <div key={od.roomTypeId}>
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
                <td>{orderDetail.paid ? "Đã thanh toán" : "COD"}</td>
                <td className="actions">
                  <button>
                    <i className="fi fi-ss-trash"></i>
                  </button>
                </td>
                <td className="price">
                  {convertNumberToCurrency("vietnamdong", orderDetail.total)}
                </td>
              </tr>
            ))
          ) : (
            <></>
          )}
        </tbody>
      </table>
    </div>
  );
};

export default Orders;
