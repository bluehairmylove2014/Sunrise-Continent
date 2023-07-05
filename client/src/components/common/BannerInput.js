import React from 'react';
import '../../styles/scss/_common_component.scss'

// React hook form
import { Controller } from 'react-hook-form';

// Constants
import { BANNER_INPUT_TYPE } from '../../constants/Variables.constants';
// const renderNumberPicker = (control, defaultVal) => {
//     return (
//         <div className="search-cb__nopeople">
//             <button>
//                 <i className="fi fi-rs-search"></i>
//             </button>
//             <Controller
//                 name='start_date'
//                 control={control}
//                 defaultValue={""}
//                 rules={{
//                     require: true
//                 }}
//                 render={({ field }) => (
//                     <>
//                         <label>
//                         </label>
//                         <input
//                             {...field}
//                             type='datetime-local'
//                         />
//                     </>
//                 )}
//             />
//         </div>
//     )
// }

const BannerInput = ({ type, control, defaultValue }) => {

    const renderLocationInput = (control, defaultVal) => {
        return (
            <div className="common-component__banner-input">
                <button>
                    <i className="fi fi-rs-search"></i>
                </button>
                <Controller
                    name='location'
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
        if(input) {
            input.showPicker();
        }
    }
    const renderDatetimeDoubleInput = (control, defaultVal) => {
        return (
            <>
                <button
                    className="cc-banner-input__datetime--start"
                    type='button' 
                    onClick={showPickerInput}
                >
                    <i className="fi fi-rr-calendar-minus"></i>
                    <Controller
                        name='start_date'
                        control={control}
                        defaultValue={defaultVal}
                        rules={{
                            require: true
                        }}
                        render={({ field }) => (
                            <>
                                <label>
                                </label>
                                <input
                                    {...field}
                                    type='datetime-local'
                                />
                            </>
                        )}
                    />
                    <div className="cc-banner-input__multiline-value">
                        <p>{"14 tháng 7 2023"}</p>
                        <p>{"Thứ 6"}</p>
                    </div>

                </button>
                <button
                    className="cc-banner-input__datetime--end"
                    type='button' 
                    onClick={showPickerInput}
                >
                    <i className="fi fi-rr-calendar-check"></i>
                    <Controller
                        name='start_date'
                        control={control}
                        defaultValue={defaultVal}
                        rules={{
                            require: true
                        }}
                        render={({ field }) => (
                            <>
                                <label>
                                </label>
                                <input
                                    {...field}
                                    type='datetime-local'
                                />
                            </>
                        )}
                    />
                    <div className="cc-banner-input__multiline-value">
                        <p>{"16 tháng 7 2023"}</p>
                        <p>{"Thứ 2"}</p>
                    </div>
                </button>
            </>
        )
    }
    const renderPeopleRoomInput = (control, defaultVal) => {
        return (
            <>
                <button
                    className="cc-banner-input__people-e-room"
                    type='button' 
                    onClick={showPickerInput}
                >
                    <i className="fi fi-tr-people"></i>
                    <div className="cc-banner-input__multiline-value">
                        <p>{"2 người lớn, 1 trẻ em"}</p>
                        <p>{"1 phòng"}</p>
                    </div>
                </button>
            </>
        )
    }


    return (
        <div className="common-component__banner-input-wrapper">
            {
                type === BANNER_INPUT_TYPE.LOCATION &&
                renderLocationInput(
                    control,
                    defaultValue
                )
            }
            {
                type === BANNER_INPUT_TYPE.DATE_TIME_DOUBLE &&
                renderDatetimeDoubleInput(
                    control,
                    defaultValue
                )
            }
            {
                type === BANNER_INPUT_TYPE.PEOPLE_AND_ROOM &&
                renderPeopleRoomInput(
                    control,
                    defaultValue
                )
            }
        </div>
    );
}

export default BannerInput;
