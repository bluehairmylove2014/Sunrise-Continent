
import React, { useEffect, useState } from 'react';
import '../../styles/scss/home.scss';

// subcomponent
import Banners from './Banners';
import ModernInput from '../../components/common/ModernInput';
import Gallery from './Gallery';
import TrendingHotel from './TrendingHotels';

// svg graphics
import DestinationIcon from '../../assets/images/icons/destination.svg';
import AirplaneIcon from '../../assets/images/icons/plane.svg';
import FireIcon from '../../assets/images/icons/fire.svg';
import CityGraphic from '../../assets/images/bgs/360_F_63940372_ghZQzzZEwektiDoOroft0eNNZlC66k5c.png';

// img
import VietnamField from '../../assets/images/bgs/Mountain.png';

const Home = () => {
    // Define
    const [banners, setBanner] = useState([]);
    const [countries, setCountries] = useState([]);
    const [hot_countries, setHotCountries] = useState([]);
    const [roomType, setRoomType] = useState([]);
    const [trendingHotelPage, setTrendingHotelPage] = useState(1);
    const [trendingHotel, setTrendingHotel] = useState([]);

    const trendingHotelPerPage = 6;

    // Methods
    const handleChangeTrendingHotelPage = (e) => {
        setTrendingHotelPage(Number(e.target.getAttribute('data-pagenumber')));
    }
    const renderPagePaginationNumberBtn = (targetPage, numberOfPages) => {
        const displayPages = [];

        if(targetPage === 1) {
            for(let i = 0; i < 3 && targetPage + i <= numberOfPages; i++) {
                displayPages.push({page: targetPage + i, active: i === 0 ? true : false});
            }
        }
        else if(targetPage < numberOfPages) {
            displayPages.push(
                {page: targetPage - 1, active: false},
                {page: targetPage, active: true},
                {page: targetPage + 1, active: false}
            );
        }
        else if(targetPage === numberOfPages) {
            for(let i = 2; i >= 0 && targetPage - i >= 1; i--) {
                displayPages.push({page: targetPage - i, active: i === 0 ? true : false});
            }
        }

        const htmlDisplayPages = displayPages.map((p, i) => {
            return (
                <button 
                    className={p.active ? 'active' : ''} 
                    data-pagenumber={p.page}
                    onClick={e => handleChangeTrendingHotelPage(e)}
                    key={`trending-hotel-page-number@${i}`}
                >
                    {p.page}
                </button>
            )
        })

        return (
            <>{htmlDisplayPages}</>
        )
    }

    // use effect
    useEffect(() => {
        // Get banners here
        setBanner([
            {
                id: 'home-banner@1',
                src: 'https://aldortio.sirv.com/sc/banners/book%20now.png'
            },
            {
                id: 'home-banner@2',
                src: 'https://aldortio.sirv.com/sc/banners/book%20now%20(1).png'
            },
            {
                id: 'home-banner@3',
                src: 'https://aldortio.sirv.com/sc/banners/book%20now%20(2).png'
            },
        ])
        setCountries([
            { Country: 'Korea', Province: ['Seoul', 'Busan', 'Incheon', 'Daegu', 'Daejeon', 'Gwangju', 'Ulsan', 'Sejong', 'Gyeonggi', 'Gangwon', 'Chungbuk', 'Chungnam', 'Jeonbuk', 'Jeonnam', 'Gyeongbuk', 'Gyeongnam', 'Jeju'] },
            { Country: 'Japan', Province: ['Tokyo', 'Osaka', 'Kyoto', 'Hokkaido', 'Aichi', 'Fukuoka', 'Kanagawa', 'Hyogo', 'Hiroshima', 'Shizuoka', 'Chiba', 'Saitama', 'Ibaraki', 'Kumamoto', 'Miyagi', 'Niigata', 'Okayama', 'Okinawa', 'Gifu', 'Mie'] },
            { Country: 'Singapore', Province: ['Central Region', 'East Region', 'North Region', 'Northeast Region', 'West Region'] },
            { Country: 'Australia', Province: ['New South Wales', 'Victoria', 'Queensland', 'Western Australia', 'South Australia', 'Tasmania', 'Australian Capital Territory', 'Northern Territory'] },
            { Country: 'Viet Nam', Province: ['Ho Chi Minh City', 'Hanoi', 'Da Nang', 'Hai Phong', 'Can Tho', 'Hai Duong', 'Hue', 'Nha Trang', 'Vung Tau', 'Quang Ninh', 'Lam Dong', 'Binh Thuan'] },
            { Country: 'China', Province: ['Beijing', 'Shanghai', 'Guangzhou', 'Shenzhen', 'Chengdu', 'Chongqing', 'Hangzhou', "Xi'an", 'Nanjing', 'Tianjin', 'Suzhou', 'Wuhan'] },
        ])
        setRoomType([
            'Phòng tiêu chuẩn',             // Standard Room
            'Phòng sang trọng',             // Deluxe Room
            'Phòng suite',                  // Suite
            'Phòng suite cao cấp',          // Junior Suite
            'Phòng suite điều hành',        // Executive Suite
            'Căn hộ',                       // Apartment
            'Biệt thự',                     // Villa
            'Nhà gỗ',                       // Bungalow
            'Căn hộ cao cấp',               // Penthouse
            'Phòng liền kề',                // Connecting Room
            'Phòng kết nối',                // Adjoining Room
            'Phòng gia đình',               // Family Room
            'Phòng duplex',                 // Duplex Room
            'Phòng studio',                 // Studio
            'Phòng loft',                   // Loft
            'Phòng suite tổng thống',       // Presidential Suite
        ])
        setHotCountries([
            {
              Name: "Hàn Quốc",
              Description: "Chiêm ngưỡng cảnh đẹp ngoạn mục của những tán lá mùa thu rực rỡ trong các sắc đỏ, vàng và cam!",
              ImgUrl: "https://aldortio.sirv.com/sc/hot-countries-png/korea-hotel.png?w=1920"
            },
            {
              Name: "Nhật Bản",
              Description: "Khám phá lịch sử phong phú, văn hóa sống động và hoa anh đào tuyệt đẹp của Nhật Bản!",
              ImgUrl: "https://aldortio.sirv.com/sc/hot-countries-png/japan-hotel.png?w=1920"
            },
            {
              Name: "Trung Quốc",
              Description: "Khám phá những kỳ quan cổ xưa, địa hình đa dạng và thành phố nhộn nhịp của Trung Quốc!",
              ImgUrl: "https://aldortio.sirv.com/sc/hot-countries-png/china-hotel.png?w=1920"
            },
            {
              Name: "Úc",
              Description: "Trải nghiệm những bãi biển tuyệt đẹp, động vật hoang dã độc đáo và thành phố sôi động của Úc!",
              ImgUrl: "https://aldortio.sirv.com/sc/hot-countries-png/australia-hotel.png?w=1920"
            },
            {
              Name: "Singapore",
              Description: "Thưởng thức ẩm thực đường phố sôi động, kiến trúc hiện đại và nền văn hóa hòa quyện của Singapore!",
              ImgUrl: "https://aldortio.sirv.com/sc/hot-countries-png/sing-hotel.png?w=1920"
            },
            {
              Name: "Việt Nam",
              Description: "Đắm mình vào lịch sử phong phú, vẻ đẹp thiên nhiên và ẩm thực ngon miệng của Việt Nam!",
              ImgUrl: "https://aldortio.sirv.com/sc/hot-countries-png/vietnam-hotel.png?w=1920"
            },
            {
              Name: "Vương quốc Anh",
              Description: "Khám phá những địa danh biểu tượng, nông thôn quyến rũ và văn hóa đa dạng của Vương quốc Anh!",
              ImgUrl: "https://aldortio.sirv.com/sc/hot-countries-png/united-kingdom.png?w=1920"
            },
            {
              Name: "Thụy Sĩ",
              Description: "Trải nghiệm cảnh quan núi non hùng vĩ, hồ nước trong xanh và trượt tuyết hàng đầu thế giới tại Thụy Sĩ!",
              ImgUrl: "https://aldortio.sirv.com/sc/hot-countries-png/switzerland.png?w=1920"
            }
        ]);
        setTrendingHotel([
            {
                id: 'hotel@0',
                name: 'Hilton Garden Inn Singapore Serangoon',
                imgUrl: 'https://aldortio.sirv.com/sc/hotel/8%20The%20White%20House/176672886.jpg',
                stars: 3,
                rating: {
                    score: 9.7,
                    reviews: 927
                },
                location: "No. 21, Geylang Lorong 12, 399001 Singapore, Singapore",
                price: 410,
                discountAmount: 0.2
            },
            {
                id: 'hotel@1',
                name: 'Hilton Garden Inn Singapore Serangoon',
                imgUrl: 'https://aldortio.sirv.com/sc/hotel/8%20The%20White%20House/176685229.jpg',
                stars: 3,
                rating: {
                    score: 9.7,
                    reviews: 927
                },
                location: "No. 21, Geylang Lorong 12, 399001 Singapore, Singapore",
                price: 410,
                discountAmount: 0.4
            },
            {
                id: 'hotel@2',
                name: 'Hilton Garden Inn Singapore Serangoon',
                imgUrl: 'https://aldortio.sirv.com/sc/hotel/8%20The%20White%20House/352697894.jpg',
                stars: 3,
                rating: {
                    score: 9.7,
                    reviews: 927
                },
                location: "No. 21, Geylang Lorong 12, 399001 Singapore, Singapore",
                price: 410,
                discountAmount: 0.1
            },
            {
                id: 'hotel@3',
                name: 'Hilton Garden Inn Singapore Serangoon',
                imgUrl: 'https://aldortio.sirv.com/sc/hotel/8%20The%20White%20House/372185742.jpg',
                stars: 3,
                rating: {
                    score: 9.7,
                    reviews: 927
                },
                location: "No. 21, Geylang Lorong 12, 399001 Singapore, Singapore",
                price: 410,
                discountAmount: 0.3
            },
            {
                id: 'hotel@4',
                name: 'Hilton Garden Inn Singapore Serangoon',
                imgUrl: 'https://aldortio.sirv.com/sc/hotel/8%20The%20White%20House/352700285.jpg',
                stars: 3,
                rating: {
                    score: 9.7,
                    reviews: 927
                },
                location: "No. 21, Geylang Lorong 12, 399001 Singapore, Singapore",
                price: 410,
                discountAmount: 0.6
            },
            {
                id: 'hotel@5',
                name: 'Hilton Garden Inn Singapore Serangoon',
                imgUrl: 'https://aldortio.sirv.com/sc/hotel/8%20The%20White%20House/409500073.jpg',
                stars: 3,
                rating: {
                    score: 9.7,
                    reviews: 927
                },
                location: "No. 21, Geylang Lorong 12, 399001 Singapore, Singapore",
                price: 410,
                discountAmount: 0.7
            },
        ])
    }, [])

    return (
        <main className='home'>
            {/* Banner section */}
            <section className="home__banners">
                <Banners data_banner={banners}/>
            </section>

            {/* Destination section */}
            <section className="container home__destination">
                {/* Title */}
                <div className="home-destination__title">
                    <img src={DestinationIcon} className='home-destination__title-icon' alt='destination'/>
                    <h3>ĐỊA ĐIỂM MONG MUỐN</h3>
                </div>
                {/* Input field */}
                <form className='home-destination__form'>
                    {/* Use component to render an input */}
                    <div className="home-des-form__row">
                        <ModernInput 
                            options={countries}
                            defaultVal='Bạn muốn đi đâu?'
                            search={true}
                            valMultipleLevel={true}
                            inputType={'text'}
                        />
                        <ModernInput 
                            options={roomType}
                            defaultVal='Bạn mong muốn gì từ khách sạn?'
                            search={false}
                            valMultipleLevel={false}
                            inputType={'text'}
                        />
                    </div> 
                    <div className="home-des-form__row">
                        <ModernInput 
                            options={countries}
                            defaultVal='Khi nào thì bạn khởi hành?'
                            search={false}
                            valMultipleLevel={false}
                            inputType={'date'}
                        />
                        <ModernInput 
                            options={[
                                '1 ngày',
                                '2 ngày',
                                '3 ngày',
                                '4 ngày trở lên',
                            ]}
                            defaultVal='Bạn dự định sẽ ở lại bao lâu?'
                            search={false}
                            valMultipleLevel={false}
                            inputType={'text'}
                        />
                        <ModernInput 
                            defaultVal='Ngân sách của bạn thế nào?'
                            inputType={'price'}
                        />
                    </div>
                    <div className="home-destination-form__submit-field">
                        <button type='button'>
                            <i className="fi fi-rs-trash"></i>
                            Xóa bộ lọc
                        </button>
                        <button type='submit'>
                            Xem kết quả
                        </button>
                    </div>
                </form>
            </section>
            <img src={CityGraphic} className='home-destination__city-graphic' alt='city'/>

            <section className="container home__promised-land">
                {/* Title */}
                <div className="home-promised-land__title-container">
                    <div className="home-promised-land__title">
                        <img src={AirplaneIcon} className='home-promised-land__title-icon' alt='air-plane'/>
                        <h3>MIỀN ĐẤT HỨA</h3>
                    </div>
                    <p>Cùng chúng tôi khám phá những khách sạn tuyệt vời nhất trên toàn thế giới!</p>
                </div>
                {/* Hot countries */}
                <Gallery list={hot_countries}/>
            </section>

            <section className="container home__trending">
                {/* Title */}
                <div className="home-trending__title-container">
                    <div className="home-trending__title">
                        <img src={FireIcon} className='home-trending__title-icon' alt='fire'/>
                        <h3>Xu hướng hiện nay</h3>
                    </div>
                    <p>Discover our collection of the hottest and most trending hotels. Immerse yourself in luxury, comfort, and style as you explore these top-rated accommodations handpicked just for you.</p>
                </div>
                {/* Hotel list */}
                <div className="home-trending__trending-list">
                    <TrendingHotel hotelShortDescribeList={trendingHotel}/>
                </div>
                {/* Page Pagination */}
                <div className="home-trending__page-pagination-wrapper">
                    <p className="home-trending__page-limit">Showing 7-12 of 121 trips</p>
                    {
                        trendingHotel.length > 1 && 
                        <div className="home-trending__page-pagination">
                            <button>
                                <i className="fi fi-rs-angle-double-small-left"></i>
                            </button>
                            <button>
                                <i className="fi fi-rs-angle-small-left"></i>
                            </button>

                            {renderPagePaginationNumberBtn(trendingHotelPage, Math.ceil(trendingHotel.length / trendingHotelPerPage))}

                            <button>
                                <i className="fi fi-rs-angle-small-right"></i>
                            </button>
                            <button>
                                <i className="fi fi-rs-angle-double-small-right"></i>
                            </button>
                        </div>
                    }
                </div>
            </section>
            
            <section className='home__why-choosing-us'>
                {/* why-choosing-us header background */}
                <img src={VietnamField} alt="Vietnam field" />
            </section>
        </main>
    );
}

export default Home;
