import React, { useState } from "react";
import voucherBg from "../../assets/images/bgs/banner.png";
import BannerLayout from "../../components/layouts/BannerLayout";
import { RankList } from "../../constants/Rank";
import "../../styles/component/voucherShop.scss";
import { voucherMockData } from "./MockData";
import Empty from "../../components/common/Empty";
import Voucher from "../../components/common/Voucher";

const voucherCategory = [
  {
    id: 1,
    name: RankList.Bronze.label,
    icon: RankList.Bronze.image,
  },
  {
    id: 2,
    name: RankList.Silver.label,
    icon: RankList.Silver.image,
  },
  {
    id: 3,
    name: RankList.Gold.label,
    icon: RankList.Gold.image,
  },
  {
    id: 4,
    name: RankList.Diamond.label,
    icon: RankList.Diamond.image,
  },
  {
    id: 5,
    name: RankList.Vip.label,
    icon: RankList.Vip.image,
  },
];

const VoucherShop = () => {
  const [selectedCategory, setSelectedCategory] = useState(1);
  const voucherData = voucherMockData;

  return (
    <div className="voucher-shop">
      <BannerLayout
        banner={voucherBg}
        title={"Cửa hàng khuyến mãi"}
        subtitle={
          "Voucher Shop - Khám phá ưu đãi độc quyền trên hệ thống đặt phòng của chúng tôi!"
        }
      />
      <div className="container">
        <div className="shop__category">
          <div className="line"></div>
          <div className="category__list">
            {voucherCategory.map((vc) => (
              <div
                className={`category__item ${
                  selectedCategory === vc.id ? "active" : ""
                }`}
                onClick={() => setSelectedCategory(vc.id)}
              >
                <img src={vc.icon} alt={vc.name} />
                <p>{vc.name}</p>
              </div>
            ))}
          </div>
        </div>
        <div className="voucher__list">
          {voucherData ? (
            voucherData.map((vd) => (
              <Voucher
                voucherData={vd}
                chooseVoucherCallback={(data) => console.log(data)}
              />
            ))
          ) : (
            <div className="empty">
              <Empty label={"Không có voucher khả dụng"} />
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default VoucherShop;
