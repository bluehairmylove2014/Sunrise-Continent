export const standardizedKeyword = (keyword) => {
  return keyword
    .trim()
    .toLowerCase()
    .replace(/\s{2,}/g, " ");
};
