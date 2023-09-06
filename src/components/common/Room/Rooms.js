import React, { useRef } from "react";
import {
  ACCOMMODATION_FACILITIES,
  BED_TYPES,
  ROOM_OPTIONS,
} from "../../../constants/filter.constants";
import { icon } from "./Data";
import { convertNumberToCurrency } from "../../../utils/helpers/MoneyConverter";
import "./room.scss";
import YesNoPopup from "../YesNoPopup/YesNoPopup";
import { toggleClass } from "../../../utils/helpers/ToggleClass";
import addIcon from "../../../assets/images/icons/add.png";
import { useForm } from "react-hook-form";
import { Controller } from "react-hook-form";

const Rooms = ({ roomsData, openGallery }) => {
  let room = null;
  const deleteRoomConfirmRef = useRef(null);

  const handleDeleteRoom = (value) => {
    if (value) {
    } else {
      toggleClass(deleteRoomConfirmRef.current, "active");
    }
  };

  const getInstance = (id) => {
    return document.getElementById(id);
  };

  const { control, handleSubmit } = useForm();

  const confirmEdit = (data) => {
    //
  };

  if (Array.isArray(roomsData)) {
    room = roomsData.map((rd, index) => {
      return (
        <form
          className="room__wrapper"
          key={`room@${rd.id}`}
          id={`room@${rd.id}`}
          onSubmit={handleSubmit(confirmEdit)}
        >
          <h5 className="room__name">{rd.name}</h5>
          <h5 className="edit-room__name">
            <Controller
              name="room_name"
              control={control}
              defaultValue={rd.name}
              rules={{
                required: {
                  value: true,
                  message: "Room name is required",
                },
              }}
              render={({ field }) => <input {...field} type="text" />}
            />
          </h5>

          <div className="room__content">
            <div className="room__main-infor">
              <h6>Loại phòng</h6>

              <div className="main-infor__img-wrapper">
                {rd.picture.map((rp) => {
                  return (
                    <img
                      src={rp.link}
                      alt="room_picture"
                      key={`picture@${rp.id}`}
                    />
                  );
                })}
              </div>
              <button
                className="main-infor__view-all-img"
                type="button"
                onClick={() => openGallery(rd.picture)}
              >
                Xem tất cả ảnh
              </button>

              <div className="main-infor__hightlight">
                <img src={BED_TYPES[rd.bedType].ICON} alt="bedtype" />
                <span>{BED_TYPES[rd.bedType].LABEL}</span>
              </div>
              <div className="main-infor__hightlight">
                <img src={icon.roomSizeIcon} alt="room size" />

                <span>Kích thước: {rd.size} ㎡</span>
              </div>
              <div className="main-infor__hightlight edit">
                <img src={BED_TYPES[rd.bedType].ICON} alt="bedtype" />
                <Controller
                  name="bed_type"
                  control={control}
                  defaultValue={rd.roomInfo}
                  render={({ field }) => (
                    <select {...field}>
                      <option value={rd.bedType} defaultChecked={true}>
                        {BED_TYPES[rd.bedType].LABEL}
                      </option>
                      {Object.keys(BED_TYPES)
                        .filter((btk) => btk !== rd.bedType)
                        .map((btk) => (
                          <option value={btk} defaultChecked={true} key={btk}>
                            {BED_TYPES[btk].LABEL}
                          </option>
                        ))}
                    </select>
                  )}
                />
              </div>
              <div className="main-infor__hightlight edit">
                <img src={icon.roomSizeIcon} alt="room size" />

                <span>
                  Kích thước:{" "}
                  <Controller
                    name="room_size"
                    control={control}
                    defaultValue={rd.size}
                    rules={{
                      required: {
                        value: true,
                        message: "Room size is required",
                      },
                    }}
                    render={({ field }) => <input {...field} type="number" />}
                  />{" "}
                  ㎡
                </span>
              </div>
              <div className="main-infor__hightlight" style={{ opacity: 1 }}>
                <img src={icon.viewIcon} alt="view" />

                <div className="room-view-wrapper">
                  {rd.roomView
                    .split(",")
                    .slice(0, 3)
                    .map((rv) => (
                      <span key={`room@${rd.id}view@${rv}`}>{rv}</span>
                    ))}
                  {rd.roomView.split(",").length > 3 ? (
                    <span>+ {rd.roomView.split(",").length - 3} more</span>
                  ) : (
                    <></>
                  )}
                </div>
              </div>
            </div>
            <div className="room__facilities-services">
              <h6>Giá này đã bao gồm</h6>

              <div className="facilities">
                <small>Tiện nghi</small>
                {rd.facility.map((fa) => {
                  return (
                    <div className="facilities__item" key={fa}>
                      <img src={ACCOMMODATION_FACILITIES[fa].ICON} alt="fa" />
                      <p>{ACCOMMODATION_FACILITIES[fa].LABEL}</p>
                    </div>
                  );
                })}
                <button className="facilities__item button" type="button">
                  <img src={addIcon} alt="add" />
                  <p>Thêm</p>
                </button>
              </div>
              <div className="services">
                <small>Dịch vụ</small>
                {rd.service.map((sv) => {
                  return (
                    <div className="services__item" key={sv}>
                      <i className={ROOM_OPTIONS[sv].ICON}></i>
                      <span>{ROOM_OPTIONS[sv].LABEL}</span>
                    </div>
                  );
                })}
                <div className="services__item button" type="button">
                  <i className="fi fi-rs-add"></i>
                  <span>Thêm</span>
                </div>
              </div>
            </div>
            <div className="room__description">
              <h6>Mô tả</h6>

              <div className="short__description">
                <p className="description">{rd.roomInfo}</p>
                <Controller
                  name="description"
                  control={control}
                  defaultValue={rd.roomInfo}
                  render={({ field }) => (
                    <textarea {...field} className="edit-description" />
                  )}
                />
                {rd.vacancy ? (
                  <>
                    <p className="vacancy">
                      <b>
                        <i className="fi fi-sr-bed-alt"></i>
                        Số phòng: {rd.vacancy} phòng
                      </b>
                    </p>
                    <p className="edit-vacancy">
                      <b>
                        <i className="fi fi-sr-bed-alt"></i>
                        Số phòng:
                        <Controller
                          name="vacancy"
                          control={control}
                          defaultValue={rd.vacancy}
                          rules={{
                            required: {
                              value: true,
                              message: "Vacancy is required",
                            },
                          }}
                          render={({ field }) => (
                            <input {...field} type="number" />
                          )}
                        />{" "}
                        phòng
                      </b>
                    </p>
                  </>
                ) : (
                  <div className="no-vacancy">
                    <img src={icon.noVacancyIcon} alt="no-vacancy" />
                  </div>
                )}
              </div>
            </div>
            <div className="room__price">
              <h6>Giá chỉ</h6>

              <div className="price__wrapper">
                <p className="price">
                  <span>
                    {convertNumberToCurrency("vietnamdong", rd.price)}
                  </span>{" "}
                  / đêm
                </p>
                <p className="edit-price">
                  <Controller
                    name="price"
                    control={control}
                    defaultValue={rd.price}
                    rules={{
                      required: {
                        value: true,
                        message: "Price is required",
                      },
                    }}
                    render={({ field }) => <input {...field} type="number" />}
                  />
                  / đêm
                </p>
                <div className="btn__wrapper">
                  <button
                    className={"booking"}
                    type="button"
                    onClick={() => {
                      toggleClass(getInstance(`room@${rd.id}`), "edit");
                    }}
                  >
                    <i className="fi fi-sr-pen-clip"></i>
                  </button>
                  <button
                    className={"confirm"}
                    type="button"
                    onClick={() => {
                      toggleClass(getInstance(`room@${rd.id}`), "edit");
                    }}
                  >
                    <i className="fi fi-br-check"></i>
                  </button>
                  <button
                    className="delete"
                    type="button"
                    onClick={() =>
                      toggleClass(deleteRoomConfirmRef.current, "active")
                    }
                  >
                    <i className="fi fi-ss-trash"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
          <YesNoPopup
            label={"Xác nhận xoá phòng này?"}
            callback={handleDeleteRoom}
            ref={deleteRoomConfirmRef}
          />
        </form>
      );
    });
  } else if (roomsData) {
    room = (
      <form
        className="room__wrapper edit"
        key={`room@${roomsData.id}`}
        id={`room@${roomsData.id}`}
        onSubmit={handleSubmit(confirmEdit)}
      >
        <h5 className="edit-room__name">
          <Controller
            name="room_name"
            control={control}
            rules={{
              required: {
                value: true,
                message: "Room name is required",
              },
            }}
            render={({ field }) => <input {...field} type="text" />}
          />
        </h5>

        <div className="room__content">
          <div className="room__main-infor">
            <h6>Loại phòng</h6>

            <div className="main-infor__img-wrapper">
              {roomsData.picture.map((rp) => {
                return (
                  <img
                    src={rp.link}
                    alt="room_picture"
                    key={`picture@${rp.id}`}
                  />
                );
              })}
            </div>
            <button
              className="main-infor__view-all-img"
              type="button"
              onClick={() => openGallery(roomsData.picture)}
            >
              Quản lý ảnh
            </button>

            <div className="main-infor__hightlight edit">
              {roomsData.bedType ? (
                <img src={BED_TYPES[roomsData.bedType].ICON} alt="bedtype" />
              ) : (
                <></>
              )}

              <Controller
                name="bed_type"
                control={control}
                render={({ field }) => (
                  <select {...field}>
                    {Object.keys(BED_TYPES)
                      .filter((btk) => btk !== roomsData.bedType)
                      .map((btk, index) => (
                        <option
                          value={btk}
                          defaultChecked={index === 0}
                          key={btk}
                        >
                          {BED_TYPES[btk].LABEL}
                        </option>
                      ))}
                  </select>
                )}
              />
            </div>
            <div className="main-infor__hightlight edit">
              <img src={icon.roomSizeIcon} alt="room size" />

              <span>
                Kích thước:{" "}
                <Controller
                  name="room_size"
                  control={control}
                  rules={{
                    required: {
                      value: true,
                      message: "Room size is required",
                    },
                  }}
                  render={({ field }) => <input {...field} type="number" />}
                />{" "}
                ㎡
              </span>
            </div>
            {/* <div className="main-infor__hightlight" style={{ opacity: 1 }}>
            <img src={icon.viewIcon} alt="view" />

            <div className="room-view-wrapper">
              {roomsData.roomView
                .split(",")
                .slice(0, 3)
                .map((rv) => (
                  <span key={`room@${roomsData.id}view@${rv}`}>{rv}</span>
                ))}
              {roomsData.roomView.split(",").length > 3 ? (
                <span>+ {roomsData.roomView.split(",").length - 3} more</span>
              ) : (
                <></>
              )}
            </div>
          </div> */}
          </div>
          <div className="room__facilities-services">
            <h6>Giá này đã bao gồm</h6>

            <div className="facilities">
              <small>Tiện nghi</small>
              {Array.isArray(roomsData.facility) &&
                roomsData.facility.length > 0 &&
                roomsData.facility.map((fa) => {
                  return ACCOMMODATION_FACILITIES[fa] ? (
                    <div className="facilities__item" key={fa}>
                      <img src={ACCOMMODATION_FACILITIES[fa].ICON} alt="fa" />
                      <p>{ACCOMMODATION_FACILITIES[fa].LABEL}</p>
                    </div>
                  ) : (
                    <></>
                  );
                })}
              <button className="facilities__item button" type="button">
                <img src={addIcon} alt="add" />
                <p>Thêm</p>
              </button>
            </div>
            <div className="services">
              <small>Dịch vụ</small>
              {Array.isArray(roomsData.service) &&
                roomsData.service.length > 0 &&
                roomsData.service.map((sv) => {
                  return ROOM_OPTIONS[sv] ? (
                    <div className="services__item" key={sv}>
                      <i className={ROOM_OPTIONS[sv].ICON}></i>
                      <span>{ROOM_OPTIONS[sv].LABEL}</span>
                    </div>
                  ) : (
                    <></>
                  );
                })}
              <div className="services__item button" type="button">
                <i className="fi fi-rs-add"></i>
                <span>Thêm</span>
              </div>
            </div>
          </div>
          <div className="room__description">
            <h6>Mô tả</h6>

            <div className="short__description">
              <Controller
                name="description"
                control={control}
                render={({ field }) => (
                  <textarea {...field} className="edit-description" />
                )}
              />
              <p className="edit-vacancy">
                <b>
                  <i className="fi fi-sr-bed-alt"></i>
                  Số phòng:
                  <Controller
                    name="vacancy"
                    control={control}
                    rules={{
                      required: {
                        value: true,
                        message: "Vacancy is required",
                      },
                    }}
                    render={({ field }) => <input {...field} type="number" />}
                  />{" "}
                  phòng
                </b>
              </p>
            </div>
          </div>
          <div className="room__price">
            <h6>Giá chỉ</h6>

            <div className="price__wrapper">
              <p className="edit-price">
                <Controller
                  name="price"
                  control={control}
                  rules={{
                    required: {
                      value: true,
                      message: "Price is required",
                    },
                  }}
                  render={({ field }) => <input {...field} type="number" />}
                />
                / đêm
              </p>
              <div className="btn__wrapper">
                <button
                  className={"confirm"}
                  type="button"
                  onClick={() => {
                    toggleClass(getInstance(`room@${roomsData.id}`), "edit");
                  }}
                >
                  <i className="fi fi-br-check"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
        <YesNoPopup
          label={"Xác nhận xoá phòng này?"}
          callback={handleDeleteRoom}
          ref={deleteRoomConfirmRef}
        />
      </form>
    );
  }
  return <>{room}</>;
};

export default Rooms;
