import React from "react";
import { useContext } from "react";

export const VoucherContext = React.createContext({
  state: {
    voucher: null,
    accessToken: null,
  },
  dispatch: () => undefined,
});

export const useVoucherContext = () => {
  const context = useContext(VoucherContext);
  if (context === undefined) {
    throw new Error("useVoucherContext must be used within a VoucherProvider");
  }
  return context;
};
