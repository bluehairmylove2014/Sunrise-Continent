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

import { UserPageLayout } from "./components/layouts/UserPageLayout";
import HomePage from "./pages/Home/Home";
// Lazy loading component=
// const SearchPage = lazy(() => import("./pages/Search/Search"));

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
              <Route path={PAGES.HOME} element={<UserPageLayout />}>
                <Route index element={<HomePage />} />
              </Route>
              {/* <Route
                  exact
                  path={PAGES.LOGIN}
                  element={<AuthenticationPage />}
                /> */}
            </Routes>
          )}
        </Suspense>
      </div>
    </BusinessLogicProvider>
  );
}

export default App;
