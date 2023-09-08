import React, { useEffect, useRef, useState } from "react";
import "./HotelEdit.scss";
import { useForm } from "react-hook-form";
import { Controller } from "react-hook-form";
import { toggleClass } from "../../../utils/helpers/ToggleClass";
import { useEditHotel } from "../../../libs/business-logic/src/lib/hotel/process/hooks";
import { toast } from "react-hot-toast";
import { countries } from "./../../../constants/CountriesData";
import { provinces } from "./../../../constants/ProvinceCityData";
import { useUpload } from "../../../libs/business-logic/src/lib/sirv/process/hooks/useUpload";
import { generateImageVersion } from "../../../utils/helpers/imageVersion";

const HotelEdit = React.forwardRef(({ hotelDetail, callback }, ref) => {
  const editImageInputRef = useRef(null);
  const [hotelImage, setHotelImage] = useState(hotelDetail.image);
  const [isUploading, setIsUploading] = useState(false);
  const { onEditHotel, isLoading: isEditing } = useEditHotel();
  const { onUpload } = useUpload();
  const { control, handleSubmit, reset } = useForm({
    defaultValues: {
      name: hotelDetail.name,
      description: hotelDetail.description,
      address: hotelDetail.address,
      provinceCity: hotelDetail.provinceCity,
      country: hotelDetail.country,
    },
  });

  const onSuccessSubmit = ({
    name,
    description,
    address,
    provinceCity,
    country,
  }) => {
    if (typeof hotelImage !== "string") {
      // upload to sirv
      setIsUploading(true);
      onUpload({
        imgFile: hotelImage,
        hotelName: hotelDetail.name,
        imgName: `hotelThumbnail.${hotelImage.type.split("/")[1]}`,
      })
        .then((res) => {
          // Update to server
          const editHotelPkg = {
            ...hotelDetail,
            name,
            description,
            address,
            provinceCity,
            country,
            image: res.path,
          };
          onEditHotel(editHotelPkg)
            .then((msg) => toast.success(msg))
            .catch((err) => toast.error(err.message));
        })
        .catch((error) => {
          console.error("ERROR: ", error);
          toast.error("Unexpected Error");
        })
        .finally(() => {
          callback && callback();
          setIsUploading(false);
          toggleClass(ref.current, "active");
        });
    } else {
      const editHotelPkg = {
        ...hotelDetail,
        name,
        description,
        address,
        provinceCity,
        country,
        image: hotelImage.path,
      };
      onEditHotel(editHotelPkg)
        .then((msg) => toast.success(msg))
        .catch((err) => toast.error(err.message))
        .finally(() => {
          toggleClass(ref.current, "active");
        });
    }
  };
  const onErrorSubmit = (err) => {
    toast.error(err[Object.keys(err)[0]].message);
  };

  useEffect(() => {
    setHotelImage(hotelDetail.image);
  }, [hotelDetail]);

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
              rules={{
                required: {
                  value: true,
                  message: "Province / City is required",
                },
              }}
              render={({ field }) => (
                <div className="input-wrapper">
                  <label htmlFor="provinceCity">Province / City</label>

                  <select {...field} name="provinceCity" id="provinceCity">
                    <option value={""} disabled>
                      Chọn tỉnh / thành phố
                    </option>
                    {provinces.map((p) => (
                      <option
                        value={p}
                        defaultChecked={field.value === p}
                        key={p}
                      >
                        {p}
                      </option>
                    ))}
                  </select>
                </div>
              )}
            />
            <Controller
              name="country"
              control={control}
              rules={{
                required: {
                  value: true,
                  message: "Country is required",
                },
              }}
              render={({ field }) => (
                <div className="input-wrapper">
                  <label htmlFor="country">Country</label>
                  <select {...field} name="country" id="country">
                    <option value={""} disabled>
                      Chọn quốc gia
                    </option>
                    {countries.map((country) => (
                      <option
                        value={country.value}
                        defaultChecked={field.value === country.value}
                        key={country.value}
                      >
                        {country.name}
                      </option>
                    ))}
                  </select>
                </div>
              )}
            />
          </div>
          <div className="hotel-edit__image">
            <p>Ảnh đại diện khách sạn</p>
            <img
              src={
                typeof hotelImage === "string"
                  ? hotelImage + generateImageVersion()
                  : URL.createObjectURL(hotelImage)
              }
              alt="hotel"
            />
            <input
              type="file"
              name="hotelImage"
              id="hotelImage"
              accept="image/jpg,image/png"
              onChange={(e) => {
                setHotelImage(Array.from(e.target.files)[0]);
              }}
              ref={editImageInputRef}
            />
            <button
              type="button"
              onClick={() =>
                editImageInputRef.current && editImageInputRef.current.click()
              }
            >
              Chỉnh sửa
            </button>
          </div>
          <div className="btn-wrapper">
            <button type="submit" disabled={isEditing || isUploading}>
              {isEditing || isUploading ? "Chờ chút..." : "Xác nhận"}
            </button>
            <button
              type="button"
              onClick={() => {
                toggleClass(ref.current, "active");
                setTimeout(() => {
                  reset();
                }, 500);
              }}
              disabled={isEditing || isUploading}
            >
              Huỷ
            </button>
          </div>
        </form>
      </div>
    </div>
  );
});

export default HotelEdit;
