/* eslint-disable react-hooks/exhaustive-deps */
import React, { memo, useEffect, useState } from "react";
import { convertNumberToCurrency } from "../../utils/helpers/MoneyConverter";
import { Slider } from "@mui/material";
import { CONVERSION_FACTOR } from "../../constants/Variables.constants";
import { debounce } from "lodash";
import "../../styles/common/budgetRange.scss";

const defaultRange = [0, 100];

const BudgetRange = ({ callbackOnchange, defaultValues }) => {
  const [priceRange, setPriceRange] = useState(
    typeof defaultValues !== "undefined" ? defaultValues : defaultRange
  );
  const [isFirstRender, setIsFirstRender] = useState(true);

  useEffect(() => {
    if (isFirstRender) {
      setIsFirstRender(false);
      return; // Do nothing on the first render
    }

    const delayedCallback = debounce(() => {
      callbackOnchange && callbackOnchange(priceRange);
    }, 500);

    delayedCallback();

    return delayedCallback.cancel;
  }, [priceRange]);

  return (
    <div className="common-component__budget-range">
      <Slider
        value={priceRange}
        onChange={(e, price) => {
          setPriceRange(price);
        }}
        valueLabelDisplay="off"
        min={0}
        max={100}
      />
      <div className="cc-modern-input__price-detail">
        <span>
          {convertNumberToCurrency(
            "vietnamdong",
            (priceRange ? priceRange[0] : defaultRange[0]) *
              CONVERSION_FACTOR.PER_ONE
          )}
        </span>
        <span>
          {convertNumberToCurrency(
            "vietnamdong",
            (priceRange ? priceRange[1] : defaultRange[1]) *
              CONVERSION_FACTOR.PER_ONE
          )}
        </span>
      </div>
    </div>
  );
};

export default memo(BudgetRange);
