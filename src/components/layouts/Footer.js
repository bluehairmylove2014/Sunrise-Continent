import React from "react";
import { Link } from "react-router-dom";
import "../../styles/common/footer.scss";
import sunriseContinentLogo from "../../assets/images/logos/sc-non-white.png";

const Footer = () => {
  return (
    <footer className="footer">
      <div className="footer__upper-bg"></div>
      <div className="container">
        <div className="footer__row split">
          <div className="split-row">
            <img src={sunriseContinentLogo} alt="logo" />
            <p>
              <i class="fi fi-sr-phone-call"></i>&nbsp;033.3783.9146
            </p>
            <p>
              <i class="fi fi-sr-envelope"></i>&nbsp;phucdat4102@gmail.com
            </p>
            <p>
              <i class="fi fi-ss-marker"></i>&nbsp;2014 Quốc lộ 5, làng Bảo
              Mệnh, Lục Địa Bình Minh
            </p>
          </div>
          <div className="split-row">
            <h3>
              <Link
                to="https://www.facebook.com/MinMinPD2211/"
                target="_blank"
                rel="noopener noreferrer"
              >
                Về chúng tôi
              </Link>
            </h3>
            <h3>
              <Link
                to="https://www.youtube.com/channel/UCD2T2jAlO282XPmDfftRpvw"
                target="_blank"
                rel="noopener noreferrer"
              >
                Dịch vụ
              </Link>
            </h3>
            <h3>
              <Link
                to="https://twitter.com/PHAN_DUONG_MINH"
                target="_blank"
                rel="noopener noreferrer"
              >
                Chính sách bảo mật
              </Link>
            </h3>
            <h3>
              <Link
                to="https://www.linkedin.com/in/phan-phúc-đạt-b88871243/"
                target="_blank"
                rel="noopener noreferrer"
              >
                Điều khoản
              </Link>
            </h3>
            <h3>Liên hệ trực tuyến</h3>
            <div className="social-media">
              <Link
                to="https://www.facebook.com/MinMinPD2211/"
                target="_blank"
                rel="noopener noreferrer"
              >
                <i className="fi fi-brands-facebook"></i>
              </Link>
              <Link
                to="https://twitter.com/PHAN_DUONG_MINH"
                target="_blank"
                rel="noopener noreferrer"
              >
                <i className="fi fi-brands-twitter"></i>
              </Link>
              <Link
                to="https://www.youtube.com/channel/UCD2T2jAlO282XPmDfftRpvw"
                target="_blank"
                rel="noopener noreferrer"
              >
                <i className="fi fi-brands-youtube"></i>
              </Link>
              <Link
                to="https://www.linkedin.com/in/phan-phúc-đạt-b88871243/"
                target="_blank"
                rel="noopener noreferrer"
              >
                <i className="fi fi-brands-linkedin"></i>
              </Link>
            </div>
          </div>
        </div>

        <div className="footer__row copyright">
          Copyright © 2023 Sunrise Continent - All rights reserved || Designed
          By: Phan Phuc Dat
        </div>
      </div>
    </footer>
  );
};

export default Footer;
