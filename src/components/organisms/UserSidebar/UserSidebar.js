import React, { useEffect, useRef } from "react";
import { Link, useNavigate } from "react-router-dom";
import { useLogout } from "../../../libs/business-logic/src/lib/auth";
import "./userSidebar.scss";
import { PAGES } from "./../../../constants/Link.constants";

const UserSidebar = ({ isActive, userData, callback }) => {
  const sidebarRef = useRef(null);
  const { onLogout } = useLogout();
  const navigate = useNavigate();

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
              <img src={userData.image} alt="rank" />
              <span>
                {userData.name} <br />
                <small>{userData.role}</small>
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
          <button
            onClick={() => {
              navigate(PAGES.LOGIN);
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
