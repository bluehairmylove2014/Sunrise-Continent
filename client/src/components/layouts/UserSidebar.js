import React, { useEffect, useRef } from "react";
import { Link } from "react-router-dom";
import { useLogout } from "../../libs/business-logic/src/lib/auth";
import "../../styles/common/userSidebar.scss";
import { RankList } from "../../constants/Rank";
import { PAGES } from "../../constants/Link.constants";

const UserSidebar = ({ isActive, userData, callback }) => {
  const sidebarRef = useRef(null);
  const { onLogout } = useLogout();

  useEffect(() => {
    if (sidebarRef.current.classList.contains("active") && !isActive) {
      sidebarRef.current.classList.remove("active");
      callback(false);
    } else if (!sidebarRef.current.classList.contains("active") && isActive) {
      sidebarRef.current.classList.add("active");
      callback(true);
    }
  }, [isActive, sidebarRef, callback]);

  const handleClose = () => {
    sidebarRef.current.classList.remove("active");
    callback(false);
  };

  return (
    <div
      className={`common-component__user-sidebar ${isActive ? "active" : ""}`}
      ref={sidebarRef}
    >
      <div className="cc-user-sidebar__header">
        <div className="cc-user-sidebar-header__rank">
          {userData && (
            <>
              <img src={RankList[userData.rank].image} alt="rank" />
              <span>
                {RankList[userData.rank].label} <br />
                <small>{userData.point} Điểm</small>
              </span>
            </>
          )}
        </div>
        <button
          className="cc-user-sidebar-header__close-btn"
          onClick={handleClose}
        >
          x
        </button>
      </div>
      <ul>
        <li>
          <Link to={PAGES.HOME}>
            <i className="fi fi-rr-user"></i>
            <span>Your profile</span>
          </Link>
        </li>
        {/* <li>
          <Link to="/setting">
            <i className="fi fi-rr-settings"></i>
            <span>Setting</span>
          </Link>
        </li> */}
        <li>
          <button
            onClick={() => {
              onLogout();
              handleClose();
            }}
          >
            <i className="fi fi-rr-power"></i>
            <span>Logout</span>
          </button>
        </li>
      </ul>
    </div>
  );
};

export default UserSidebar;
