import { useVoucherContext } from "../context";

export const useLocalVoucher = () => {
  const { state, dispatch } = useVoucherContext();

  const setVoucherList = ({ voucherList }) => {
    dispatch({
      type: "SET_VOUCHER",
      payload: voucherList,
    });
  };
  const addVoucher = ({ voucherData }) => {
    if (!voucherData) return;
    let copyContextVoucher = Array.isArray(state.voucher)
      ? [...state.voucher]
      : [];

    // Tìm voucherId lớn nhất trong mảng hiện tại
    const maxVoucherId = Math.max(
      ...copyContextVoucher.map((voucher) => voucher.voucherId),
      0
    );

    // Kiểm tra nếu có chỗ trống (voucherId bị thiếu)
    let newVoucherId = maxVoucherId + 1;
    for (let i = 1; i <= maxVoucherId; i++) {
      if (!copyContextVoucher.some((voucher) => voucher.voucherId === i)) {
        newVoucherId = i;
        break;
      }
    }

    // Thiết lập voucherId cho voucher mới
    Object.assign(voucherData, { voucherId: newVoucherId });

    if (Array.isArray(copyContextVoucher)) {
      copyContextVoucher.push(voucherData);
    } else {
      copyContextVoucher = [voucherData];
    }
    dispatch({
      type: "SET_VOUCHER",
      payload: copyContextVoucher,
    });
  };
  const deleteVouchers = ({ voucherIdList }) => {
    if (!Array.isArray(voucherIdList)) return;
    dispatch({
      type: "SET_VOUCHER",
      payload: [...state.voucher].filter(
        (voucher) => !voucherIdList.includes(voucher.voucherId)
      ),
    });
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
    setVoucherList,
    addVoucher,
    useVoucher,
    deleteVouchers,
  };
};
