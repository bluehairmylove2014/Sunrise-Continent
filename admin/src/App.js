import { Routes, Route, Navigate } from "react-router-dom";
import { BusinessLogicProvider } from "./libs/business-logic/src/provider";

// Notification library
import { Toaster } from "react-hot-toast";

// Constant
import { PAGES } from "./constants/Link.constants";

// Global style
import "./App.scss";

import { NormalPageLayout } from "./components/templates/NormalPageLayout/NormalPageLayout";
import Dashboard from "./pages/Dashboard/Dashboard";
import UserManagement from "./pages/UserManagement/UserManagement";
import HotelManagement from "./pages/HotelManagement/HotelManagement";
import VoucherManagement from "./pages/VoucherManagement/VoucherManagement";
import Auth from "./pages/Authentication/Authentication";

function App() {
  return (
    <BusinessLogicProvider>
      <div className="App">
        <div className="app__notification">
          <Toaster />
        </div>
        <Routes>
          <Route
            exact
            path={PAGES.HOME}
            element={<Navigate to={PAGES.DASHBOARD} />}
          />
          <Route
            path={PAGES.DASHBOARD}
            element={
              <NormalPageLayout>
                <Dashboard />
              </NormalPageLayout>
            }
          />
          <Route
            path={PAGES.USERS}
            element={
              <NormalPageLayout>
                <UserManagement />
              </NormalPageLayout>
            }
          />
          <Route
            path={PAGES.HOTEL}
            element={
              <NormalPageLayout>
                <HotelManagement />
              </NormalPageLayout>
            }
          />
          <Route
            path={PAGES.VOUCHER}
            element={
              <NormalPageLayout>
                <VoucherManagement />
              </NormalPageLayout>
            }
          />
          <Route
            exact
            path={PAGES.AUTH}
            element={<Navigate to={PAGES.LOGIN} />}
          />
          <Route path={PAGES.LOGIN} element={<Auth />} />
          <Route
            path={PAGES.REGISTER}
            element={<Navigate to={PAGES.LOGIN} />}
          />
        </Routes>
      </div>
    </BusinessLogicProvider>
  );
}

export default App;
