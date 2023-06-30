import React, { useEffect, useRef, useState } from 'react';
import '../../styles/scss/_authen.scss';
import { Link, useLocation, useNavigate } from 'react-router-dom';

// Loader
import PageLoader from '../../components/common/PageLoader';

// Notification trigger
import toast from 'react-hot-toast';

// Constant
import { PAGES } from '../../constants/Link.constants';
import { APICacheMarker } from '../../constants/APICacheMarker.constants';
import { REGEX } from '../../constants/Regex';
import { MESSAGE } from '../../constants/Message.constants';

// Img
import logo from "../../assets/images/logos/sc-non-white.png";
import mountain_night from "../../assets/images/bgs/mountain-night.jpg";
import mountain_day from "../../assets/images/bgs/mountain-day.jpg";

// react-query
import { useMutation, useQueryClient } from 'react-query';

// Service
import AuthService from '../../services/AuthService';
import BroadcastService from '../../services/BroadcastService';

// Form
import { Controller, useForm } from 'react-hook-form';


const Authentication = () => {
    const loginForm = useForm();
    const registerForm = useForm();

    const navigate = useNavigate();
    const location = useLocation();

    const [page, setPage] = useState('');
    const [isLoading, setIsLoading] = useState(true);

    const registerFormRef = useRef(null);
    const authenRef = useRef(null);

    const queryClient = useQueryClient();

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
    const handleFocus = (target) => {
        if (target && target.parentNode) {
            const labelEl = target.parentNode.querySelector('label');
            labelEl && labelEl.classList.remove('active');
        }
    }
    const handleBlur = (target) => {
        if (target && target.parentNode) {
            const labelEl = target.parentNode.querySelector('label');
            if (labelEl && !target.value.length) {
                labelEl.classList.add('active');
            }
        }
    }

    const loginMutation = useMutation(AuthService.login, {
        retry: 3,
        onSuccess: (data) => {
            queryClient.invalidateQueries(APICacheMarker.AUTH_LOGIN);
            toast.success('Successfully! You will redirect to home page right now!')
            setTimeout(() => {
                BroadcastService.postMessage(MESSAGE.USER_LOGGED_IN);
                navigate("/");
            }, 2000)
        },
        onError: (error) => {
            loginMutation.reset();
            toast.error('Login error')
        },
    })
    const registerMutation = useMutation(AuthService.register, {
        retry: 3,
        onSuccess: (data) => {
            queryClient.invalidateQueries(APICacheMarker.AUTH_REGISTER);
            toast.success('Successfully! Please check your email for verification')
            setTimeout(() => {
                BroadcastService.postMessage(MESSAGE.USER_REGISTER);
                navigate("/login");
            }, 2000)
        },
        onError: (error) => {
            loginMutation.reset();
            toast.error('Register error')
        },
    })

    const handleLogin = (data) => {
        data && loginMutation.mutate(data)
    }
    const handleLoginError = (errors) => {
        if (errors) {
            if (errors.login_email) {
                toast.error(errors.login_email.message)

            }
            else if (errors.login_password) {
                toast.error(errors.login_password.message)
            }
        }
    }

    const handleRegister = (data) => {
        if (data.register_password !== data.confirm_password) {
            toast.error('Confirm password does not match')
            return;
        }
        data && registerMutation.mutate(data.register_email, data.register_password)
    }
    const handleRegisterError = (errors) => {
        if (errors) {
            if (errors.register_email) {
                toast.error(errors.register_email.message)

            }
            else if (errors.register_password) {
                toast.error(errors.register_password.message)
            }
            else if (errors.confirm_password) {
                toast.error(errors.confirm_password.message)
            }
        }
    }

    const changeBackground = (cur_page) => {
        if (authenRef && authenRef.current) {
            if (cur_page === PAGES.LOGIN) {
                authenRef.current.style.backgroundImage = `url(${mountain_night})`;
            }
            else if (cur_page === PAGES.REGISTER) {
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
                                onSubmit={loginForm.handleSubmit(handleLogin, handleLoginError)}
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
                                    <Controller
                                        name="login_email"
                                        control={loginForm.control}
                                        defaultValue=""
                                        rules={{
                                            required: 'Email should not be empty',
                                            pattern: {
                                                value: REGEX.VALID_EMAIL,
                                                message: "Email is not valid!"
                                            }
                                        }}
                                        render={({ field }) => (
                                            <input
                                                {...field}
                                                type="email"
                                                id='login-email-input'
                                                onFocus={e => handleFocus(e.target)}
                                                onBlur={e => handleBlur(e.target)}
                                            />
                                        )}
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
                                    <Controller
                                        name="login_password"
                                        control={loginForm.control}
                                        defaultValue=""
                                        rules={{
                                            required: 'Password should not be empty',
                                            minLength: {
                                                value: 6,
                                                message: "Password must be at least 6 characters long"
                                            }
                                        }}
                                        render={({ field }) => (
                                            <input
                                                {...field}
                                                type="password"
                                                id='login-psw-input'
                                                onFocus={e => handleFocus(e.target)}
                                                onBlur={e => handleBlur(e.target)}
                                            />
                                        )}
                                    />
                                </div>
                                <div className='authen-form__interact-field'>
                                    <div>
                                        <Controller
                                            name="login_remember"
                                            control={loginForm.control}
                                            defaultValue={false}
                                            render={({ field }) => (
                                                <input
                                                    {...field}
                                                    type="checkbox"
                                                    id='login-remember-input'
                                                />
                                            )}
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
                                <button
                                    type='submit'
                                    className='authen-form__submit-btn'
                                    disabled={loginMutation.isLoading}
                                >
                                    {loginMutation.isLoading ? "Signing in..." : "Sign In"}
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
                                onSubmit={registerForm.handleSubmit(handleRegister, handleRegisterError)}
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
                                    <Controller
                                        name="register_email"
                                        control={registerForm.control}
                                        defaultValue=""
                                        rules={{
                                            required: 'Email should not be empty',
                                            pattern: {
                                                value: REGEX.VALID_EMAIL,
                                                message: "Email is not valid!"
                                            }
                                        }}
                                        render={({ field }) => (
                                            <input
                                                {...field}
                                                type="email"
                                                id='register-email-input'
                                                onFocus={e => handleFocus(e.target)}
                                                onBlur={e => handleBlur(e.target)}
                                            />
                                        )}
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
                                    <Controller
                                        name="register_password"
                                        control={registerForm.control}
                                        defaultValue=""
                                        rules={{
                                            required: 'Password should not be empty',
                                            minLength: {
                                                value: 6,
                                                message: "Password must be at least 6 characters long"
                                            }
                                        }}
                                        render={({ field }) => (
                                            <input
                                                {...field}
                                                type="password"
                                                id='register-psw-input'
                                                onFocus={e => handleFocus(e.target)}
                                                onBlur={e => handleBlur(e.target)}
                                            />
                                        )}
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
                                    <Controller
                                        name="confirm_password"
                                        control={registerForm.control}
                                        defaultValue=""
                                        rules={{
                                            required: 'Confirm password should not be empty'
                                        }}
                                        render={({ field }) => (
                                            <input
                                                {...field}
                                                type="password"
                                                id='register-cfpsw-input'
                                                onFocus={e => handleFocus(e.target)}
                                                onBlur={e => handleBlur(e.target)}
                                            />
                                        )}
                                    />
                                </div>
                                <button
                                    type='submit'
                                    className='authen-form__submit-btn'
                                    disabled={registerMutation.isLoading}
                                >
                                    {registerMutation.isLoading ? "Wait a second..." : "Register now"}
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
