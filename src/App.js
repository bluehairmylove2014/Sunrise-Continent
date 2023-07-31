import { Routes, Route, Navigate } from "react-router-dom";
import { Suspense, lazy, useEffect, useState } from "react";
import { BusinessLogicProvider } from "./libs/business-logic/src/provider";

// Notification library
import { Toaster } from "react-hot-toast";

// Constant
import { PAGES } from "./constants/Link.constants";

// Global style
import "./App.scss";

// Component
import Header from "./components/layouts/Header";
import Footer from "./components/layouts/Footer";
import PageLoader from "./components/common/PageLoader";

// Redux
import { Provider } from "react-redux";
import redux_store from "./redux/store";
import { useIsLogged } from "./libs/business-logic/src/lib/auth";

// Code spliting, lazy loading component
const HomePage = lazy(() => import("./pages/Home/Home"));
const SearchPage = lazy(() => import("./pages/Search/Search"));
const HotelDetail = lazy(() => import("./pages/HotelDetail/HotelDetail"));
const PreCheckout = lazy(() => import("./pages/PreCheckout/PreCheckout"));
const AuthenticationPage = lazy(() =>
  import("./pages/Authentication/Authentication")
);

function App() {
  const [isLoading, setIsLoading] = useState(true);
  const isLoggedIn = useIsLogged();

  useEffect(() => {
    const timer = setTimeout(() => {
      setIsLoading(false);
    }, 1000);

    // Dọn dẹp khi component unmount
    return () => {
      clearTimeout(timer);
    };
  }, []);

  return (
    <Provider store={redux_store}>
      <BusinessLogicProvider>
        <div className="App">
          <div className="app__notification">
            <Toaster />
          </div>
          <Suspense fallback={<PageLoader />}>
            {isLoading ? (
              <PageLoader />
            ) : (
              <Routes>
                <Route
                  exact
                  path={PAGES.HOME}
                  element={
                    <>
                      <Header />
                      <HomePage />
                      <Footer />
                    </>
                  }
                />
                <Route
                  path={PAGES.SEARCH}
                  element={
                    <>
                      <Header></Header>
                      <SearchPage></SearchPage>
                      <Footer></Footer>
                    </>
                  }
                />
                <Route
                  path={PAGES.HOTEL_DETAIL}
                  element={
                    <>
                      <Header></Header>
                      <HotelDetail></HotelDetail>
                      <Footer></Footer>
                    </>
                  }
                />
                <Route
                  path={PAGES.PRE_CHECKOUT}
                  element={
                    isLoggedIn ? (
                      <>
                        <Header></Header>
                        <PreCheckout></PreCheckout>
                        <Footer></Footer>
                      </>
                    ) : (
                      <Navigate to={PAGES.LOGIN} replace={true} />
                    )
                  }
                />
                <Route
                  exact
                  path={PAGES.LOGIN}
                  element={
                    !isLoggedIn ? (
                      <AuthenticationPage />
                    ) : (
                      <Navigate to={PAGES.HOME} replace={true} />
                    )
                  }
                />
                <Route
                  exact
                  path={PAGES.REGISTER}
                  element={
                    !isLoggedIn ? (
                      <AuthenticationPage />
                    ) : (
                      <Navigate to={PAGES.HOME} replace={true} />
                    )
                  }
                />
              </Routes>
            )}
          </Suspense>
        </div>
      </BusinessLogicProvider>
    </Provider>
  );
}

export default App;
