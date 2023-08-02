import React from "react";
import { Controller } from "react-hook-form";
import "../../styles/common/checkbox.scss";

const Checkbox = ({ form, name, label, callbackOnChange }) => {
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
              defaultChecked={form.getValues()[name] === "true" ? true : false}
              onChange={(e) => {
                field.onChange(e);
                callbackOnChange(name);
              }}
            />
            <span className="checkmark">
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
