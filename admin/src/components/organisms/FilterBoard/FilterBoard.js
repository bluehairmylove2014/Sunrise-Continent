import React from "react";
import "./FilterBoard.scss";
import { toggleClass } from "../../../utils/helpers/ToggleClass";
import { Controller, useForm } from "react-hook-form";
import { toast } from "react-hot-toast";

const FilterBoard = React.forwardRef(
  ({ filterData, sortData, callback }, ref) => {
    const { control, handleSubmit, setValue, getValues } = useForm();

    const onSuccessSubmit = (data) => {
      const dataKeys = Object.keys(data);
      if (dataKeys.length > 0) {
        let sortCriteriaValue = -1;
        if (dataKeys.includes("sort")) {
          sortCriteriaValue = Number(data.sort);
        }
        const filterCriteriaKeys = dataKeys
          .filter((dk) => data[dk] === true)
          .map((dk) =>
            Object.keys(filterData).find(
              (fdk) => filterData[fdk].inputName === dk
            )
          );
        callback({
          filterData: filterCriteriaKeys,
          sortData: sortCriteriaValue,
        });
        toggleClass(ref.current, "active");
        toast.success("Thành công!");
      }
    };

    const onClear = () => {
      const dataKeys = Object.keys(getValues()).filter((k) => k !== "sort");
      setValue("sort", "");
      dataKeys.forEach((dk) => {
        setValue(dk, false);
      });
      callback({
        filterData: null,
        sortData: null,
      });
      toggleClass(ref.current, "active");
      toast.success("Xoá bộ lọc thành công!");
    };

    return (
      <form
        className="filter-board"
        ref={ref}
        onSubmit={handleSubmit(onSuccessSubmit)}
      >
        <div className="filter-board__header">
          <div></div>
          <h3>Lọc và sắp xếp</h3>
          <button
            type="button"
            onClick={() => toggleClass(ref.current, "active")}
          >
            x
          </button>
        </div>
        <div className="filter-board__body">
          <div className="filter">
            <strong>Lọc theo</strong>
            {filterData &&
              Object.keys(filterData).map((fdk) => (
                <Controller
                  key={fdk}
                  name={filterData[fdk].inputName}
                  control={control}
                  render={({ field }) => (
                    <button
                      type="button"
                      className={`filter__item ${field.value ? "active" : ""}`}
                      onClick={() => {
                        setValue(filterData[fdk].inputName, !field.value);
                      }}
                    >
                      <span>{filterData[fdk].label}</span>
                    </button>
                  )}
                />
              ))}
          </div>
          <div className="sort">
            <strong>Sắp xếp theo</strong>
            <Controller
              name={"sort"}
              control={control}
              defaultValue={""}
              render={({ field }) => (
                <div className="sort-select">
                  <select {...field}>
                    <option value="" disabled>
                      Mặc định
                    </option>
                    {sortData &&
                      Object.keys(sortData).map((sdk) => (
                        <option value={sortData[sdk].value} key={sdk}>
                          {sortData[sdk].label}
                        </option>
                      ))}
                  </select>
                </div>
              )}
            />
          </div>
        </div>
        <div className="filter-board__footer">
          <button type="submit">Xác nhận</button>
          <button type="button" onClick={onClear}>
            <i className="fi fi-ss-trash"></i>Làm mới
          </button>
        </div>
      </form>
    );
  }
);

export default FilterBoard;
