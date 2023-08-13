/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useState } from "react";
import BannerLayout from "../../components/layouts/BannerLayout";
import { RankList } from "../../constants/Rank";
import "../../styles/component/voucherShop.scss";
// import { voucherMockData } from "./MockData";
import Empty from "../../components/common/Empty";
import Voucher from "../../components/common/Voucher";
import {
  PAGINATION_MODEL,
  VOUCHER_DISPLAY_TYPE,
} from "../../constants/Variables.constants";
import { useGetVoucher } from "../../libs/business-logic/src/lib/voucher";
import SunriseLoader from "../../components/common/Loader/SunriseLoader";
import {
  calculateMaxPage,
  slicePaginationData,
} from "../../utils/helpers/Pagination";
import Pagination from "../../components/common/Pagination";
import { useVoucherContext } from "../../libs/business-logic/src/lib/voucher/process/context";

const voucherCategory = [
  {
    id: 1,
    name: RankList.Bronze.label,
    icon: RankList.Bronze.image,
    rank: Object.keys(RankList)[0],
  },
  {
    id: 2,
    name: RankList.Silver.label,
    icon: RankList.Silver.image,
    rank: Object.keys(RankList)[1],
  },
  {
    id: 3,
    name: RankList.Gold.label,
    icon: RankList.Gold.image,
    rank: Object.keys(RankList)[2],
  },
  {
    id: 4,
    name: RankList.Diamond.label,
    icon: RankList.Diamond.image,
    rank: Object.keys(RankList)[3],
  },
  {
    id: 5,
    name: RankList.Vip.label,
    icon: RankList.Vip.image,
    rank: Object.keys(RankList)[4],
  },
  {
    id: 6,
    name: "Túi voucher",
    icon: RankList.Bronze.image,
    rank: null,
  },
];

const maxElementPerPage = 6;
const VoucherShop = () => {
  const [selectedCategory, setSelectedCategory] = useState(1);
  const { state, dispatch } = useVoucherContext();
  const voucherApiData = useGetVoucher(
    voucherCategory[selectedCategory - 1].rank
  );
  let voucherData = state.voucher;
  const [pagination, setPagination] = useState({
    currentPage: 1,
    maxPage: 1,
  });

  useEffect(() => {
    setPagination({
      currentPage: 1,
      maxPage: 1,
    });
  }, [selectedCategory]);

  useEffect(() => {
    dispatch({
      type: "SET_VOUCHER",
      payload: voucherApiData,
    });
  }, [voucherApiData]);

  useEffect(() => {
    if (voucherData) {
      setPagination({
        ...pagination,
        maxPage: calculateMaxPage(voucherData, maxElementPerPage),
      });
    }
  }, [voucherData]);

  const handleChangeCategory = (targetID) => {
    voucherData = undefined;
    setSelectedCategory(targetID);
  };

  const scrollToTop = () => {
    const element = document.querySelector(`.layout__title`);
    if (element) {
      element.scrollIntoView({ behavior: "smooth" });
    }
  };

  return (
    <div className="voucher-shop">
      <BannerLayout
        banner={`https://rialloer.sirv.com/Sunrise-Continent/banners/banner.png?w=1920`}
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
                onClick={() => handleChangeCategory(vc.id)}
                key={vc.id}
              >
                <img src={vc.icon} alt={vc.name} />
                <p>{vc.name}</p>
              </div>
            ))}
          </div>
        </div>
        <div className="voucher__list">
          {voucherData &&
          Array.isArray(voucherData) &&
          voucherData.length > 0 ? (
            <>
              {slicePaginationData(
                voucherData,
                pagination.currentPage,
                pagination.maxPage,
                maxElementPerPage
              ).map((vd) => (
                <Voucher
                  voucherData={vd}
                  type={
                    selectedCategory !== 6
                      ? VOUCHER_DISPLAY_TYPE.SHOP
                      : VOUCHER_DISPLAY_TYPE.STORAGE
                  }
                  key={vd.voucherId}
                />
              ))}
              <div className="voucher-list__pagination">
                <Pagination
                  data={voucherData}
                  defaultStartPage={1}
                  maxElementPerPage={maxElementPerPage}
                  paginationState={{
                    state: pagination,
                    setState: setPagination,
                  }}
                  model={PAGINATION_MODEL.SIMPLE}
                  callback={scrollToTop}
                />
              </div>
            </>
          ) : (
            <div className="empty" key={"loader"}>
              {voucherData === undefined ? (
                <SunriseLoader />
              ) : (
                <Empty label={"Không có voucher khả dụng"} />
              )}
            </div>
          )}
        </div>
        <div className="voucher__pagination"></div>
      </div>
    </div>
  );
};

export default VoucherShop;
