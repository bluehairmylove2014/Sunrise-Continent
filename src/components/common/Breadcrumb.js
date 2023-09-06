import React, { useEffect, useState } from "react";
import "../../styles/common/breadCrumb.scss";
import { Link, useLocation } from "react-router-dom";
import { PAGES } from "./../../constants/Link.constants";

const breadcrumbsLSKey = "ak123dba1234kj15dabnd3462ablasd";

function setBreadcrumbsLocalStorage(breadcrumb) {
  if (typeof window !== "undefined") {
    window.localStorage.setItem(breadcrumbsLSKey, JSON.stringify(breadcrumb));
  }
}
function getBreadcrumbsLocalStorage() {
  if (typeof window !== "undefined") {
    const rawBreadcrumbs = window.localStorage.getItem(breadcrumbsLSKey);
    return !rawBreadcrumbs ? [] : JSON.parse(rawBreadcrumbs);
  } else {
    return [];
  }
}

const Breadcrumb = () => {
  const location = useLocation();
  const [tabList, setTabList] = useState(getBreadcrumbsLocalStorage());

  useEffect(() => {
    const newLabel = location.pathname.replace("-", " ").split("/").pop();
    const sameTab = tabList.find((tab) => tab.label === newLabel);
    let newTabList = null;
    if (sameTab) {
      newTabList = [...tabList.slice(0, sameTab.step + 1)];
    } else {
      newTabList = [
        ...tabList,
        {
          label: newLabel,
          url: location.pathname + location.search,
          step: tabList.length,
        },
      ];
    }
    console.log(newTabList);
    setBreadcrumbsLocalStorage(newTabList);
    setTabList(getBreadcrumbsLocalStorage());
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [location]);

  useEffect(() => {
    console.log(tabList);
  }, [tabList]);

  return (
    <div className="breadcrumb">
      <span className="tab">
        <Link to={PAGES.HOME}>home</Link>
        {tabList.length > 0 ? <i className="fi fi-ss-caret-right"></i> : <></>}
      </span>

      {tabList.map((tab, index) => (
        <span className="tab" key={tab.label}>
          <Link
            to={tab.url}
            className={index + 1 === tabList.length ? "active" : ""}
          >
            {tab.label}
          </Link>
          {index + 1 < tabList.length ? (
            <i className="fi fi-ss-caret-right"></i>
          ) : (
            <></>
          )}
        </span>
      ))}
    </div>
  );
};

export default Breadcrumb;
