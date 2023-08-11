import React, { memo, useRef } from "react";
import { Link, useNavigate } from "react-router-dom";
import "../../styles/common/navDropdown.scss";

// Helper
import { toggleClass } from "../../utils/helpers/ToggleClass";

const NavDropdown = ({ name, name_il, name_ir, options, href }) => {
  const dropdown = useRef(null);
  const navigate = useNavigate();
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
    if (href) {
      navigate(href);
    } else {
      toggleClass(dropdownInstance, "active");
    }
  };
  return (
    <div className="common-component__nav-dropdown">
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
