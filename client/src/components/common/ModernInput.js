/* eslint-disable react-hooks/exhaustive-deps */
import React, { memo, useEffect, useRef, useState } from "react";
import "../../styles/common/modernInput.scss";

import { debounce } from "lodash";

import BudgetRange from "./BudgetRange";

// Helpers
import { toggleClass } from "../../utils/helpers/ToggleClass";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";

const ModernInput = ({
  options = [],
  defaultVal = "",
  search = false,
  valMultipleLevel = false,
  inputType = "text",
  callback,
  input_name,
}) => {
  const [upLevelOps, setUpLevelOps] = useState([]);
  const [normalOps, setNormalOps] = useState([]);

  const inputRef = useRef(null);
  const startDatePickerRef = useRef(null);

  useEffect(() => {
    if (inputType === "text" && options && options.length) {
      let normalOpList = valMultipleLevel
        ? Object.values(options[0])[1]
        : options;
      valMultipleLevel && handleChangeUpLevelOps(options);
      handleChangeNormalOps(normalOpList);
    }
  }, [options, search, valMultipleLevel, inputType]);

  const handleChangeUpLevelOps = (opList) => {
    setUpLevelOps(
      opList.map((op, i) => {
        return (
          <button
            type="button"
            key={`mi-uplevelops@${i}`}
            className="cc-modern-input__option-container"
            onClick={() => {
              handleChangeNormalOps(Object.values(opList[i])[1]);
            }}
          >
            {Object.values(op)[0]}
          </button>
        );
      })
    );
  };
  const handleChangeNormalOps = (opList) => {
    setNormalOps(
      opList.map((op, i) => {
        return (
          <button
            type="button"
            key={`mi-normalops@${i}`}
            className="cc-modern-input__option-container"
            onClick={() => {
              callback(input_name, op);
              toggleClass(inputRef.current, "active");
            }}
          >
            {op}
          </button>
        );
      })
    );
  };

  const handleDateChange = (date) => {
    callback(input_name, date);
  };
  const handlePriceChange = (price) => {
    const debouncedSetInputVal = debounce(() => {
      callback(
        input_name,
        `${convertNumberToCurrency(
          "vietnamdong",
          price[0]
        )} đến ${convertNumberToCurrency("vietnamdong", price[1])}`
      );
    }, 1000);
    debouncedSetInputVal();
  };

  return (
    <div className={`common-component__modern-input`} ref={inputRef}>
      <button
        type="button"
        onClick={() => {
          if (inputType !== "date") {
            toggleClass(inputRef.current, "active");
          } else {
            startDatePickerRef.current.showPicker();
          }
        }}
      >
        {defaultVal}
        <i className="fi fi-sr-caret-down"></i>

        {inputType === "date" && (
          <>
            <input
              type="date"
              ref={startDatePickerRef}
              onChange={(e) => handleDateChange(e.target.value)}
              min={new Date().toISOString().split("T")[0]}
            />
          </>
        )}
      </button>
      <div className="cc-modern-input__dropdown">
        {search && (
          <>
            <div className="cc-modern-input__searchbox">
              <i className="fi fi-rr-search"></i>
              <input type="text" placeholder="Search" />
            </div>
          </>
        )}

        {inputType === "text" && (
          <>
            {valMultipleLevel && (
              <div className="cc-modern-input__up-level-options">
                {upLevelOps}
              </div>
            )}
            <div className="cc-modern-input__normalOptions">{normalOps}</div>
          </>
        )}
        {inputType === "price" && (
          <>
            <p>Ngân sách dự kiến</p>
            <BudgetRange callbackOnchange={handlePriceChange} />
          </>
        )}
      </div>
    </div>
  );
};

export default memo(ModernInput);
