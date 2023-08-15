import React from "react";
import "../../../styles/common/pageLoader.scss";

const TypingLoader = () => {
  return (
    <div className="common-component__typing-loader">
      <p>Đang kiểm tra phòng trống...</p>
      <div className="line-wobble"></div>
    </div>
  );
};

export default TypingLoader;
