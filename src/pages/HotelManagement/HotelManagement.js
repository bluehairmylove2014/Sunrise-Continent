/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useRef, useState } from "react";
import "../../styles/pages/search.scss";
import Filterboard from "./Filterboard";
import { useForm } from "react-hook-form";
import {
  BANNER_INPUT,
  FILTER_INPUT,
  PAGINATION_MODEL,
} from "../../constants/Variables.constants";
import { useLocation } from "react-router-dom";
import {
  parseSearchParams,
  stringifySearchParams,
} from "../../utils/helpers/params";
import Hotel from "./Hotel";
import { toggleClass } from "../../utils/helpers/ToggleClass";
import { useSearch } from "../../libs/business-logic/src/lib/hotel";
import SunriseLoader from "../../components/common/Loader/SunriseLoader";
import Pagination from "../../components/common/Pagination/Pagination";
import Empty from "../../components/common/Empty/Empty";
import { calculateFromIndex } from "../../utils/helpers/Pagination";

const itemsPerPage = 8;
const budgetKey = "budget";
const sortCriteria = {
  RATING: {
    sortingCol: "Rating",
    sortType: "ASC",
    name: "Phổ biến nhất",
  },
  ASC_PRICE: {
    sortingCol: "Price",
    sortType: "ASC",
    name: "Giá tăng dần",
  },
  DESC_PRICE: {
    sortingCol: "Price",
    sortType: "DESC",
    name: "Giá giảm dần",
  },
};
function createCheckboxDefaultValue(inputObject) {
  const {
    location,
    budget,
    rooms,
    adults,
    childrens,
    end_date,
    start_date,
    ...rest
  } = inputObject;

  const checkboxNames = Object.values(rest)
    .flat()
    .map((value) => value.toLowerCase());

  return checkboxNames;
}
const HotelManagement = () => {
  const [totalHotels, setTotalHotels] = useState(0);
  const [selectedSort, setSelectedSort] = useState(null);
  const { onSearch, isLoading: isSearching } = useSearch();
  const sortDropdownRef = useRef(null);
  const [pagination, setPagination] = useState({
    currentPage: 1,
    maxPage: 1,
  });
  const location = useLocation();
  const [hotels, setHotels] = useState([]);
  const [criteria, setCriteria] = useState(parseSearchParams(location.search));
  const defaultFormValue = Object.keys(BANNER_INPUT).reduce((values, key) => {
    const inputName = BANNER_INPUT[key].INPUT_NAME;
    if (Array.isArray(inputName)) {
      inputName.forEach((n) => {
        values[n] = criteria[n];
      });
      return values;
    } else {
      values[BANNER_INPUT[key].INPUT_NAME] =
        criteria[BANNER_INPUT[key].INPUT_NAME];
      return values;
    }
  }, {});
  defaultFormValue["adults"] === undefined && (defaultFormValue["adults"] = 1);
  defaultFormValue["childrens"] === undefined &&
    (defaultFormValue["childrens"] = 0);
  defaultFormValue["rooms"] === undefined && (defaultFormValue["rooms"] = 1);
  const searchBoardForm = useForm({
    defaultValues: defaultFormValue,
  });
  const filterTrueList = createCheckboxDefaultValue(criteria);
  const filterBoardForm = useForm({
    defaultValues: FILTER_INPUT.reduce((values, key) => {
      values[key] = filterTrueList.includes(key);
      return values;
    }, {}),
  });
  useEffect(() => {
    const newCriteria = parseSearchParams(location.search);
    setCriteria(newCriteria);
    if (searchBoardForm.getValues().location !== newCriteria.location) {
      searchBoardForm.setValue("location", newCriteria.location);
    }
    handleSearch(newCriteria);
  }, [location]);

  const scrollToTop = () => {
    const element = document.querySelector(`.scrollable-content`);
    if (element) {
      element.scrollTop = 0;
    }
  };

  const handleSearch = (criteria, isChangePage) => {
    if (typeof criteria.budget === "string") return;

    scrollToTop();
    onSearch({
      ...criteria,
      page_number: isChangePage ? pagination.currentPage : 1,
      location: !criteria.location ? "" : criteria.location,
    })
      .then((data) => {
        if (data) {
          setTotalHotels(data.totalCount);
          setHotels(data.hotelList);
          setPagination({
            currentPage: data.currentPage,
            maxPage: data.totalPages || 1,
          });
        }
      })
      .catch((err) => {
        console.error(err);
      });
  };

  const handleChangePage = () => {
    handleSearch(criteria, true);
  };

  const budgetToObject = (arrayBudget) => {
    if (!Array.isArray(arrayBudget) || arrayBudget.length !== 2)
      return { min: null, max: null };
    return {
      min: arrayBudget[0],
      max: arrayBudget[1],
    };
  };

  const onFilter = ({ key, value, status }) => {
    let newCriteria = {
      ...criteria,
    };
    const newBudget = key === budgetKey ? value : criteria.budget;
    if (status !== undefined) {
      if (status) {
        if (Object.keys(newCriteria).includes(key)) {
          !Array.isArray(newCriteria[key]) &&
            (newCriteria[key] = [newCriteria[key]]);
          newCriteria[key].push(value);
        } else {
          newCriteria = {
            ...newCriteria,
            ...{
              [key]: [value],
            },
          };
        }
      } else {
        if (Array.isArray(newCriteria[key])) {
          newCriteria[key] = newCriteria[key].filter((v) => v !== value);
          if (newCriteria[key].length === 0) {
            delete newCriteria[key];
          }
        } else {
          delete newCriteria[key];
        }
      }
    }

    const keysToExclude = ["sortingCol", "sortType"];

    // Sử dụng Object.entries() để lọc và tạo đối tượng mới
    newCriteria = Object.fromEntries(
      Object.entries(newCriteria).filter(
        ([key]) => !keysToExclude.includes(key)
      )
    );

    let paramsCriteria = { ...newCriteria };
    if (newBudget) {
      newCriteria = {
        ...newCriteria,
        budget: newBudget,
      };
      paramsCriteria = {
        ...paramsCriteria,
        budget: JSON.stringify(budgetToObject(newBudget)),
      };
    }
    setCriteria(newCriteria);
    window.history.pushState(
      null,
      null,
      `/hotel${stringifySearchParams(paramsCriteria)}`
    );
    handleSearch(newCriteria);
  };

  const renderHotels = (hotelList) => {
    if (!Array.isArray(hotelList))
      return (
        <div className="empty">
          <Empty label={"Không có khách sạn nào cả"} />
        </div>
      );
    return hotelList.map((hotel) => {
      return <Hotel data={hotel} key={hotel.id} criteria={criteria} />;
    });
  };

  return (
    <main className="search" key={location}>
      <div className="main__wrapper">
        {isSearching ? (
          <div className="search__loader">
            <SunriseLoader />
          </div>
        ) : (
          <div className="search__results">
            {Array.isArray(hotels) && hotels.length > 0 ? (
              <>
                <div className="results__title-container">
                  <h3 className="results__title">
                    {!criteria[BANNER_INPUT.LOCATION.INPUT_NAME] ? (
                      "Toàn bộ khách sạn"
                    ) : (
                      <>
                        Kết quả cho&nbsp;
                        <span>
                          {criteria[BANNER_INPUT.LOCATION.INPUT_NAME]}
                        </span>
                        <span>
                          {Object.keys(criteria).length > 1 &&
                            ` và +${
                              Object.keys(criteria).length
                            } tuỳ chọn khác`}
                        </span>
                      </>
                    )}
                  </h3>
                  <small>
                    Hiển thị{" "}
                    {calculateFromIndex(pagination.currentPage, itemsPerPage)} -{" "}
                    {Math.min(
                      pagination.currentPage * itemsPerPage,
                      totalHotels
                    )}{" "}
                    trong {totalHotels} kết quả
                  </small>
                </div>
                <hr />
                <div className="results__subtitle-container">
                  <div className="result__subtitle">
                    <p>Thời gian được tính theo giờ địa phương</p>
                    <p>Đã bao gồm thuế và phí</p>
                  </div>
                  <div className="results__sort-container">
                    <button
                      onClick={() =>
                        toggleClass(sortDropdownRef.current, "active")
                      }
                    >
                      {selectedSort ? (
                        <span>{selectedSort}</span>
                      ) : (
                        <span>Sắp xếp theo</span>
                      )}
                      <i className="fi fi-ts-angle-small-down"></i>
                    </button>
                    <div
                      className="results-sort__dropdown"
                      ref={sortDropdownRef}
                    >
                      {Object.keys(sortCriteria).map((sck) => (
                        <button
                          key={sck}
                          onClick={() => {
                            setSelectedSort(sortCriteria[sck].name);
                            const newCriteria = {
                              ...criteria,
                              sortingCol: sortCriteria[sck].sortingCol,
                              sortType: sortCriteria[sck].sortType,
                            };
                            setCriteria(newCriteria);
                            handleSearch(newCriteria);
                          }}
                        >
                          {sortCriteria[sck].name}
                        </button>
                      ))}
                    </div>
                  </div>
                </div>
                <div className="results__list">
                  {renderHotels(hotels)}
                  <Pagination
                    data={hotels}
                    defaultStartPage={1}
                    maxElementPerPage={itemsPerPage}
                    paginationState={{
                      state: pagination,
                      setState: setPagination,
                    }}
                    model={PAGINATION_MODEL.SIMPLE}
                    callback={handleChangePage}
                  />
                </div>
              </>
            ) : (
              <div className="empty-wrapper" style={{ marginTop: "2rem" }}>
                <Empty label={"Không có gì cả"} />
              </div>
            )}
          </div>
        )}
        <Filterboard
          form={filterBoardForm}
          defaultValues={criteria.budget}
          callback={onFilter}
        />
      </div>
    </main>
  );
};

export default HotelManagement;
