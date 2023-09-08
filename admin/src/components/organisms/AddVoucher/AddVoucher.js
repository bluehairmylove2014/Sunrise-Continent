import React from "react";
import { toggleClassNoListener } from "./../../../utils/helpers/ToggleClass";
import { Controller, useForm } from "react-hook-form";
import { toast } from "react-hot-toast";
import "./AddVoucher.scss";
import { RankList } from "./../../../constants/Rank";
import { useCreateVoucher } from "../../../libs/business-logic/src/lib/voucher/process/hooks";

const AddVoucher = React.forwardRef(({ callback }, ref) => {
  const { onCreateVoucher, isLoading } = useCreateVoucher();
  const { control, handleSubmit } = useForm({
    defaultValues: {
      name: "",
      quantity: 0,
      value: 0,
      point: 0,
      requiredRank: "",
    },
  });
  const rankList = Object.fromEntries(Object.entries(RankList).slice(0, -3));

  const onSuccessSubmit = (data) => {
    onCreateVoucher({ ...data, value: data.value / 100 })
      .then((msg) => toast.success(msg))
      .catch((err) => toast.error(err.message))
      .finally(() => toggleClassNoListener(ref.current, "active"));
  };
  const onErrorSubmit = (err) => {
    toast.error(err[Object.keys(err)[0]].message);
  };

  return (
    <div className="add-voucher" ref={ref}>
      <div className="add-voucher__bg"></div>
      <form
        className="add-voucher__box"
        onSubmit={handleSubmit(onSuccessSubmit, onErrorSubmit)}
      >
        <div className="box__title">
          <div></div>
          <h3>Trình tạo voucher</h3>
          <button
            type="button"
            onClick={() =>
              ref.current && toggleClassNoListener(ref.current, "active")
            }
          >
            <i className="fi fi-ss-circle-xmark"></i>
          </button>
        </div>
        <div className="box__content">
          <Controller
            name="name"
            control={control}
            rules={{
              required: "Bạn cần nhập tên voucher",
            }}
            render={({ field }) => (
              <div className="content__input">
                <label htmlFor="name-input">Tên hiển thị</label>
                <input {...field} type="text" id="name-input" />
              </div>
            )}
          />

          <Controller
            name="quantity"
            control={control}
            rules={{
              required: "Bạn cần bổ sung số lượng cần tạo",
              min: {
                value: 1,
                message: "Số lượng cần tạo ít nhất là 1",
              },
            }}
            render={({ field }) => (
              <div className="content__input">
                <label htmlFor="quantity-input">Số lượng tạo</label>
                <input {...field} type="number" id="quantity-input" />
              </div>
            )}
          />

          <Controller
            name="value"
            control={control}
            rules={{
              required: "Bạn cần bổ sung giá trị voucher",
              min: {
                value: 1,
                message: "Giá trị voucher ít nhất là 1%",
              },
              max: {
                value: 100,
                message: "Giá trị voucher ít nhất là 100%",
              },
            }}
            render={({ field }) => (
              <div className="content__input">
                <label htmlFor="value-input">Giá trị (Đơn vị %)</label>
                <input {...field} type="number" id="value-input" />
              </div>
            )}
          />

          <Controller
            name="point"
            control={control}
            rules={{
              required: "Bạn cần bổ sung số điểm để đổi voucher",
              min: {
                value: 1,
                message: "Số điểm ít nhất là 1%",
              },
            }}
            render={({ field }) => (
              <div className="content__input">
                <label htmlFor="point-input">Số điểm để đổi</label>
                <input {...field} type="number" id="point-input" />
              </div>
            )}
          />

          <Controller
            name="requiredRank"
            control={control}
            rules={{
              required: "Bạn cần bổ sung mức rank",
            }}
            render={({ field }) => (
              <div className="content__input">
                <label htmlFor="requiredRank-select">Mức rank tối thiểu</label>
                <select {...field} type="number" id="requiredRank-select">
                  <option value="" disabled>
                    *
                  </option>
                  {Object.keys(rankList).map((rank) => (
                    <option value={rank} key={rank}>
                      {/* <img src={rankList[rank].image} alt="rank" /> */}
                      {rankList[rank].label}
                    </option>
                  ))}
                </select>
              </div>
            )}
          />
        </div>
        <div className="box__footer">
          <button type="submit" disabled={isLoading}>
            {isLoading ? "Chờ chút..." : "Xác nhận"}
          </button>
          <button
            type="button"
            onClick={() =>
              ref.current && toggleClassNoListener(ref.current, "active")
            }
            disabled={isLoading}
          >
            Huỷ bỏ
          </button>
        </div>
      </form>
    </div>
  );
});

export default AddVoucher;
