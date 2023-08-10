import React from "react";
import { Link } from "react-router-dom";
import { useGetVoucher } from "../../libs/business-logic/src/lib/voucher";
import SunriseLoader from "../../components/common/Loader/SunriseLoader";
import voucherIcon from "../../assets/images/icons/gift-voucher.png";
import { RankList } from "../../constants/Rank";
import Empty from "../../components/common/Empty";
import { PAGES } from "../../constants/Link.constants";

function convertRankToEnglish(vietnameseRank) {
  const rankKeys = Object.keys(RankList);
  for (const key of rankKeys) {
    if (RankList[key].label === vietnameseRank) {
      return key;
    }
  }
  return null;
}
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
          {voucherData && Array.isArray(voucherData) ? (
            voucherData.map((vd) => (
              <div
                className={`voucher ${convertRankToEnglish(
                  RankList[vd.requiredRank].label
                )}`}
                key={vd.voucherId}
                onClick={() => chooseVoucherCallback(vd)}
              >
                <div className="dot"></div>
                <div className="dot"></div>
                <img src={voucherIcon} alt="voucher" />
                <div className="voucher__content">
                  <h6>{vd.name}</h6>
                  <small>Số lượng: {vd.quantity}</small>
                </div>
                <div className="rank">
                  <img src={RankList[vd.requiredRank].image} alt="rank" />
                </div>
              </div>
            ))
          ) : voucherData === null ? (
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
