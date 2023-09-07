import React from "react";
import "./pageLoader.scss";

const CalculateLoader = () => {
  return (
    <div className="spinnerContainer">
      <div className="spinner"></div>
      <div className="loader">
        <p>Đang tải</p>
        <div className="words">
          <span className="word">Doanh thu tuần</span>
          <span className="word">Doanh thu năm</span>
          <span className="word">Tổng doanh thu</span>
          <span className="word">Người dùng</span>
          <span className="word">Đánh giá</span>
        </div>
      </div>
    </div>
  );
};

export default CalculateLoader;
