export function isDateGreaterThan (dateCheck, dateTarget) {
    if(!dateCheck || !dateTarget) return false;
    const check = new Date(dateCheck);
    const target = new Date(dateTarget);

    return check > target;
}