import React from "react";
import "../../../styles/common/yesNoConfirm.scss";

const MultipleOptionPopup = React.forwardRef(
  ({ label, options, callback }, ref) => {
    return (
      <div className="yes-no-confirm" ref={ref}>
        <div className="overlay"></div>
        <div className="yes-no-confirm__box">
          <p>{label}</p>
          <div className="yes-no-confirm__btn">
            {options.map((op) => (
              <button onClick={() => callback(op.value)} key={op.value}>
                {op.label}
              </button>
            ))}
          </div>
        </div>
      </div>
    );
  }
);

export default MultipleOptionPopup;
