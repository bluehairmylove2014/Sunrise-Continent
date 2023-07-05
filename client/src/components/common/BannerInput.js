import React from 'react';
import '../../styles/scss/_common_component.scss'

// React hook form
import { Controller } from 'react-hook-form';

// Constants
import { BANNER_INPUT_TYPE } from '../../constants/Variables.constants';
import { formatDate } from '../../utils/helpers/ShortenDatetime';

const BannerInput = ({
    name,
    title,
    description,
    type,
    control,
    watcher,
    defaultValue,
    min
}) => {

    const renderLocationInput = (name, control, defaultVal) => {
        return (
            <div className="common-component__banner-input">
                <button>
                    <i className="fi fi-rs-search"></i>
                </button>
                <Controller
                    name={name}
                    control={control}
                    defaultValue={defaultVal}
                    rules={{
                        require: true
                    }}
                    render={({ field }) => (
                        <input
                            {...field}
                        />
                    )}
                />
            </div>
        )
    }
    const showPickerInput = (ev) => {
        const input = ev.target.querySelector("input");
        input && input.showPicker();
    }
    const renderDatetimeDoubleInput = (
        name,
        control,
        watcher,
        defaultVal
    ) => {
        return (
            <>
                <button
                    className="cc-banner-input__datetime--start"
                    type='button'
                    onClick={showPickerInput}
                >
                    <i className="fi fi-rr-calendar-minus"></i>
                    <Controller
                        name={name[0]}
                        control={control}
                        defaultValue={defaultVal[0]}
                        rules={{
                            require: true
                        }}
                        render={({ field }) => (
                            <>
                                <input
                                    {...field}
                                    type='datetime-local'
                                />
                            </>
                        )}
                    />
                    <div className="cc-banner-input__multiline-value">
                        <p>{
                            formatDate(watcher(name[0]) || defaultVal[0]).dateMonthYear ||
                            "Start date"
                        }</p>
                        <p>{
                            formatDate(watcher(name[0]) || defaultVal[0]).days
                        }</p>
                    </div>

                </button>
                <button
                    className="cc-banner-input__datetime--end"
                    type='button'
                    onClick={showPickerInput}
                >
                    <i className="fi fi-rr-calendar-check"></i>
                    <Controller
                        name={name[1]}
                        control={control}
                        defaultValue={defaultVal[1]}
                        rules={{
                            require: true
                        }}
                        render={({ field }) => (
                            <>
                                <input
                                    {...field}
                                    type='datetime-local'
                                />
                            </>
                        )}
                    />
                    <div className="cc-banner-input__multiline-value">
                        <p>{
                            formatDate(watcher(name[1]) || defaultVal[1]).dateMonthYear ||
                            "End date"
                        }</p>
                        <p>{
                            formatDate(watcher(name[1]) || defaultVal[1]).days
                        }</p>
                    </div>
                </button>
            </>
        )
    }
    const renderOption = (
        input_name,
        description,
        control,
        watcher,
        label, 
        defaultValue, 
        min
    ) => {
        let isMin = false;
        if(watcher) {
            isMin = watcher(input_name) === min;
        }
        else {
            isMin = defaultValue === min;
        }
        console.log({input_name,
            description,
            control,
            watcher,
            label, 
            defaultValue, 
            min})
        return (
            <div className="per-dropdown__option">
                <p>
                    {label}
                    <small><br/>{description}</small>
                </p>
                <div className="per-dropdown-option__counter">
                    <button
                        className={`option-counter__btn--decrease ${isMin ? 'disable' : ''}`}
                        disabled={isMin}
                    >
                        <i className="fi fi-rr-minus-small"></i>
                    </button>
                    <p className='option-counter__display-val'>
                        {watcher(input_name) || defaultValue}
                    </p>
                    <button
                        className={`option-counter__btn--increase`}
                    >
                        <i className="fi fi-rr-plus-small"></i>
                    </button>
                </div>
                <Controller
                        name={input_name}
                        control={control}
                        defaultValue={defaultValue}
                        rules={{
                            require: true
                        }}
                        render={({ field }) => (
                            <>
                                <input
                                    {...field}
                                    type='number'
                                />
                            </>
                        )}
                    />
            </div>
        )
    }
    const renderPeopleRoomInput = (
        name,
        title,
        description,
        control,
        watcher,
        defaultValue,
        min
    ) => {
        return (
            <>
                <div className="cc-banner-input__per-wrapper">
                    <button
                        className="cc-banner-input__people-e-room"
                        type='button'
                        onClick={showPickerInput}
                    >
                        <i className="fi fi-tr-people"></i>
                        <div className="cc-banner-input__multiline-value">
                            <p>{`${watcher(name[1])} người lớn, ${watcher(name[2])} trẻ em`}</p>
                            <p>{`${watcher(name[0])} phòng`}</p>
                        </div>
                    </button>
                    <div className="cc-banner-input__per-dropdown">
                        {
                            name.map((n, i) => renderOption(
                                n,
                                description[i],
                                control,
                                watcher,
                                title[i], 
                                defaultValue[i], 
                                min[i]
                            ))
                        }
                    </div>
                </div>
            </>
        )
    }


    return (
        <div className="common-component__banner-input-wrapper">
            {
                type === BANNER_INPUT_TYPE.LOCATION &&
                renderLocationInput(
                    name,
                    control,
                    defaultValue
                )
            }
            {
                type === BANNER_INPUT_TYPE.DATE_TIME_DOUBLE &&
                renderDatetimeDoubleInput(
                    name,
                    control,
                    watcher,
                    defaultValue
                )
            }
            {
                type === BANNER_INPUT_TYPE.PEOPLE_AND_ROOM &&
                renderPeopleRoomInput(
                    name,
                    title,
                    description,
                    control,
                    watcher,
                    defaultValue,
                    min
                )
            }
        </div>
    );
}

export default BannerInput;
