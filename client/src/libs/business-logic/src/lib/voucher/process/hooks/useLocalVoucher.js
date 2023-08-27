import { useVoucherContext } from "../context";

export const useLocalVoucher = () => {
  const { state, dispatch } = useVoucherContext();

  const addVoucher = ({ voucherData, quantity }) => {
    if (!voucherData) return;
    const copyContextVoucher = [...state.voucher];
    if (copyContextVoucher && Array.isArray(copyContextVoucher)) {
      const sameVoucherIndex = copyContextVoucher.findIndex(
        (v) => v.voucherId === voucherData.voucherId
      );
      if (sameVoucherIndex !== -1) {
        copyContextVoucher[sameVoucherIndex].quantity += quantity;
      } else {
        copyContextVoucher.push({ ...voucherData, quantity });
      }
    } else {
      dispatch({
        type: "SET_VOUCHER",
        payload: [voucherData],
      });
    }
  };
  const useVoucher = ({ voucherId }) => {
    if (!voucherId) return;
    const copyContextVoucher = [...state.voucher];

    if (copyContextVoucher && Array.isArray(copyContextVoucher)) {
      const sameVoucherIndex = copyContextVoucher.findIndex(
        (v) => v.voucherId === voucherId
      );
      if (sameVoucherIndex !== -1) {
        if (copyContextVoucher[sameVoucherIndex].quantity === 1) {
          copyContextVoucher.splice(sameVoucherIndex, 1);
        } else {
          copyContextVoucher[sameVoucherIndex].quantity -= 1;
        }
      }
    }
  };

  return {
    addVoucher,
    useVoucher,
  };
};
