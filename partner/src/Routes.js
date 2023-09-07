import React from "react";
import { Routes as Switch, Route, Navigate } from "react-router-dom";
import { PAGES } from "./constants/Link.constants";

import { NormalPageLayout } from "./components/templates/NormalPageLayout/NormalPageLayout";
import Dashboard from "./pages/Dashboard/Dashboard";
import Orders from "./pages/Orders/Orders";
import Hotel from "./pages/Hotel/Hotel";
import Voucher from "./pages/Voucher/Voucher";
import Auth from "./pages/Authentication/Authentication";
import CreateHotel from "./pages/CreateHotel/CreateHotel";
import { useGetUser } from "./libs/business-logic/src/lib/auth/process/hooks";
import PageLoader from "./components/common/Loader/PageLoader";

const Routes = () => {
  const partnerData = useGetUser();
  const hotelId = partnerData ? partnerData.hotelId : null;
  return partnerData || partnerData === null ? (
    <Switch>
      <Route
        exact
        path={PAGES.HOME}
        element={<Navigate to={PAGES.DASHBOARD} />}
      />
      <Route
        path={PAGES.DASHBOARD}
        element={
          !hotelId ? (
            <Navigate to={PAGES.CREATE_HOTEL} />
          ) : (
            <NormalPageLayout>
              <Dashboard />
            </NormalPageLayout>
          )
        }
      />
      <Route
        path={PAGES.ORDERS}
        element={
          !hotelId ? (
            <Navigate to={PAGES.CREATE_HOTEL} />
          ) : (
            <NormalPageLayout>
              <Orders />
            </NormalPageLayout>
          )
        }
      />
      <Route
        path={PAGES.HOTEL}
        element={
          !hotelId ? (
            <Navigate to={PAGES.CREATE_HOTEL} />
          ) : (
            <NormalPageLayout>
              <Hotel />
            </NormalPageLayout>
          )
        }
      />
      <Route
        path={PAGES.VOUCHER}
        element={
          !hotelId ? (
            <Navigate to={PAGES.CREATE_HOTEL} />
          ) : (
            <NormalPageLayout>
              <Voucher />
            </NormalPageLayout>
          )
        }
      />
      <Route
        path={PAGES.CREATE_HOTEL}
        element={hotelId ? <Navigate to={PAGES.DASHBOARD} /> : <CreateHotel />}
      />
      <Route exact path={PAGES.AUTH} element={<Navigate to={PAGES.LOGIN} />} />
      <Route path={PAGES.LOGIN} element={<Auth />} />
      <Route path={PAGES.REGISTER} element={<Auth />} />
    </Switch>
  ) : (
    <PageLoader />
  );
};

export default Routes;
