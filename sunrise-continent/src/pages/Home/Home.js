
import React, { useEffect, useState } from 'react';
import '../../assets/styles/scss/_home.scss';

// subcomponent
import Banners from './Banners';
import ModernInput from '../../components/common/ModernInput';
import Gallery from './Gallery';
import TrendingHotel from './TrendingHotels';

// svg graphics
import DestinationIcon from '../../assets/images/icons/destination.svg';
import AirplaneIcon from '../../assets/images/icons/plane.svg';
import FireIcon from '../../assets/images/icons/fire.svg';
import CityGraphic from '../../assets/images/graphics/city.svg';

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

    // Methods
    const renderPagePaginationNumberBtn = (targetPage, numberOfPages) => {
        let displayPages = [];

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
        console.log(displayPages)

        const htmlDisplayPages = displayPages.map(p => {
            return (
                <button className={p.active && 'active'}>
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
            'Standard Room',                // Phòng tiêu chuẩn
            'Deluxe Room',                  // Phòng sang trọng
            'Suite',                        // Phòng suite
            'Junior Suite',                 // Phòng suite cao cấp
            'Executive Suite',              // Phòng suite điều hành
            'Apartment',                    // Căn hộ
            'Villa',                        // Biệt thự
            'Bungalow',                     // Nhà gỗ
            'Penthouse',                    // Căn hộ cao cấp
            'Connecting Room',              // Phòng liền kề
            'Adjoining Room',               // Phòng kết nối
            'Family Room',                  // Phòng gia đình
            'Duplex Room',                  // Phòng duplex
            'Studio',                       // Phòng studio
            'Loft',                         // Phòng loft
            'Presidential Suite',           // Phòng suite tổng thống
        ])
        setHotCountries([
            {
              Name: "South Korea",
              Description: "Witness the breathtaking scenery of stunning autumn foliage in various shades of red, yellow and orange!",
              ImgUrl: "https://aldortio.sirv.com/sc/hot-countries-png/korea-hotel.png?w=1920"
            },
            {
              Name: "Japan",
              Description: "Explore the rich history, vibrant culture, and beautiful cherry blossoms of Japan!",
              ImgUrl: "https://aldortio.sirv.com/sc/hot-countries-png/japan-hotel.png?w=1920"
            },
            {
              Name: "China",
              Description: "Discover the ancient wonders, diverse landscapes, and bustling cities of China!",
              ImgUrl: "https://aldortio.sirv.com/sc/hot-countries-png/china-hotel.png?w=1920"
            },
            {
              Name: "Australia",
              Description: "Experience the stunning beaches, unique wildlife, and vibrant cities of Australia!",
              ImgUrl: "https://aldortio.sirv.com/sc/hot-countries-png/australia-hotel.png?w=1920"
            },
            {
              Name: "Singapore",
              Description: "Indulge in the vibrant street food, modern architecture, and cultural melting pot of Singapore!",
              ImgUrl: "https://aldortio.sirv.com/sc/hot-countries-png/sing-hotel.png?w=1920"
            },
            {
              Name: "Vietnam",
              Description: "Immerse yourself in the rich history, natural beauty, and delicious cuisine of Vietnam!",
              ImgUrl: "https://aldortio.sirv.com/sc/hot-countries-png/vietnam-hotel.png?w=1920"
            },
            {
              Name: "United Kingdom",
              Description: "Explore the iconic landmarks, charming countryside, and diverse culture of the United Kingdom!",
              ImgUrl: "https://aldortio.sirv.com/sc/hot-countries-png/united-kingdom.png?w=1920"
            },
            {
              Name: "Switzerland",
              Description: "Experience the breathtaking alpine landscapes, pristine lakes, and world-class skiing in Switzerland!",
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
                    <h3>DESTINATION</h3>
                </div>
                {/* Input field */}
                <form className='home-destination__form'>
                    {/* Use component to render an input */}
                    <div className="home-des-form__row">
                        <ModernInput 
                            options={countries}
                            defaultVal='Where do you wish to go?'
                            search={true}
                            valMultipleLevel={2}
                        />
                        <ModernInput 
                            options={roomType}
                            defaultVal='What do you expect from the hotel?'
                            search={false}
                            valMultipleLevel={null}
                        />
                    </div> 
                    <div className="home-des-form__row">
                        <ModernInput 
                            options={countries}
                            defaultVal='When do you wish to go?'
                            search={false}
                            valMultipleLevel={'date'}
                        />
                        <ModernInput 
                            options={countries}
                            defaultVal='How long do you wish to stay?'
                            search={false}
                            valMultipleLevel={null}
                        />
                        <ModernInput 
                            options={countries}
                            defaultVal='What is your budget?'
                            search={false}
                            valMultipleLevel={null}
                        />
                    </div>
                </form>
            </section>
            <img src={CityGraphic} className='home-destination__city-graphic' alt='city'/>

            <section className="container home__promised-land">
                {/* Title */}
                <div className="home-promised-land__title-container">
                    <div className="home-promised-land__title">
                        <img src={AirplaneIcon} className='home-promised-land__title-icon' alt='air-plane'/>
                        <h3>PROMISED LAND</h3>
                    </div>
                    <p>Come with us on an incredible adventure to discover the most stunning hotels worldwide!</p>
                </div>
                {/* Hot countries */}
                <Gallery list={hot_countries}/>
            </section>

            <section className="container home__trending">
                {/* Title */}
                <div className="home-trending__title-container">
                    <div className="home-trending__title">
                        <img src={FireIcon} className='home-trending__title-icon' alt='fire'/>
                        <h3>HOT & TRENDING</h3>
                    </div>
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

                            {renderPagePaginationNumberBtn(trendingHotelPage, trendingHotel.length)}

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
