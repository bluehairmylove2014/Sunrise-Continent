/* eslint-disable react-hooks/exhaustive-deps */
import React, { useContext } from "react";
import { AuthContext } from "../../lib/auth/process/context/authContext";

export const withTokenFromContext = (
  WrappedComponent
) => {
  const EnhancedComponent = (props) => {
    const {
      state: { token }
    } = useContext(AuthContext);

    return React.useMemo(
      () => <WrappedComponent {...props} accessToken={token ?? null} />,
      [token, props]
    );
  };

  return EnhancedComponent;
};
