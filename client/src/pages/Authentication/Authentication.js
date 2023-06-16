import React, { useEffect, useRef, useState } from 'react';
import '../../styles/scss/_authen.scss';
import { Link, useLocation, useNavigate } from 'react-router-dom';

// Loader
import PageLoader from '../../components/common/PageLoader';

// Notification trigger
import toast from 'react-hot-toast';

// Constant
import { PAGES } from '../../constants/Link.constants';

// Img
import logo from "../../assets/images/logos/sc-non-white.png";
import mountain_night from "../../assets/images/bgs/mountain-night.jpg";
import mountain_day from "../../assets/images/bgs/mountain-day.jpg";

// Validator utils
import { isValidEmail } from '../../utils/validators/email.validator';
import { isValidPassword } from '../../utils/validators/password.validator';

const Authentication = () => {
    const navigate = useNavigate();
    const location = useLocation();

    const [page, setPage] = useState('');
    const [isLoading, setIsLoading] = useState(true);

    const loginFormRef = useRef(null);
    const registerFormRef = useRef(null);
    const authenRef = useRef(null);

    // Hook
    useEffect(() => {
        setPage(location.pathname);

        const imageSources = [
            mountain_night,
            mountain_day,
        ];

        // Preloading background image
        Promise.all(imageSources.map((src) => preloadImage(src)))
            .then((images) => {
                // Update background-image of .authen
                changeBackground(location.pathname);
            })
            .catch((error) => {
                toast.error('Cannot load background image')
            })
            .finally(() => {
                setTimeout(() => {
                    setIsLoading(false);
                }, 500)
            });
    }, [location]);

    // Methods
    const handleFocus = (ev) => {
        if (ev.target && ev.target.parentNode) {
            const labelEl = ev.target.parentNode.querySelector('label');
            labelEl && labelEl.classList.remove('active');
        }
    }
    const handleBlur = (ev) => {
        if (ev.target && ev.target.parentNode) {
            const labelEl = ev.target.parentNode.querySelector('label');
            if (labelEl && !ev.target.value.length) {
                labelEl.classList.add('active');
            }
        }
    }

    const handleLogin = (e) => {
        // Prevent reload by default
        e.preventDefault();

        // Check form reference
        if (!loginFormRef.current) {
            toast.error('Sorry! Some errors here.')
            return;
        }

        // Check data valid
        if (!isValidEmail(loginFormRef.current.email.value)) {
            toast.error('Email is invalid')
            return;
        }
        if (!isValidPassword(loginFormRef.current.password.value)) {
            toast.error('Password must not be empty and at least 6 characters long')
            return;
        }

        // Check in db here
        toast.success('Successfully! You will redirect to home page right now!')
        setTimeout(() => {
            navigate(PAGES.HOME);
        }, 4000)
    }

    const handleRegister = (e) => {
        // Prevent reload by default
        e.preventDefault();

        // Check form reference
        if (
            !registerFormRef.current ||
            !registerFormRef.current.email ||
            !registerFormRef.current.password ||
            !registerFormRef.current.confirm_password
        ) {
            toast.error('Sorry! Some errors here.')
            return;
        }

        // Check data valid
        const email = registerFormRef.current.email.value;
        const password = registerFormRef.current.password.value;
        const confirm_password = registerFormRef.current.confirm_password.value;

        if (!isValidEmail(email)) {
            toast.error('Email is invalid')
            return;
        }
        if (!isValidPassword(password)) {
            toast.error('Password must not be empty and at least 6 characters long')
            return;
        }
        if (confirm_password !== password) {
            toast.error('Confirm password does not match')
            return;
        }

        // Check in db here
        toast.success('Successfully! You will redirect to login right now!')
        setTimeout(() => {
            navigate(PAGES.HOME);
        }, 4000)
    }

    const changeBackground = (cur_page) => {
        if (authenRef && authenRef.current) {
            if(cur_page === PAGES.LOGIN) {
                authenRef.current.style.backgroundImage = `url(${mountain_night})`;
            }
            else if(cur_page === PAGES.REGISTER) {
                authenRef.current.style.backgroundImage = `url(${mountain_day})`;
            }
            else {
                toast.error('Cannot load background image')
            }
        }
        else {
            toast.error('Cannot load background image')
        }
    }

    const changePage = (pathname) => {
        setPage(pathname);
        changeBackground(pathname);
        window.history.pushState(null, '', pathname)
    }

    // Methods preloading image
    const preloadImage = (src) => {
        return new Promise((resolve, reject) => {
            const img = new Image();
            img.src = src;
            img.onload = () => resolve(img);
            img.onerror = (error) => reject(error);
        });
    }

    return (
        <>
            {<div className={`authen`} ref={authenRef}>
                <header className='authen__header'>
                    <nav>
                        <ul>
                            <li>
                                <Link
                                    className={`${page === PAGES.HOME && 'active'}`}
                                    to={PAGES.HOME}
                                >
                                    Home
                                </Link>
                            </li>
                            <li>
                                <Link
                                    className={`${(page === PAGES.LOGIN || page === PAGES.REGISTER) && 'active'}`}
                                    to={PAGES.LOGIN}
                                >
                                    Authentication
                                </Link>
                            </li>
                            <li>
                                <Link
                                    className={`${page === PAGES.ABOUT && 'active'}`}
                                    to={PAGES.ABOUT}
                                >
                                    About
                                </Link>
                            </li>
                            <li>
                                <Link
                                    className={`${page === PAGES.CONTACT && 'active'}`}
                                    to={PAGES.CONTACT}
                                >
                                    Contact
                                </Link>
                            </li>
                        </ul>
                    </nav>
                </header>
                <main className='authen__main'>
                    <div className="authen__wrapper">
                        <div className="authen__container">
                            <div className="authen__bg"></div>
                            <div className='authen__intro'>
                                <div className='authen-intro__logo'>
                                    <img src={logo} alt="logo" />
                                </div>
                                <div className="authen-intro__information">
                                    <h2>
                                        Welcome!<br />
                                        To Sunrise Continent
                                    </h2>
                                    <p>
                                        With just one account from Sunrise Continent,
                                        you can access all of our other platforms.
                                    </p>
                                    <div className='authen-intro__social-link'>
                                        <Link to="https://www.facebook.com/MinMinPD2211/" target="_blank">
                                            <i className="fi fi-brands-facebook"></i>
                                        </Link>
                                        <Link to="https://twitter.com/PHAN_DUONG_MINH" target="_blank">
                                            <i className="fi fi-brands-twitter"></i>
                                        </Link>
                                        <Link to="https://www.youtube.com/channel/UCD2T2jAlO282XPmDfftRpvw" target="_blank">
                                            <i className="fi fi-brands-youtube"></i>
                                        </Link>
                                        <Link to="https://www.linkedin.com/in/phan-phúc-đạt-b88871243/" target="_blank">
                                            <i className="fi fi-brands-linkedin"></i>
                                        </Link>
                                    </div>
                                </div>
                            </div>
                            <div></div>
                            <form
                                className={`loginForm ${page === PAGES.LOGIN && 'active'}`}
                                noValidate
                                ref={loginFormRef}
                                onSubmit={handleLogin}
                            >
                                <h3>Login</h3>
                                <div className='authen-form__input-field'>
                                    <label
                                        className='active'
                                        htmlFor="login-email-input"
                                    >
                                        Email
                                    </label>
                                    <i className="fi fi-ss-envelope"></i>
                                    <input
                                        name="email"
                                        type="email"
                                        id='login-email-input'
                                        onFocus={handleFocus}
                                        onBlur={handleBlur}
                                    />
                                </div>
                                <div className='authen-form__input-field'>
                                    <label
                                        className='active'
                                        htmlFor="login-psw-input"
                                    >
                                        Password
                                    </label>
                                    <i className="fi fi-ss-lock"></i>
                                    <input
                                        name="password"
                                        type="password"
                                        id='login-psw-input'
                                        onFocus={handleFocus}
                                        onBlur={handleBlur}
                                    />
                                </div>
                                <div className='authen-form__interact-field'>
                                    <div>
                                        <input
                                            name="remember"
                                            type="checkbox"
                                            id='login-remember-input'
                                        />
                                        <label
                                            htmlFor="login-remember-input"
                                        >
                                            Remember me
                                        </label>
                                    </div>

                                    <div>
                                        <Link>Forget Password</Link>
                                    </div>
                                </div>
                                <button type='submit' className='authen-form__submit-btn'>
                                    Sign In
                                </button>
                                <button
                                    type='button'
                                    className='authen-form__register-btn'
                                    onClick={() => changePage(PAGES.REGISTER)}
                                >
                                    Create A New Account? Sign Up
                                </button>
                            </form>
                            <form
                                className={`registerForm ${page === PAGES.REGISTER && 'active'}`}
                                noValidate
                                ref={registerFormRef}
                                onSubmit={handleRegister}
                            >
                                <h3>Just a few more steps!</h3>
                                <div className='authen-form__input-field'>
                                    <label
                                        className='active'
                                        htmlFor="register-email-input"
                                    >
                                        Email
                                    </label>
                                    <i className="fi fi-ss-envelope"></i>
                                    <input
                                        name="email"
                                        type="email"
                                        id='register-email-input'
                                        onFocus={handleFocus}
                                        onBlur={handleBlur}
                                    />
                                </div>
                                <div className='authen-form__input-field'>
                                    <label
                                        className='active'
                                        htmlFor="register-psw-input"
                                    >
                                        Password
                                    </label>
                                    <i className="fi fi-ss-lock"></i>
                                    <input
                                        name="password"
                                        type="password"
                                        id='register-psw-input'
                                        onFocus={handleFocus}
                                        onBlur={handleBlur}
                                    />
                                </div>
                                <div className='authen-form__input-field'>
                                    <label
                                        className='active'
                                        htmlFor="register-cfpsw-input"
                                    >
                                        Confirm password
                                    </label>
                                    <i className="fi fi-ss-lock"></i>
                                    <input
                                        name="confirm_password"
                                        type="password"
                                        id='register-cfpsw-input'
                                        onFocus={handleFocus}
                                        onBlur={handleBlur}
                                    />
                                </div>
                                <button
                                    type='submit'
                                    className='authen-form__submit-btn'
                                >
                                    Register now
                                </button>
                                <button
                                    type='button'
                                    className='authen-form__register-btn'
                                    onClick={() => changePage(PAGES.LOGIN)}
                                >
                                    Do you already have an account?
                                </button>
                            </form>
                        </div>
                    </div>
                </main>
            </div>}
            {isLoading && <PageLoader />}
        </>
    );
}

export default Authentication;
