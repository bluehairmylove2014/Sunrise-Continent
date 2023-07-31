/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useRef, useState } from "react";
import "../../styles/scss/search.scss";
import TravelImg from "../../assets/images/graphics/travel.png";
import Filterboard from "./Filterboard";
import BannerInput from "../../components/common/BannerInput";
import { useForm } from "react-hook-form";
import { BANNER_INPUT } from "../../constants/Variables.constants";
import { useLocation } from "react-router-dom";
import {
  parseSearchParams,
  stringifySearchParams,
} from "../../utils/helpers/params";
import Hotel from "./Hotel";
import { toggleClass } from "../../utils/helpers/ToggleClass";
import { useSearch } from "../../libs/business-logic/src/lib/hotel";
import SmallPageLoader from "../../components/common/SmallPageLoader";
import { calcMaxPage } from "../../utils/helpers/Pages";

const itemsPerPage = 14;

const Search = () => {
  const { onSearch, isLoading: isSearching } = useSearch();
  const sortDropdownRef = useRef(null);
  const [currentPage, setCurrentPage] = useState(1);
  const [maxPage, setMaxPage] = useState(1);
  const [hotels, setHotels] = useState([]);
  const [criteria, setCriteria] = useState(
    parseSearchParams(useLocation().search)
  );
  const defaultValues = Object.keys(BANNER_INPUT).reduce((values, key) => {
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
  const criteriaBoardForm = useForm({
    defaultValues,
  });
  const searchBoardForm = useForm();

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
    const formBudget = searchBoardForm.getValues().budget;
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
  };

  const onFilter = ({ key, value, status }) => {
    let newCriteria = {
      ...criteria,
    };
    if (criteria.budget) {
      newCriteria = {
        ...criteria,
        budget: JSON.stringify(budgetToObject(criteria.budget)),
      };
    }
    if (!status) {
      delete newCriteria[value];
    } else {
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
    }
    setCriteria(newCriteria);
    window.history.pushState(
      null,
      null,
      `/search${stringifySearchParams(newCriteria)}`
    );
  };

  const renderHotels = (hotelList) => {
    if (!Array.isArray(hotelList)) return <></>;
    return hotelList.map((hotel) => {
      return <Hotel data={hotel} key={hotel.id} />;
    });
  };

  const renderPagePaginationNumberBtn = (targetPage, numberOfPages) => {
    const displayPages = [];

    if (targetPage === 1) {
      for (let i = 0; i < 3 && targetPage + i <= numberOfPages; i++) {
        displayPages.push({
          page: targetPage + i,
          active: i === 0 ? true : false,
        });
      }
    } else if (targetPage < numberOfPages) {
      displayPages.push(
        { page: targetPage - 1, active: false },
        { page: targetPage, active: true },
        { page: targetPage + 1, active: false }
      );
    } else if (targetPage === numberOfPages) {
      for (let i = 2; i >= 0 && targetPage - i >= 1; i--) {
        displayPages.push({
          page: targetPage - i,
          active: i === 0 ? true : false,
        });
      }
    }

    const htmlDisplayPages = displayPages.map((p, i) => {
      return (
        <button
          className={p.active ? "active" : ""}
          data-pagenumber={p.page}
          onClick={(e) => {
            setCurrentPage(p.page);
          }}
          key={`trending-hotel-page-number@${i}`}
        >
          {p.page}
        </button>
      );
    });

    return <>{htmlDisplayPages}</>;
  };

  useEffect(() => {
    if (criteria.budget && typeof criteria.budget === "string") {
      let budgetJson = JSON.parse(criteria.budget);
      setCriteria({
        ...criteria,
        budget: [budgetJson.min, budgetJson.max],
      });
    }
  }, []);
  useEffect(() => {
    if (typeof criteria.budget === "string") return;
    if (Object.keys(criteria).length) {
      onSearch(criteria)
        .then((data) => {
          const length = Array.isArray(data) ? data.length : 0;
          setHotels(data);
          setMaxPage(calcMaxPage(length, currentPage, itemsPerPage));
        })
        .catch((err) => {
          console.error(err);
        });
    }
  }, [criteria]);

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
        onSubmit={criteriaBoardForm.handleSubmit(onResearch)}
      >
        <BannerInput
          name={BANNER_INPUT.LOCATION.INPUT_NAME}
          type={BANNER_INPUT.LOCATION.TYPE}
          form={criteriaBoardForm}
        />
        <BannerInput
          name={BANNER_INPUT.DATE_TIME_DOUBLE.INPUT_NAME}
          type={BANNER_INPUT.DATE_TIME_DOUBLE.TYPE}
          form={criteriaBoardForm}
        />
        <BannerInput
          name={BANNER_INPUT.PEOPLE_AND_ROOM.INPUT_NAME}
          title={BANNER_INPUT.PEOPLE_AND_ROOM.TITLE}
          description={BANNER_INPUT.PEOPLE_AND_ROOM.DESCRIPTION}
          type={BANNER_INPUT.PEOPLE_AND_ROOM.TYPE}
          min={BANNER_INPUT.PEOPLE_AND_ROOM.MIN_VALUE}
          form={criteriaBoardForm}
        />
        <button type="submit" className="search__submit-btn">
          Tìm kiếm
        </button>
      </form>
      <div className="container main__wrapper">
        <Filterboard
          form={searchBoardForm}
          defaultValues={criteria.budget}
          callback={onFilter}
        />
        {isSearching ? (
          <SmallPageLoader />
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
                <div className="results__page-pagination-wrapper">
                  {
                    <div className="results__page-pagination">
                      <button
                        onClick={() => {
                          setCurrentPage(1);
                        }}
                      >
                        <i className="fi fi-rs-angle-double-small-left"></i>
                      </button>
                      <button
                        onClick={() => {
                          if (currentPage > 1) {
                            setCurrentPage(currentPage - 1);
                          }
                        }}
                      >
                        <i className="fi fi-rs-angle-small-left"></i>
                      </button>

                      {renderPagePaginationNumberBtn(currentPage, maxPage)}

                      <button
                        onClick={() => {
                          if (currentPage > maxPage) {
                            setCurrentPage(currentPage + 1);
                          }
                        }}
                      >
                        <i className="fi fi-rs-angle-small-right"></i>
                      </button>
                      <button
                        onClick={() => {
                          setCurrentPage(maxPage);
                        }}
                      >
                        <i className="fi fi-rs-angle-double-small-right"></i>
                      </button>
                    </div>
                  }
                </div>
              </div>
            </div>
          </>
        )}
      </div>
    </main>
  );
};

export default Search;