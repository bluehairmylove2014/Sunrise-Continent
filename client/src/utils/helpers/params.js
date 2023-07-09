export const parseSearchParams = (params) => {
    // Ex: "?location=London&start_date=2023-07-12T14%3A31&end_date=2023-07-28T14%3A31&rooms=2&adults=3&childrens=1"
    const paramObject = {};
    const paramArray = params.slice(1).split('&');
    paramArray.forEach((param) => {
        const [key, value] = param.split('=');
        paramObject[key] = isNaN(value) ? decodeURIComponent(value) : Number(value);
    });
    return paramObject;
};
export const stringifySearchParams = (paramsObj) => {
    let result = "?";
    Object.keys(paramsObj).forEach(k => {
        if(paramsObj[k]) {
            result.length > 1 && (result += "&");
            const encodeVal = paramsObj[k]
                                .toString()
                                .toLowerCase()
                                .replace(" ", "%20");
            result += `${k}=${encodeVal}`;
        }
    })
    return result;
};