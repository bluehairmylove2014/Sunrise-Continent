import React from "react";
import {
  LOCATION_TYPES,
  BED_TYPES,
  ROOM_OPTIONS,
  ACCOMMODATION_FACILITIES,
} from "../../constants/filter.constants";
import { GUEST_RATINGS } from "../../constants/Rating.constant";
import BudgetRange from "../../components/common/BudgetRange";
import Checkbox from "../../components/common/Checkbox";
import { Controller } from "react-hook-form";

const Filterboard = ({ form, defaultValues, callback }) => {
  const onCheckboxChange = (checkboxName, paramKey) => {
    callback({
      key: paramKey,
      value: checkboxName,
      status: form.getValues()[checkboxName],
    });
  };
  const renderCheckbox = (parentForm, checkboxData, paramKey) => {
    const keyList = Object.keys(checkboxData);
    if (Array.isArray(keyList)) {
      return keyList.map((k) => {
        return (
          <Checkbox
            form={parentForm}
            name={checkboxData[k].INPUT_NAME}
            label={checkboxData[k].LABEL}
            callbackOnChange={(callbackData) => {
              onCheckboxChange(callbackData, paramKey);
            }}
            key={checkboxData[k].INPUT_NAME}
          />
        );
      });
    } else {
      return <></>;
    }
  };
  const setBudget = (budget) => {
    form.setValue("budget", budget);
  };

  return (
    <form className="filterboard">
      <div className="filterboard__budget">
        <h6>Giá mỗi đêm</h6>
        <Controller
          name="budget"
          control={form.control}
          render={({ field }) => (
            <BudgetRange
              callbackOnchange={setBudget}
              defaultValues={
                Array.isArray(defaultValues) && defaultValues.length === 2
                  ? defaultValues
                  : null
              }
            />
          )}
        />
      </div>
      <hr />
      <div className="filterboard__location-types">
        <h6>Loại hình nơi ở</h6>

        {renderCheckbox(form, LOCATION_TYPES, "hotelType")}
      </div>
      <hr />
      <div className="filterboard__location-types">
        <h6>Loại giường</h6>

        {renderCheckbox(form, BED_TYPES, "bedType")}
      </div>
      <hr />
      <div className="filterboard__location-types">
        <h6>Đánh giá của khách</h6>

        {renderCheckbox(form, GUEST_RATINGS, "guestRating")}
      </div>
      <hr />
      <div className="filterboard__location-types">
        <h6>Tiện nghi chỗ nghỉ</h6>

        {renderCheckbox(form, ACCOMMODATION_FACILITIES, "facilities")}
      </div>
      <hr />
      <div className="filterboard__location-types">
        <h6>Chọn phòng có</h6>

        {renderCheckbox(form, ROOM_OPTIONS, "amenities")}
      </div>
    </form>
  );
};

export default Filterboard;
