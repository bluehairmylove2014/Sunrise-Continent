import React, { useRef, useState } from "react";
import "../../styles/pages/createHotel.scss";
import { ReactComponent as CloudyBackground } from "../../assets/images/bgs/Cloudy.svg";
import { ReactComponent as SprinkleBackground } from "../../assets/images/bgs/Sprinkle.svg";
import { ReactComponent as ShutdownIcon } from "../../assets/images/icons/shut-down-svgrepo-com.svg";
import { Controller, useForm } from "react-hook-form";
import { provinces } from "../../constants/ProvinceCityData";
import { countries } from "../../constants/CountriesData";
import { toast } from "react-hot-toast";
import YesNoPopup from "../../components/common/YesNoPopup/YesNoPopup";
import { toggleClass } from "./../../utils/helpers/ToggleClass";
import Camping from "../../components/common/Loader/Camping";
import { useUpload } from "./../../libs/business-logic/src/lib/sirv/process/hooks/useUpload";
import { useCreateHotel } from "../../libs/business-logic/src/lib/hotel/process/hooks";
import { LOCATION_TYPES } from "../../constants/filter.constants";
import { useNavigate } from "react-router-dom";
import { PAGES } from "../../constants/Link.constants";
import { useLogout } from "../../libs/business-logic/src/lib/auth";

const stageList = {
  info: "info",
  decorate: "decorate",
  confirm: "confirm",
  waiting: "waiting",
};
const starsList = [
  { value: 0, name: "0 sao" },
  { value: 1, name: "1 sao" },
  { value: 2, name: "2 sao" },
  { value: 3, name: "3 sao" },
  { value: 4, name: "4 sao" },
  { value: 5, name: "5 sao" },
];

function isFileSizeGreaterThanMB(file, MBNumber) {
  // Độ lớn của 1MB trong byte
  const oneMBInBytes = 1024 * 1024;

  // Giới hạn kích thước là 2MB
  const maxSizeInBytes = MBNumber * oneMBInBytes;

  // So sánh kích thước tệp với giới hạn
  return file.size > maxSizeInBytes;
}

