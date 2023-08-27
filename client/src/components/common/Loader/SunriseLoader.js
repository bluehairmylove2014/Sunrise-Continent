import React from "react";
import "../../../styles/common/pageLoader.scss";

const SunriseLoader = () => {
  return (
    <div className="common-component__sunrise-loader">
      <div className="sunrise">
        <div className="cloud front">
          <span className="left-front"></span>
          <span className="right-front"></span>
        </div>
        <span className="sun sunshine"></span>
        <span className="sun"></span>
        <div className="cloud back">
          <span className="left-back"></span>
          <span className="right-back"></span>
        </div>
      </div>
      <div className="loading">
        <div className="inner_loader"></div>
      </div>
    </div>
  );
};

export default SunriseLoader;
