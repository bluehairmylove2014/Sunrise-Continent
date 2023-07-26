import React, { useCallback, useEffect, useRef, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom'
import '../../styles/scss/header.scss';
import logoVerticalImg from '../../assets/images/logos/sc-vertical.png';
import logoHorizontalImg from '../../assets/images/logos/sc-horizontal.png';
import worker_gif from '../../assets/images/graphics/worker.gif';
import { PAGES } from '../../constants/Link.constants';
import NavDropdown from '../common/NavDropdown';
import UserSidebar from './UserSidebar';
import { useForm } from 'react-hook-form';
import {
    useIsLogged
} from '../../libs/business-logic/src/lib/auth'

const Header = () => {
    const [categories, setCategories] = useState([]);
    const [languageChooser, setLanguageChooser] = useState([]);
    const [userSidebarStatus, setUserSidebarStatus] = useState(false);
    const [logoSrc, setLogoSrc] = useState(logoVerticalImg);
    const isLogin = useIsLogged();

    
    const headerRef = useRef(null);

    const navigate = useNavigate();

    const {
        handleSubmit,
        register,
        reset,
        // formState: { errors }
    } = useForm();

    
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
    const handleBlurSearchbox = () => {
        headerRef.current.classList.remove("active");
        setLogoSrc(logoVerticalImg);
        document.removeEventListener('click', handleClickOutside);
    }
    const handleClickOutside = event => {
        if (headerRef.current && !headerRef.current.contains(event.target)) {
            handleBlurSearchbox()
        }
    }
    const handleFocusSearchbox = () => {
        if(headerRef.current) {
            if(!headerRef.current.classList.contains('active')) {
                headerRef.current.classList.add("active")
                setLogoSrc(logoHorizontalImg);
                document.addEventListener('click', handleClickOutside);
            }
        }
    }
    const onSearch = (data) => {
        reset();
        handleBlurSearchbox();
        // Handle split keys
        const keys = ['phong doi'];
        let query = '/search?key='

        keys.forEach(k => {
            query += k 
        })

        navigate(query)
    }

    return (
        <React.Fragment>
            <header className='header' ref={headerRef}>
                <div className='header__overlay'></div>
                <div className="header__logo-container">
                    <img
                        src={logoSrc}
                        alt="Sunrise Continent"
                        className="header__logo-img"
                        id="header-logo"
                    />
                </div>
                <div className="header__search">
                    <div className="search-box__wrapper">
                        <form onSubmit={handleSubmit(onSearch)}>
                            <button type="submit">
                                <i className="fi fi-rr-search"></i>
                            </button>
                            <input 
                                name="search"
                                defaultValue=""
                                type="text" 
                                placeholder='Bạn muốn đặt chân đến nơi nào?' 
                                onFocus={handleFocusSearchbox}
                                onKeyDown={e => {
                                    if(e.key === 'Enter') {
                                        handleSubmit(onSearch)
                                    }
                                }}
                                {...register("search", {
                                    required: true
                                })}
                            />
                        </form>
                    </div>
                    <nav className="header__main-nav">
                        <ul className='header-main-nav__infor'>
                            <li><Link to={PAGES.ABOUT}>Về chúng tôi</Link></li>
                            <li><Link to={PAGES.CONTACT}>Liên hệ</Link></li>
                            <li>
                                <div className="header-main-nav__language">
                                    <NavDropdown 
                                        name='Tiếng Việt'
                                        name_il={'fi fi-rs-language'}
                                        name_ir={'fi fi-ts-angle-small-down'}
                                        options={languageChooser}
                                    />
                                </div>
                            </li>
                        </ul>
                        <ul className={`header-main-nav__user-interact ${!isLogin && 'active'}`}>
                            <li>
                                <Link to={PAGES.LOGIN} className='header-user-interact__login-btn'>
                                    Đăng nhập
                                </Link>
                            </li>
                            <li>
                                <Link to={PAGES.REGISTER} className='header-user-interact__register-btn'>
                                    Tham gia ngay!
                                </Link>
                            </li>
                        </ul>
                        {/* user avatar when logged in */}
                        <ul className={`header-main-nav__user-interact ${isLogin && 'active'}`}>
                            <li className='header-main-nav__user-avatar'>
                                <span>Welcome!</span>
                                <button onClick={() => setUserSidebarStatus(!userSidebarStatus)}>
                                    <img src="https://rialloer.sirv.com/Sunrise-Continent/Users/IMG_0615-min%20(1).jpg?w=500&h=500" alt="user-avatar" />
                                </button>
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
                <div className="search-box__introduction">
                    <img src={worker_gif} alt="worker_gif" />
                    <div>
                        <h3>Hãy thoải mái yêu cầu những gì bạn muốn!</h3>
                        <p>Bạn có thể nhập bất kỳ yêu cầu gì với bất kì văn phong nào.
                            Chúng tôi sẽ tự phân tích và tìm ra kết quả hợp lý nhất cho bạn.
                        </p>
                        <small>Ví dụ: Hãy tìm cho tôi một căn Villa tại Đà Lạt với hai phòng đơn, một phòng đôi và có bồn tắm ngoài trời </small>
                    </div>
                </div>
            </header>
            <UserSidebar isActive={userSidebarStatus} callback={useCallback((status) => setUserSidebarStatus(status), [setUserSidebarStatus])}/>
        </React.Fragment>
    );
}

export default Header;
