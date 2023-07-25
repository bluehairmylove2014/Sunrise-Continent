import React from "react";
import {
  LOCATION_TYPES,
  BED_TYPES,
  ROOM_OPTIONS,
  ACCOMMODATION_FACILITIES
} from "../../constants/filter.constants";
import { GUEST_RATINGS } from "../../constants/Rating.constant";
import BudgetRange from "../../components/common/BudgetRange";
import Checkbox from "../../components/common/Checkbox";

const Filterboard = ({ form, defaultValues }) => {
  const renderCheckbox = (parentForm, checkboxData) => {
    const keyList = Object.keys(checkboxData);
    if (Array.isArray(keyList)) {
      return keyList.map((k) => {
        return (
          <Checkbox
            form={parentForm}
            name={checkboxData[k].INPUT_NAME}
            label={checkboxData[k].LABEL}
            key={checkboxData[k].INPUT_NAME}
          />
        );
      });
    } else {
      return <></>;
    }
  };

  return (
    <form className="filterboard">
      <div className="filterboard__budget">
        <h6>Giá mỗi đêm</h6>

        <BudgetRange 
          callbackOnchange={null} 
          defaultValues={Array.isArray(defaultValues) && defaultValues.length === 2 ? defaultValues : null}
        />
      </div>
      <hr />
      <div className="filterboard__location-types">
        <h6>Loại hình nơi ở</h6>

        {renderCheckbox(form, LOCATION_TYPES)}
      </div>
      <hr />
      <div className="filterboard__location-types">
        <h6>Loại giường</h6>

        {renderCheckbox(form, BED_TYPES)}
      </div>
      <hr />
      <div className="filterboard__location-types">
        <h6>Đánh giá của khách</h6>

        {renderCheckbox(form, GUEST_RATINGS)}
      </div>
      <hr />
      <div className="filterboard__location-types">
        <h6>Tiện nghi chỗ nghỉ</h6>

        {renderCheckbox(form, ACCOMMODATION_FACILITIES)}
      </div>
      <hr />
      <div className="filterboard__location-types">
        <h6>Chọn phòng có</h6>

        {renderCheckbox(form, ROOM_OPTIONS)}
      </div>
    </form>
  );
};

export default Filterboard;
