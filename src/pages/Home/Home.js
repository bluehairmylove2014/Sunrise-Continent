import React, { useEffect, useState } from "react";
import "../../styles/component/home.scss";
import toast from "react-hot-toast";

// subcomponent
import Banners from "./Banners";
import ModernInput from "../../components/common/ModernInput";
import Gallery from "./Gallery";
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

const defaultSearchInputVal = {
  location: "Bạn muốn đi đâu?",
  roomType: "Bạn mong muốn gì từ khách sạn?",
  start_date: "Khi nào thì bạn khởi hành?",
  end_date: "Bạn muốn rời đi khi nào?",
  budget: "Ngân sách của bạn thế nào?",
};

const Home = () => {
  // Define
  const [banners, setBanner] = useState([]);
  const [countries, setCountries] = useState([]);
  const [hot_countries, setHotCountries] = useState([]);
  const [roomType, setRoomType] = useState([]);
  const [trendingHotelPage, setTrendingHotelPage] = useState(1);
  const [searchInputVal, setSearchInputVal] = useState(defaultSearchInputVal);
  const navigate = useNavigate();
  const { data: hotHotelData } = useGetHotHotelQuery();
  console.log(hotHotelData);

  const trendingHotelPerPage = 6;

  // Methods
  const updateSearchInputVal = (key, value) => {
    setSearchInputVal((prevState) => ({
      ...prevState,
      [key]: value,
    }));
  };
  const handleChangeTrendingHotelPage = (e) => {
    setTrendingHotelPage(Number(e.target.getAttribute("data-pagenumber")));
  };
  const renderPagePaginationNumberBtn = (targetPage, numberOfPages) => {
    const displayPages = [];

    if (targetPage === 1) {
      for (let i = 0; i < 3 && targetPage + i <= numberOfPages; i++) {
        displayPages.push({
          page: targetPage + i,
          active: i === 0 ? true : false,
        });
      }
    } else if (targetPage < numberOfPages) {
      displayPages.push(
        { page: targetPage - 1, active: false },
        { page: targetPage, active: true },
        { page: targetPage + 1, active: false }
      );
    } else if (targetPage === numberOfPages) {
      for (let i = 2; i >= 0 && targetPage - i >= 1; i--) {
        displayPages.push({
          page: targetPage - i,
          active: i === 0 ? true : false,
        });
      }
    }

    const htmlDisplayPages = displayPages.map((p, i) => {
      return (
        <button
          className={p.active ? "active" : ""}
          data-pagenumber={p.page}
          onClick={(e) => handleChangeTrendingHotelPage(e)}
          key={`trending-hotel-page-number@${i}`}
        >
          {p.page}
        </button>
      );
    });

    return <>{htmlDisplayPages}</>;
  };
  const extractMinAndMax = (rangeString) => {
    // Check if the input is not a string or is null/undefined
    if (typeof rangeString !== "string") {
      console.error("Input is not a valid string.");
      return null;
    }

    // Update the regex pattern to match numbers with or without a separator
    const regexPattern = /(\d+(\.\d+)?)/g;
    const matches = rangeString.match(regexPattern);

    if (matches && matches.length >= 2) {
      const minStr = matches[0];
      const maxStr = matches[2];

      const min = parseInt(minStr.replace(/\./g, "")) / 100;
      const max = parseInt(maxStr.replace(/\./g, "")) / 100;

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
    if (
      defaultSearchInputVal.location === location ||
      defaultSearchInputVal.roomType === roomType ||
      defaultSearchInputVal.start_date === start_date ||
      defaultSearchInputVal.end_date === end_date ||
      defaultSearchInputVal.budget === budget
    ) {
      toast.error("Please fill all criteria!");
    } else {
      navigate(
        `/search${stringifySearchParams({
          ...searchInputVal,
          budget: JSON.stringify(extractMinAndMax(searchInputVal.budget)),
        })}`
      );
    }
  };
  // use effect
  useEffect(() => {
    // Get banners here
    setBanner([
      {
        id: "home-banner@1",
        src: "https://aldortio.sirv.com/sc/banners/book%20now.png",
      },
      {
        id: "home-banner@2",
        src: "https://aldortio.sirv.com/sc/banners/book%20now%20(1).png",
      },
      {
        id: "home-banner@3",
        src: "https://aldortio.sirv.com/sc/banners/book%20now%20(2).png",
      },
    ]);
    setCountries([
      {
        Country: "Korea",
        Province: [
          "Seoul",
          "Busan",
          "Incheon",
          "Daegu",
          "Daejeon",
          "Gwangju",
          "Ulsan",
          "Sejong",
          "Gyeonggi",
          "Gangwon",
          "Chungbuk",
          "Chungnam",
          "Jeonbuk",
          "Jeonnam",
          "Gyeongbuk",
          "Gyeongnam",
          "Jeju",
        ],
      },
      {
        Country: "Japan",
        Province: [
          "Tokyo",
          "Osaka",
          "Kyoto",
          "Hokkaido",
          "Aichi",
          "Fukuoka",
          "Kanagawa",
          "Hyogo",
          "Hiroshima",
          "Shizuoka",
          "Chiba",
          "Saitama",
          "Ibaraki",
          "Kumamoto",
          "Miyagi",
          "Niigata",
          "Okayama",
          "Okinawa",
          "Gifu",
          "Mie",
        ],
      },
      {
        Country: "Singapore",
        Province: [
          "Central Region",
          "East Region",
          "North Region",
          "Northeast Region",
          "West Region",
        ],
      },
      {
        Country: "Australia",
        Province: [
          "New South Wales",
          "Victoria",
          "Queensland",
          "Western Australia",
          "South Australia",
          "Tasmania",
          "Australian Capital Territory",
          "Northern Territory",
        ],
      },
      {
        Country: "Viet Nam",
        Province: [
          "Ho Chi Minh City",
          "Hanoi",
          "Da Nang",
          "Hai Phong",
          "Can Tho",
          "Hai Duong",
          "Hue",
          "Nha Trang",
          "Vung Tau",
          "Quang Ninh",
          "Lam Dong",
          "Binh Thuan",
        ],
      },
      {
        Country: "China",
        Province: [
          "Beijing",
          "Shanghai",
          "Guangzhou",
          "Shenzhen",
          "Chengdu",
          "Chongqing",
          "Hangzhou",
          "Xi'an",
          "Nanjing",
          "Tianjin",
          "Suzhou",
          "Wuhan",
        ],
      },
    ]);
    setRoomType([
      "Phòng tiêu chuẩn", // Standard Room
      "Phòng sang trọng", // Deluxe Room
      "Phòng suite", // Suite
      "Phòng suite cao cấp", // Junior Suite
      "Phòng suite điều hành", // Executive Suite
      "Căn hộ", // Apartment
      "Biệt thự", // Villa
      "Nhà gỗ", // Bungalow
      "Căn hộ cao cấp", // Penthouse
      "Phòng liền kề", // Connecting Room
      "Phòng kết nối", // Adjoining Room
      "Phòng gia đình", // Family Room
      "Phòng duplex", // Duplex Room
      "Phòng studio", // Studio
      "Phòng loft", // Loft
      "Phòng suite tổng thống", // Presidential Suite
    ]);
    setHotCountries([
      {
        Name: "Hàn Quốc",
        Description:
          "Chiêm ngưỡng cảnh đẹp ngoạn mục của những tán lá mùa thu rực rỡ trong các sắc đỏ, vàng và cam!",
        ImgUrl:
          "https://aldortio.sirv.com/sc/hot-countries-png/korea-hotel.png?w=1920",
      },
      {
        Name: "Nhật Bản",
        Description:
          "Khám phá lịch sử phong phú, văn hóa sống động và hoa anh đào tuyệt đẹp của Nhật Bản!",
        ImgUrl:
          "https://aldortio.sirv.com/sc/hot-countries-png/japan-hotel.png?w=1920",
      },
      {
        Name: "Trung Quốc",
        Description:
          "Khám phá những kỳ quan cổ xưa, địa hình đa dạng và thành phố nhộn nhịp của Trung Quốc!",
        ImgUrl:
          "https://aldortio.sirv.com/sc/hot-countries-png/china-hotel.png?w=1920",
      },
      {
        Name: "Úc",
        Description:
          "Trải nghiệm những bãi biển tuyệt đẹp, động vật hoang dã độc đáo và thành phố sôi động của Úc!",
        ImgUrl:
          "https://aldortio.sirv.com/sc/hot-countries-png/australia-hotel.png?w=1920",
      },
      {
        Name: "Singapore",
        Description:
          "Thưởng thức ẩm thực đường phố sôi động, kiến trúc hiện đại và nền văn hóa hòa quyện của Singapore!",
        ImgUrl:
          "https://aldortio.sirv.com/sc/hot-countries-png/sing-hotel.png?w=1920",
      },
      {
        Name: "Việt Nam",
        Description:
          "Đắm mình vào lịch sử phong phú, vẻ đẹp thiên nhiên và ẩm thực ngon miệng của Việt Nam!",
        ImgUrl:
          "https://aldortio.sirv.com/sc/hot-countries-png/vietnam-hotel.png?w=1920",
      },
      {
        Name: "Vương quốc Anh",
        Description:
          "Khám phá những địa danh biểu tượng, nông thôn quyến rũ và văn hóa đa dạng của Vương quốc Anh!",
        ImgUrl:
          "https://aldortio.sirv.com/sc/hot-countries-png/united-kingdom.png?w=1920",
      },
      {
        Name: "Thụy Sĩ",
        Description:
          "Trải nghiệm cảnh quan núi non hùng vĩ, hồ nước trong xanh và trượt tuyết hàng đầu thế giới tại Thụy Sĩ!",
        ImgUrl:
          "https://aldortio.sirv.com/sc/hot-countries-png/switzerland.png?w=1920",
      },
    ]);
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
          <Gallery list={hot_countries} />
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
            Discover our collection of the hottest and most trending hotels.
            Immerse yourself in luxury, comfort, and style as you explore these
            top-rated accommodations handpicked just for you.
          </p>
        </div>
        {hotHotelData && Array.isArray(hotHotelData) ? (
          <>
            {/* Hotel list */}
            <div className="home-trending__trending-list">
              <TrendingHotel hotelShortDescribeList={hotHotelData} />
            </div>

            {/* Page Pagination */}
            <div className="home-trending__page-pagination-wrapper">
              <p className="home-trending__page-limit">
                Showing 7-12 of 121 trips
              </p>
              {hotHotelData.length > 1 && (
                <div className="home-trending__page-pagination">
                  <button>
                    <i className="fi fi-rs-angle-double-small-left"></i>
                  </button>
                  <button>
                    <i className="fi fi-rs-angle-small-left"></i>
                  </button>

                  {renderPagePaginationNumberBtn(
                    trendingHotelPage,
                    Math.ceil(hotHotelData.length / trendingHotelPerPage)
                  )}

                  <button>
                    <i className="fi fi-rs-angle-small-right"></i>
                  </button>
                  <button>
                    <i className="fi fi-rs-angle-double-small-right"></i>
                  </button>
                </div>
              )}
            </div>
          </>
        ) : (
          <>Loading</>
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
