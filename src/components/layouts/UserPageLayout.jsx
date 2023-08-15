import { useEffect, useState } from "react";
import Footer from "./Footer";
import Header from "./Header";
import { useLocation } from "react-router-dom";

export const UserPageLayout = ({ children }) => {
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
    <>
      <Header />
      {children}
      <button
        className={`scroll-button ${showScrollButton ? "active" : ""}`}
        onClick={scrollToTop}
      >
        <i className="fi fi-sr-up"></i>
      </button>
      <Footer />
    </>
  );
};
