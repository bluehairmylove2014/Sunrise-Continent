import React from "react";
import { Link } from "react-router-dom";
import Empty from "../../components/common/Empty";
import SunriseLoader from "../../components/common/Loader/SunriseLoader";
import Voucher from "../../components/common/Voucher";
import { PAGES } from "../../constants/Link.constants";
import { useGetVoucher } from "../../libs/business-logic/src/lib/voucher";
import { VOUCHER_DISPLAY_TYPE } from "../../constants/Variables.constants";

const SelectVoucer = ({ isOpen, chooseVoucherCallback, closeCallback }) => {
  const voucherData = useGetVoucher();
  return (
    <div className={`select-voucher__wrapper ${isOpen ? "active" : ""}`}>
      <div className="select-voucher__box">
        <div className="box__title">
          <h4>Danh sách voucher hiện có</h4>
          <button onClick={() => closeCallback()}>x</button>
        </div>
        <div className="box__voucher-list">
          {voucherData &&
          Array.isArray(voucherData) &&
          voucherData.length > 0 ? (
            voucherData.map((vd) => (
              <Voucher
                voucherData={vd}
                chooseVoucherCallback={chooseVoucherCallback}
                type={VOUCHER_DISPLAY_TYPE.STORAGE}
                key={vd.voucherId}
              />
            ))
          ) : voucherData === null ||
            (Array.isArray(voucherData) && voucherData.length === 0) ? (
            <div className="emptyWrapper">
              <Empty
                label={
                  "Không có voucher khả dụng. Hãy đến cửa hàng voucher để đổi nhé."
                }
              />
              <Link to={PAGES.VOUCHER_SHOP}>Tới cửa hàng?</Link>
            </div>
          ) : (
            <div className="loader">
              <SunriseLoader />
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default SelectVoucer;
