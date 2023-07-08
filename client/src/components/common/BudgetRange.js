import React, { useState } from "react";
import {
    convertNumberToCurrency
} from '../../utils/helpers/MoneyConverter';
// Slider library
import { Slider } from "@mui/material";
import { CONVERSION_FACTOR } from "../../constants/Variables.constants";


const BudgetRange = ({callbackOnchange}) => {
const [priceRange, setPriceRange] = useState([0, 1000]);
  return (
    <div className="common-component__budget-range">
      <Slider
        value={priceRange}
        onChange={(e, price) => {
            setPriceRange(price);
            callbackOnchange && callbackOnchange(price);
        }}
        valueLabelDisplay="off"
        min={0}
        max={1000}
      />
      <div className="cc-modern-input__price-detail">
        <span>
          {convertNumberToCurrency(
            "vietnamdong",
            priceRange[0] * CONVERSION_FACTOR.PER_ONE
          )}
        </span>
        <span>
          {convertNumberToCurrency(
            "vietnamdong",
            priceRange[1] * CONVERSION_FACTOR.PER_ONE
          )}
        </span>
      </div>
    </div>
  );
};

export default BudgetRange;


