/* eslint-disable no-unused-vars */
/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useRef, useState } from "react";
import "../../styles/common/cartSidebar.scss";
import Empty from "./Empty";
import { combineAddress } from "../../utils/helpers/Address";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";
import YesNoConfirm from "./Popup/YesNoConfirm";
import {
  toggleClass,
  toggleClassNoListener,
} from "../../utils/helpers/ToggleClass";
import { useForm } from "react-hook-form";
import Checkbox from "./Checkbox";
import {
  useClearCart,
  useDeleteFromCart,
} from "../../libs/business-logic/src/lib/cart";
import { useCartContext } from "../../libs/business-logic/src/lib/cart/process/context";
import { toast } from "react-hot-toast";
import MultipleOptionPopup from "./Popup/MultipleOptionPopup";
import OrderDetailPicker from "./OrderDetailPicker";

const deleteType = {
  ROOM: 1,
  HOTEL: 2,
};

// const convertCartToDefaultValues = (cart) => {
//   if (!Array.isArray(cart) || cart.length === 0) {
//     return {};
//   }

//   const defaultValues = {};

//   cart.forEach((cartItem) => {
//     const { room } = cartItem;
//     if (Array.isArray(room)) {
//       room.forEach((roomItem) => {
//         const { inputName } = roomItem;
//         defaultValues[inputName] = false;
//       });
//     }
//   });

//   return defaultValues;
// };

const checkSameHotel = (inputObject) => {
  const hotels = {};

  for (const inputName in inputObject) {
    const [hotelId] = inputName.split("room");
    if (inputObject[inputName] && hotelId) {
      hotels[hotelId]
        ? hotels[hotelId].push(inputName)
        : (hotels[hotelId] = [inputName]);
    }
  }
  return Object.keys(hotels).length === 1;
};
const generateSelectedRoomsObject = (cart, formValues) => {
  if (!Array.isArray(cart) || !cart.length || !formValues) {
    return [];
  }

  return cart.reduce((selectedRoomsObject, cartItem) => {
    const { hotel, room } = cartItem;
    const selectedRooms = [];

    if (Array.isArray(room)) {
      room.forEach((roomItem) => {
        const { inputName } = roomItem;
        if (formValues[inputName]) {
          selectedRooms.push(roomItem);
        }
      });
    }

    if (selectedRooms.length > 0) {
      selectedRoomsObject.push({
        hotel,
        rooms: selectedRooms,
      });
    }

    return selectedRoomsObject;
  }, []);
};

const CartSidebar = ({ isActive, callback }) => {
  const sidebarRef = useRef(null);
  const { state } = useCartContext();
  const [cart, setCart] = useState(null);
  // const cart = mockData;
  const pickerRef = useRef(null);
  const popUpRef = useRef(null);
  const checkoutPopUpRef = useRef(null);
  const clearCartPopUpRef = useRef(null);
  const deleteTarget = useRef(null);
  const { control, getValues, handleSubmit } = useForm();
  const pickerForm = useForm({
    defaultValues: {
      rooms: 1,
      adults: 1,
      childrens: 0,
    },
  });
  const { onClearCart } = useClearCart();
  const { onDeleteItem } = useDeleteFromCart();
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
        onDeleteItem({
          type: "hotel",
          id: deleteTarget.current.id,
        })
          .then((message) => {
            toast.success(message);
          })
          .catch((err) => console.error(err));
      } else if (deleteTarget.current.type === deleteType.ROOM) {
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
                    <div className="wrapper">
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
                    <button
                      type="button"
                      onClick={() => {
                        onDeleteItem({
                          type: "room",
                          id: { hotelId: d.hotel.id, roomId: roomData.id },
                        })
                          .then((message) => {
                            toast.success(message);
                          })
                          .catch((err) => console.error(err));
                      }}
                    >
                      <i className="fi fi-ss-trash"></i>
                    </button>
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

  const handleClearCart = (value) => {
    if (value) {
      onClearCart()
        .then((message) => toast.success(message))
        .catch((err) => toast.error(err.response.data.message || err.message));
    }
    toggleClass(clearCartPopUpRef.current, "active");
  };

  const onSuccessSubmit = (data) => {
    if (Object.values(data).includes(true)) {
      if (checkSameHotel(data)) {
        toggleClass(checkoutPopUpRef.current, "active");
      } else {
        toast.error(
          "Chúng tôi chỉ hỗ trợ thanh toán các phòng cùng khách sạn!"
        );
      }
    } else {
      toast.error("Hãy chọn ít nhất 1 phòng");
    }
  };
  const handleCartCheckout = (value) => {
    if (value === "yes") {
      callback && callback(false);
      toggleClass(checkoutPopUpRef.current, "active");
      toggleClass(pickerRef.current, "active");
    } else if (value === "no") {
      toast.error("Xin lỗi! Chức năng này chưa được hỗ trợ.");
      toggleClass(checkoutPopUpRef.current, "active");
    } else {
      toggleClass(checkoutPopUpRef.current, "active");
    }
  };

  return (
    <>
      <form
        className={`common-component__cart ${isActive ? "active" : ""}`}
        ref={sidebarRef}
        onSubmit={handleSubmit(onSuccessSubmit)}
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
            disabled={!cart || (Array.isArray(cart) && cart.length === 0)}
            onClick={() => toggleClass(clearCartPopUpRef.current, "active")}
          >
            <i className="fi fi-ss-trash"></i>&nbsp;&nbsp;Xoá giỏ hàng
          </button>
        </div>
      </form>
      <YesNoConfirm
        label={"Bạn muốn xoá hả?"}
        callback={handleDeleteFromcart}
        ref={popUpRef}
      />
      <YesNoConfirm
        label={"Bạn muốn dọn sạch giỏ hàng phải không?"}
        callback={handleClearCart}
        ref={clearCartPopUpRef}
      />
      <MultipleOptionPopup
        label={"Bạn có muốn đặt tất cả phòng cùng ngày không?"}
        options={[
          {
            value: "yes",
            label: "Đúng rồi",
          },
          {
            value: "no",
            label: "Đặt khác ngày",
          },
          {
            value: "pause",
            label: "Suy nghĩ lại",
          },
        ]}
        callback={handleCartCheckout}
        ref={checkoutPopUpRef}
      />

      <OrderDetailPicker
        ref={pickerRef}
        form={pickerForm}
        defaultValues={{}}
        roomDetail={generateSelectedRoomsObject(cart, getValues())}
      />
    </>
  );
};

export default CartSidebar;
