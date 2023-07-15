import React from "react";
import { Controller } from "react-hook-form";
import {
  FILTER_SEARCH,
  LOCATION_TYPES,
  BED_TYPES,
  GUEST_RATINGS,
  ROOM_OPTIONS,
  ACCOMMODATION_FACILITIES
} from "../../constants/filter.constants";
import BudgetRange from "../../components/common/BudgetRange";
import Checkbox from "../../components/common/Checkbox";

const Filterboard = ({ form }) => {
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
      <div className="filterboard__search">
        <i className="fi fi-rr-search"></i>
        <Controller
          name={FILTER_SEARCH.NAME}
          control={form.control}
          rules={{
            require: true,
          }}
          render={({ field }) => (
            <input {...field} placeholder="Tìm kiếm theo tên ?" />
          )}
        />
      </div>
      <div className="filterboard__budget">
        <h6>Giá mỗi đêm</h6>

        <BudgetRange callbackOnchange={null} />
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
