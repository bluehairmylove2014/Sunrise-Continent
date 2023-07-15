import React from "react";
import { Controller } from "react-hook-form";

const Checkbox = ({ form, name, label }) => {
  return (
    <div className="common-component__checkbox">
      <Controller
        name={name}
        control={form.control}
        render={({ field }) => 
        <label className="cc-checkbox__container">
          <input {...field} type="checkbox" />
          <span className="checkmark">
            <i className="fi fi-br-check"></i>
          </span>
          {label}
        </label>
      }
      />
    </div>
  );
};

export default Checkbox;
