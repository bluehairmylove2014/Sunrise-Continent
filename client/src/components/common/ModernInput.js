import React, { memo, useEffect, useRef, useState } from 'react';
import '../../styles/scss/_common_component.scss';

import { debounce } from 'lodash';

// Helpers
import {
    toggleClass
} from '../../utils/helpers/ToggleClass';
import {
    shortenDatetime
} from '../../utils/helpers/ShortenDatetime'
import {
    convertNumberToCurrency,
    convertCurrencyToNumber
} from '../../utils/helpers/MoneyConverter';

// Slider library
import Slider from "@mui/material/Slider";


const ModernInput = ({
    options = [],
    defaultVal = '',
    search=false,
    valMultipleLevel=false,
    inputType='text'
}) => {
    const conversion_factor = 100000;
    const [selectedDate, setSelectedDate] = useState(null);
    const [priceRange, setPriceRange] = useState([0, 1000]);

    const [upLevelOps, setUpLevelOps] = useState([]);
    const [normalOps, setNormalOps] = useState([]);
    const [inputVal, setInputVal] = useState(defaultVal);

    const inputRef = useRef(null);
    const startDatePickerRef = useRef(null);

    useEffect(() => {
        if(inputType === "text" && options && options.length) {    
            let normalOpList = valMultipleLevel ? Object.values(options[0])[1] : options;
            valMultipleLevel && handleChangeUpLevelOps(options);
            handleChangeNormalOps(normalOpList)
        }
    }, [options, search, valMultipleLevel, inputType])
    useEffect(() => {
        setInputVal(defaultVal)
    }, [defaultVal])

    const handleChangeUpLevelOps = (opList) => {
        setUpLevelOps(opList.map((op,i) => {
            return (
                <button 
                    type='button'
                    key={`mi-uplevelops@${i}`} 
                    className='cc-modern-input__option-container'
                    onClick={() => {
                        handleChangeNormalOps(Object.values(opList[i])[1])
                    }}
                >
                    {Object.values(op)[0]}
                </button>
            )
        }));
    }
    const handleChangeNormalOps = (opList) => {
        setNormalOps(opList.map((op, i) => {
            return (
                <button 
                    type='button'
                    key={`mi-normalops@${i}`} 
                    className='cc-modern-input__option-container'
                    onClick={() => {
                        setInputVal(op);
                        toggleClass(inputRef.current, 'active');
                    }}
                >
                    {op}
                </button>
            )
        }))
    }

    const handleDateChange = (date) => {
        setSelectedDate(date);
        setInputVal(shortenDatetime(date))
    }
    const handlePriceChange = (e, price) => {
        setPriceRange(price);
        const debouncedSetInputVal = debounce(() => setInputVal(`
            ${convertNumberToCurrency('vietnamdong', price[0]*conversion_factor)}
             đến 
            ${convertNumberToCurrency('vietnamdong', price[1]*conversion_factor)}
        `), 1000);
        debouncedSetInputVal();
    }

    return (
        <div 
            className={`common-component__modern-input ${inputVal !== defaultVal && 'chosen'}`} 
            ref={inputRef}
        >
            <button 
                type='button' 
                onClick={() => {
                    if(inputType !== 'date') {
                        toggleClass(inputRef.current, 'active')
                    }
                    else {
                        startDatePickerRef.current.showPicker();
                    }
                }}
            >
                {inputVal}
                <i className="fi fi-sr-caret-down"></i>
                
                {inputType === 'date' && (
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
                {search && <>
                    <div className="cc-modern-input__searchbox">
                        <i className="fi fi-rr-search"></i>
                        <input type="text" placeholder='Search'/>
                    </div>
                </>}

                {inputType === 'text' && (
                    <>
                        {valMultipleLevel && (
                            <div className="cc-modern-input__up-level-options">
                                {upLevelOps}
                            </div>
                        )}
                        <div className="cc-modern-input__normalOptions">
                            {normalOps}
                        </div>
                    </>
                )}
                {inputType === 'price' && (
                    <>
                        <p>Ngân sách dự kiến</p>
                        <Slider 
                            value={priceRange} 
                            onChange={handlePriceChange} 
                            valueLabelDisplay="off"  
                            min={0}
                            max={1000}
                        /> 
                        <div className='cc-modern-input__price-detail'>
                            <span>{convertNumberToCurrency('vietnamdong', priceRange[0]*conversion_factor)}</span>
                            <span>{convertNumberToCurrency('vietnamdong', priceRange[1]*conversion_factor)}</span>
                        </div>
                    </>
                )}
            </div>
        </div>
    );
}

export default memo(ModernInput);
