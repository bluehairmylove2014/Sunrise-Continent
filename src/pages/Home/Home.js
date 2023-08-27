/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useRef, useState } from "react";
import "../../styles/component/home.scss";
import toast from "react-hot-toast";

// subcomponent
import Banners from "./Banners";
import ModernInput from "../../components/common/ModernInput";
import TrendingHotel from "./TrendingHotels";

// svg graphics
import DestinationIcon from "../../assets/images/icons/destination.svg";
import AirplaneIcon from "../../assets/images/icons/plane.svg";
import FireIcon from "../../assets/images/icons/fire.svg";
import CityGraphic from "../../assets/images/bgs/360_F_63940372_ghZQzzZEwektiDoOroft0eNNZlC66k5c.png";

// img
import VietnamField from "../../assets/images/bgs/Mountain.png";
import { useNavigate } from "react-router-dom";
import { stringifySearchParams } from "../../utils/helpers/params";
import { useGetHotHotelQuery } from "../../libs/business-logic/src/lib/hotel/fetching/query";
import SunriseLoader from "../../components/common/Loader/SunriseLoader";
import { bannerData, countriesData } from "./Data";
import { ComposableMap, Geographies, Geography } from "react-simple-maps";
import { PAGES } from "../../constants/Link.constants";
import {
  calculateMaxPage,
  slicePaginationData,
} from "../../utils/helpers/Pagination";
import Pagination from "../../components/common/Pagination";
import { PAGINATION_MODEL } from "../../constants/Variables.constants";
import { LOCATION_TYPES } from "../../constants/filter.constants";

const geoUrl =
  "https://raw.githubusercontent.com/deldersveld/topojson/master/world-countries.json";
const selectedAreas = [
  "geo-173",
  "geo-84",
  "geo-92",
  "geo-31",
  "geo-88",
  "geo-158",
  "geo-128",
];
const defaultSearchInputVal = {
  location: "Bạn muốn đi đâu?",
  roomType: "Bạn muốn kiểu khách sạn nào?",
  start_date: "Khi nào thì bạn khởi hành?",
  end_date: "Bạn muốn rời đi khi nào?",
  budget: "Ngân sách của bạn thế nào?",
};

const maximumHotHotelPerPage = 3;
const defaultReviewStartPage = 1;
function getLocationLabels() {
  return Object.values(LOCATION_TYPES).map((type) => type.LABEL);
}
function getLocationKeyFromLabel(locationLabel) {
  const foundKey = Object.keys(LOCATION_TYPES).find(
    (key) => LOCATION_TYPES[key].LABEL === locationLabel
  );

  return foundKey || null;
}

