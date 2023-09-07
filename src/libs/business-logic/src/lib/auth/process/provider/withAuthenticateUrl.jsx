/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useState } from "react";
import { Loader, authUrls, needLocalOrderUrls } from "../../config";
import { useAuthContext } from "../context";
import { getWindowInstance } from "../helper/windowHelper";
import { useAccessToken } from "../hooks/useAccessToken";
import { useLocation, useNavigate } from "react-router";
import { LOCAL_STORAGE_KEYS } from "../../../../configs/constants";

export const withAuthenticateUrl = (WrappedComponent) => {
  const EnhancedComponent = (props) => {
    /**
     * UPDATE METHODS TO GET PATHNAME RIGHT HERE
     * RECOMMEND:
     * + React: useLocation
     * + Next: useRouter
     */
    const location = useLocation();
    const currentPathname = location.pathname;

    const navigator = useNavigate();
    /**
     * DEFINE REDIRECT METHODS RIGHT HERE
     * @param {string} redirectUrl
     */
    const redirectMethods = (redirectUrl) => {
      navigator(redirectUrl, { replace: true });
      // windowInstance.location.href = redirectUrl;
    };

    const windowInstance = getWindowInstance();
    const [isLoaderActive, setIsLoaderActive] = useState(true);
    const { getToken } = useAccessToken();
    const { state } = useAuthContext();
    const isLoggedIn = Boolean(state.token || getToken());

    // Addition condition to serve /success-order, /pre-checkout, /checkout

    useEffect(() => {
      !currentPathname && setIsLoaderActive(false);
      if (currentPathname === "/") {
        setIsLoaderActive(false);
      } else {
        // Check need local order url
        const localOrder =
          typeof window !== "undefined"
            ? JSON.parse(window.localStorage.getItem(LOCAL_STORAGE_KEYS.ORDER))
            : null;
        console.log("CHECK: ", localOrder);
        if (
          needLocalOrderUrls.find((u) => currentPathname.includes(u.authUrl)) &&
          !localOrder
        ) {
          const target = needLocalOrderUrls.find((u) =>
            currentPathname.includes(u.authUrl)
          );
          redirectMethods(target?.redirectUrl || "");
        } else if (
          JSON.parse(
            window.localStorage.getItem(LOCAL_STORAGE_KEYS.CAN_SUCCESS_ORDER)
          ) === false &&
          currentPathname.includes("/success-order")
        ) {
          redirectMethods("");
        }

        // Check Auth url
        else if (isLoggedIn) {
          // Already logged in
          setIsLoaderActive(false);
        } else {
          // Not logged in
          const target = authUrls.find((u) =>
            currentPathname.includes(u.authUrl)
          );
          if (target && windowInstance) {
            // Autl url => redirect
            redirectMethods(target.redirectUrl);
          } else {
            // None autl url
            setIsLoaderActive(false);
          }
        }
      }
    }, [currentPathname, isLoggedIn, state.token]);

    return isLoaderActive ? <Loader /> : <WrappedComponent {...props} />;
  };

  return EnhancedComponent;
};
