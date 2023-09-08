/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useRef, useState } from "react";
import "../../styles/pages/users.scss";
import Filterboard from "./Filterboard";
import { useForm } from "react-hook-form";
import {
  BANNER_INPUT,
  PAGINATION_MODEL,
} from "../../constants/Variables.constants";
import { useLocation } from "react-router-dom";
import {
  parseSearchParams,
  stringifySearchParams,
} from "../../utils/helpers/params";
import User from "./User";
import { toggleClass } from "../../utils/helpers/ToggleClass";
import SunriseLoader from "../../components/common/Loader/SunriseLoader";
import Pagination from "../../components/common/Pagination/Pagination";
import Empty from "../../components/common/Empty/Empty";
import { calculateFromIndex } from "../../utils/helpers/Pagination";
import { useSearchAccount } from "../../libs/business-logic/src/lib/account/process/hooks/useSearchAccount";

const itemsPerPage = 8;
const sortCriteria = {
  ASC_RATING: {
    sortingCol: "FullName",
    sortType: "ASC",
    name: "a -> z",
  },
  DESC_RATING: {
    sortingCol: "FullName",
    sortType: "DESC",
    name: "z -> a",
  },
  ASC_DOB: {
    sortingCol: "DateOfBirth",
    sortType: "ASC",
    name: "Tuổi tăng dần",
  },
  DESC_DOB: {
    sortingCol: "DateOfBirth",
    sortType: "DESC",
    name: "Tuổi giảm dần",
  },
  ASC_RANK: {
    sortingCol: "Rank",
    sortType: "ASC",
    name: "Hạng tăng dần",
  },
  DESC_RANK: {
    sortingCol: "Rank",
    sortType: "DESC",
    name: "Hạng giảm dần",
  },
};
function createCheckboxDefaultValue(inputObject) {
  const { name, ...rest } = inputObject;

  const checkboxNames = Object.values(rest)
    .flat()
    .map((value) => value.toLowerCase());

  return checkboxNames;
}
const UserManagement = () => {
  const [selectedSort, setSelectedSort] = useState(null);
  const { onSearchAccount, isLoading: isSearching } = useSearchAccount();
  const sortDropdownRef = useRef(null);
  const [pagination, setPagination] = useState({
    currentPage: 1,
    maxPage: 1,
  });
  const location = useLocation();
  const [accounts, setAccounts] = useState([]);
  const [criteria, setCriteria] = useState(parseSearchParams(location.search));
  const filterTrueList = createCheckboxDefaultValue(criteria);
  const FILTER_INPUT = ["user", "partner", "admin", "male", "female"];
  const filterBoardForm = useForm({
    defaultValues: FILTER_INPUT.reduce((values, key) => {
      values[key] = filterTrueList.includes(key);
      return values;
    }, {}),
  });
  useEffect(() => {
    const newCriteria = parseSearchParams(location.search);
    setCriteria(newCriteria);
    handleSearch(newCriteria);
  }, [location]);

  const scrollToTop = () => {
    const element = document.querySelector(`.scrollable-content`);
    if (element) {
      element.scrollTop = 0;
    }
  };

  const handleSearch = (criteria, isChangePage) => {
    scrollToTop();
    onSearchAccount({
      ...criteria,
      page_number: isChangePage ? pagination.currentPage : 1,
      name: criteria.name === 0 ? "" : criteria.name,
    })
      .then((data) => {
        if (data) {
          setAccounts(data.accounts);
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

  const onFilter = ({ key, value, status }) => {
    let newCriteria = {
      ...criteria,
    };
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

    setCriteria(newCriteria);
    window.history.pushState(
      null,
      null,
      `/users${stringifySearchParams(newCriteria)}`
    );
    handleSearch(newCriteria);
  };

  const renderAccounts = (accountList) => {
    if (!Array.isArray(accountList))
      return (
        <div className="empty">
          <Empty label={"Không có tài khoản nào cả"} />
        </div>
      );
    return accountList.map((account) => {
      return <User data={account} key={account.accountId} />;
    });
  };

  return (
    <main className="users" key={location}>
      <div className="main__wrapper">
        {isSearching ? (
          <div className="search__loader">
            <SunriseLoader />
          </div>
        ) : (
          <div className="search__results">
            {Array.isArray(accounts) && accounts.length > 0 ? (
              <>
                <div className="results__title-container">
                  <h3 className="results__title">
                    {!criteria[BANNER_INPUT.LOCATION.INPUT_NAME] ? (
                      "Toàn bộ người dùng"
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
                    {pagination.currentPage * itemsPerPage} trong{" "}
                    {Number(pagination.maxPage * itemsPerPage).toLocaleString(
                      "en"
                    )}{" "}
                    kết quả
                  </small>
                </div>
                <hr />
                <div className="results__subtitle-container">
                  <div className="result__subtitle">
                    <p>Chỉ hiển thị những người dùng đã tạo tài khoản</p>
                    <p>Không hiển thị đối tác và khách vãng lai</p>
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
                  {renderAccounts(accounts)}
                  <Pagination
                    data={accounts}
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
        <Filterboard form={filterBoardForm} callback={onFilter} />
      </div>
    </main>
  );
};

export default UserManagement;
