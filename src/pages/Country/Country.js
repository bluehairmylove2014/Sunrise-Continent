import React from "react";
import carEmptyIcon from "../../assets/images/graphics/car-empty.png";
import "../../styles/component/country.scss";

const Country = () => {
  const countryData = null;
  return (
    <>
      {countryData ? (
        <>hello</>
      ) : (
        <div className="country__empty">
          <div className="empty__icon">
            <img src={carEmptyIcon} alt="empty" />
            <div className="title">
              <h1>Xin lỗi!</h1>
              <h4>
                Chúng tôi chưa <br />
                hỗ trợ quốc gia này
              </h4>
            </div>
          </div>
        </div>
      )}
    </>
  );
};

export default Country;
