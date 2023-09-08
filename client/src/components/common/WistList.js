/* eslint-disable no-unused-vars */
/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useRef, useState } from "react";
import "../../styles/common/wishlist.scss";
import Empty from "./Empty";
import { toast } from "react-hot-toast";
import { combineAddress } from "../../utils/helpers/Address";
import { useNavigate } from "react-router-dom";
import { PAGES } from "../../constants/Link.constants";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";
import { useWishlist } from "../../libs/business-logic/src/lib/wishlist";
import YesNoConfirm from "./Popup/YesNoConfirm";
import { toggleClassNoListener } from "../../utils/helpers/ToggleClass";

const WistList = ({ isActive, callback }) => {
  const sidebarRef = useRef(null);
  const { getWishlist, removeFromWishlist } = useWishlist();
  const wishlist = getWishlist();
  const [wishlistData, setWishlistData] = useState(null);
  const navigate = useNavigate();
  const popUpRef = useRef(null);
  const deleteTarget = useRef(null);

  useEffect(() => {
    setWishlistData(wishlist);
  }, [wishlist]);

  useEffect(() => {
    if (sidebarRef.current.classList.contains("active") && !isActive) {
      sidebarRef.current.classList.remove("active");
      callback(false);
    } else if (!sidebarRef.current.classList.contains("active") && isActive) {
      sidebarRef.current.classList.add("active");
      callback(true);
    }
  }, [isActive, sidebarRef, callback]);

  const handleConfirmDelete = (e, id) => {
    e.stopPropagation();
    deleteTarget.current = id;
    toggleClassNoListener(popUpRef.current, "active");
  };

  const handleDeleteFromWishlist = (isNeedDelete) => {
    if (isNeedDelete) {
      removeFromWishlist(deleteTarget.current)
        .then((message) => {
          toast.success(message);
        })
        .catch((error) => {
          toast.error(error.message);
        });
    }
    deleteTarget.current = null;
    toggleClassNoListener(popUpRef.current, "active");
  };

  const renderWishlistHotel = (data) => {
    if (!Array.isArray(data)) return <></>;
    return data.map((d) => {
      return (
        <div className="wishlist-content__hotel" key={d.id}>
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
                onClick={() => {
                  callback(false);
                  navigate(PAGES.HOTEL_DETAIL + `?id=${d.id}`, {replace: true});
                }}
              >
                Đặt ngay
              </button>
            </div>
          </div>
          <button
            className="close-btn"
            onClick={(e) => handleConfirmDelete(e, d.id)}
          >
            x
          </button>
        </div>
      );
    });
  };

  return (
    <>
      <div
        className={`common-component__wishlist ${isActive ? "active" : ""}`}
        ref={sidebarRef}
      >
        <div className="wishlist__title">
          <div></div>
          <p>Danh sách yêu thích</p>
          <button
            className="wishlist__close-btn"
            onClick={() => callback(false)}
          >
            x
          </button>
        </div>
        <div className="wishlist__content">
          {wishlistData && wishlistData.length ? (
            <>{renderWishlistHotel(wishlistData)}</>
          ) : (
            <Empty label="Không có khách sạn nào" />
          )}
        </div>
      </div>
      <YesNoConfirm
        label={"Bạn muốn xoá tôi khỏi yêu thích ư?"}
        callback={handleDeleteFromWishlist}
        ref={popUpRef}
      />
    </>
  );
};

export default WistList;
