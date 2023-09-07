import React, { useEffect, useRef, useState } from "react";
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
import MultiPicker from "../MultiPicker/MultiPicker";
import {
  useCreateRoom,
  useDeleteRoom,
} from "../../../libs/business-logic/src/lib/hotel/process/hooks";
import { toast } from "react-hot-toast";
import { useUpload } from "../../../libs/business-logic/src/lib/sirv/process/hooks/useUpload";
import { generateImageVersion } from "../../../utils/helpers/imageVersion";
import Empty from "../Empty/Empty";

const Rooms = ({
  roomsData,
  openGallery,
  hotelData,
  closeCreateCallback,
  refetchCallback,
}) => {
  let room = null;
  const [isCreatingRoom, setIsCreatingRoom] = useState(false);
  const deleteRoomConfirmRef = useRef(null);
  const [multiPickerData, setMultiPickerData] = useState({});
  const [multiPickerDefaultValues, setMultiPickerDefaultValues] = useState([]);
  const inputFileRef = useRef(null);
  const selectedImage = useRef(null);
  const selectedDelete = useRef(null);

  const multiPickerCallback = useRef(() => {});
  const multiPickerRef = useRef(null);
  const [editRoomData, setEditRoomData] = useState(
    roomsData && !Array.isArray(roomsData) ? roomsData : null
  );
  const { onDeleteRoom } = useDeleteRoom();
  const { onCreateRoom } = useCreateRoom();

  const handleDeleteRoom = (value) => {
    if (value) {
      onDeleteRoom({
        id: selectedDelete.current,
        hotelId: hotelData.id,
      })
        .then((msg) => toast.success(msg))
        .catch((err) => toast.error(err.message))
        .finally(() => {
          refetchCallback && refetchCallback();
          selectedDelete.current = null;
        });
    }
    toggleClass(deleteRoomConfirmRef.current, "active");
  };

  const getInstance = (id) => {
    return document.getElementById(id);
  };

  const { control, handleSubmit } = useForm({
    defaultValues: {
      room_name: "",
      bed_type: "",
      room_size: 0,
      description: "",
      vacancy: 0,
      price: 0,
    },
  });
  const { control: controlCreate, handleSubmit: handleSubmitCreate } = useForm({
    defaultValues: {
      room_name: "",
      bed_type: "",
      room_size: 0,
      description: "",
      vacancy: 0,
      price: 0,
    },
  });

  const confirmEdit = (data) => {
    console.log(data);
  };

  const handleAddFacilities = (dataList) => {
    setEditRoomData({ ...editRoomData, facility: dataList });
  };
  const handleAddServices = (dataList) => {
    setEditRoomData({ ...editRoomData, service: dataList });
  };
  const { onUpload } = useUpload();

  const handleCreateRoom = (data) => {
    // UPLOAD IMAGE TO SIRV
    setIsCreatingRoom(true);
    const promises = selectedImage.current.map((si, index) =>
      onUpload({
        imgFile: si,
        hotelName: hotelData.name,
        imgName: `${data.room_name}@${index}.${si.type.split("/")[1]}`,
      })
    );
    Promise.all(promises)
      .then((res) => {
        const roomPictures = res.map((r, index) => ({
          id: index + 1,
          link: r.path,
        }));
        const createRoomPkg = {
          ...editRoomData,
          roomInfo: data.description,
          name: data.room_name,
          bedType: data.bed_type,
          size: data.room_size,
          vacancy: data.vacancy,
          price: data.price,
          picture: roomPictures,
        };
        onCreateRoom(createRoomPkg)
          .then((msg) => toast.success(msg))
          .catch((err) => toast.error(err.message));
        // toggleClass(getInstance(`room@${editRoomData.id}`), "edit");
        closeCreateCallback && closeCreateCallback();
        refetchCallback && refetchCallback();
      })
      .catch((err) => {
        console.error(err);
      })
      .finally(() => {
        setIsCreatingRoom(false);
      });
  };
  const errorCreateRoom = (err) => {
    if (err) {
      toast.error(err[Object.keys(err)[0]].message);
    }
  };

  useEffect(() => {
    if (roomsData && !Array.isArray(roomsData)) {
      setEditRoomData(roomsData);
    }
  }, [roomsData]);

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
                      src={rp.link + generateImageVersion()}
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
              {rd.roomView !== "null" ? (
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
              ) : (
                <></>
              )}
            </div>
            <div className="room__facilities-services">
              <h6>Giá này đã bao gồm</h6>

              <div className="facilities">
                <small>Tiện nghi</small>
                {Array.isArray(rd.facility) && rd.facility.length === 0 ? (
                  <div className="empty" style={{ gridColumn: "1 /span 4" }}>
                    <Empty label={"Không có gì cả"} />
                  </div>
                ) : (
                  <></>
                )}

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
                {Array.isArray(rd.facility) && rd.facility.length === 0 ? (
                  <div className="empty" style={{ gridColumn: "1 /span 4" }}>
                    <Empty label={"Không có gì cả"} />
                  </div>
                ) : (
                  <></>
                )}
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
                <p className="description">
                  {rd.roomInfo === "null" ? "" : rd.roomInfo}
                </p>
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
                  VNĐ / đêm
                </p>
                <div className="btn__wrapper">
                  <button
                    className={"booking"}
                    type="button"
                    onClick={() => {
                      toast.error(
                        "XIN LỖI! Chúng tôi chưa hỗ trợ chức năng này"
                      );
                      // toggleClass(getInstance(`room@${rd.id}`), "edit");
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
                    onClick={() => {
                      selectedDelete.current = rd.id;
                      toggleClass(deleteRoomConfirmRef.current, "active");
                    }}
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
  } else if (editRoomData) {
    room = (
      <form
        className="room__wrapper edit"
        key={`room@${editRoomData.id}`}
        id={`room@${editRoomData.id}`}
        onSubmit={handleSubmitCreate(handleCreateRoom, errorCreateRoom)}
      >
        <h5 className="edit-room__name">
          <Controller
            name="room_name"
            control={controlCreate}
            rules={{
              required: {
                value: true,
                message: "Bạn chưa thêm tên loại phòng",
              },
            }}
            render={({ field }) => (
              <input {...field} type="text" placeholder="Tên loại phòng" />
            )}
          />
        </h5>

        <div className="room__content">
          <div className="room__main-infor">
            <h6>Loại phòng</h6>

            <div className="main-infor__img-wrapper">
              {Array.isArray(editRoomData.picture) &&
              editRoomData.picture.length > 0 ? (
                editRoomData.picture.map((rp) => {
                  return (
                    <img
                      src={rp.link}
                      alt="room_picture"
                      key={`picture@${rp.id}`}
                    />
                  );
                })
              ) : (
                <>
                  <input
                    type="file"
                    style={{ display: "none" }}
                    ref={inputFileRef}
                    accept="image/jpg,image/png"
                    multiple={true}
                    onChange={(e) => {
                      const selectedImages = Array.from(e.target.files);
                      selectedImage.current = selectedImages;
                      setEditRoomData({
                        ...editRoomData,
                        picture: selectedImages.map((si, index) => ({
                          id: index,
                          link: URL.createObjectURL(si),
                        })),
                      });
                    }}
                  />
                  <button
                    type="button"
                    onClick={() => inputFileRef.current.click()}
                  >
                    <i className="fi fi-rr-layer-plus"></i>Thêm hình ảnh
                  </button>
                </>
              )}
            </div>
            <button
              className="main-infor__view-all-img"
              type="button"
              onClick={() => openGallery(editRoomData.picture)}
            >
              Quản lý ảnh
            </button>

            <div className="main-infor__hightlight edit">
              {editRoomData.bedType ? (
                <img src={BED_TYPES[editRoomData.bedType].ICON} alt="bedtype" />
              ) : (
                <></>
              )}

              <Controller
                name="bed_type"
                control={controlCreate}
                rules={{
                  required: "Bạn cần chọn loại giường",
                }}
                render={({ field }) => (
                  <select {...field}>
                    <option value={""} disabled>
                      Loại giường
                    </option>
                    {Object.keys(BED_TYPES)
                      .filter((btk) => btk !== editRoomData.bedType)
                      .map((btk, index) => (
                        <option value={btk} key={btk}>
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
                  control={controlCreate}
                  rules={{
                    required: {
                      value: true,
                      message: "Room size is required",
                    },
                    min: {
                      value: 1,
                      message: "Bạn cần nhập kích thước phòng",
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
              {editRoomData.roomView
                .split(",")
                .slice(0, 3)
                .map((rv) => (
                  <span key={`room@${editRoomData.id}view@${rv}`}>{rv}</span>
                ))}
              {editRoomData.roomView.split(",").length > 3 ? (
                <span>+ {editRoomData.roomView.split(",").length - 3} more</span>
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
                editRoomData.facility.length > 0 &&
                editRoomData.facility.map((fa) => {
                  return ACCOMMODATION_FACILITIES[fa] ? (
                    <div className="facilities__item" key={fa}>
                      <img src={ACCOMMODATION_FACILITIES[fa].ICON} alt="fa" />
                      <p>{ACCOMMODATION_FACILITIES[fa].LABEL}</p>
                    </div>
                  ) : (
                    <></>
                  );
                })}
              <button
                className="facilities__item button"
                type="button"
                onClick={() => {
                  setMultiPickerData(ACCOMMODATION_FACILITIES);
                  multiPickerCallback.current = handleAddFacilities;
                  setMultiPickerDefaultValues(editRoomData.facility);
                  toggleClass(multiPickerRef.current, "active");
                }}
              >
                <img src={addIcon} alt="add" />
                <p>Thêm</p>
              </button>
            </div>
            <div className="services">
              <small>Dịch vụ</small>
              {Array.isArray(editRoomData.service) &&
                editRoomData.service.length > 0 &&
                editRoomData.service.map((sv) => {
                  return ROOM_OPTIONS[sv] ? (
                    <div className="services__item" key={sv}>
                      <i className={ROOM_OPTIONS[sv].ICON}></i>
                      <span>{ROOM_OPTIONS[sv].LABEL}</span>
                    </div>
                  ) : (
                    <></>
                  );
                })}
              <div
                className="services__item button"
                type="button"
                onClick={() => {
                  setMultiPickerData(ROOM_OPTIONS);
                  multiPickerCallback.current = handleAddServices;
                  setMultiPickerDefaultValues(editRoomData.service);
                  toggleClass(multiPickerRef.current, "active");
                }}
              >
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
                control={controlCreate}
                render={({ field }) => (
                  <textarea
                    {...field}
                    className="edit-description"
                    style={{ resize: "none" }}
                  />
                )}
              />
              <p className="edit-vacancy">
                <b>
                  <i className="fi fi-sr-bed-alt"></i>
                  Số phòng:
                  <Controller
                    name="vacancy"
                    control={controlCreate}
                    rules={{
                      required: {
                        value: true,
                        message: "Vacancy is required",
                      },
                      min: {
                        value: 1,
                        message: "Bạn cần nhập số phòng có sẵn",
                      },
                    }}
                    render={({ field }) => <input {...field} type="number" />}
                  />{" "}
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
                  control={controlCreate}
                  rules={{
                    required: {
                      value: true,
                      message: "Price is required",
                    },
                    min: {
                      value: 1,
                      message: "Bạn cần chọn giá phòng",
                    },
                  }}
                  render={({ field }) => <input {...field} type="number" />}
                />
                VNĐ / đêm
              </p>
              <div className="btn__wrapper">
                <button
                  className={"confirm"}
                  type="submit"
                  disabled={isCreatingRoom}
                >
                  {isCreatingRoom ? (
                    <i className="fi fi-bs-ban"></i>
                  ) : (
                    <i className="fi fi-br-check"></i>
                  )}
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
        <MultiPicker
          data={multiPickerData}
          callback={multiPickerCallback.current}
          ref={multiPickerRef}
          defaultValues={multiPickerDefaultValues}
        />
      </form>
    );
  }
  return <>{room}</>;
};

export default Rooms;
