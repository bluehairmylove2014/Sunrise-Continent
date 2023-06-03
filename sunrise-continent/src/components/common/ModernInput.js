import React from 'react';
import '../../assets/styles/scss/_common_component.scss';

const ModernInput = ({
    options = [],
    defaultVal = '',
    search=false,
    valMultipleLevel=false
}) => {

    const renderOptions = (option_list, isValMulLevel) => {
        const options = option_list.map((op,i) => {
            return (
                <button key={`ModernInput@${i}`} className='cc-modern-input__option-container'>
                    {Object.values(op)[0]}
                </button>
            )
        })
        return (
            {options}
        )
    }

    return (
        <div className='common-component__modern-input'>
            <button type='button'>
                {defaultVal}
                <i className="fi fi-sr-caret-down"></i>
            </button>
            <div className="cc-modern-input__dropdown">
                {search && <>
                    <div className="cc-modern-input__searchbox">
                        <input type="text" placeholder='search'/>
                        <i className="fi fi-rr-search"></i>
                    </div>
                </>}
                {() => renderOptions(options, valMultipleLevel)}
            </div>
        </div>
    );
}

export default ModernInput;
