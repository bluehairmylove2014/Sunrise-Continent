/* eslint-disable react-hooks/exhaustive-deps */
import React, { useCallback, useEffect, useRef, useState } from "react";
import { Link, useLocation, useNavigate } from "react-router-dom";
import "../../styles/component/header.scss";
import logoVerticalImg from "../../assets/images/logos/sc-vertical.png";
import logoHorizontalImg from "../../assets/images/logos/sc-horizontal.png";
import cartIcon from "../../assets/images/icons/shopping-bag (1).png";
import { PAGES } from "../../constants/Link.constants";
import NavDropdown from "../common/NavDropdown";
import UserSidebar from "./UserSidebar";
import { Controller, useForm } from "react-hook-form";
import { useIsLogged } from "../../libs/business-logic/src/lib/auth";
import { categories, partner } from "./Data";
import WistList from "../common/WistList";
import CartSidebar from "../common/CartSidebar";
import { useGetUser } from "../../libs/business-logic/src/lib/auth/process/hooks";
import { useWishlist } from "../../libs/business-logic/src/lib/wishlist";
import { useCartContext } from "../../libs/business-logic/src/lib/cart/process/context";
import { toast } from "react-hot-toast";
import Empty from "../common/Empty";
import { useGetRecommendProduct } from "./../../libs/business-logic/src/lib/search/process/hooks/useGetRecommendProduct";
import { useGetSearchHistory } from "./../../libs/business-logic/src/lib/search/process/hooks/useGetSearchHistory";
import { useSearchRecommend } from "../../libs/business-logic/src/lib/search/process/hooks/useSearchRecommend";
import { useHandleKeyWord } from "./../../libs/business-logic/src/lib/search/process/hooks/useHandleKeyWord";

