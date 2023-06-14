
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom'
import '../../styles/scss/_header.scss';

// Images
import logo_img from '../../assets/images/logos/sc-vertical.png';

// Component
import NavDropdown from '../common/NavDropdown';

const Header = () => {
    const [categories, setCategories] = useState([]);
    const [languageChooser, setLanguageChooser] = useState([]);

    useEffect(() => {
        setCategories([
            {
                category_name: 'Khách sạn',
                options: [
                    {
                        option_name: 'Khách sạn 5 sao',
                        option_url: '/'
                    },
                    {
                        option_name: 'Khách sạn 4 sao',
                        option_url: '/'
                    },
                    {
                        option_name: 'Khách sạn 3 sao',
                        option_url: '/'
                    },
                    {
                        option_name: 'Resort',
                        option_url: '/'
                    },
                    {
                        option_name: 'Biệt thự nghỉ dưỡng',
                        option_url: '/'
                    },
                    {
                        option_name: 'Homestay',
                        option_url: '/'
                    },
                    {
                        option_name: 'Nhà nghỉ',
                        option_url: '/'
                    },
                ]
            },
            {
                category_name: 'Địa điểm',
                options: [
                    {
                        option_name: 'Thành phố',
                        option_url: '/'
                    },
                    {
                        option_name: 'Khu du lịch',
                        option_url: '/'
                    },
                    {
                        option_name: 'Bãi biển',
                        option_url: '/'
                    },
                    {
                        option_name: 'Núi rừng',
                        option_url: '/'
                    },
                    {
                        option_name: 'Miền quê',
                        option_url: '/'
                    },
                    {
                        option_name: 'Trung tâm thành phố',
                        option_url: '/'
                    },
                ]
            },
            {
                category_name: 'Tiện nghi',
                options: [
                    {
                        option_name: 'Wifi miễn phí',
                        option_url: '/'
                    },
                    {
                        option_name: 'Bể bơi',
                        option_url: '/'
                    },
                    {
                        option_name: 'Nhà hàng',
                        option_url: '/'
                    },
                    {
                        option_name: 'Phòng tập gym',
                        option_url: '/'
                    },
                    {
                        option_name: 'Spa',
                        option_url: '/'
                    },
                    {
                        option_name: 'Dịch vụ đưa đón sân bay',
                        option_url: '/'
                    },
                ]
            },
            {
                category_name: 'Loại phòng',
                options: [
                    {
                        option_name: 'Phòng đơn',
                        option_url: '/'
                    },
                    {
                        option_name: 'Phòng đôi',
                        option_url: '/'
                    },
                    {
                        option_name: 'Phòng gia đình',
                        option_url: '/'
                    },
                    {
                        option_name: 'Suite',
                        option_url: '/'
                    },
                    {
                        option_name: 'Căn hộ',
                        option_url: '/'
                    },
                ]
            },
            {
                category_name: 'Giá',
                options: [
                    {
                        option_name: 'Dưới 1 triệu đồng',
                        option_url: '/'
                    },
                    {
                        option_name: '1 - 2 triệu đồng',
                        option_url: '/'
                    },
                    {
                        option_name: '2 - 3 triệu đồng',
                        option_url: '/'
                    },
                    {
                        option_name: 'Trên 3 triệu đồng',
                        option_url: '/'
                    },
                ]
            },
            {
                category_name: 'Đánh giá',
                options: [
                    {
                        option_name: '5 sao',
                        option_url: '/'
                    },
                    {
                        option_name: '4 sao',
                        option_url: '/'
                    },
                    {
                        option_name: '3 sao',
                        option_url: '/'
                    },
                    {
                        option_name: '2 sao',
                        option_url: '/'
                    },
                    {
                        option_name: '1 sao',
                        option_url: '/'
                    },
                ]
            }
        ]);
        setLanguageChooser([
            {
                option_name: 'Tiếng Việt',
                option_url: '/vi'
            },
            {
                option_name: 'Tiếng Anh',
                option_url: '/en'
            }
        ])
    }, [])

    // Methods
    const renderCategories = (catelist) => {
        return (
            <ul>{
                catelist ? catelist.map((c, i) => {
                    return (
                        <li key={`header-category@${i}`}>
                            <NavDropdown 
                                name={c.category_name} 
                                name_ir={'fi fi-rr-caret-down'}
                                options={c.options}
                            />
                        </li>
                    )
                }) : <></>
            }</ul>
        )
    }

    return (
        <header className='header'>
            <div className="header__logo-container">
                <img
                    src={logo_img}
                    alt="Sunrise Continent"
                    className="header__logo-img"
                />
            </div>
            <div className="header__search">
                <form>
                    <i className="fi fi-rr-search"></i>
                    <input type="text" placeholder='Bạn muốn đặt chân đến nơi nào?' />
                </form>
                <nav className="header__main-nav">
                    <ul className='header-main-nav__infor'>
                        <li><Link to="/about-us">Về chúng tôi</Link></li>
                        <li><Link to="/about-us">Liên hệ</Link></li>
                        <li>
                            <div className="header-main-nav__language">
                                {/* <button>
                                    <i className="fi fi-rs-language"></i>
                                    Tiếng Việt
                                    <i className="fi fi-ts-angle-small-down"></i>
                                </button>
                                <div className="language__dropdown">

                                </div> */}
                                
                                <NavDropdown 
                                    name='Tiếng Việt'
                                    name_il={'fi fi-rs-language'}
                                    name_ir={'fi fi-ts-angle-small-down'}
                                    options={languageChooser}
                                />
                            </div>
                        </li>
                    </ul>
                    <ul className='header-main-nav__user-interact'>
                        <li>
                            <Link to="/login" className='header-user-interact__login-btn'>
                                Đăng nhập
                            </Link>
                        </li>
                        <li>
                            <Link to="/register" className='header-user-interact__register-btn'>
                                Tham gia ngay!
                            </Link>
                        </li>
                    </ul>
                </nav>
            </div>
            <nav className="header__product-nav">
                {renderCategories(categories)}
                <button className='product-nav__wish-list'>
                    <span className='wishlist-btn__label'>
                        <i className="fi fi-rs-heart"></i>
                        Wish List
                    </span>
                    <span className='wishlist-btn__content'>0&nbsp;</span>
                    <span className='wishlist-btn__content'>i</span>
                    <span className='wishlist-btn__content'>t</span>
                    <span className='wishlist-btn__content'>e</span>
                    <span className='wishlist-btn__content'>m</span>
                </button>
            </nav>
        </header>
    );
}

export default Header;
