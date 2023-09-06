import React from "react";
import unavailableIcon from "../../../assets/images/graphics/delete.png";
import "./notSupport.scss";

const NotSupport = () => {
  return (
    <div className="not-support">
      <img src={unavailableIcon} alt="unavailable" />
      <p>Xin lỗi! Chức năng này chưa được hỗ trợ.</p>
    </div>
  );
};

export default NotSupport;
