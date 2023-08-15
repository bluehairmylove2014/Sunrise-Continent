/* eslint-disable react-hooks/exhaustive-deps */
import React, { useCallback, useEffect, useRef, useState } from "react";
import "../../styles/component/search.scss";
import TravelImg from "../../assets/images/graphics/travel.png";
import Filterboard from "./Filterboard";
import BannerInput from "../../components/common/BannerInput";
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
import { FILTER_CHECKBOX_KEY } from "../../constants/filter.constants";
import Pagination from "../../components/common/Pagination";
import Empty from "../../components/common/Empty";
import {
  calculateMaxPage,
  slicePaginationData,
} from "../../utils/helpers/Pagination";

const itemsPerPage = 5;
const budgetKey = "budget";
const Search = () => {
  const { onSearch, isLoading: isSearching } = useSearch();
  const sortDropdownRef = useRef(null);
  const [pagination, setPagination] = useState({
    currentPage: 1,
    maxPage: 1,
  });
  const [hotels, setHotels] = useState([]);
  const [criteria, setCriteria] = useState(
    parseSearchParams(useLocation().search)
  );
  const searchBoardForm = useForm({
    defaultValues: Object.keys(BANNER_INPUT).reduce((values, key) => {
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
    }, {}),
  });
  let filterTrueList = [];
  FILTER_CHECKBOX_KEY.forEach((fc) => {
    const trueList = criteria[fc.checkboxGroupKey];
    if (trueList) {
      filterTrueList = [...filterTrueList, ...trueList];
    }
  });
  const filterBoardForm = useForm({
    defaultValues: FILTER_INPUT.reduce((values, key) => {
      values[key] = filterTrueList.includes(key);
      return values;
    }, {}),
  });

  useEffect(() => {
    handleSearch(criteria);
  }, []);

  const scrollToTop = () => {
    const element = document.querySelector(`.search__results`);
    if (element) {
      element.scrollIntoView({ behavior: "smooth" });
    }
  };

  const handleSearch = (criteria) => {
    if (typeof criteria.budget === "string") return;
    if (Object.keys(criteria).length) {
      onSearch(criteria)
        .then((data) => {
          setHotels(data);
          setPagination({
            ...pagination,
            maxPage: Array.isArray(data)
              ? calculateMaxPage(data, itemsPerPage)
              : 1,
          });
        })
        .catch((err) => {
          console.error(err);
        });
    }
  };

  const budgetToObject = (arrayBudget) => {
    if (!Array.isArray(arrayBudget) || arrayBudget.length !== 2)
      return { min: null, max: null };
    return {
      min: arrayBudget[0],
      max: arrayBudget[1],
    };
  };

  const onResearch = (data) => {
    let newCriteria = {
      ...criteria,
      ...data,
    };
    const formBudget = filterBoardForm.getValues().budget;
    if (criteria.budget) {
      newCriteria = {
        ...criteria,
        ...data,
        budget: JSON.stringify(
          budgetToObject(formBudget ? formBudget : criteria.budget)
        ),
      };
    }
    setCriteria({
      ...criteria,
      ...data,
    });
    window.history.pushState(
      null,
      null,
      `/search${stringifySearchParams(newCriteria)}`
    );
    handleSearch({
      ...criteria,
      ...data,
    });
  };

  const onFilter = useCallback(({ key, value, status }) => {
    let newCriteria = {
      ...criteria,
    };
    const newBudget = key === budgetKey ? value : criteria.budget;
    if (status !== undefined) {
      if (status) {
        if (key in newCriteria) {
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
        delete newCriteria[value];
      }
    }

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
      `/search${stringifySearchParams(paramsCriteria)}`
    );
    handleSearch(newCriteria);
  }, []);

  const renderHotels = (hotelList) => {
    if (!Array.isArray(hotelList))
      return (
        <div className="empty">
          <Empty label={"Không có khách sạn nào cả"} />
        </div>
      );
    return slicePaginationData(
      hotelList,
      pagination.currentPage,
      pagination.maxPage,
      itemsPerPage
    ).map((hotel) => {
      return <Hotel data={hotel} key={hotel.id} criteria={criteria} />;
    });
  };

  return (
    <main className="search">
      <div className="search__banner">
        <img src={TravelImg} alt="travel" />
        <h5>Bạn muốn du lịch tới Vương Quốc Anh?</h5>
        <small>
          Hãy đọc tất cả các yêu cầu thủ tục nhập cảnh trước khi đặt chỗ nhé.
        </small>
        <button>Tìm hiểu thêm</button>
      </div>
      <form
        className="search__criteria-board"
        onSubmit={searchBoardForm.handleSubmit(onResearch)}
      >
        <BannerInput
          name={BANNER_INPUT.LOCATION.INPUT_NAME}
          type={BANNER_INPUT.LOCATION.TYPE}
          form={searchBoardForm}
        />
        <BannerInput
          name={BANNER_INPUT.DATE_TIME_DOUBLE.INPUT_NAME}
          type={BANNER_INPUT.DATE_TIME_DOUBLE.TYPE}
          form={searchBoardForm}
        />
        <BannerInput
          name={BANNER_INPUT.PEOPLE_AND_ROOM.INPUT_NAME}
          title={BANNER_INPUT.PEOPLE_AND_ROOM.TITLE}
          description={BANNER_INPUT.PEOPLE_AND_ROOM.DESCRIPTION}
          type={BANNER_INPUT.PEOPLE_AND_ROOM.TYPE}
          min={BANNER_INPUT.PEOPLE_AND_ROOM.MIN_VALUE}
          form={searchBoardForm}
        />
        <button type="submit" className="search__submit-btn">
          Tìm kiếm
        </button>
      </form>
      <div className="container main__wrapper">
        <Filterboard
          form={filterBoardForm}
          defaultValues={criteria.budget}
          callback={onFilter}
        />
        {isSearching ? (
          <div className="search__loader">
            <SunriseLoader />
          </div>
        ) : (
          <>
            <div className="search__results">
              <div className="results__title-container">
                <h3 className="results__title">
                  Kết quả cho&nbsp;
                  <span>{criteria[BANNER_INPUT.LOCATION.INPUT_NAME]}</span>
                  <span>
                    {Object.keys(criteria).length > 1 &&
                      ` và +${Object.keys(criteria).length} tuỳ chọn khác`}
                  </span>
                </h3>
                <small>
                  Hiển thị 0 - 14 trong {Number(4102014).toLocaleString("en")}{" "}
                  kết quả
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
                    <span>Sắp xếp theo</span>
                    <i className="fi fi-ts-angle-small-down"></i>
                  </button>
                  <div className="results-sort__dropdown" ref={sortDropdownRef}>
                    <button>Phổ biến nhất</button>
                    <button>Giá tăng dần</button>
                    <button>Giá giảm dần</button>
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
                  callback={scrollToTop}
                />
              </div>
            </div>
          </>
        )}
      </div>
    </main>
  );
};

export default Search;
