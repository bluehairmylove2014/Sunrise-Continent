import React from "react";
import { Controller } from "react-hook-form";
import "../../styles/common/checkbox.scss";

const Checkbox = ({ form, name, label, callbackOnChange, checkboxSize }) => {
  const checkboxRealSize = checkboxSize ?? "20px";
  return (
    <div className="common-component__checkbox">
      <Controller
        name={name}
        control={form.control}
        render={({ field }) => (
          <label className="cc-checkbox__container">
            <input
              {...field}
              type="checkbox"
              defaultChecked={form.getValues()[name]}
              onChange={(e) => {
                field.onChange(e);
                callbackOnChange && callbackOnChange(name);
              }}
              style={{ width: checkboxRealSize, height: checkboxRealSize }}
            />
            <span
              className="checkmark"
              style={{ width: checkboxRealSize, height: checkboxRealSize }}
            >
              <i className="fi fi-br-check"></i>
            </span>
            {label}
          </label>
        )}
      />
    </div>
  );
};

export default Checkbox;
