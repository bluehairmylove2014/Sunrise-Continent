import React, { useState } from "react";
import "./header.scss";
import { country } from "./Data";
import UserSidebar from "../UserSidebar/UserSidebar";
import { useGetUser } from "./../../../libs/business-logic/src/lib/auth/process/hooks/useGetUser";
import { useLocation } from "react-router-dom";
import { PAGES } from "../../../constants/Link.constants";

const Header = () => {
  // eslint-disable-next-line no-unused-vars
  const [selectedLanguage, setSelectedLanguage] = useState(country[0]);
  const [isUserSidebarActive, setIsUserSidebarActive] = useState(false);
  const adminData = useGetUser();
  const location = useLocation();

  return (
    <div className="header">
      <form
        className={`header__search ${
          location.pathname.includes(PAGES.USERS) ||
          location.pathname.includes(PAGES.HOTEL)
            ? "active"
            : ""
        }`}
        onSubmit={(e) => e.preventDefault()}
      >
        <button type="submit">
          <i className="fi fi-br-search"></i>
        </button>
        <input type="text" placeholder="Tìm kiếm..." />
      </form>
      <div className="header__language">
        <button>
          <img src={selectedLanguage.icon} alt={selectedLanguage.label} />
          <span>{selectedLanguage.label}</span>
          <i className="fi fi-rr-angle-small-down"></i>
        </button>
        <div className="language__dropdown"></div>
      </div>
      <button className="header__notification">
        <i className="fi fi-rs-bell"></i>
      </button>
      {adminData ? (
        <button
          className="header__partner"
          onClick={() => setIsUserSidebarActive(!isUserSidebarActive)}
        >
          <img src={adminData.image} alt="partner" />
          <div className="partner__info">
            <span>{adminData.fullName}</span>
            <span>Admin</span>
          </div>
          <i className="fi fi-rr-angle-small-down"></i>
        </button>
      ) : (
        <></>
      )}

      <UserSidebar
        isActive={isUserSidebarActive}
        callback={setIsUserSidebarActive}
        userData={adminData}
      />
    </div>
  );
};

export default Header;