const CreateHotel = () => {
  const { onLogout } = useLogout();
  const { onUpload } = useUpload();
  const { onCreateHotel } = useCreateHotel();
  const [isFirstTime, setIsFirstTime] = useState(true);
  const [previewImages, setPreviewImages] = useState(null);
  const imageInputRef = useRef(null);
  const decorateGalleryRef = useRef(null);
  const policyPopup = useRef(null);
  const [stage, setStage] = useState(stageList.info);
  const { control: infoControl, handleSubmit } = useForm({
    defaultValues: {
      hotelName: "",
      hotelAddress: "",
      hotelProvinceCity: "",
      hotelCountry: "",
      stars: "",
      hotelType: "",
    },
  });
  const {
    control: decorateControl,
    handleSubmit: handleDecorateSubmit,
    getValues: getDecorateValues,
  } = useForm({
    defaultValues: {
      description: "",
    },
  });
  const [hotelDetail, setHotelDetail] = useState({});
  const navigate = useNavigate();

  const onSuccessSubmit = (data) => {
    setIsFirstTime(false);
    setHotelDetail({ ...data });
    setStage(stageList.decorate);
  };
  const onErrorSubmit = (err) => {
    if (err) {
      toast.error(err[Object.keys(err)[0]].message);
    }
  };
  const onSuccessDecorateSubmit = (data) => {
    if (!previewImages) {
      toast.error("Úi! Bạn quên thêm ảnh kìa.");
    } else {
      toggleClass(policyPopup.current, "active");
    }
  };
  const handleDrop = (e) => {
    e.preventDefault();
    decorateGalleryRef.current.style.backgroundColor = "white";
    const selectedFiles = Array.from(e.dataTransfer.files);
    if (selectedFiles.length > 1) {
      toast.error("Chỉ được chọn 1 ảnh thôi nhé!");
    } else {
      if (isFileSizeGreaterThanMB(selectedFiles[0], 2)) {
        toast.error("Kích thước file phải nhỏ hơn 2MB");
      } else {
        setPreviewImages(selectedFiles[0]);
      }
    }
  };
  const handleConfirm = (choice) => {
    if (choice) {
      setStage(stageList.waiting);

      // Upload image to sirv
      onUpload({
        imgFile: previewImages,
        hotelName: hotelDetail.hotelName,
        imgName: `hotelThumbnail.${previewImages.type.split("/")[1]}`,
      })
        .then((res) => {
          // Update to server
          onCreateHotel({
            name: hotelDetail.hotelName,
            country: hotelDetail.hotelCountry,
            hotelType: hotelDetail.hotelType,
            provinceCity: hotelDetail.hotelProvinceCity,
            address: hotelDetail.hotelAddress,
            stars: hotelDetail.stars,
            description: getDecorateValues().description,
            image: res.path,
          })
            .then((msg) => {
              toast.success(msg);
              setTimeout(() => {
                navigate(PAGES.DASHBOARD);
              }, 2000);
            })
            .catch((error) => {
              console.error("ERROR: ", error);
              toast.error("Error create hotel");
            });
        })
        .catch((error) => {
          console.error("ERROR: ", error);
          toast.error("Unexpected Error");
        });
    }
    toggleClass(policyPopup.current, "active");
  };

  return (
    <div className={`create-hotel ${stage}`}>
      <button
        className="logout-btn"
        onClick={() => {
          onLogout();
          navigate(PAGES.AUTH);
        }}
      >
        <span className="text">Đăng xuất</span>
        <span className="icon">
          <ShutdownIcon />
        </span>
      </button>
      <div className="create-hotel__info">
        <div className="info__background">
          <CloudyBackground alt="cloudy" />
        </div>
        <div className="info__title">
          <h3>Chúng tôi muốn biết thêm về bạn!</h3>
        </div>
        <form
          className="info__form"
          onSubmit={handleSubmit(onSuccessSubmit, onErrorSubmit)}
        >
          <div className="form__header">
            <h2>Thông tin khách sạn</h2>
          </div>
          <div className="form__body">
            <div className="body__row">
              <Controller
                name="hotelName"
                control={infoControl}
                rules={{
                  required: "Bạn cần nhập tên khách sạn",
                }}
                render={({ field }) => (
                  <input {...field} type="text" placeholder="Tên khách sạn" />
                )}
              />
            </div>
            <div className="body__row">
              <Controller
                name="hotelAddress"
                control={infoControl}
                rules={{
                  required: "Bạn cần nhập địa chỉ khách sạn",
                }}
                render={({ field }) => (
                  <input
                    {...field}
                    type="text"
                    placeholder="Địa chỉ (Số nhà, tên đường, tên phường, tên quận)"
                  />
                )}
              />
            </div>
            <div className="body__row">
              <Controller
                name="hotelProvinceCity"
                control={infoControl}
                rules={{
                  required: "Bạn cần chọn tỉnh / thành phố",
                }}
                render={({ field }) => (
                  <select {...field}>
                    <option value="" disabled>
                      Tỉnh / Thành phố
                    </option>
                    {provinces.map((p) => (
                      <option value={p} key={p}>
                        {p}
                      </option>
                    ))}
                  </select>
                )}
              />
            </div>
            <div className="body__row">
              <Controller
                name="hotelCountry"
                control={infoControl}
                rules={{
                  required: "Bạn cần chọn quốc gia",
                }}
                render={({ field }) => (
                  <select {...field}>
                    <option value="" disabled>
                      Quốc Gia
                    </option>
                    {countries.map((c) => (
                      <option value={c.value} key={c.value}>
                        {c.name}
                      </option>
                    ))}
                  </select>
                )}
              />
            </div>
            <div className="body__row">
              <Controller
                name="stars"
                control={infoControl}
                rules={{
                  required:
                    "Bạn cần chọn số sao (Theo chuẩn American Automobile Association)",
                }}
                render={({ field }) => (
                  <select {...field}>
                    <option value="" disabled>
                      Số sao
                    </option>
                    {starsList.map((p) => (
                      <option value={p.value} key={p.name}>
                        {p.name}
                      </option>
                    ))}
                  </select>
                )}
              />
            </div>
            <div className="body__row">
              <Controller
                name="hotelType"
                control={infoControl}
                rules={{
                  required: "Bạn cần chọn loại hình đăng ký",
                }}
                render={({ field }) => (
                  <select {...field}>
                    <option value="" disabled>
                      Loại hình đăng ký
                    </option>
                    {Object.keys(LOCATION_TYPES).map((lt) => (
                      <option value={lt} key={lt}>
                        {LOCATION_TYPES[lt].LABEL}
                      </option>
                    ))}
                  </select>
                )}
              />
            </div>
          </div>
          <div className="form__footer">
            <button type="submit" className="stylistBtn">
              <span className="button_lg">
                <span className="button_sl"></span>
                <span className="button_text">Tiếp theo</span>
              </span>
            </button>
          </div>
        </form>
      </div>
      <div
        className={`create-hotel__decorate ${
          stage === stageList.info && isFirstTime ? "first-time" : ""
        }`}
      >
        <div className="decorate__wrapper">
          <div className="decorate__background">
            <SprinkleBackground alt="SprinkleBackground" />
          </div>
          <form
            className="decorate__form"
            onSubmit={handleDecorateSubmit(
              onSuccessDecorateSubmit,
              onErrorSubmit
            )}
          >
            <div className="decorate__title">
              <h3>Thêm một chút thông tin nhé!</h3>
            </div>
            <h6>
              <i className="fi fi-sr-images"></i>Hình ảnh thumbnail khách sạn
            </h6>
            <div
              className={`decorate__gallery ${previewImages ? "" : "active"}`}
              ref={decorateGalleryRef}
              onDrop={handleDrop}
              onDragOver={(e) => {
                e.preventDefault();
                decorateGalleryRef.current.style.backgroundColor =
                  "var(--quill-grey)";
              }}
              onDragLeave={(e) => {
                e.preventDefault();
                decorateGalleryRef.current.style.backgroundColor = "white";
              }}
            >
              <input
                alt="gallery"
                type="file"
                accept="image/jpg,image/png"
                multiple={false}
                ref={imageInputRef}
                onChange={(e) => {
                  const selectedFiles = Array.from(e.target.files);
                  if (isFileSizeGreaterThanMB(selectedFiles[0], 2)) {
                    toast.error("Kích thước file phải nhỏ hơn 2MB");
                  } else {
                    setPreviewImages(selectedFiles[0]);
                  }
                }}
              />
              <p>Kéo thả hình ảnh vào đây hoặc chọn </p>
              <button
                type="button"
                onClick={() => {
                  imageInputRef.current.click();
                }}
              >
                <span>Browse image</span>
              </button>
            </div>
            <div
              className={`decorate__preview ${previewImages ? "" : "active"}`}
            >
              <div className="preview__images">
                <div className="images__wrapper">
                  {previewImages && (
                    <img
                      src={URL.createObjectURL(previewImages)}
                      alt="preview"
                    />
                  )}
                </div>
              </div>
              <div className="btn__wrapper">
                <button
                  type="button"
                  onClick={() => imageInputRef.current.click()}
                >
                  <span>Thay đổi</span>
                </button>
              </div>
            </div>
            <h6>
              <i className="fi fi-sr-images"></i>Mô tả ngắn gọn
            </h6>
            <div className="decorate__description">
              <Controller
                name="description"
                control={decorateControl}
                rules={{
                  required:
                    "Hãy thêm mô tả để khách hàng biết thêm về bạn nhé!",
                }}
                render={({ field }) => (
                  <textarea
                    {...field}
                    name="description"
                    placeholder="Nhập gì đó đi..."
                  ></textarea>
                )}
              />
            </div>

            <div className="decorate__btn">
              <button
                type="button"
                className="stylistBtn negative"
                onClick={() => setStage(stageList.info)}
              >
                <span className="button_lg">
                  <span className="button_sl"></span>
                  <span className="button_text">Trở về</span>
                </span>
              </button>
              <button type="submit" className="stylistBtn">
                <span className="button_lg">
                  <span className="button_sl"></span>
                  <span className="button_text">Tiếp theo</span>
                </span>
              </button>
            </div>
          </form>
        </div>
      </div>
      <div className="create-hotel__waiting">
        <Camping
          label={
            "Chúng tôi đang tạo khách sạn cho bạn. Vui lòng không tắt trang!"
          }
        />
      </div>
      <YesNoPopup
        label={
          "Bạn có chắc chắn với thông tin này chứ. Mọi sai sót sẽ chịu hậu quả rất lớn từ pháp luật!"
        }
        callback={handleConfirm}
        ref={policyPopup}
      />
    </div>
  );
};

export default CreateHotel;
