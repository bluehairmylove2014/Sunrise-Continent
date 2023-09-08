import React, { useEffect, useState } from "react";
import "./navigationBar.scss";
import { logo, navigator } from "./data";
import { useLocation, useNavigate } from "react-router";

const findTabId = (pathName) => {
  const result = navigator.find((n) => n.pathName === pathName);
  return result ? result.id : -1;
};

const NavigationBar = () => {
  const location = useLocation();
  const navigate = useNavigate();
  const [selectedTab, setSelectedTab] = useState(
    findTabId(location.pathname + location.search)
  );

  useEffect(() => {
    setSelectedTab(findTabId(location.pathname + location.search));
  }, [location]);

  return (
    <nav className="navigation-bar">
      <img
        src={logo.sunriseHorizontalLogo}
        alt="logo"
        className="navigation-bar__logo"
      />
      <ul>
        {navigator.map((n) => (
          <li key={n.id} className={selectedTab === n.id ? "active" : ""}>
            <button onClick={() => navigate(n.pathName)}>
              <i className={n.icon}></i>
              <span>{n.label}</span>
            </button>
          </li>
        ))}
      </ul>
    </nav>
  );
};

export default NavigationBar;
