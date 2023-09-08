import { useEffect, useState } from "react";
import Footer from "../../organisms/Footer/Footer";
import Header from "../../organisms/Header/Header";
import { useLocation } from "react-router-dom";
import NavigationBar from "../../organisms/NavigationBar/NavigationBar";
import "./normalPageLayout.scss";

export const NormalPageLayout = ({ children }) => {
  const [showScrollButton, setShowScrollButton] = useState(false);
  const location = useLocation();
  // Handle the scroll event to show/hide the scroll button
  const handleScroll = () => {
    if (window.scrollY > 200) {
      // Adjust the value as needed
      setShowScrollButton(true);
    } else {
      setShowScrollButton(false);
    }
  };

  // Attach the scroll event listener when the component mounts
  useEffect(() => {
    window.addEventListener("scroll", handleScroll);
    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, []);

  // Scroll to the top when the scroll button is clicked
  const scrollToTop = () => {
    window.scrollTo({ top: 0, behavior: "smooth" });
  };

  useEffect(() => {
    window.scrollTo({ top: 0, behavior: "smooth" });
  }, [location]);

  return (
    <div className="normal-page-layout">
      <NavigationBar />
      <div className="main-layout">
        <Header />
        <div className="scrollable-content">{children}</div>
        <button
          className={`scroll-button ${showScrollButton ? "active" : ""}`}
          onClick={scrollToTop}
        >
          <i className="fi fi-sr-up"></i>
        </button>
      </div>
      <Footer />
    </div>
  );
};
