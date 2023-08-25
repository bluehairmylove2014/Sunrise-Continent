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
import Orders from "./pages/Orders/Orders";
import Hotel from "./pages/Hotel/Hotel";
import Voucher from "./pages/Voucher/Voucher";

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
            path={PAGES.ORDERS}
            element={
              <NormalPageLayout>
                <Orders />
              </NormalPageLayout>
            }
          />
          <Route
            path={PAGES.HOTEL}
            element={
              <NormalPageLayout>
                <Hotel />
              </NormalPageLayout>
            }
          />
          <Route
            path={PAGES.VOUCHER}
            element={
              <NormalPageLayout>
                <Voucher />
              </NormalPageLayout>
            }
          />
        </Routes>
      </div>
    </BusinessLogicProvider>
  );
}

export default App;
