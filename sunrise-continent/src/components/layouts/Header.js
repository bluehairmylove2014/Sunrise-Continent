
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
                    <input type="text" placeholder='In which location are you looking for a hotel room?'/>
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
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </nav>
            </div>
            <nav className="header__product-nav">
                <ul>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </nav>
        </header>
    );
}

export default Header;
