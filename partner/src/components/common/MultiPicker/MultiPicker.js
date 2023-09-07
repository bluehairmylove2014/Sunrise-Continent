import React, { useEffect, useState } from "react";
import { toggleClass } from "../../../utils/helpers/ToggleClass";
import { isValidURL } from "./../../../utils/validators/url.validator";
import "./MultiPicker.scss";

const MultiPicker = React.forwardRef(
  ({ data, callback, defaultValues }, ref) => {
    const [selected, setSelected] = useState(
      Array.isArray(defaultValues) ? defaultValues : []
    );

    useEffect(() => {
      setSelected(Array.isArray(defaultValues) ? defaultValues : []);
    }, [defaultValues]);
    return (
      <div className="multi-picker" ref={ref}>
        <div className="multi-picker__bg"></div>
        <div className="multi-picker__box">
          <h6>Chọn một hoặc nhiều...</h6>
          {data && Object.keys(data).length > 0 ? (
            <div className="box__content">
              {Object.keys(data).map((dk) => {
                return (
                  <button
                    type="button"
                    className={`content__item ${
                      selected.includes(dk) && "active"
                    }`}
                    key={dk}
                    onClick={() => {
                      if (selected.includes(dk)) {
                        setSelected(selected.filter((s) => s !== dk));
                      } else {
                        setSelected([...selected, dk]);
                      }
                    }}
                  >
                    {isValidURL(data[dk].ICON) ? (
                      <img src={data[dk].ICON} alt="icon"></img>
                    ) : (
                      <i className={data[dk].ICON}></i>
                    )}
                    <p>{data[dk].LABEL}</p>
                  </button>
                );
              })}
            </div>
          ) : (
            <></>
          )}
          <div className="box__btn">
            <button
              type="button"
              onClick={() => {
                toggleClass(ref.current, "active");
                callback && callback(selected);
                setSelected([]);
              }}
            >
              Xác nhận
            </button>
            <button
              type="button"
              onClick={() => {
                toggleClass(ref.current, "active");
                setSelected([]);
              }}
            >
              Huỷ
            </button>
          </div>
        </div>
      </div>
    );
  }
);

export default MultiPicker;
