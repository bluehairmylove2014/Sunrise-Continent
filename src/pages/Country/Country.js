/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useRef, useState } from "react";
import carEmptyIcon from "../../assets/images/graphics/car-empty.png";
import emptyBoxIcon from "../../assets/images/graphics/empty-box.png";
import "../../styles/component/country.scss";
import { countryDetail } from "./MockData";
import { useSearch } from "../../libs/business-logic/src/lib/hotel";
import SunriseLoader from "../../components/common/Loader/SunriseLoader";
import { HOTEL_TYPE } from "../../constants/Variables.constants";
import HotelCard from "../../components/common/HotelCard";
import BannerLayout from "../../components/layouts/BannerLayout";
import { useLocation } from "react-router-dom";

const Country = () => {
  const localtion = useLocation();
  const countryData = localtion.search.includes("Vietnam")
    ? countryDetail
    : null;
  const [provinceSelected, setProvinceSelected] = useState(null);
  const [provinceHotel, setProvinceHotel] = useState(null);
  const { onSearch } = useSearch();
  const hotelListRef = useRef(null);

  useEffect(() => {
    provinceSelected &&
      onSearch({ location: provinceSelected })
        .then((data) => {
          setProvinceHotel(data.hotelList);
        })
        .catch((error) => {
          console.error(error);
        });
  }, [provinceSelected]);

  const handleChooseProvince = (provinceName) => {
    setProvinceSelected(provinceName);
    hotelListRef.current &&
      hotelListRef.current.scrollIntoView({ behavior: "smooth" });
  };

  return (
    <>
      {countryData ? (
        <div className="countryDetail">
          <BannerLayout
            banner={countryData.picture + "?w=1920"}
            title={countryData.name}
            subtitle={countryData.decription}
          />
          <div className="countryDetail__content container">
            <div className="content__header">
              <h4>Có thể bạn sẽ thích</h4>
              <hr />
            </div>
            <div className="content__body">
              {countryData.provinces.map((prv) => {
                return (
                  <button
                    className="province"
                    key={prv.id}
                    onClick={() => handleChooseProvince(prv.name)}
                  >
                    <img src={prv.picture} alt={prv.id} />
                    <div className="province__overlay"></div>
                    <h4>{prv.name}</h4>
                  </button>
                );
              })}
            </div>
          </div>
          <div className="countryDetail__content container">
            <div className="content__header" ref={hotelListRef}>
              <h4>Khách sạn nổi bật</h4>
              <hr />
            </div>
            <div className="content__body">
              {provinceSelected ? (
                provinceHotel ? (
                  provinceHotel.length > 0 ? (
                    provinceHotel.map((ph) => {
                      return (
                        <HotelCard
                          hotelData={ph}
                          key={ph.id}
                          type={HOTEL_TYPE.VERTICAL}
                        />
                      );
                    })
                  ) : (
                    <div className="empty">
                      <img src={emptyBoxIcon} alt="empty" />
                      <p>Không có khách sạn nào ở đây cả</p>
                    </div>
                  )
                ) : (
                  <div className="empty">
                    <SunriseLoader />
                  </div>
                )
              ) : (
                <div className="empty">
                  <img src={emptyBoxIcon} alt="empty" />
                  <p>Hãy chọn một tỉnh thành bên trên để lấy kết quả nhé</p>
                </div>
              )}
            </div>
          </div>
        </div>
      ) : (
        <div className="country__empty">
          <div className="empty__icon">
            <img src={carEmptyIcon} alt="empty" />
            <div className="title">
              <h1>Xin lỗi!</h1>
              <h4>
                Chúng tôi chưa <br />
                hỗ trợ quốc gia này
              </h4>
            </div>
          </div>
        </div>
      )}
    </>
  );
};

export default Country;
