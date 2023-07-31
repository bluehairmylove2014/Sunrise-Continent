import React from "react";
import "../../styles/common/wishlist.scss";

const WistList = ({ isActive, callback }) => {
  return (
    <sidebar
      className={`common-component__wishlist ${isActive ? "active" : ""}`}
    ></sidebar>
  );
};

export default WistList;
