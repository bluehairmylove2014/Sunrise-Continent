/* eslint-disable no-unused-vars */
/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useRef, useState } from "react";
import "../../styles/common/cartSidebar.scss";
import Empty from "./Empty";
import { combineAddress } from "../../utils/helpers/Address";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";
import YesNoConfirm from "./Popup/YesNoConfirm";
import { toggleClassNoListener } from "../../utils/helpers/ToggleClass";
import { useForm } from "react-hook-form";
import Checkbox from "./Checkbox";
import {
  useClearCart,
  useGetCart,
} from "../../libs/business-logic/src/lib/cart";
import { useCartContext } from "../../libs/business-logic/src/lib/cart/process/context";
import { toast } from "react-hot-toast";

const mockData = [
  {
    hotel: {
      id: 4,
      inputName: "hotel4",
      name: "Musketeers Guest House",
      country: "Việt Nam",
      hotelType: "HOTEL",
      provinceCity: "Hà Nội",
      address: "21 Ngõ 67 Tô Ngọc Vân Quảng An, Quận Tây Hồ, Hà Nội, Việt Nam",
      image:
        "https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i1.jpg",
    },
    room: [
      {
        id: 1,
        inputName: "hotel4room1",
        name: "Phòng 2 Giường Đơn",
        price: 2620000,
      },
      {
        id: 2,
        inputName: "hotel4room2",
        name: "Phòng 2 Giường Đơn",
        price: 2620000,
      },
    ],
  },
  {
    hotel: {
      id: 5,
      inputName: "hotel5",
      name: "Sunrise Paradise Hotel",
      country: "Việt Nam",
      hotelType: "HOTEL",
      provinceCity: "Đà Nẵng",
      address: "123 Đường Biển, Quận Sơn Trà, Đà Nẵng, Việt Nam",
      image:
        "https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i1.jpg",
    },
    room: [
      {
        id: 3,
        inputName: "hotel5room1",
        name: "Phòng 1 Giường Đôi",
        price: 3000000,
      },
    ],
  },
  {
    hotel: {
      id: 6,
      inputName: "hotel6",
      name: "Royal Palace Resort",
      country: "Việt Nam",
      hotelType: "RESORT",
      provinceCity: "Phú Quốc",
      address: "456 Đường Biển, Huyện Phú Quốc, Kiên Giang, Việt Nam",
      image:
        "https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i1.jpg",
    },
    room: [
      {
        id: 4,
        inputName: "hotel6room1",
        name: "Phòng Villa Biển",
        price: 4500000,
      },
      {
        id: 5,
        inputName: "hotel6room2",
        name: "Phòng Deluxe",
        price: 3800000,
      },
    ],
  },
  {
    hotel: {
      id: 7,
      inputName: "hotel7",
      name: "Elegant Riverside Inn",
      country: "Việt Nam",
      hotelType: "HOTEL",
      provinceCity: "Huế",
      address: "789 Đường Sông Hương, Thành phố Huế, Việt Nam",
      image:
        "https://atarceni.sirv.com/Shared/Sunrise-Continent-from-rialloer/hotels/Musketeers%20Guest%20House/Pho%CC%80ng%20Deluxe%20Gi%C6%B0%C6%A1%CC%80ng%20%C4%90%C3%B4i1.jpg",
    },
    room: [
      {
        id: 6,
        inputName: "hotel7room1",
        name: "Phòng Superior",
        price: 1800000,
      },
      {
        id: 7,
        inputName: "hotel7room2",
        name: "Phòng Deluxe",
        price: 2200000,
      },
      {
        id: 8,
        inputName: "hotel7room3",
        name: "Phòng Suite",
        price: 3200000,
      },
    ],
  },
];

const deleteType = {
  ROOM: 1,
  HOTEL: 2,
};

