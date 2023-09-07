import React, { useState } from "react";
import "../../styles/common/reviewPopup.scss";
import { toast } from "react-hot-toast";
import { useForm } from "react-hook-form";
import { Controller } from "react-hook-form";
import loveIcon from "../../assets/images/icons/love.png";
import happyIcon from "../../assets/images/icons/happy.png";
import crazyIcon from "../../assets/images/icons/crazy.png";
import upsetIcon from "../../assets/images/icons/upset.png";
import annoyedIcon from "../../assets/images/icons/annoyed.png";
import ratingIcon from "../../assets/images/icons/good-feedback.png";
import { toggleClassNoListener } from "../../utils/helpers/ToggleClass";

const RATING = {
  EXCELLENT: {
    ICON: loveIcon,
    LABEL: "Trên cả tuyệt vời",
    CRITERIA: 9,
  },
  GREAT: {
    ICON: happyIcon,
    LABEL: "Xuất sắc",
    CRITERIA: 8,
  },
  VERY_GOOD: {
    ICON: crazyIcon,
    LABEL: "Rất tốt",
    CRITERIA: 7,
  },
  SATISFIED: {
    ICON: upsetIcon,
    LABEL: "Hài lòng",
    CRITERIA: 6,
  },
  UNSATISFIED: {
    ICON: annoyedIcon,
    LABEL: "Không hài lòng",
    CRITERIA: 0,
  },
};
const noneRating = {
  ICON: ratingIcon,
  LABEL: "Vui lòng chọn mức điểm",
  CRITERIA: 0,
};

const ReviewPopup = React.forwardRef(({ callback }, ref) => {
  const [hoverPointSelected, setHoverPointSelected] = useState(0);
  const [pointSelected, setPointSelected] = useState(0);
  const [ratingIcon, setRatingIcon] = useState(noneRating);
  const { control, handleSubmit, reset } = useForm({
    defaultValues: {
      content: "",
    },
  });

  const onSuccessSubmit = (data) => {
    callback &&
      callback({
        point: pointSelected,
        content: data.content,
      });
  };
  const onErrorSubmit = (error) => {
    toast.error(error[Object.keys(error)[0]].message);
  };
  const handleChangePoint = (point) => {
    setPointSelected(point);
    const targetKey = Object.keys(RATING).find(
      (ratingKey) => RATING[ratingKey].CRITERIA <= point
    );
    if (targetKey) {
      setRatingIcon(RATING[targetKey]);
    }
  };
  const handleHoverPoint = (point) => {
    setHoverPointSelected(point);
  };
  const handleBlurPoint = () => {
    setHoverPointSelected(0);
  };

  return (
    <div className="review-popup" ref={ref}>
      <div className="review-popup__bg"></div>
      <form
        className="review-popup__box"
        onSubmit={handleSubmit(onSuccessSubmit, onErrorSubmit)}
      >
        <div className="box__title">
          <div></div>
          <h4>Đánh giá khách sạn</h4>
          <button
            type="button"
            onClick={() => {
              toggleClassNoListener(ref.current, "active");
              setTimeout(() => {
                reset();
                setHoverPointSelected(0);
                setPointSelected(0);
                setRatingIcon(noneRating);
              }, 500);
            }}
          >
            x
          </button>
        </div>
        <div className="box__rating-icon">
          <img src={ratingIcon.ICON} alt="rating" />
          <strong>{ratingIcon.LABEL}</strong>
        </div>
        <div className="box__rating">
          {Array.from({ length: 11 }, (_, index) => index).map((point) => (
            <button
              type="button"
              onClick={() => handleChangePoint(point)}
              className={`${pointSelected >= point ? "active" : ""} ${
                hoverPointSelected >= point ? "hover" : ""
              }`}
              onMouseEnter={() => handleHoverPoint(point)}
              onMouseLeave={handleBlurPoint}
              key={point}
            >
              {point}
            </button>
          ))}
        </div>
        <div className="box__review-content">
          <Controller
            name={"content"}
            control={control}
            rules={{
              required: "Bạn chưa nhập nội dung kìa",
            }}
            render={({ field }) => (
              <textarea
                {...field}
                type="text"
                placeholder="Nội dung đánh giá..."
              />
            )}
          />
        </div>
        <div className="box__submit">
          <button type="submit">Gửi đánh giá</button>
        </div>
      </form>
    </div>
  );
});

export default ReviewPopup;
