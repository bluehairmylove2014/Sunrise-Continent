import React, { useEffect, useRef, useState } from "react";
import "../../styles/pages/authen.scss";
import { Link, useLocation, useNavigate } from "react-router-dom";
import toast from "react-hot-toast";
import { PAGES } from "../../constants/Link.constants";
import { REGEX } from "../../constants/Regex";
import logo from "../../assets/images/logos/sc-non-white.png";
import { Controller, useForm } from "react-hook-form";
import { useLogin, useRegister } from "../../libs/business-logic/src/lib/auth";
import {
  deleteRedirectUrl,
  getRedirectUrl,
} from "../../utils/helpers/RedirectUrlSaver";
import { useIsLogged } from "../../libs/business-logic/src/lib/auth/process/hooks";

const Authentication = () => {
  const [isLoginProcess, setIsLoginProcess] = useState(false);
  const loginForm = useForm({
    defaultValues: {
      email: "",
      password: "",
      isRememberMe: false,
    },
  });
  const registerForm = useForm({
    defaultValues: {
      email: "",
      fullName: "",
      password: "",
    },
  });
  const navigate = useNavigate();
  const isLoggin = useIsLogged();

  const location = useLocation();

  const [page, setPage] = useState("");

  const registerFormRef = useRef(null);
  const authenRef = useRef(null);

  const { onLogin, isLoading: isLoginLoading } = useLogin();
  const { onRegister, isLoading: isRegisterLoading } = useRegister();

  // Hook
  useEffect(() => {
    setPage(location.pathname);
  }, [location]);

  useEffect(() => {
    if (isLoggin && !isLoginProcess) {
      navigate(PAGES.DASHBOARD);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [isLoggin]);

  // Methods
  const handleNavigate = (message) => {
    const oldRedirectUrl = getRedirectUrl();
    if (oldRedirectUrl) {
      navigate(oldRedirectUrl);
      deleteRedirectUrl();
    } else {
      navigate(PAGES.DASHBOARD);
    }
  };

  const handleFocus = (target) => {
    if (target && target.parentNode) {
      const labelEl = target.parentNode.querySelector("label");
      labelEl && labelEl.classList.remove("active");
    }
  };
  const handleBlur = (target) => {
    if (target && target.parentNode) {
      const labelEl = target.parentNode.querySelector("label");
      if (labelEl && !target.value.length) {
        labelEl.classList.add("active");
      }
    }
  };
  const handleLogin = ({ email, password, isRememberMe }) => {
    setIsLoginProcess(true);
    onLogin({
      isRememberMe,
      email,
      password,
    })
      .then((message) => {
        handleNavigate(message);
      })
      .catch((err) => {
        toast.error(err.message);
      });
  };
  const handleLoginError = (errors) => {
    if (errors) {
      if (errors.email) {
        toast.error(errors.email.message);
      } else if (errors.password) {
        toast.error(errors.password.message);
      }
    }
  };
  const handleRegister = ({ email, fullName, password }) => {
    setIsLoginProcess(true);
    onRegister({ email, fullName, password })
      .then((message) => {
        handleNavigate(message);
      })
      .catch((err) => {
        toast.error(err.message);
      });
  };
  const handleRegisterError = (errors) => {
    if (errors) {
      if (errors.email) {
        toast.error(errors.email.message);
      } else if (errors.password) {
        toast.error(errors.password.message);
      } else if (errors.password) {
        toast.error(errors.password.message);
      }
    }
  };
  const changePage = (pathname) => {
    navigate(pathname, { replace: true });
  };

  return (
    <>
      {
        <div
          className={`authen ${page === "/auth/register" ? "register" : ""}`}
          ref={authenRef}
        >
          <div className="authen__register-bg"></div>
          {/* <div className="authen__login-bg"></div> */}

          <header className="authen__header">
            <nav>
              <ul>
                <li>
                  <Link
                    className={`${page === PAGES.HOME && "active"}`}
                    to={PAGES.HOME}
                  >
                    Home
                  </Link>
                </li>
                <li>
                  <Link
                    className={`${
                      (page === PAGES.LOGIN || page === PAGES.REGISTER) &&
                      "active"
                    }`}
                    to={PAGES.LOGIN}
                  >
                    Authentication
                  </Link>
                </li>
                <li>
                  <Link
                    className={`${page === PAGES.ABOUT && "active"}`}
                    to={PAGES.ABOUT}
                  >
                    About
                  </Link>
                </li>
                <li>
                  <Link
                    className={`${page === PAGES.CONTACT && "active"}`}
                    to={PAGES.CONTACT}
                  >
                    Contact
                  </Link>
                </li>
              </ul>
            </nav>
          </header>
          <main className="authen__main">
            <div className="authen__wrapper">
              <div className="authen__container">
                <div className="authen__bg"></div>
                <div className="authen__intro">
                  <div className="authen-intro__logo">
                    <img src={logo} alt="logo" />
                  </div>
                  <div className="authen-intro__information">
                    <h2>
                      Welcome!
                      <br />
                      To Sunrise Continent
                    </h2>
                    <p>
                      With just one account from Sunrise Continent, you can
                      access all of our other platforms.
                    </p>
                    <div className="authen-intro__social-link">
                      <Link
                        to="https://www.facebook.com/MinMinPD2211/"
                        target="_blank"
                      >
                        <i className="fi fi-brands-facebook"></i>
                      </Link>
                      <Link
                        to="https://twitter.com/PHAN_DUONG_MINH"
                        target="_blank"
                      >
                        <i className="fi fi-brands-twitter"></i>
                      </Link>
                      <Link
                        to="https://www.youtube.com/channel/UCD2T2jAlO282XPmDfftRpvw"
                        target="_blank"
                      >
                        <i className="fi fi-brands-youtube"></i>
                      </Link>
                      <Link
                        to="https://www.linkedin.com/in/phan-phúc-đạt-b88871243/"
                        target="_blank"
                      >
                        <i className="fi fi-brands-linkedin"></i>
                      </Link>
                    </div>
                  </div>
                </div>
                <div></div>
                <form
                  className={`loginForm ${page === PAGES.LOGIN && "active"}`}
                  noValidate
                  onSubmit={loginForm.handleSubmit(
                    handleLogin,
                    handleLoginError
                  )}
                >
                  <h3>Login</h3>
                  <div className="authen-form__input-field">
                    <label className="active" htmlFor="login-email-input">
                      Email
                    </label>
                    <i className="fi fi-ss-envelope"></i>
                    <Controller
                      name="email"
                      control={loginForm.control}
                      rules={{
                        required: "Email should not be empty",
                        pattern: {
                          value: REGEX.VALID_EMAIL,
                          message: "Email is not valid!",
                        },
                      }}
                      render={({ field }) => (
                        <input
                          {...field}
                          type="email"
                          id="login-email-input"
                          onFocus={(e) => handleFocus(e.target)}
                          onBlur={(e) => handleBlur(e.target)}
                        />
                      )}
                    />
                  </div>
                  <div className="authen-form__input-field">
                    <label className="active" htmlFor="login-psw-input">
                      Password
                    </label>
                    <i className="fi fi-ss-lock"></i>
                    <Controller
                      name="password"
                      control={loginForm.control}
                      rules={{
                        required: "Password should not be empty",
                        minLength: {
                          value: 6,
                          message:
                            "Password must be at least 6 characters long",
                        },
                      }}
                      render={({ field }) => (
                        <input
                          {...field}
                          type="password"
                          id="login-psw-input"
                          onFocus={(e) => handleFocus(e.target)}
                          onBlur={(e) => handleBlur(e.target)}
                        />
                      )}
                    />
                  </div>
                  <div className="authen-form__interact-field">
                    <div>
                      <Controller
                        name="isRememberMe"
                        control={loginForm.control}
                        render={({ field }) => (
                          <input
                            {...field}
                            type="checkbox"
                            id="login-remember-input"
                          />
                        )}
                      />
                      <label htmlFor="login-remember-input">Remember me</label>
                    </div>

                    {/* <div>
                      <Link>Forget Password</Link>
                    </div> */}
                  </div>
                  <div className="button__wrapper">
                    <button
                      type="submit"
                      className="authen-form__submit-btn"
                      disabled={isLoginLoading}
                    >
                      {isLoginLoading ? "Signing in..." : "Sign In"}
                    </button>
                    {/* <button
                      className="authen-form__social-btn google"
                      type="button"
                      onClick={handleGoogleLogin}
                      disabled={isGoogleLoginLoading}
                    >
                      <img src={googleIcon} alt="social" />
                      <span>
                        {isGoogleLoginLoading
                          ? `In process`
                          : `Login with google`}
                      </span>
                    </button> */}
                  </div>

                  {/* <button
                    type="button"
                    className="authen-form__register-btn"
                    onClick={() => changePage(PAGES.REGISTER)}
                  >
                    Create A New Account? Sign Up
                  </button> */}
                </form>
                <form
                  className={`registerForm ${
                    page === PAGES.REGISTER && "active"
                  }`}
                  noValidate
                  ref={registerFormRef}
                  onSubmit={registerForm.handleSubmit(
                    handleRegister,
                    handleRegisterError
                  )}
                >
                  <h3>Just a few more steps!</h3>
                  <div className="authen-form__input-field">
                    <label className="active" htmlFor="register-email-input">
                      Email
                    </label>
                    <i className="fi fi-ss-envelope"></i>
                    <Controller
                      name="email"
                      control={registerForm.control}
                      rules={{
                        required: "Email should not be empty",
                        pattern: {
                          value: REGEX.VALID_EMAIL,
                          message: "Email is not valid!",
                        },
                      }}
                      render={({ field }) => (
                        <input
                          {...field}
                          type="email"
                          id="register-email-input"
                          onFocus={(e) => handleFocus(e.target)}
                          onBlur={(e) => handleBlur(e.target)}
                        />
                      )}
                    />
                  </div>
                  <div className="authen-form__input-field">
                    <label className="active" htmlFor="register-fullName-input">
                      Full name
                    </label>
                    <i className="fi fi-sr-id-card-clip-alt"></i>
                    <Controller
                      name="fullName"
                      control={registerForm.control}
                      rules={{
                        required: "Full name should not be empty",
                      }}
                      render={({ field }) => (
                        <input
                          {...field}
                          type="text"
                          id="register-fullName-input"
                          onFocus={(e) => handleFocus(e.target)}
                          onBlur={(e) => handleBlur(e.target)}
                        />
                      )}
                    />
                  </div>
                  <div className="authen-form__input-field">
                    <label className="active" htmlFor="register-psw-input">
                      Password
                    </label>
                    <i className="fi fi-ss-lock"></i>
                    <Controller
                      name="password"
                      control={registerForm.control}
                      rules={{
                        required: "Password should not be empty",
                        minLength: {
                          value: 6,
                          message:
                            "Password must be at least 6 characters long",
                        },
                      }}
                      render={({ field }) => (
                        <input
                          {...field}
                          type="password"
                          id="register-psw-input"
                          onFocus={(e) => handleFocus(e.target)}
                          onBlur={(e) => handleBlur(e.target)}
                        />
                      )}
                    />
                  </div>
                  <button
                    type="submit"
                    className="authen-form__submit-btn"
                    disabled={isRegisterLoading}
                  >
                    {isRegisterLoading ? "Wait a second..." : "Register now"}
                  </button>
                  <button
                    type="button"
                    className="authen-form__register-btn"
                    onClick={() => changePage(PAGES.LOGIN)}
                  >
                    Do you already have an account?
                  </button>
                </form>
              </div>
            </div>
          </main>
        </div>
      }
    </>
  );
};

export default Authentication;
