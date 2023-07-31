import React, { useEffect, useRef } from "react";
import "../../styles/common/wishlist.scss";

const WistList = ({ isActive, callback }) => {
  const sidebarRef = useRef(null);

  useEffect(() => {
    if (sidebarRef.current.classList.contains("active") && !isActive) {
      sidebarRef.current.classList.remove("active");
      callback(false);
    } else if (!sidebarRef.current.classList.contains("active") && isActive) {
      sidebarRef.current.classList.add("active");
      callback(true);
    }
  }, [isActive, sidebarRef, callback]);

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
    </div>
  );
};

export default WistList;
