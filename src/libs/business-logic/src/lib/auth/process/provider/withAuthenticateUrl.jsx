/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useState } from "react";
import { Loader, authUrls } from "../../config";
import { useAuthContext } from "../context";
import { getWindowInstance } from "../helper/windowHelper";
import { useAccessToken } from "../hooks/useAccessToken";

export const withAuthenticateUrl = (WrappedComponent) => {
  const EnhancedComponent = (props) => {
    const windowInstance = getWindowInstance();
    const currentUrl = windowInstance && windowInstance.location.pathname;
    const [isLoaderActive, setIsLoaderActive] = useState(true);
    const { getToken } = useAccessToken();
    const { state } = useAuthContext();
    const isLoggedIn = Boolean(state.token || getToken());

    useEffect(() => {
      if (!currentUrl || isLoggedIn) {
        setIsLoaderActive(false);
      } else {
        const target = authUrls.find((u) => currentUrl.includes(u.authUrl));
        if (target && windowInstance) {
          windowInstance.location.href = target.redirectUrl;
        } else {
          setIsLoaderActive(false);
        }
      }
    }, [currentUrl, isLoggedIn, state.token]);

    return isLoaderActive ? <Loader /> : <WrappedComponent {...props} />;
  };

  return EnhancedComponent;
};