const Home = () => {
  // Define
  const [banners, setBanner] = useState([]);
  const [countries, setCountries] = useState([]);
  const [searchInputVal, setSearchInputVal] = useState(defaultSearchInputVal);
  const navigate = useNavigate();
  const { data: hotHotelData } = useGetHotHotelQuery();
  const mapRef = useRef(null);
  const roomType = getLocationLabels();
  const [hotHotelPagination, setHotHotelPagination] = useState({
    currentPage: defaultReviewStartPage,
    maxPage: calculateMaxPage(hotHotelData, maximumHotHotelPerPage),
  });

  useEffect(() => {
    setHotHotelPagination({
      ...hotHotelPagination,
      maxPage: calculateMaxPage(hotHotelData, maximumHotHotelPerPage),
    });
  }, [hotHotelData]);

  // Methods
  const updateSearchInputVal = (key, value) => {
    setSearchInputVal((prevState) => ({
      ...prevState,
      [key]: value,
    }));
  };
  const extractMinAndMax = (rangeString) => {
    // Check if the input is not a string or is null/undefined
    if (typeof rangeString !== "string") {
      console.error("Input is not a valid string.");
      return null;
    }

    ["₫", " ", "\u00A0", "."].forEach(
      (k) => (rangeString = rangeString.replaceAll(k, ""))
    );
    rangeString = rangeString.split("đến");
    if (rangeString && rangeString.length === 2) {
      const min = Number(rangeString[0].trim());
      const max = Number(rangeString[1].trim());
      return { min, max };
    } else {
      console.error("Invalid input format.");
      return null;
    }
  };
  const handleSearch = (
    e,
    { location, roomType, start_date, end_date, budget }
  ) => {
    e.preventDefault();
    let params = {};
    defaultSearchInputVal.location !== location &&
      (params = { ...params, location });
    defaultSearchInputVal.hotelType !== roomType &&
      (params = { ...params, hotelType: getLocationKeyFromLabel(roomType) });
    defaultSearchInputVal.start_date !== start_date &&
      (params = { ...params, start_date });
    defaultSearchInputVal.end_date !== end_date &&
      (params = { ...params, end_date });
    defaultSearchInputVal.budget !== budget &&
      (params = {
        ...params,
        budget: JSON.stringify(extractMinAndMax(searchInputVal.budget)),
      });
    if (!Object.keys(params).includes("location")) {
      toast.error("Ít nhất hãy chọn vị trí mong muốn nhé!");
    } else {
      navigate(`/search${stringifySearchParams(params)}`);
    }
  };
  const [tooltipContent, setTooltipContent] = useState(null);
  const [tooltipPosition, setTooltipPosition] = useState({ x: 0, y: 0 });

  const handleMouseEnterMap = () => {
    if (!mapRef.current || !mapRef.current.addEventListener) return;
    mapRef.current.addEventListener("mousemove", handleMouseMove);
  };
  const handleMouseLeaveMap = () => {
    if (!mapRef.current || !mapRef.current.removeEventListener) return;
    mapRef.current.removeEventListener("mousemove", handleMouseMove);
  };
  const scrollToTop = () => {
    const element = document.querySelector(`.home__trending`);
    if (element) {
      element.scrollIntoView({ behavior: "smooth" });
    }
  };
  const handleMouseMove = (event) => {
    const { clientX, clientY } = event;
    setTooltipPosition({ x: clientX + 10, y: clientY - 20 });
  };
  // use effect
  useEffect(() => {
    // Get banners here
    setBanner(bannerData);
    setCountries(countriesData);
  }, []);

  return (
    <main className="home">
      {/* Banner section */}
      <section className="home__banners">
        <Banners data_banner={banners} />
      </section>

      {/* Destination section */}
      <section className="container home__destination">
        {/* Title */}
        <div className="home-destination__title">
          <img
            src={DestinationIcon}
            className="home-destination__title-icon"
            alt="destination"
          />
          <h3>ĐỊA ĐIỂM MONG MUỐN</h3>
        </div>
        {/* Input field */}
        <form
          className="home-destination__form"
          onSubmit={(e) => handleSearch(e, searchInputVal)}
        >
          {/* Use component to render an input */}
          <div className="home-des-form__row">
            <ModernInput
              options={countries}
              defaultVal={searchInputVal.location}
              search={true}
              valMultipleLevel={true}
              inputType={"text"}
              callback={updateSearchInputVal}
              input_name={"location"}
            />
            <ModernInput
              options={roomType}
              defaultVal={searchInputVal.roomType}
              search={false}
              valMultipleLevel={false}
              inputType={"text"}
              callback={updateSearchInputVal}
              input_name={"roomType"}
            />
          </div>
          <div className="home-des-form__row">
            <ModernInput
              defaultVal={searchInputVal.start_date}
              search={false}
              valMultipleLevel={false}
              inputType={"date"}
              callback={updateSearchInputVal}
              input_name={"start_date"}
            />
            <ModernInput
              defaultVal={searchInputVal.end_date}
              search={false}
              valMultipleLevel={false}
              inputType={"date"}
              callback={updateSearchInputVal}
              input_name={"end_date"}
            />
            <ModernInput
              defaultVal={searchInputVal.budget}
              inputType={"price"}
              callback={updateSearchInputVal}
              input_name={"budget"}
            />
          </div>
          <div className="home-destination-form__submit-field">
            <button
              type="button"
              onClick={() => setSearchInputVal(defaultSearchInputVal)}
            >
              <i className="fi fi-rs-trash"></i>
              Xóa bộ lọc
            </button>
            <button type="submit">Xem kết quả</button>
          </div>
        </form>
      </section>
      <img
        src={CityGraphic}
        className="home-destination__city-graphic"
        alt="city"
      />

      <section className="home__promised-land">
        <div className="container">
          {/* Title */}
          <div className="home-promised-land__title-container">
            <div className="home-promised-land__title">
              <img
                src={AirplaneIcon}
                className="home-promised-land__title-icon"
                alt="air-plane"
              />
              <h3>MIỀN ĐẤT HỨA</h3>
            </div>
            <p>
              Cùng chúng tôi khám phá những khách sạn tuyệt vời nhất trên toàn
              thế giới!
            </p>
          </div>
          {/* Hot countries */}
          <div className="promised-land__map">
            <ComposableMap
              projection="geoEqualEarth"
              projectionConfig={{
                scale: 200,
                center: [0, 10],
              }}
              style={{
                position: "relative",
                width: "100%",
                height: "auto",
              }}
              ref={mapRef}
              onMouseEnter={handleMouseEnterMap}
              onMouseLeave={handleMouseLeaveMap}
            >
              <Geographies geography={geoUrl}>
                {({ geographies }) => {
                  return geographies.map((geo) => {
                    const rsmKey = geo.rsmKey;
                    const isHighlighted = selectedAreas.includes(rsmKey);
                    return (
                      <React.Fragment key={rsmKey}>
                        <Geography
                          key={rsmKey}
                          geography={geo}
                          fill={
                            tooltipContent === geo.properties.name
                              ? "#5b94ff"
                              : isHighlighted
                              ? rsmKey === "geo-173"
                                ? "#DC143C"
                                : "#3C2C7C"
                              : "#C0C0C0"
                          }
                          onMouseEnter={() =>
                            setTooltipContent(geo.properties.name)
                          }
                          onMouseLeave={() => setTooltipContent(null)}
                          onClick={() =>
                            navigate(
                              PAGES.COUNTRY + `?name=${geo.properties.name}`
                            )
                          }
                        />
                      </React.Fragment>
                    );
                  });
                }}
              </Geographies>
            </ComposableMap>
            {tooltipContent && (
              <div
                className="country__name"
                style={{
                  position: "fixed",
                  top: tooltipPosition.y,
                  left: tooltipPosition.x,
                }}
              >
                {tooltipContent}
              </div>
            )}
          </div>
        </div>
      </section>

      <section className="container home__trending">
        {/* Title */}
        <div className="home-trending__title-container">
          <div className="home-trending__title">
            <img
              src={FireIcon}
              className="home-trending__title-icon"
              alt="fire"
            />
            <h3>Xu hướng hiện nay</h3>
          </div>
          <p>
            Khám phá bộ sưu tập các khách sạn hot và đang thịnh hành nhất. Đắm
            mình trong sự xa hoa, thoải mái và phong cách khi bạn khám phá những
            chỗ ở hàng đầu này, được lựa chọn kỹ lưỡng đặc biệt cho bạn.
          </p>
        </div>
        {hotHotelData && Array.isArray(hotHotelData) ? (
          <>
            {/* Hotel list */}
            <div className="home-trending__trending-list">
              <TrendingHotel
                hotelShortDescribeList={slicePaginationData(
                  hotHotelData,
                  hotHotelPagination.currentPage,
                  hotHotelPagination.maxPage,
                  maximumHotHotelPerPage
                )}
              />
            </div>

            {/* Page Pagination */}
            <Pagination
              data={hotHotelData}
              defaultStartPage={defaultReviewStartPage}
              maxElementPerPage={maximumHotHotelPerPage}
              paginationState={{
                state: hotHotelPagination,
                setState: setHotHotelPagination,
              }}
              model={PAGINATION_MODEL.DETAIL}
              callback={scrollToTop}
            />
          </>
        ) : (
          <SunriseLoader />
        )}
      </section>

      <section className="home__why-choosing-us">
        {/* why-choosing-us header background */}
        <img src={VietnamField} alt="Vietnam field" />
      </section>
    </main>
  );
};

export default Home;
