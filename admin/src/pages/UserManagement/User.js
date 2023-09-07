/* eslint-disable no-unused-vars */
import React, { useRef, useState } from "react";
import YesNoPopup from "../../components/common/YesNoPopup/YesNoPopup";
import { toggleClassNoListener } from "../../utils/helpers/ToggleClass";
import { useBanHotel } from "../../libs/business-logic/src/lib/hotel/process/hooks/useBanHotel";
import { RankList } from "../../constants/Rank";
import { generateImageVersion } from "../../utils/helpers/imageVersion";
import { formatDate } from "./../../utils/helpers/ShortenDatetime";
import reviewIcon from "../../assets/images/icons/review.png";
import adminIcon from "../../assets/images/icons/admin.png";
import { toast } from "react-hot-toast";

const roleList = {
  USER: "User",
  PARTNER: "Partner",
  ADMIN: "Admin",
};

const User = ({ data }) => {
  const popupRef = useRef(null);
  const [isBanned, setIsBanned] = useState(!data.active);
  const { onBanHotel } = useBanHotel();

  const handleBanHotel = (popupStatus) => {
    if (popupStatus) {
      onBanHotel({
        hotelId: data.accountId,
      })
        .then((msg) => {
          toast.success(msg);
          setIsBanned(true);
        })
        .catch((error) => console.error(error));
    }
    toggleClassNoListener(popupRef.current, "active");
  };
  const handleUnBanHotel = () => {
    onBanHotel({
      hotelId: data.accountId,
    })
      .then((msg) => {
        toast.success(msg);
        setIsBanned(false);
      })
      .catch((error) => console.error(error));
  };

  return (
    <div className={`hotel ${isBanned ? "banned" : ""}`}>
      <div className="hotel__images">
        <img src={data.image + generateImageVersion()} alt="hotel" />
      </div>
      <div className="hotel__infor">
        <h4>{data.fullName}</h4>
        <div className="infor__location">
          <i className="fi fi-sr-circle-envelope"></i>
          <p>{data.emailAddress}</p>
        </div>
        <div className="infor__dob">
          <i className="fi fi-sr-calendar"></i>
          <p>{formatDate(data.dateOfBirth).dateMonthYear}</p>
        </div>
        <div className="infor__dob">
          <i className="fi fi-ss-user"></i>
          <p>{data.gender === "Male" ? "Nam" : "Nữ"}</p>
        </div>
        <div className="infor__dob">
          <i className="fi fi-sr-phone-call"></i>
          <p>{data.phoneNumber}</p>
        </div>
        <div className="infor__amenities"></div>
        <div className="infor__services"></div>
      </div>
      <div className="hotel__rating-price">
        <div className="hotel__rating">
          {data.role === roleList.USER ? (
            <>
              <div className="rating__infor" style={{ marginRight: "2px" }}>
                <p>Người dùng</p>
                <small>{RankList[data.rank].label}</small>
              </div>
              <img
                src={RankList[data.rank].image}
                alt="user"
                className="rating__point"
              />
            </>
          ) : data.role === roleList.PARTNER ? (
            <>
              <div className="rating__infor" style={{ marginRight: "8px" }}>
                <p>Đối tác</p>
              </div>
              <img src={reviewIcon} alt="user" className="rating__point" />
            </>
          ) : (
            <>
              <div className="rating__infor">
                <p>Quản trị viên</p>
              </div>
              <img src={adminIcon} alt="user" className="rating__point" />
            </>
          )}
        </div>
        {data.role === roleList.USER ? (
          <div className="hotel__price">
            <small>Điểm đang có</small>
            <p className="hotel-price__real">{data.point} điểm</p>
          </div>
        ) : (
          <></>
        )}
        {data.role === roleList.USER || data.role === roleList.PARTNER ? (
          !isBanned ? (
            <div className="hotel__admin-interact">
              <button
                onClick={() =>
                  toggleClassNoListener(popupRef.current, "active")
                }
              >
                <i className="fi fi-bs-ban"></i>
                Cấm
              </button>
            </div>
          ) : (
            <></>
          )
        ) : (
          <></>
        )}
      </div>
      {isBanned ? (
        <div className="hotel__ban-wrapper">
          <i className="fi fi-bs-ban"></i>
          <button type="button" onClick={handleUnBanHotel}>
            Bỏ cấm
          </button>
        </div>
      ) : (
        <></>
      )}
      <YesNoPopup
        label={"Xác nhận cấm khách sạn này?"}
        ref={popupRef}
        callback={handleBanHotel}
      />
    </div>
  );
};

export default User;
