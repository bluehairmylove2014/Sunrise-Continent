/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useRef } from "react";
import "./pagination.scss";
import {
  calculateFromIndex,
  calculateToIndex,
  handleNextPage,
  handlePrevPage,
  isDisableNext,
  isDisablePrev,
  calculateNumberList,
} from "../../../utils/helpers/Pagination";
import { PAGINATION_MODEL } from "../../../constants/Variables.constants";

const Pagination = ({
  data,
  maxElementPerPage,
  paginationState,
  model,
  callback,
}) => {
  const isFirstRender = useRef(true);
  const { state, setState } = paginationState;

  useEffect(() => {
    if (!isFirstRender.current) {
      callback && callback();
    }
  }, [state.currentPage]);

  const handleChangePageByNumber = (e) => {
    setState({
      ...state,
      currentPage: Number(e.target.getAttribute("data-pagenumber")),
    });
  };

  const renderPagePaginationNumberBtn = (targetPage, numberOfPages) => {
    const displayPages = calculateNumberList(targetPage, numberOfPages);

    const htmlDisplayPages = displayPages.map((p, i) => {
      return (
        <button
          className={p.active ? "active" : ""}
          data-pagenumber={p.page}
          onClick={(e) => {
            isFirstRender.current && (isFirstRender.current = false);
            handleChangePageByNumber(e);
          }}
          key={`trending-hotel-page-number@${i}`}
        >
          {p.page}
        </button>
      );
    });

    return <>{htmlDisplayPages}</>;
  };

  const detailPagination = ({ data, maxElementPerPage }) => {
    return (
      <div className="home-trending__page-pagination-wrapper">
        <p className="home-trending__page-limit">
          Hiển thị {calculateFromIndex(state.currentPage, maxElementPerPage)} -{" "}
          {calculateToIndex(data, state.currentPage, maxElementPerPage)} trong{" "}
          {data.length} khách sạn nổi bật
        </p>
        {data.length >= 1 && (
          <div className="home-trending__page-pagination">
            <button
              disabled={state.currentPage === 1}
              onClick={() => {
                isFirstRender.current && (isFirstRender.current = false);
                setState({
                  ...state,
                  currentPage: 1,
                });
              }}
            >
              <i className="fi fi-rs-angle-double-small-left"></i>
            </button>
            <button
              disabled={isDisablePrev({ currentPage: state.currentPage })}
              onClick={() => {
                isFirstRender.current && (isFirstRender.current = false);
                handlePrevPage(state, setState);
              }}
            >
              <i className="fi fi-rs-angle-small-left"></i>
            </button>

            {renderPagePaginationNumberBtn(state.currentPage, state.maxPage)}

            <button
              disabled={isDisableNext(state)}
              onClick={() => {
                isFirstRender.current && (isFirstRender.current = false);
                handleNextPage(state, setState);
              }}
            >
              <i className="fi fi-rs-angle-small-right"></i>
            </button>
            <button
              disabled={state.currentPage === state.maxPage}
              onClick={() => {
                isFirstRender.current && (isFirstRender.current = false);
                setState({
                  ...state,
                  currentPage: state.maxPage,
                });
              }}
            >
              <i className="fi fi-rs-angle-double-small-right"></i>
            </button>
          </div>
        )}
      </div>
    );
  };

  const simplePagination = ({ data }) => {
    return (
      <div className="home-trending__page-pagination-wrapper">
        {data.length >= 1 && (
          <div className="home-trending__page-pagination">
            <button
              disabled={state.currentPage === 1}
              onClick={() => {
                isFirstRender.current && (isFirstRender.current = false);
                setState({
                  ...state,
                  currentPage: 1,
                });
              }}
            >
              <i className="fi fi-rs-angle-double-small-left"></i>
            </button>
            <button
              disabled={isDisablePrev({ currentPage: state.currentPage })}
              onClick={() => {
                isFirstRender.current && (isFirstRender.current = false);
                handlePrevPage(state, setState);
              }}
            >
              <i className="fi fi-rs-angle-small-left"></i>
            </button>

            {renderPagePaginationNumberBtn(state.currentPage, state.maxPage)}

            <button
              disabled={isDisableNext(state)}
              onClick={() => {
                isFirstRender.current && (isFirstRender.current = false);
                handleNextPage(state, setState);
              }}
            >
              <i className="fi fi-rs-angle-small-right"></i>
            </button>
            <button
              disabled={state.currentPage === state.maxPage}
              onClick={() => {
                isFirstRender.current && (isFirstRender.current = false);
                setState({
                  ...state,
                  currentPage: state.maxPage,
                });
              }}
            >
              <i className="fi fi-rs-angle-double-small-right"></i>
            </button>
          </div>
        )}
      </div>
    );
  };

  return state.currentPage && state.maxPage ? (
    model === PAGINATION_MODEL.DETAIL ? (
      detailPagination({ data, maxElementPerPage })
    ) : (
      simplePagination({ data })
    )
  ) : (
    <p>ERROR RENDER PAGINATION</p>
  );
};

export default Pagination;
