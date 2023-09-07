// Importing necessary modules and functions
import { useUploadMutation } from "../../fetching/mutation";

export const useUpload = () => {
  const uploadMutation = useUploadMutation();

  const readFileAsBuffer = (file) => {
    return new Promise((resolve) => {
      const reader = new FileReader();

      reader.onload = (event) => {
        resolve(event.target.result);
      };

      reader.readAsArrayBuffer(file);
    });
  };

  const onUpload = ({ imgFile, hotelName, imgName }) => {
    return new Promise((resolve, reject) => {
      // Convert file to buffer
      readFileAsBuffer(imgFile).then((buffer) => {
        uploadMutation
          .mutateAsync({
            file: imgFile,
            fileBuffer: buffer,
            path: `/Sunrise-Continent/hotels/${hotelName}/${imgName}`,
          })
          .then((data) => {
            resolve(data);
          })
          .catch((error) => {
            reject(error);
          });
      });
    });
  };

  return {
    onUpload,
    isLoading: uploadMutation.isLoading,
  };
};
