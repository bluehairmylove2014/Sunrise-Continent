export const VARIABLES = {
    AUTH_TOKEN_LSKEY: 'authorization_token',
    REMEMBER_ME_LSKEY: 'remember_me_option',
};
export const BANNER_INPUT_TYPE = {
    LOCATION: "location type",
    DATE_TIME: "date time local type",
    DATE_TIME_DOUBLE: "date time local start end type",
    PEOPLE_AND_ROOM: "pick people and room number"
}

export const BANNER_INPUT_MIN = {
    PEOPLE_AND_ROOM: [1, 1, 0]
};

export const BANNER_INPUT_NAME = {
    LOCATION: 'location',
    DATE_TIME: ['start_date', 'end_date'],
    PEOPLE_AND_ROOM: ['rooms', 'adults', 'childrens']
};

export const BANNER_INPUT_TITLE = {
    PEOPLE_AND_ROOM: ['Phòng', 'Người lớn', 'Trẻ em']
};

export const BANNER_INPUT_DESCRIPTION = {
    PEOPLE_AND_ROOM: ['', '18 tuổi trở lên', '0 - 17 tuổi']
};
