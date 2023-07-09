import React, { memo, useEffect, useRef, useState } from 'react';
import '../../styles/scss/_common_component.scss';

import { debounce } from 'lodash';

import BudgetRange from './BudgetRange';

// Helpers
import {
    toggleClass
} from '../../utils/helpers/ToggleClass';
import {
    shortenDatetime
} from '../../utils/helpers/ShortenDatetime'
import {
    convertNumberToCurrency
} from '../../utils/helpers/MoneyConverter';
import { CONVERSION_FACTOR } from '../../constants/Variables.constants';


const ModernInput = ({
    options = [],
    defaultVal = '',
    search=false,
    valMultipleLevel=false,
    inputType='text'
}) => {
    const [selectedDate, setSelectedDate] = useState(null);

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
    const handlePriceChange = (price) => {
        const debouncedSetInputVal = debounce(() => setInputVal(`
            ${convertNumberToCurrency('vietnamdong', price[0]*CONVERSION_FACTOR.ALL_TRIP)}
             đến 
            ${convertNumberToCurrency('vietnamdong', price[1]*CONVERSION_FACTOR.ALL_TRIP)}
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
                        <BudgetRange callbackOnchange={handlePriceChange}/>
                    </>
                )}
            </div>
        </div>
    );
}

export default memo(ModernInput);
