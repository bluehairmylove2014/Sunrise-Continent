/* eslint-disable react-hooks/exhaustive-deps */
import React, { useContext } from "react";
import { AuthContext } from "../../lib/auth/process/context/authContext";
import { CartContext } from "../../lib/cart/process/context/cartContext";


export const withCartFromContext = (
  WrappedComponent
) => {
  const EnhancedComponent = (props) => {
    const {
      state: { token }
    } = useContext(AuthContext);
    const {
      state: { cart }
    } = useContext(CartContext);

    return React.useMemo(
      () => (
        <WrappedComponent
          {...props}
          accessToken={token ?? null}
          cart={cart ?? null}
        />
      ),
      [token, cart, cart?.items, props]
    );
  };

  return EnhancedComponent;
};
