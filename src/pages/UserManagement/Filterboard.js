/* eslint-disable react-hooks/exhaustive-deps */
import React from "react";
import Checkbox from "../../components/common/Checkbox/Checkbox";

const FILTER_CHECKBOX_KEY = [
  {
    checkboxGroupKey: "role",
    label: "Vai trò trong hệ thống",
    checkboxData: {
      USER: {
        INPUT_NAME: "user",
        LABEL: "Người dùng",
      },
      PARTNER: {
        INPUT_NAME: "partner",
        LABEL: "Đối tác / Chủ khách sạn",
      },
      ADMIN: {
        INPUT_NAME: "admin",
        LABEL: "Quản trị viên",
      },
    },
  },
  {
    checkboxGroupKey: "gender",
    label: "Giới tính",
    checkboxData: {
      MALE: {
        INPUT_NAME: "male",
        LABEL: "Giới tính nam",
      },
      FEMALE: {
        INPUT_NAME: "female",
        LABEL: "Giới tính nữ",
      },
    },
  },
];

const Filterboard = ({ form, callback }) => {
  const onCheckboxChange = (checkboxName, paramKey, checkboxList) => {
    const checkboxValue = Object.keys(checkboxList).find(
      (ck) => checkboxList[ck].INPUT_NAME === checkboxName
    );
    callback({
      key: paramKey,
      value: checkboxValue,
      status: form.getValues()[checkboxName],
    });
  };
  const renderCheckbox = (parentForm, checkboxData, paramKey) => {
    const keyList = Object.keys(checkboxData);
    if (Array.isArray(keyList)) {
      return keyList.map((k) => (
        <Checkbox
          form={parentForm}
          name={checkboxData[k].INPUT_NAME}
          label={checkboxData[k].LABEL}
          callbackOnChange={(callbackData) => {
            onCheckboxChange(callbackData, paramKey, checkboxData);
          }}
          key={checkboxData[k].INPUT_NAME}
        />
      ));
    } else {
      return <></>;
    }
  };

  return (
    <form className="filterboard">
      {FILTER_CHECKBOX_KEY.map((fc) => {
        return (
          <div
            className="filterboard__location-types"
            key={fc.checkboxGroupKey}
          >
            <h6>{fc.label}</h6>

            {renderCheckbox(form, fc.checkboxData, fc.checkboxGroupKey)}
          </div>
        );
      })}
    </form>
  );
};

export default Filterboard;
