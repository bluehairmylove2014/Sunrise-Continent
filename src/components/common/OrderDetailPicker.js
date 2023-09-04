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
import { useInitOrder } from "../../libs/business-logic/src/lib/order/process/hooks";

const OrderDetailPicker = React.forwardRef(
  ({ form, defaultValues, roomDetail, edit, editCallback }, ref) => {
    if (!Array.isArray(roomDetail)) {
      roomDetail = [
        {
          hotel: {
            id: roomDetail.hotelId,
          },
          rooms: [
            {
              id: roomDetail.id,
              name: roomDetail.name,
              price: roomDetail.price,
            },
          ],
        },
      ];
    }

    const navigate = useNavigate();
    const isLoggedIn = useIsLogged();
    const { onCheckRoomAvailable, isLoading: isCheckingRoomAvailable } =
      useCheckRoomAvailable();
    const { onInitOrder } = useInitOrder();
    const checkRoomsAvailability = (
      selectedRooms,
      checkIn,
      checkOut,
      numberOfRooms
    ) => {
      const promises = selectedRooms.rooms.map((detail) => {
        return onCheckRoomAvailable({
          HotelId: selectedRooms.hotel.id,
          RoomTypeId: detail.id,
          NumberOfRoom: numberOfRooms,
          CheckIn: checkIn,
          CheckOut: checkOut,
        });
      });

      return Promise.all(promises);
    };

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
          if (
            !data ||
            !data.start_date ||
            !data.end_date ||
            data.start_date.length === 0 ||
            data.end_date.length === 0
          ) {
            toast.error("Hãy chọn ngày đến và ngày đi");
            return;
          }
          if (data.start_date === data.end_date) {
            toast.error("Ngày đến phải khác với ngày đi");
            return;
          }
          checkRoomsAvailability(rd, data.start_date, data.end_date, data.rooms)
            .then((results) => {
              const allAvailable = results.every((isAvailable) => isAvailable);
              if (allAvailable) {
                onInitOrder({
                  fullName: null,
                  nation: null,
                  dateOfBirth: null,
                  email: null,
                  phoneNumber: null,
                  specialNeeds: null,
                  notes: null,
                  voucherId: null,
                  total: null,
                  orders: rd.rooms.map((detail) => ({
                    hotelId: rd.hotel.id,
                    roomTypeId: detail.id,
                    checkIn: data.start_date,
                    checkOut: data.end_date,
                    numberOfRoom: data.rooms,
                    adults: data.adults,
                    childrens: data.childrens,
                  })),
                });

                navigate(PAGES.PRE_CHECKOUT);
                toast.success("Thành công");
                toggleClass(ref.current, "active");
              } else {
                toast.error("Phòng đã hết chỗ vào ngày này!");
              }
            })
            .catch((error) => {
              toast.error(error.response.data.message || error.message);
            });
        }
      }
    };

    return (
      <form
        className="room__pre-checkout-picker"
        ref={ref}
        onSubmit={form.handleSubmit((data) =>
          onPreCheckout(data, roomDetail[0])
        )}
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
