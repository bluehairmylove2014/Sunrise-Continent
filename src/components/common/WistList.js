/* eslint-disable no-unused-vars */
/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useRef, useState } from "react";
import "../../styles/common/wishlist.scss";
import Empty from "./Empty";
import { useDeleteFromCart } from "../../libs/business-logic/src/lib/cart";
import { toast } from "react-hot-toast";
import { combineAddress } from "../../utils/helpers/Address";
import { useNavigate } from "react-router-dom";
import { PAGES } from "../../constants/Link.constants";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";
// import { useCartContext } from "../../libs/business-logic/src/lib/cart/process/context";

const WistList = ({ isActive, callback }) => {
  const sidebarRef = useRef(null);
  const [wishlistData, setWishlistData] = useState(null);
  // const { state } = useCartContext();
  const navigate = useNavigate();
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

  // useEffect(() => {
  //   setWishlistData(state.cart);
  // }, [state, state.cart]);

  const handleDeleteFromWishlist = (e, id) => {
    e.stopPropagation();
    onDeleteItem(id)
      .then((message) => {
        toast.success(message);
      })
      .catch((err) => {
        toast.error(err.message);
      });
  };

  const renderWishlistHotel = (data) => {
    if (!Array.isArray(data)) return <></>;
    return data.map((d) => {
      return (
        <div
          className="wishlist-content__hotel"
          key={d.id}
          onClick={() => {
            callback(false);
            navigate(PAGES.HOTEL_DETAIL + `?id=${d.id}`);
          }}
        >
          <div className="hotel__img-container">
            <img src={d.image} alt="hotel" />
          </div>
          <div className="hotel__information">
            <div className="information__title">
              <h6>{d.name}</h6>
              <p>{combineAddress(d.address, d.provinceCity, d.country)}</p>
            </div>
            <div className="hotel__price">
              <p>
                {convertNumberToCurrency("vietnamdong", d.price)}{" "}
                <small> / đêm</small>
              </p>
              <button
                onClick={(e) => {
                  e.stopPropagation();
                }}
              >
                Đặt ngay
              </button>
            </div>
          </div>
          <button
            className="close-btn"
            onClick={(e) => handleDeleteFromWishlist(e, d.id)}
          >
            x
          </button>
        </div>
      );
    });
  };

  return (
    <div
      className={`common-component__wishlist ${isActive ? "active" : ""}`}
      ref={sidebarRef}
    >
      <div className="wishlist__title">
        <div></div>
        <p>Danh sách yêu thích</p>
        <button className="wishlist__close-btn" onClick={() => callback(false)}>
          x
        </button>
      </div>
      <div className="wishlist__content">
        {wishlistData ? (
          <>
            <div>{renderWishlistHotel(wishlistData)}</div>
          </>
        ) : (
          <Empty label="Không có khách sạn nào" />
        )}
      </div>
    </div>
  );
};

export default WistList;
