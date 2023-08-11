import React from "react";
import "../../styles/common/bannerLayout.scss";

const BannerLayout = ({ banner, title, subtitle }) => {
  return (
    <div className="banner-layout">
      <div className="layout__banner">
        <img src={banner} alt={title} />
      </div>
      <div className="layout__title">
        <h2>{title}</h2>
        <p>{subtitle}</p>
      </div>
    </div>
  );
};

export default BannerLayout;
