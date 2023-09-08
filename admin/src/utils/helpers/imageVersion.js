export const generateImageVersion = () => {
  return `?v=${Math.floor(Math.random() * (100000000 - 0)) + 0}`;
};
