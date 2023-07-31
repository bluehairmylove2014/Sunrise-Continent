import React, { useCallback, useRef, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import "../../styles/component/header.scss";
import logoVerticalImg from "../../assets/images/logos/sc-vertical.png";
import logoHorizontalImg from "../../assets/images/logos/sc-horizontal.png";
import worker_gif from "../../assets/images/graphics/worker.gif";
import { PAGES } from "../../constants/Link.constants";
import NavDropdown from "../common/NavDropdown";
import UserSidebar from "./UserSidebar";
import { useForm } from "react-hook-form";
import { useIsLogged } from "../../libs/business-logic/src/lib/auth";
import { categories, languages } from "./Data";
import WistList from "../common/WistList";
import { useGetUser } from "../../libs/business-logic/src/lib/auth/process/hooks";
import { useCartContext } from "../../libs/business-logic/src/lib/cart/process/context";

const Header = () => {
  const [isUserSidebarActive, setIsUserSidebarActive] = useState(false);
  const [isWishlistActive, setIsWishlistActive] = useState(false);
  const [logoSrc, setLogoSrc] = useState(logoVerticalImg);
  const isLogin = useIsLogged();
  const userData = useGetUser();
  const headerRef = useRef(null);
  const { state } = useCartContext();

  const navigate = useNavigate();

  const { handleSubmit, register, reset } = useForm();

  // Methods
  const renderCategories = (catelist) => {
    return (
      <ul>
        {catelist ? (
          catelist.map((c, i) => {
            return (
              <li key={`header-category@${i}`}>
                <NavDropdown name_il={c.icon} name={c.category_name} />
              </li>
            );
          })
        ) : (
          <></>
        )}
      </ul>
    );
  };
  const handleBlurSearchbox = () => {
    headerRef.current.classList.remove("active");
    setLogoSrc(logoVerticalImg);
    document.removeEventListener("click", handleClickOutside);
  };
  const handleClickOutside = (event) => {
    if (headerRef.current && !headerRef.current.contains(event.target)) {
      handleBlurSearchbox();
    }
  };
  const handleFocusSearchbox = () => {
    if (headerRef.current) {
      if (!headerRef.current.classList.contains("active")) {
        headerRef.current.classList.add("active");
        setLogoSrc(logoHorizontalImg);
        document.addEventListener("click", handleClickOutside);
      }
    }
  };
  const onSearch = (content) => {
    handleBlurSearchbox();
    // Handle split keys
    let query = `/search?location=${content.search}`;
    navigate(query);
    reset();
  };

  return (
    <React.Fragment>
      <header className="header" ref={headerRef}>
        <div className="header__overlay"></div>
        <Link className="header__logo-container" to={PAGES.HOME}>
          <img
            src={logoSrc}
            alt="Sunrise Continent"
            className="header__logo-img"
            id="header-logo"
          />
        </Link>
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
                placeholder="Bạn muốn đặt chân đến nơi nào?"
                onFocus={handleFocusSearchbox}
                onKeyDown={(e) => {
                  if (e.key === "Enter") {
                    handleSubmit(onSearch);
                  }
                }}
                {...register("search", {
                  required: true,
                })}
              />
            </form>
          </div>
          <nav className="header__main-nav">
            <ul className="header-main-nav__infor">
              <li>
                <Link to={PAGES.ABOUT}>Về chúng tôi</Link>
              </li>
              <li>
                <Link to={PAGES.CONTACT}>Liên hệ</Link>
              </li>
              <li>
                <div className="header-main-nav__language">
                  <NavDropdown
                    name="Tiếng Việt"
                    name_il={"fi fi-rs-language"}
                    name_ir={"fi fi-ts-angle-small-down"}
                    options={languages}
                  />
                </div>
              </li>
            </ul>
            <ul
              className={`header-main-nav__user-interact ${
                !isLogin && "active"
              }`}
            >
              <li>
                <Link
                  to={PAGES.LOGIN}
                  className="header-user-interact__login-btn"
                >
                  Đăng nhập
                </Link>
              </li>
              <li>
                <Link
                  to={PAGES.REGISTER}
                  className="header-user-interact__register-btn"
                >
                  Tham gia ngay!
                </Link>
              </li>
            </ul>
            {/* user avatar when logged in */}
            <ul
              className={`header-main-nav__user-interact ${
                isLogin && "active"
              }`}
            >
              <li className="header-main-nav__user-avatar">
                {userData && (
                  <>
                    <button
                      onClick={() =>
                        setIsUserSidebarActive(!isUserSidebarActive)
                      }
                    >
                      <img src={userData.image} alt="user-avatar" />
                    </button>
                  </>
                )}
              </li>
            </ul>
          </nav>
        </div>
        <nav className="header__product-nav">
          {renderCategories(categories)}
          <button
            className="product-nav__wish-list"
            onClick={() => setIsWishlistActive(!isWishlistActive)}
          >
            <span className="wishlist-btn__label">
              <i className="fi fi-rs-heart"></i>
              Wish List
            </span>
            <span className="wishlist-btn__content">
              {state.cart ? state.cart.length : 0}&nbsp;
            </span>
            <span className="wishlist-btn__content">i</span>
            <span className="wishlist-btn__content">t</span>
            <span className="wishlist-btn__content">e</span>
            <span className="wishlist-btn__content">ms</span>
          </button>
        </nav>
        <div className="search-box__introduction">
          <img src={worker_gif} alt="worker_gif" />
          <div>
            <h3>Hãy thoải mái yêu cầu những gì bạn muốn!</h3>
            <p>
              Bạn có thể nhập bất kỳ yêu cầu gì với bất kì văn phong nào. Chúng
              tôi sẽ tự phân tích và tìm ra kết quả hợp lý nhất cho bạn.
            </p>
            <small>
              Ví dụ: Hãy tìm cho tôi một căn Villa tại Đà Lạt với hai phòng đơn,
              một phòng đôi và có bồn tắm ngoài trời{" "}
            </small>
          </div>
        </div>
      </header>
      <WistList
        isActive={isWishlistActive}
        callback={useCallback(
          (status) => setIsWishlistActive(status),
          [setIsWishlistActive]
        )}
      />
      <UserSidebar
        isActive={isUserSidebarActive}
        userData={userData}
        callback={useCallback(
          (status) => setIsUserSidebarActive(status),
          [setIsUserSidebarActive]
        )}
      />
    </React.Fragment>
  );
};

export default Header;
