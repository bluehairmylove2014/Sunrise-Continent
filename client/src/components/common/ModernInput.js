import React, { memo }, { useState } from 'react';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import '../../styles/scss/_common_component.scss';

// Helpers
import {
    toggleClass
} from '../../utils/helpers/ToggleClass';

const ModernInput = ({
    options = [],
    placeholder = '',
    search=false,
    valMultipleLevel=false,
    inputType='text'
}) => {
    const [selectedDate, setSelectedDate] = useState(null);
    let upLevelOps = [];
    let normalOps = [];

    if(options && options.length) {    
        let normalOpList = valMultipleLevel ? Object.values(options[0])[1] : options;
        upLevelOps = valMultipleLevel && options.map((op,i) => {
            return (
                <button key={`mi-uplevelops@${i}`} className='cc-modern-input__option-container'>
                    {Object.values(op)[0]}
                </button>
            )
        });
        normalOps = normalOpList.map((op, i) => {
            return (
                <button 
                    key={`mi-normalops@${i}`} 
                    className='cc-modern-input__option-container'
                >
                    {op}
                </button>
            )
        })
    }

    const handleDateChange = (date) => {
        setSelectedDate(date);
    }

    return (
        <div className='common-component__modern-input'>
            <button type='button' onClick={e => toggleClass(e.target.parentNode, 'active')}>
                {placeholder}
                <i className="fi fi-sr-caret-down"></i>
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
                {inputType === 'date' && (
                    <>
                        <DatePicker 
                            selected={selectedDate}
                            onChange={handleDateChange}
                            dateFormat='dd/MM/yyyy'
                            showYearDropdown
                            scrollableYearDropdown
                            yearDropdownItemNumber={15}
                        />
                    </>
                )}
            </div>
        </div>
    );
}

export default memo(ModernInput);