const Header = () => {
  const [isUserSidebarActive, setIsUserSidebarActive] = useState(false);
  const [isWishlistActive, setIsWishlistActive] = useState(false);
  const [isCartActive, setIsCartActive] = useState(false);
  const [logoSrc, setLogoSrc] = useState(logoVerticalImg);
  const [isSimplyHeader, setIsSimplyHeader] = useState(false);
  const timeskipScroll = useRef(false);
  const location = useLocation();
  const recommendProducts = useGetRecommendProduct();
  const searchHistories = useGetSearchHistory();
  const { onSearchRecommend } = useSearchRecommend();
  const { onSaveKeyWord, onDeleteKeyWord } = useHandleKeyWord();
  const isLogin = useIsLogged();

  const userData = useGetUser();
  const headerRef = useRef(null);
  const { getWishlist } = useWishlist();
  const wishlist = getWishlist();
  const { state } = useCartContext();
  const cart = state.cart;

  const navigate = useNavigate();

  const { handleSubmit, reset, control } = useForm({
    defaultValues: {
      search: "",
    },
  });

  useEffect(() => {
    const handleScroll = () => {
      if (!timeskipScroll.current) {
        if (window.scrollY > scrollPosition + 5) {
          if (
            categories.findIndex(
              (c) => c.category_name === partner.category_name
            ) === -1
          ) {
            timeskipScroll.current = true;
            categories.push(partner);
          }
          handleBlurSearchbox();
          setLogoSrc(logoHorizontalImg);
          setIsSimplyHeader(true);
          headerRef.current && headerRef.current.classList.add("simply");

          setTimeout(() => {
            timeskipScroll.current = false;
          }, 500);
        } else if (window.scrollY < scrollPosition - 5) {
          const targetIndex = categories.findIndex(
            (c) => c.category_name === partner.category_name
          );
          if (targetIndex !== -1) {
            timeskipScroll.current = true;
            categories.splice(targetIndex, 1);
          }
          handleBlurSearchbox();
          setLogoSrc(logoVerticalImg);
          setIsSimplyHeader(false);
          headerRef.current && headerRef.current.classList.remove("simply");

          setTimeout(() => {
            timeskipScroll.current = false;
          }, 500);
        }
      }

      scrollPosition = window.scrollY;
    };

    let scrollPosition = 0;

    window.addEventListener("scroll", handleScroll);

    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, []);

  useEffect(() => {
    setIsSimplyHeader(false);
    setLogoSrc(logoVerticalImg);
    headerRef.current && headerRef.current.classList.remove("simply");
  }, [location]);

  // Methods
  const renderCategories = (catelist) => {
    return (
      <ul>
        {catelist ? (
          catelist.map((c, i) => {
            return (
              <li key={`header-category@${i}`}>
                <NavDropdown
                  name_il={c.icon}
                  name={c.category_name}
                  href={c.href}
                  options={c.options}
                />
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
    headerRef.current && headerRef.current.classList.remove("active");
    !isSimplyHeader && setLogoSrc(logoVerticalImg);
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
    const realKeyWords = (
      typeof content === "string" ? content : content.search
    ).replace(/[._\-,]/g, " ");

    if (!realKeyWords || !realKeyWords.trim().length) {
      toast.error("Nhập gì đó đi!");
    } else {
      // Handle split keys
      handleBlurSearchbox();
      let query = `/search?location=${realKeyWords}`;
      navigate(query, { replace: true });
      onSaveKeyWord(realKeyWords);
      reset();
    }
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
            {isSimplyHeader ? (
              <form
                onSubmit={handleSubmit(onSearch)}
                className="simply-search-box"
              >
                <button type="submit" className="search-box__submit">
                  <i className="fi fi-rr-search"></i>
                </button>
                <Controller
                  name="search"
                  control={control}
                  rules={{
                    required: true,
                  }}
                  render={({ field }) => (
                    <input
                      {...field}
                      type="text"
                      autoComplete="off"
                      placeholder="Bạn muốn đặt chân đến nơi nào?"
                      onFocus={handleFocusSearchbox}
                      onKeyDown={(e) => {
                        if (e.key === "Enter") {
                          handleSubmit(onSearch);
                        }
                      }}
                    />
                  )}
                />
              </form>
            ) : (
              <form
                onSubmit={handleSubmit(onSearch)}
                className="normal-search-box"
              >
                <button type="submit" className="search-box__submit">
                  <i className="fi fi-rr-search"></i>
                </button>
                <Controller
                  name="search"
                  control={control}
                  rules={{
                    required: true,
                  }}
                  render={({ field }) => (
                    <input
                      {...field}
                      type="text"
                      autoComplete="off"
                      placeholder="Bạn muốn đặt chân đến nơi nào?"
                      onFocus={handleFocusSearchbox}
                      onKeyDown={(e) => {
                        if (e.key === "Enter") {
                          handleSubmit(onSearch);
                        }
                      }}
                      onChange={(e) => {
                        field.onChange(e);
                        const searchKeyWords = e.target.value.trim();
                        onSearchRecommend(searchKeyWords);
                      }}
                    />
                  )}
                />
              </form>
            )}
          </div>
          <nav className="header__main-nav">
            <ul className="header-main-nav__infor">
              <li>
                <a
                  href={partner.href}
                  rel="noopener noreferrer"
                  target="_blank"
                >
                  <i className={partner.icon}></i>
                  {partner.category_name}
                </a>
              </li>
              {/* <li>
                <div className="header-main-nav__language">
                  <NavDropdown
                    name="Tiếng Việt"
                    name_il={"fi fi-rs-language"}
                    name_ir={"fi fi-ts-angle-small-down"}
                    options={languages}
                  />
                </div>
              </li> */}
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
              <li
                className="header-main-nav__user-avatar"
                onClick={() => setIsUserSidebarActive(!isUserSidebarActive)}
              >
                {userData ? (
                  <>
                    <button>
                      <img src={userData.image} alt="user-avatar" />
                    </button>
                  </>
                ) : (
                  <div className="spinner"></div>
                )}
              </li>
            </ul>
          </nav>
        </div>

        <nav className="header__product-nav">
          <button
            type="button"
            className="search-box__trigger-open"
            onClick={() => handleFocusSearchbox()}
          >
            <i className="fi fi-rr-search"></i>
          </button>

          {renderCategories(categories)}

          <button
            className="product-nav__wish-list"
            onClick={() => setIsWishlistActive(!isWishlistActive)}
          >
            {isSimplyHeader ? (
              <>
                <div className="wishlist__length">
                  {Array.isArray(wishlist) ? wishlist.length : 0}
                </div>
                <span className="wishlist-btn__label">
                  <i className="fi fi-rs-heart"></i>
                </span>
                <span className="wishlist-btn__content">
                  {Array.isArray(wishlist) ? wishlist.length : 0}
                </span>
              </>
            ) : (
              <>
                <div className="wishlist__length">
                  {Array.isArray(wishlist) ? wishlist.length : 0}
                </div>
                <span className="wishlist-btn__label">
                  <i className="fi fi-bs-heart"></i>
                  Wish List
                </span>
                <span className="wishlist-btn__content">
                  {Array.isArray(wishlist) ? wishlist.length : 0}&nbsp;
                </span>
                <span className="wishlist-btn__content">i</span>
                <span className="wishlist-btn__content">t</span>
                <span className="wishlist-btn__content">e</span>
                <span className="wishlist-btn__content">ms</span>
              </>
            )}
          </button>
          <button
            className="product-nav__cart"
            onClick={() => setIsCartActive(!isCartActive)}
          >
            <div className="cart__length">
              {Array.isArray(cart) ? cart.length : 0}
            </div>
            <span className="cart-btn__label">
              <img src={cartIcon} alt="cart" />
            </span>
          </button>
          {isSimplyHeader ? (
            <>
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
              </ul>
              {/* user avatar when logged in */}
              <ul
                className={`header-main-nav__user-interact ${
                  isLogin && "active"
                }`}
              >
                <li
                  className="header-main-nav__user-avatar"
                  onClick={() => setIsUserSidebarActive(!isUserSidebarActive)}
                >
                  {userData ? (
                    <>
                      <button>
                        <img src={userData.image} alt="user-avatar" />
                      </button>
                    </>
                  ) : (
                    <div className="spinner"></div>
                  )}
                </li>
              </ul>
            </>
          ) : (
            <></>
          )}
        </nav>
        <div className={`search-box__introduction`}>
          <div className="search-histories">
            <h6>Lịch sử tìm kiếm</h6>
            {Array.isArray(searchHistories) && searchHistories.length > 0 ? (
              searchHistories.map((sh, index) => (
                <div className="history" key={`search-history@${index}`}>
                  <p onClick={() => onSearch(sh)}>
                    <i className="fi fi-bs-search"></i>
                    {sh}
                  </p>
                  <button onClick={() => onDeleteKeyWord(sh)}>
                    <i className="fi fi-ss-trash-xmark"></i>
                  </button>
                </div>
              ))
            ) : (
              <Empty label={""} />
            )}
          </div>
          <div className="recommend-locations">
            <h6>Đề xuất</h6>
            <div className="locations-wrapper">
              {Array.isArray(recommendProducts) &&
              recommendProducts.length > 0 ? (
                recommendProducts.map((lo) => (
                  <button
                    className="location"
                    key={lo.id}
                    onClick={() => onSearch(lo.name)}
                  >
                    <img src={lo.picture} alt="" />
                    <div className="location__overlay"></div>
                    <p>{lo.name}</p>
                  </button>
                ))
              ) : (
                <div className="empty">
                  <Empty label={""} />
                </div>
              )}
            </div>
          </div>
          {/* <div>
            <h3>Hãy thoải mái yêu cầu những gì bạn muốn!</h3>
            <p>
              Bạn có thể nhập bất kỳ yêu cầu gì với bất kì văn phong nào. Chúng
              tôi sẽ tự phân tích và tìm ra kết quả hợp lý nhất cho bạn.
            </p>
            <small>
              Ví dụ: Hãy tìm cho tôi một căn Villa tại Đà Lạt với hai phòng đơn,
              một phòng đôi và có bồn tắm ngoài trời{" "}
            </small>
          </div> */}
        </div>
      </header>
      <WistList
        isActive={isWishlistActive}
        callback={useCallback(
          (status) => setIsWishlistActive(status),
          [setIsWishlistActive]
        )}
      />
      <CartSidebar
        isActive={isCartActive}
        callback={useCallback(
          (status) => setIsCartActive(status),
          [setIsCartActive]
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
