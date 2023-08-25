import React from "react";
import "./HotelEdit.scss";
import { useForm } from "react-hook-form";
import { Controller } from "react-hook-form";
import { toggleClass } from "../../../utils/helpers/ToggleClass";

const HotelEdit = React.forwardRef(({ hotelDetail }, ref) => {
  const { control, handleSubmit } = useForm();

  const onSuccessSubmit = (data) => {
    console.log(data);
  };
  const onErrorSubmit = (err) => {
    console.log(err);
  };

  return (
    <div className="hotel-edit" ref={ref}>
      <div className="overlay"></div>
      <div className="hotel-edit__box-wrapper">
        <form
          className="hotel-edit__box"
          onSubmit={handleSubmit(onSuccessSubmit, onErrorSubmit)}
        >
          <Controller
            name="name"
            control={control}
            defaultValue={hotelDetail.name}
            rules={{
              required: {
                value: true,
                message: "Hotel name is required",
              },
            }}
            render={({ field }) => (
              <div className="input-wrapper">
                <label htmlFor="name">Hotel name</label>
                <input id="name" {...field} type="text" />
              </div>
            )}
          />
          <Controller
            name="description"
            control={control}
            defaultValue={hotelDetail.description}
            render={({ field }) => (
              <div className="input-wrapper">
                <label htmlFor="description">Description</label>
                <input id="description" {...field} type="text" />
              </div>
            )}
          />
          <div className="hotel-edit__address">
            <Controller
              name="address"
              control={control}
              defaultValue={hotelDetail.address}
              rules={{
                required: {
                  value: true,
                  message: "Address is required",
                },
              }}
              render={({ field }) => (
                <div className="input-wrapper">
                  <label htmlFor="address">Address</label>
                  <input id="address" {...field} type="text" />
                </div>
              )}
            />
            <Controller
              name="provinceCity"
              control={control}
              defaultValue={hotelDetail.provinceCity}
              rules={{
                required: {
                  value: true,
                  message: "Province / City is required",
                },
              }}
              render={({ field }) => (
                <div className="input-wrapper">
                  <label htmlFor="provinceCity">Province / City</label>
                  <input id="provinceCity" {...field} type="text" />
                </div>
              )}
            />
            <Controller
              name="country"
              control={control}
              defaultValue={hotelDetail.country}
              rules={{
                required: {
                  value: true,
                  message: "Country is required",
                },
              }}
              render={({ field }) => (
                <div className="input-wrapper">
                  <label htmlFor="country">Country</label>
                  <input id="country" {...field} type="text" />
                </div>
              )}
            />
          </div>
          <div className="btn-wrapper">
            <button type="submit">Confirm</button>
            <button
              type="button"
              onClick={() => toggleClass(ref.current, "active")}
            >
              Cancel
            </button>
          </div>
        </form>
      </div>
    </div>
  );
});

export default HotelEdit;
