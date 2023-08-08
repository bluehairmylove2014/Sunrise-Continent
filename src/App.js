import { Routes, Route } from "react-router-dom";
import { Suspense, lazy, useEffect, useState } from "react";
import { BusinessLogicProvider } from "./libs/business-logic/src/provider";

// Notification library
import { Toaster } from "react-hot-toast";

// Constant
import { PAGES } from "./constants/Link.constants";

// Global style
import "./App.scss";

// Component
import PageLoader from "./components/common/Loader/PageLoader";

// Redux
import { Provider } from "react-redux";
import redux_store from "./redux/store";

import { UserPageLayout } from "./components/layouts/UserPageLayout";
import HomePage from "./pages/Home/Home";
// Code spliting, lazy loading component=
const SearchPage = lazy(() => import("./pages/Search/Search"));
const HotelDetail = lazy(() => import("./pages/HotelDetail/HotelDetail"));
const PreCheckout = lazy(() => import("./pages/PreCheckout/PreCheckout"));
const AuthenticationPage = lazy(() =>
  import("./pages/Authentication/Authentication")
);

function App() {
  const [isLoading, setIsLoading] = useState(true);

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
                    <UserPageLayout>
                      <HomePage />
                    </UserPageLayout>
                  }
                />
                <Route
                  path={PAGES.SEARCH}
                  element={
                    <UserPageLayout>
                      <SearchPage />
                    </UserPageLayout>
                  }
                />
                <Route
                  path={PAGES.HOTEL_DETAIL}
                  element={
                    <UserPageLayout>
                      <HotelDetail />
                    </UserPageLayout>
                  }
                />
                <Route
                  path={PAGES.PRE_CHECKOUT}
                  element={
                    <UserPageLayout>
                      <PreCheckout />
                    </UserPageLayout>
                  }
                />
                <Route
                  exact
                  path={PAGES.LOGIN}
                  element={<AuthenticationPage />}
                />
                <Route
                  exact
                  path={PAGES.REGISTER}
                  element={<AuthenticationPage />}
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
