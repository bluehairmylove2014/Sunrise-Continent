import React, { useState } from "react";
import "./header.scss";
import { country } from "./Data";

const Header = () => {
  // eslint-disable-next-line no-unused-vars
  const [selectedLanguage, setSelectedLanguage] = useState(country[0]);
  const partnerData = {
    id: 1,
    image: "https://rialloer.sirv.com/Sunrise-Continent/Users/avt_3.png",
    role: "partner",
    name: "Diệu Linh",
  };

  return (
    <div className="header">
      <form className="header__search" onSubmit={(e) => e.preventDefault()}>
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
      <button className="header__partner">
        <img src={partnerData.image} alt="partner" />
        <div className="partner__info">
          <span>{partnerData.name}</span>
          <span>{partnerData.role}</span>
        </div>
        <i className="fi fi-rr-angle-small-down"></i>
      </button>
    </div>
  );
};

export default Header;
