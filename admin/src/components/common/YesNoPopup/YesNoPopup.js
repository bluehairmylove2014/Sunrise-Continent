import React from "react";
import "./yesNoPopup.scss";

const YesNoPopup = React.forwardRef(({ label, callback }, ref) => {
  return (
    <div className="yes-no-confirm" ref={ref}>
      <div className="overlay"></div>
      <div className="yes-no-confirm__box">
        <p>{label}</p>
        <div className="yes-no-confirm__btn">
          <button onClick={() => callback(true)}>Đúng rồi</button>
          <button onClick={() => callback(false)}>Suy nghĩ lại</button>
        </div>
      </div>
    </div>
  );
});

export default YesNoPopup;
