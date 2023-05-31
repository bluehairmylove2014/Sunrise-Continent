
import '../../assets/styles/scss/_header.scss';

import React from 'react';

// Images
import logo_img from '../../assets/images/logos/sc-vertical.png';

const Header = () => {
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
                    <input type="text" placeholder='In which location are you looking for a hotel room?' />
                </form>
                <nav className="header__main-nav">
                    <ul className='header-main-nav__infor'>
                        <li><a href="/about-us">About Us</a></li>
                        <li><a href="/about-us">Contact</a></li>
                        <li>
                            <div className="header-main-nav__language">
                                <button>
                                    <i className="fi fi-rs-language"></i>
                                    Tiếng Việt
                                    <i className="fi fi-ts-angle-small-down"></i>
                                </button>
                                <div className="language__dropdown">

                                </div>
                            </div>
                        </li>
                    </ul>
                    <ul className='header-main-nav__social-link'>
                        <li>
                            <a rel="noreferrer" target="_blank" href="https://www.facebook.com/MinMinPD2211/">
                                <i class="fi fi-brands-facebook"></i>
                            </a>
                        </li>
                        <li>
                            <a rel="noreferrer" target="_blank" href="https://www.instagram.com/phucdat_dm/">
                                <i class="fi fi-brands-instagram"></i>
                            </a>
                        </li>
                        <li>
                            <a rel="noreferrer" target="_blank" href="https://www.youtube.com/channel/UCD2T2jAlO282XPmDfftRpvw">
                                <i class="fi fi-brands-youtube"></i>
                            </a>
                        </li>
                        <li>
                            <a rel="noreferrer" target="_blank" href="https://www.linkedin.com/in/phan-ph%C3%BAc-%C4%91%E1%BA%A1t-b88871243/">
                                <i class="fi fi-brands-linkedin"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <nav className="header__product-nav">
                <ul>
                    <li>
                        <button>
                            Destination
                            <i class="fi fi-rr-caret-down"></i>
                        </button>
                    </li>
                    <li>
                        <button>
                            Trending
                            <i class="fi fi-rr-caret-down"></i>
                        </button>
                    </li>
                </ul>
                <button className='product-nav__wist-list'>
                    <i class="fi fi-rs-heart"></i>
                    Wist List
                </button>
            </nav>
        </header>
    );
}

export default Header;
