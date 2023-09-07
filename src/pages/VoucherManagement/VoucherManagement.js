import React, { useEffect, useRef, useState } from "react";
import "../../styles/pages/voucher.scss";
import Empty from "../../components/common/Empty/Empty";
import { useForm } from "react-hook-form";
import Checkbox from "../../components/common/Checkbox/Checkbox";
import { RankList } from "../../constants/Rank";
import SunriseLoader from "./../../components/common/Loader/SunriseLoader";
import Pagination from "./../../components/common/Pagination/Pagination";
import { slicePaginationData } from "../../utils/helpers/Pagination";
import { PAGINATION_MODEL } from "../../constants/Variables.constants";
import FilterBoard from "../../components/organisms/FilterBoard/FilterBoard";
import {
  toggleClass,
  toggleClassNoListener,
} from "./../../utils/helpers/ToggleClass";
import YesNoPopup from "../../components/common/YesNoPopup/YesNoPopup";
import { toast } from "react-hot-toast";
import { useDeleteVoucher } from "../../libs/business-logic/src/lib/voucher/process/hooks/useDeleteVoucher.js";
import AddVoucher from "../../components/organisms/AddVoucher/AddVoucher";
import { useVoucherContext } from "../../libs/business-logic/src/lib/voucher/process/context";

const maximumVoucherPerPage = 8;
const filterCriteriaList = {
  Gold: {
    inputName: "goldFilter",
    label: "Hạng vàng",
  },
  Silver: {
    inputName: "silverFilter",
    label: "Hạng bạc",
  },
  Bronze: {
    inputName: "bronzeFilter",
    label: "Hạng đồng",
  },
  Diamond: {
    inputName: "diamondFilter",
    label: "Hạng kim cương",
  },
  Vip: {
    inputName: "vipFilter",
    label: "Hạng Vip",
  },
  OutOfStock: {
    inputName: "outOfStock",
    label: "Hết hàng",
  },
};
const sortCriteriaList = {
  UpPrice: {
    value: 1,
    label: "Giá trị tăng dần",
  },
  DownPrice: {
    value: 2,
    label: "Giá trị giảm dần",
  },
  UpStock: {
    value: 3,
    label: "Số lượng tăng dần",
  },
  DownStock: {
    value: 4,
    label: "Số lượng giảm dần",
  },
  UpRank: {
    value: 5,
    label: "Hạng tăng dần",
  },
  DownRank: {
    value: 6,
    label: "Hạng giảm dần",
  },
};

function rankValue(rank) {
  return Object.keys(RankList).indexOf(rank);
}

function quickSort(arr, sortBy) {
  if (arr.length <= 1) {
    return arr;
  }

  const pivot = arr[0];
  const left = [];
  const right = [];

  for (let i = 1; i < arr.length; i++) {
    if (
      (sortBy === "quantity" && arr[i].quantity < pivot.quantity) ||
      (sortBy === "value" && arr[i].value < pivot.value) ||
      (sortBy === "rank" &&
        rankValue(arr[i].requiredRank) < rankValue(pivot.requiredRank))
    ) {
      left.push(arr[i]);
    } else {
      right.push(arr[i]);
    }
  }

  return [...quickSort(left, sortBy), pivot, ...quickSort(right, sortBy)];
}

function findCheckedVoucherId(inputList) {
  return Object.keys(inputList)
    .filter(
      (inputName) => inputName !== "selectAll" && inputList[inputName] === true
    )
    .map((checkedInputName) => Number(checkedInputName.split("@")[1]));
}

