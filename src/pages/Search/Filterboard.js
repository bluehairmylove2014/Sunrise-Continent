/* eslint-disable react-hooks/exhaustive-deps */
import React, { useCallback } from "react";
import { FILTER_CHECKBOX_KEY } from "../../constants/filter.constants";
import BudgetRange from "../../components/common/BudgetRange";
import Checkbox from "../../components/common/Checkbox";
import { Controller } from "react-hook-form";

const defaultRange = [0, 1000];
const budgetName = "budget";
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
  const setBudget = useCallback((budget) => {
    form.setValue(budgetName, budget);
    callback({
      key: budgetName,
      value: budget,
    });
  }, []);

  return (
    <form className="filterboard">
      <div className="filterboard__budget">
        <h6>Giá mỗi đêm</h6>
        <Controller
          name={budgetName}
          control={form.control}
          render={({ field }) => (
            <BudgetRange
              callbackOnchange={setBudget}
              defaultValues={
                Array.isArray(defaultValues) && defaultValues.length === 2
                  ? defaultValues
                  : defaultRange
              }
            />
          )}
        />
      </div>
      <hr />
      {FILTER_CHECKBOX_KEY.map((fc) => {
        return (
          <div
            className="filterboard__location-types"
            key={fc.checkboxGroupKey}
          >
            <h6>{fc.label}</h6>

            {renderCheckbox(form, fc.checkboxData, fc.checkboxGroupKey)}
          </div>
        );
      })}
    </form>
  );
};

export default Filterboard;
