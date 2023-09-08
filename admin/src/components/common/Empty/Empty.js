import React from "react";
import emptyIcon from "../../../assets/images/graphics/empty-box.png";
import "./empty.scss";

const Empty = ({ label }) => {
  return (
    <div className="empty">
      <img src={emptyIcon} alt="emptyIcon" />
      <p>{label}</p>
    </div>
  );
};

export default Empty;