const VoucherManagement = () => {
  const { state } = useVoucherContext();
  const voucherData = state.voucher;
  const [processVoucherData, setProcessVoucherData] = useState(null);
  const voucherForm = useForm({
    defaultValues: {
      selectAll: false,
    },
  });
  const [displayedVoucher, setDisplayedVoucher] = useState(null);
  const deleteTarget = useRef([]);
  const filterRef = useRef(null);
  const popupRef = useRef(null);
  const addVoucherRef = useRef(null);
  const { onDeleteVoucher } = useDeleteVoucher();
  const [isDeleteAllActive, setIsDeleteAllActive] = useState(false);
  const saveFilterSortOptions = useRef({
    filterData: [],
    sortData: 0,
  });

  const [voucherPagination, setVoucherPagination] = useState({
    currentPage: 1,
    maxPage: 1,
  });

  const scrollToTop = () => {
    window &&
      window.scrollTo({
        top: 0,
        behavior: "smooth",
      });
  };

  const onSelect = (inputName) => {
    const formValuesObj = voucherForm.getValues();
    const targetInputName = Object.keys(formValuesObj).filter((k) =>
      displayedVoucher.some((dv) => dv.voucherId === Number(k.split("@")[1]))
    );
    if (inputName === "selectAll") {
      const selectAllStatus = formValuesObj[inputName];
      targetInputName.forEach((k) => {
        voucherForm.setValue(k, selectAllStatus);
      });
    } else {
      let status = false;
      targetInputName.every((key) => formValuesObj[key] === true) &&
        (status = true);
      voucherForm.setValue("selectAll", status);
    }
    setIsDeleteAllActive(
      Object.keys(voucherForm.getValues()).some(
        (k) => voucherForm.getValues()[k] === true
      )
    );
  };

  const handleFilterSort = ({ filterData, sortData }) => {
    saveFilterSortOptions.current = { filterData, sortData };
    if (!filterData && !sortData) {
      setProcessVoucherData(voucherData);
    } else {
      let filterResult = [...voucherData];
      Array.isArray(filterData) &&
        filterData.length > 0 &&
        (filterResult = filterResult.filter(
          (voucher) =>
            filterData.includes(voucher.requiredRank) ||
            (filterData.includes("OutOfStock") && voucher.quantity === 0)
        ));
      switch (sortData) {
        case sortCriteriaList.DownPrice.value: {
          filterResult = quickSort([...filterResult], "value").reverse();
          break;
        }
        case sortCriteriaList.DownRank.value: {
          filterResult = quickSort([...filterResult], "rank").reverse();
          break;
        }
        case sortCriteriaList.DownStock.value: {
          filterResult = quickSort([...filterResult], "quantity").reverse();
          break;
        }
        case sortCriteriaList.UpPrice.value: {
          filterResult = quickSort([...filterResult], "value");
          break;
        }
        case sortCriteriaList.UpRank.value: {
          filterResult = quickSort([...filterResult], "rank");
          break;
        }
        case sortCriteriaList.UpStock.value: {
          filterResult = quickSort([...filterResult], "quantity");
          break;
        }
        default:
          break;
      }
      setProcessVoucherData(filterResult);
    }
  };

  const handleDeleteVoucher = (popupStatus) => {
    if (popupStatus) {
      if (!deleteTarget.current) {
        toast.error("Lỗi xoá voucher");
      } else {
        onDeleteVoucher({ voucherIdList: deleteTarget.current })
          .then((msg) => toast.success(msg))
          .catch((err) => toast.error(err.message))
          .finally(() => {
            deleteTarget.current = [];
            setIsDeleteAllActive(false);
          });
      }
    }
    toggleClassNoListener(popupRef.current, "active");
  };

  useEffect(() => {
    Object.keys(voucherForm.getValues()).forEach((k) =>
      voucherForm.setValue(k, false)
    );
    if (Array.isArray(processVoucherData) && processVoucherData.length > 0) {
      setDisplayedVoucher(
        slicePaginationData(
          processVoucherData,
          voucherPagination.currentPage,
          voucherPagination.maxPage,
          maximumVoucherPerPage
        )
      );
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [voucherPagination.currentPage]);

  useEffect(() => {
    if (Array.isArray(processVoucherData)) {
      const maxPage =
        processVoucherData.length === 0
          ? 1
          : Math.ceil(processVoucherData.length / maximumVoucherPerPage);
      setDisplayedVoucher(
        slicePaginationData(
          processVoucherData,
          voucherPagination.currentPage,
          maxPage,
          maximumVoucherPerPage
        )
      );
      setVoucherPagination({
        ...voucherPagination,
        maxPage,
      });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [processVoucherData]);

  useEffect(() => {
    if (Array.isArray(voucherData)) {
      handleFilterSort(saveFilterSortOptions.current);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [voucherData]);

  return (
    <div className="voucher">
      <div className="voucher__header">
        <h3>Quản lý Voucher</h3>
        <div className="btn-wrapper">
          <button
            onClick={() => {
              deleteTarget.current = findCheckedVoucherId(
                voucherForm.getValues()
              );
              toggleClassNoListener(popupRef.current, "active");
            }}
            disabled={!isDeleteAllActive}
          >
            <i className="fi fi-ss-trash"></i>
          </button>
          <button
            onClick={() =>
              toggleClassNoListener(addVoucherRef.current, "active")
            }
            disabled={!Array.isArray(displayedVoucher)}
          >
            + Tạo voucher
          </button>
          <button
            onClick={() => toggleClass(filterRef.current, "active")}
            disabled={!Array.isArray(displayedVoucher)}
          >
            <i className="fi fi-sr-filter"></i> &nbsp;Lọc và sắp xếp
          </button>
        </div>
      </div>
      {Array.isArray(displayedVoucher) ? (
        <>
          <div className="voucher__list-header">
            <Checkbox
              form={voucherForm}
              name={`selectAll`}
              label={""}
              callbackOnChange={onSelect}
            />
            <p>Tên hiển thị</p>
            <p>Số lượng còn lại</p>
            <p>Giá trị thực</p>
            <p>Yêu cầu hạng</p>
            <p>Hành động</p>
          </div>
          <hr />
          <div className="voucher__list">
            {displayedVoucher.length > 0 ? (
              displayedVoucher.map((vd) => {
                return (
                  <div className="voucher__item" key={vd.voucherId}>
                    <Checkbox
                      form={voucherForm}
                      name={`voucher@${vd.voucherId}`}
                      label={""}
                      callbackOnChange={onSelect}
                    />
                    <div className="voucher__name">{vd.name}</div>
                    <div className="voucher__quantity">{vd.quantity}</div>
                    <div className="voucher__value">
                      {(vd.value * 100).toFixed(0)} %
                    </div>
                    <div className="voucher__required-rank">
                      {RankList[vd.requiredRank] ? (
                        <>
                          <img
                            src={RankList[vd.requiredRank].image}
                            alt="rank"
                          />
                          {RankList[vd.requiredRank].label}
                        </>
                      ) : (
                        <div></div>
                      )}
                    </div>
                    <div className="voucher__action">
                      <button
                        type="button"
                        onClick={() => {
                          deleteTarget.current.push(vd.voucherId);
                          toggleClassNoListener(popupRef.current, "active");
                        }}
                      >
                        <i className="fi fi-ss-trash"></i>
                      </button>
                    </div>
                  </div>
                );
              })
            ) : voucherData === undefined ? (
              <SunriseLoader />
            ) : (
              <Empty label={"Không có voucher nào"} />
            )}
          </div>
          <div className="voucher__pagination">
            <Pagination
              data={voucherData}
              defaultStartPage={1}
              maxElementPerPage={voucherPagination.maxPage}
              paginationState={{
                state: voucherPagination,
                setState: setVoucherPagination,
              }}
              model={PAGINATION_MODEL.SIMPLE}
              callback={scrollToTop}
            />
          </div>
        </>
      ) : (
        <div className="empty">
          {voucherData === undefined ? (
            <SunriseLoader />
          ) : (
            <Empty label={"Không có Voucher nào"} />
          )}
        </div>
      )}
      <YesNoPopup
        label={"Xác nhận xoá Voucher?"}
        ref={popupRef}
        callback={handleDeleteVoucher}
      />
      <FilterBoard
        filterData={filterCriteriaList}
        sortData={sortCriteriaList}
        callback={handleFilterSort}
        ref={filterRef}
      />
      <AddVoucher ref={addVoucherRef} />
    </div>
  );
};

export default VoucherManagement;
