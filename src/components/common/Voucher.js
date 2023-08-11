import React from "react";
import voucherIcon from "../../assets/images/icons/gift-voucher.png";
import { RankList } from "../../constants/Rank";
import "../../styles/common/voucher.scss";

function convertRankToEnglish(vietnameseRank) {
  const rankKeys = Object.keys(RankList);
  for (const key of rankKeys) {
    if (RankList[key].label === vietnameseRank) {
      return key;
    }
  }
  return null;
}
const Voucher = ({ voucherData, chooseVoucherCallback }) => {
  return (
    <div
      className={`voucher ${convertRankToEnglish(
        RankList[voucherData.requiredRank].label
      )}`}
      key={voucherData.voucherId}
      onClick={() => chooseVoucherCallback(voucherData)}
    >
      <div className="dot"></div>
      <div className="dot"></div>
      <img src={voucherIcon} alt="voucher" />
      <div className="voucher__content">
        <h6>{voucherData.name}</h6>
        <small>Số lượng: {voucherData.quantity}</small>
      </div>
      <div className="rank">
        <img src={RankList[voucherData.requiredRank].image} alt="rank" />
      </div>
    </div>
  );
};

export default Voucher;