const CartSidebar = ({ isActive, callback }) => {
  const sidebarRef = useRef(null);
  const { state } = useCartContext();
  const [cart, setCart] = useState(null);
  // const cart = mockData;
  const popUpRef = useRef(null);
  const deleteTarget = useRef(null);
  const { control, getValues, handleSubmit } = useForm();
  const { onClearCart } = useClearCart();

  useEffect(() => {
    if (sidebarRef.current.classList.contains("active") && !isActive) {
      sidebarRef.current.classList.remove("active");
      callback(false);
    } else if (!sidebarRef.current.classList.contains("active") && isActive) {
      sidebarRef.current.classList.add("active");
      callback(true);
    }
  }, [isActive, sidebarRef, callback]);

  useEffect(() => {
    setCart(state.cart);
  }, [state.cart]);

  const handleConfirmDelete = (e, type, id) => {
    e.stopPropagation();
    deleteTarget.current = {
      id,
      type,
    };
    toggleClassNoListener(popUpRef.current, "active");
  };

  const handleDeleteFromcart = (isNeedDelete) => {
    if (isNeedDelete && deleteTarget.current) {
      if (deleteTarget.current.type === deleteType.HOTEL) {
        console.log("log DELETE HOTEL: ", deleteTarget.current.id);
      } else if (deleteTarget.current.type === deleteType.ROOM) {
        console.log("log DELETE ROOM: ", deleteTarget.current.id);
      }
    }
    deleteTarget.current = null;
    toggleClassNoListener(popUpRef.current, "active");
  };

  const renderCartItem = (data) => {
    if (!Array.isArray(data)) return <></>;
    return data.map((d) => {
      return (
        <div className="cart-content__hotel" key={d.hotel.id}>
          <div className="hotel__img-container">
            <img src={d.hotel.image} alt="hotel" />
          </div>
          <div className="hotel__information">
            <div className="information__title">
              <h6>{d.hotel.name}</h6>
              <p>
                {combineAddress(
                  d.hotel.address,
                  d.hotel.provinceCity,
                  d.hotel.country
                )}
              </p>
            </div>
            <div className="information__room-list">
              {Array.isArray(d.room) && d.room.length > 0 ? (
                d.room.map((roomData) => (
                  <div
                    className="room"
                    key={`hotel${d.hotel.id}room${roomData.id}`}
                  >
                    <Checkbox
                      form={{ control, getValues }}
                      name={roomData.inputName}
                      label={roomData.name}
                      checkboxSize={"14px"}
                    />
                    <p className="room__price">
                      {convertNumberToCurrency("vietnamdong", roomData.price)}{" "}
                      <small> / đêm</small>
                    </p>
                  </div>
                ))
              ) : (
                <></>
              )}
            </div>
          </div>
          <button
            className="close-btn"
            type="button"
            onClick={(e) =>
              handleConfirmDelete(e, deleteType.HOTEL, d.hotel.id)
            }
          >
            x
          </button>
        </div>
      );
    });
  };

  const onSuccessSubmit = (data) => {
    console.log("log: ", data);
  };
  const onErrorSubmit = (err) => {
    console.log("log: ", err);
  };

  return (
    <>
      <form
        className={`common-component__cart ${isActive ? "active" : ""}`}
        ref={sidebarRef}
        onSubmit={() => handleSubmit(onSuccessSubmit, onErrorSubmit)}
      >
        <div className="cart__title">
          <div></div>
          <p>Giỏ hàng</p>
          <button
            className="cart__close-btn"
            type="button"
            onClick={() => callback(false)}
          >
            x
          </button>
        </div>
        <div className="cart__content">
          {cart && cart.length ? (
            <>{renderCartItem(cart)}</>
          ) : (
            <Empty label="Không có gì ở đây cả!" />
          )}
        </div>
        <div className="cart__interact">
          <button
            type="submit"
            disabled={!cart || (Array.isArray(cart) && cart.length === 0)}
          >
            Đặt phòng ngay
          </button>
          <button
            type="button"
            onClick={() => {
              onClearCart()
                .then((message) => toast.success(message))
                .catch((err) => toast.error(err.message));
            }}
          >
            <i className="fi fi-ss-trash"></i>&nbsp;&nbsp;Xoá giỏ hàng
          </button>
        </div>
      </form>
      <YesNoConfirm
        label={"Do you want to delete from cart?"}
        callback={handleDeleteFromcart}
        ref={popUpRef}
      />
    </>
  );
};

export default CartSidebar;
