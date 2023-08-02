import {
  ACCOMMODATION_FACILITIES,
  BED_TYPES,
  LOCATION_TYPES,
  ROOM_OPTIONS,
} from "./filter.constants";

export const VARIABLES = {
  AUTH_TOKEN_LSKEY: "authorization_token",
  REMEMBER_ME_LSKEY: "remember_me_option",
};
export const BANNER_INPUT = {
  LOCATION: {
    INPUT_NAME: "location",
    TYPE: "location type",
  },
  DATE_TIME_DOUBLE: {
    INPUT_NAME: ["start_date", "end_date"],
    TYPE: "date time local start end type",
  },
  PEOPLE_AND_ROOM: {
    INPUT_NAME: ["rooms", "adults", "childrens"],
    TYPE: "pick people and room number",
    MIN_VALUE: [1, 1, 0],
    TITLE: ["Phòng", "Người lớn", "Trẻ em"],
    DESCRIPTION: ["", "18 tuổi trở lên", "0 - 17 tuổi"],
  },
};
export const FILTER_INPUT = [
  ...Object.keys(LOCATION_TYPES).map((lt) => LOCATION_TYPES[lt].INPUT_NAME),
  ...Object.keys(BED_TYPES).map((lt) => BED_TYPES[lt].INPUT_NAME),
  ...Object.keys(ROOM_OPTIONS).map((lt) => ROOM_OPTIONS[lt].INPUT_NAME),
  ...Object.keys(ACCOMMODATION_FACILITIES).map(
    (lt) => ACCOMMODATION_FACILITIES[lt].INPUT_NAME
  ),
];

export const CONVERSION_FACTOR = {
  ALL_TRIP: 100000,
  PER_ONE: 100000,
};
