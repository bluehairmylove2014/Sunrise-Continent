import React, { useEffect, useRef, useState } from "react";
import voucherIcon from "../../../assets/images/icons/gift-voucher.png";
import { RankList } from "../../../constants/Rank";
import "./voucher.scss";
import { VOUCHER_DISPLAY_TYPE } from "../../../constants/Variables.constants";
import { toggleClass } from "../../../utils/helpers/ToggleClass";
import { Controller, useForm } from "react-hook-form";
import { toast } from "react-hot-toast";
import YesNoConfirm from "../YesNoPopup/YesNoPopup";
import { useRedeem } from "../../../libs/business-logic/src/lib/voucher/process/hooks";

function convertRankToEnglish(vietnameseRank) {
  const rankKeys = Object.keys(RankList);
  for (const key of rankKeys) {
    if (RankList[key].label === vietnameseRank) {
      return key;
    }
  }
  return null;
}
const Voucher = ({ voucherData, chooseVoucherCallback, type }) => {
  const voucherRef = useRef(null);
  const popupRef = useRef(null);
  const { control, setValue, handleSubmit, getValues } = useForm({
    defaultValues: {
      checkoutQuantity: 1,
    },
  });
  const [targetCheckout, setTargetCheckout] = useState(null);
  const { onRedeemVoucher, isLoading: isRedeeming } = useRedeem();

  const handleClick = () => {
    if (type === VOUCHER_DISPLAY_TYPE.SHOP) {
      toggleClass(voucherRef.current, "active");
    } else if (type === VOUCHER_DISPLAY_TYPE.STORAGE) {
      chooseVoucherCallback && chooseVoucherCallback(voucherData);
    }
  };

  const handleCheckout = ({ checkoutQuantity }) => {
    if (!checkoutQuantity) {
      toast.error("Quantity is invalid");
    } else {
      setTargetCheckout({
        point: voucherData.point,
        quantity: checkoutQuantity,
      });
    }
  };
  const handleBuyVoucher = (value) => {
    if (value) {
      if (targetCheckout) {
        // Call api to redeem
        onRedeemVoucher({
          voucherData: voucherData,
          quantity: targetCheckout.quantity,
        })
          .then((res) => {
            toast.success(res.message);
          })
          .catch((err) => {
            toast.error(err.message);
          });
      } else {
        toast.error("Voucher invalid");
      }
    }
    toggleClass(popupRef.current, "active");
  };
  const handleCheckoutError = (err) => {
    toast.error(err.checkoutQuantity.message);
  };

  useEffect(() => {
    if (targetCheckout) {
      toggleClass(popupRef.current, "active");
    }
  }, [targetCheckout]);

  return (
    <>
      <div
        className={`voucher__wrapper ${
          type === VOUCHER_DISPLAY_TYPE.SHOP
            ? "shop"
            : type === VOUCHER_DISPLAY_TYPE.NO_ACTION
            ? "no-action"
            : "storage"
        } `}
      >
        <div
          className={`voucher ${convertRankToEnglish(
            RankList[voucherData.requiredRank].label
          )}`}
          key={voucherData.voucherId}
          onClick={() => handleClick(voucherData)}
          ref={voucherRef}
        >
          <div className="dot"></div>
          <div className="dot"></div>
          <img src={voucherIcon} alt="voucher" />
          <div className="voucher__content">
            <h6>{voucherData.name}</h6>
            <small className="voucher__quantity">
              Số lượng: {voucherData.quantity}
            </small>
          </div>
          <div className="rank">
            <img src={RankList[voucherData.requiredRank].image} alt="rank" />
          </div>
        </div>
        {type === VOUCHER_DISPLAY_TYPE.SHOP ? (
          <form
            className="voucher__checkout"
            onSubmit={handleSubmit(handleCheckout, handleCheckoutError)}
          >
            <small className="voucher__ready-to-buy">
              Có thể mua thêm: Unlimited
            </small>
            <small className="voucher__needed-point">
              Điểm cần có: {voucherData.point}
            </small>
            <div className="interact__wrapper">
              <div className="checkout__quantity">
                <button
                  type="button"
                  className="decrease"
                  // disabled={getValues().checkoutQuantity <= 1}
                  onClick={() => {
                    getValues().checkoutQuantity > 1 &&
                      setValue(
                        "checkoutQuantity",
                        getValues().checkoutQuantity - 1
                      );
                  }}
                >
                  -
                </button>
                <Controller
                  name={"checkoutQuantity"}
                  control={control}
                  rules={{
                    require: "This field must not be empty",
                    min: {
                      value: 1,
                      message: "Số lượng phải lớn hơn 1",
                    },
                  }}
                  render={({ field }) => (
                    <div className="quantity__input">
                      <input
                        {...field}
                        className="quantity"
                        type="number"
                        onChange={(e) => {
                          setValue("checkoutQuantity", Number(e.target.value));
                        }}
                      />
                    </div>
                  )}
                />

                <button
                  type="button"
                  className="increase"
                  onClick={() => {
                    setValue(
                      "checkoutQuantity",
                      getValues().checkoutQuantity + 1
                    );
                  }}
                >
                  +
                </button>
              </div>
              <button
                className="checkout__button"
                type="submit"
                disabled={isRedeeming}
              >
                Mua
              </button>
            </div>
          </form>
        ) : (
          <></>
        )}

        <div className={`voucher__loading ${isRedeeming ? "active" : ""}`}>
          <div className="loader"></div>
        </div>
      </div>
      <YesNoConfirm
        label={
          `Xác nhận mua ${
            targetCheckout ? targetCheckout.quantity : 0
          } voucher này với ` +
          `${
            targetCheckout ? targetCheckout.point * targetCheckout.quantity : 0
          } điểm?`
        }
        callback={handleBuyVoucher}
        ref={popupRef}
      />
    </>
  );
};

export default Voucher;
