import React, { useRef } from "react";
import "../../styles/common/bannerInput.scss";
import { Controller } from "react-hook-form";
import { BANNER_INPUT } from "../../constants/Variables.constants";
import { formatDate } from "../../utils/helpers/ShortenDatetime";
import {
  getCurrentDateTime,
  isDateGreaterThan,
} from "../../utils/helpers/Datetime";
import { toggleClass } from "../../utils/helpers/ToggleClass";

const BannerInput = ({
  name,
  title,
  description,
  type,
  form,
  min,
  background,
}) => {
  const { control, watch, setValue } = form;
  const perRef = useRef(null);
  const renderLocationInput = (name, background) => {
    return (
      <div
        className="common-component__banner-input"
        style={background && { background }}
      >
        <button>
          <i className="fi fi-rs-search"></i>
        </button>
        <Controller
          name={name}
          control={control}
          rules={{
            required: "Không được bỏ trống địa điểm",
          }}
          render={({ field }) => (
            <input {...field} placeholder="Tìm kiếm địa điểm" />
          )}
        />
      </div>
    );
  };
  const showPickerInput = (ev) => {
    const input = ev.target.querySelector("input");
    input && input.showPicker();
  };
  const renderDatetimeDoubleInput = (name, background) => {
    const startDate = watch(name[0]);
    const endDate = watch(name[1]);
    const startDateMin = getCurrentDateTime();
    const endDateMin = startDateMin;
    return (
      <>
        <button
          className="cc-banner-input__datetime--start"
          type="button"
          onClick={showPickerInput}
          style={background && { background }}
        >
          <i className="fi fi-rr-calendar-minus"></i>
          <Controller
            name={name[0]}
            control={control}
            rules={{
              required: "Không được bỏ trống ngày bắt đầu",
              min: {
                value: endDateMin,
                message: "Ngày giờ đến phải lớn hơn ngày giờ hiện tại",
              },
            }}
            render={({ field }) => (
              <input
                {...field}
                type="datetime-local"
                min={startDateMin}
                onChange={(e) => {
                  setValue(name[0], e.target.value);
                  if (isDateGreaterThan(e.target.value, endDate)) {
                    setValue(name[1], e.target.value);
                  }
                }}
              />
            )}
          />
          <div className="cc-banner-input__multiline-value">
            <p>{formatDate(startDate).dateMonthYear || "Ngày đến"}</p>
            {startDate ? (
              <small>
                {formatDate(startDate).time24} - {formatDate(startDate).days}
              </small>
            ) : (
              <></>
            )}
          </div>
        </button>
        <button
          className="cc-banner-input__datetime--end"
          type="button"
          onClick={showPickerInput}
          style={background && { background }}
        >
          <i className="fi fi-rr-calendar-check"></i>
          <Controller
            name={name[1]}
            control={control}
            rules={{
              required: "Không được bỏ trống ngày kết thúc",
              min: {
                value: endDateMin,
                message: "Ngày giờ đi phải lớn hơn ngày giờ hiện tại",
              },
            }}
            render={({ field }) => (
              <>
                <input
                  {...field}
                  type="datetime-local"
                  min={endDateMin}
                  onChange={(e) => {
                    setValue(name[1], e.target.value);
                    if (!isDateGreaterThan(e.target.value, startDate)) {
                      setValue(name[0], e.target.value);
                    }
                  }}
                />
              </>
            )}
          />
          <div className="cc-banner-input__multiline-value">
            <p>{formatDate(endDate).dateMonthYear || "Ngày đi"}</p>
            {startDate ? (
              <small>
                {formatDate(endDate).time24} - {formatDate(endDate).days}
              </small>
            ) : (
              <></>
            )}
          </div>
        </button>
      </>
    );
  };
  const renderOption = (input_name, description, label, min) => {
    const currentVal = watch(input_name) || min;
    const isMin = currentVal === min;
    return (
      <div className="per-dropdown__option" key={label}>
        <p>
          {label}
          <small>
            <br />
            {description}
          </small>
        </p>
        <div className="per-dropdown-option__counter">
          <button
            type="button"
            className={`option-counter__btn--decrease`}
            disabled={isMin}
            onClick={() => {
              setValue(input_name, currentVal - 1);
            }}
          >
            <i className="fi fi-rr-minus-small"></i>
          </button>
          <p className="option-counter__display-val">{currentVal}</p>
          <button
            type="button"
            className={`option-counter__btn--increase`}
            onClick={() => {
              setValue(input_name, currentVal + 1);
            }}
          >
            <i className="fi fi-rr-plus-small"></i>
          </button>
        </div>
        <Controller
          name={input_name}
          control={control}
          rules={{
            required: true,
          }}
          render={({ field }) => (
            <>
              <input {...field} type="number" value={field.value ?? min} />
            </>
          )}
        />
      </div>
    );
  };
  const renderPeopleRoomInput = (name, title, description, min, background) => {
    return (
      <>
        <div className="cc-banner-input__per-wrapper" ref={perRef}>
          <button
            className="cc-banner-input__people-e-room"
            type="button"
            onClick={() => toggleClass(perRef.current, "active")}
            style={background && { background }}
          >
            <i className="fi fi-tr-people"></i>
            <div className="cc-banner-input__multiline-value">
              <p>
                {`${watch(name[1]) || min[1]} người lớn, 
                                ${watch(name[2]) || min[2]} trẻ em`}
              </p>
              <small>{`${watch(name[0]) || min[0]} phòng`}</small>
            </div>
          </button>
          <div className="cc-banner-input__per-dropdown">
            {name.map((n, i) =>
              renderOption(n, description[i], title[i], min[i])
            )}
          </div>
        </div>
      </>
    );
  };

  return (
    <div className="common-component__banner-input-wrapper">
      {type === BANNER_INPUT.LOCATION.TYPE &&
        renderLocationInput(name, background)}
      {type === BANNER_INPUT.DATE_TIME_DOUBLE.TYPE &&
        renderDatetimeDoubleInput(name, background)}
      {type === BANNER_INPUT.PEOPLE_AND_ROOM.TYPE &&
        renderPeopleRoomInput(name, title, description, min, background)}
    </div>
  );
};

export default BannerInput;
