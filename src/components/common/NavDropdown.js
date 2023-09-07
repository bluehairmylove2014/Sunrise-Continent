import React, { memo, useEffect, useRef } from "react";
import { Link, useLocation, useNavigate } from "react-router-dom";
import "../../styles/common/navDropdown.scss";

// Helper
import { toggleClass } from "../../utils/helpers/ToggleClass";

const NavDropdown = ({ name, name_il, name_ir, options, href }) => {
  const dropdown = useRef(null);
  const navigate = useNavigate();
  const location = useLocation();
  const delay = 300; // Khoảng thời gian chờ đợi (trong mili giây)
  let timerId; // Biến để theo dõi setTimeout

  const renderOptions = (op_list) => {
    return op_list ? (
      op_list.map((op) => {
        return (
          <Link to={op.option_url} key={op.option_name}>
            {op.option_name}
          </Link>
        );
      })
    ) : (
      <></>
    );
  };
  const handleDropdownClick = (dropdownInstance, href) => {
    href && navigate(href, { replace: true });
  };
  function handleMouseEnter() {
    clearTimeout(timerId); // Hủy bỏ setTimeout trước đó (nếu có)
    // Thực hiện các hành động khác khi rê chuột vào
    !dropdown.current.classList.contains("active") &&
      toggleClass(dropdown.current, "active");
  }

  function handleMouseLeave() {
    // Đặt một setTimeout để thực hiện toggle class sau khoảng thời gian chờ đợi
    timerId = setTimeout(() => {
      dropdown.current.classList.contains("active") &&
        toggleClass(dropdown.current, "active");
    }, delay);
  }

  useEffect(() => {
    dropdown.current.classList.contains("active") &&
      toggleClass(dropdown.current, "active");
  }, [location]);
  return (
    <div
      className="common-component__nav-dropdown"
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
    >
      <button onClick={() => handleDropdownClick(dropdown.current, href)}>
        {name_il && <i className={name_il}></i>}
        {name}
        {name_ir && <i className={name_ir}></i>}
      </button>
      <div className="cc-nav-dropdown__content" ref={dropdown}>
        {renderOptions(options)}
      </div>
    </div>
  );
};

export default memo(NavDropdown);
