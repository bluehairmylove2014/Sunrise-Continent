import React from "react";
import BannerInput from "../../components/common/BannerInput";
import "../../styles/common/OrderDetailPicker.scss";
import TypingLoader from "../../components/common/Loader/TypingLoader";
import { useCheckRoomAvailable } from "../../libs/business-logic/src/lib/hotel/process/hooks";
import { useNavigate } from "react-router-dom";
import { useIsLogged } from "../../libs/business-logic/src/lib/auth/process/hooks";
import { toggleClass } from "../../utils/helpers/ToggleClass";
import { BANNER_INPUT } from "../../constants/Variables.constants";
import { setRedirectUrl } from "../../utils/helpers/RedirectUrlSaver";
import { PAGES } from "../../constants/Link.constants";
import { toast } from "react-hot-toast";

const OrderDetailPicker = React.forwardRef(
  ({ form, defaultValues, roomDetail, edit, editCallback }, ref) => {
    const navigate = useNavigate();
    const isLoggedIn = useIsLogged();
    const { onCheckRoomAvailable, isLoading: isCheckingRoomAvailable } =
      useCheckRoomAvailable();

    const onPreCheckout = (data, rd) => {
      if (!isLoggedIn) {
        setRedirectUrl(window.location.pathname + window.location.search);
        navigate("/login");
      } else {
        if (edit) {
          try {
            editCallback(form.getValues());
            toast.success("Success");
            toggleClass(ref.current, "active");
          } catch (err) {
            toast.error("Edit error!");
            console.error(err);
          }
        } else {
          if (data.start_date.length === 0 || data.end_date.length === 0) {
            toast.error("Hãy chọn ngày bắt đầu và ngày kết thúc");
            return;
          }
          // Check room available
          onCheckRoomAvailable({
            HotelId: rd.hotelId,
            RoomTypeId: rd.id,
            NumberOfRoom: data.rooms,
            CheckIn: data.start_date,
            CheckOut: data.end_date,
          })
            .then((message) => {
              navigate(
                PAGES.PRE_CHECKOUT +
                  `?hotelID=${rd.hotelId}&roomID=${rd.id}` +
                  `&start_date=${data.start_date}&end_date=${data.end_date}` +
                  `&adults=${defaultValues.adults}` +
                  `&childrens=${defaultValues.childrens}` +
                  `&rooms=${defaultValues.rooms}`
              );
              toast.success(message);
            })
            .catch((error) => {
              toast.error(error.message);
            });
        }
      }
    };

    return (
      <form
        className="room__pre-checkout-picker"
        ref={ref}
        onSubmit={form.handleSubmit((data) => onPreCheckout(data, roomDetail))}
      >
        {isCheckingRoomAvailable && (
          <div className="pre-checkout-picker__loading">
            <TypingLoader />
          </div>
        )}
        <div className="pre-checkout-picker__title">
          <button
            className="close-btn"
            onClick={() => {
              BANNER_INPUT.DATE_TIME_DOUBLE.INPUT_NAME.forEach((iname) =>
                form.setValue(iname, defaultValues[iname])
              );
              BANNER_INPUT.PEOPLE_AND_ROOM.INPUT_NAME.forEach((iname, index) =>
                form.setValue(
                  iname,
                  BANNER_INPUT.PEOPLE_AND_ROOM.MIN_VALUE[index]
                )
              );
              toggleClass(ref.current);
            }}
            type="button"
          >
            <i className="fi fi-rr-left"></i>
          </button>
          <p>Thông tin cần thiết</p>
          <div></div>
        </div>
        <div className="criteria-board__input-wrapper">
          <h6>Ngày đặt phòng</h6>
          <BannerInput
            name={BANNER_INPUT.DATE_TIME_DOUBLE.INPUT_NAME}
            type={BANNER_INPUT.DATE_TIME_DOUBLE.TYPE}
            form={form}
            background={"#fdeee6"}
          />
          <br />
          <h6>Chi tiết phòng</h6>
          <BannerInput
            name={BANNER_INPUT.PEOPLE_AND_ROOM.INPUT_NAME}
            title={BANNER_INPUT.PEOPLE_AND_ROOM.TITLE}
            description={BANNER_INPUT.PEOPLE_AND_ROOM.DESCRIPTION}
            type={BANNER_INPUT.PEOPLE_AND_ROOM.TYPE}
            min={BANNER_INPUT.PEOPLE_AND_ROOM.MIN_VALUE}
            form={form}
            background={"#fdeee6"}
          />
        </div>
        <button type="submit" className="search__submit-btn">
          Xác nhận
        </button>
        {/* <button type="button" className="search__submit-btn add-to-cart">
          Thêm vào giỏ hàng
        </button> */}
      </form>
    );
  }
);

export default OrderDetailPicker;
