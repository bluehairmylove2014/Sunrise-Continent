import axios from "axios";
import { delay } from "lodash";
import React from "react";

const unknownError = "Unexpected error occurred";
const baseUrlTemplate = "https://api.sirv.com";
const baseApi = baseUrlTemplate + "/v2";
const uploadApi = baseApi + "/files/upload";
const deleteApi = baseApi + "/files/delete";
// const downloadApi = baseApi + "/files/download";
const sirvUser = "rialloer";
let sirvState = {
  options: {
    method: "POST",
    url: baseUrlTemplate + "/v2/token",
    headers: {
      "Content-Type": "application/json",
    },
  },
  clientId: process.env.REACT_APP_SIRV_CLIENT_ID || "",
  clientSecret: process.env.REACT_APP_SIRV_CLIENT_SECRET || "",
  access_token: "",
  expiresIn: 0,
  scope: [],
  tokenExpirationTimestamp: 0,
};

export class SirvService extends React.Component {
  isConnecting = false;
  connect = async () => {
    try {
      const response = await axios.post(sirvState.options.url, {
        clientId: sirvState.clientId,
        clientSecret: sirvState.clientSecret,
      });
      const apiResponse = response.data;

      sirvState = {
        ...sirvState,
        access_token: apiResponse.token,
        scope: apiResponse.scope,
        expiresIn: apiResponse.expiresIn,
        tokenExpirationTimestamp:
          Math.floor(Date.now() / 1000) + apiResponse.expiresIn,
      };
      this.isConnecting = false; // Mark connection as completed
      return apiResponse;
    } catch (error) {
      throw new Error(error.message);
    }
  };

  upload = async ({ file, fileBuffer, path }) => {
    try {
      // Check if the token has expired
      if (Math.floor(Date.now() / 1000) >= sirvState.tokenExpirationTimestamp) {
        this.isConnecting = true;
        await this.connect(); // Wait for connection to complete
      }
      while (this.isConnecting) {
        await delay(300);
      }
      // eslint-disable-next-line no-unused-vars
      const response = await axios({
        method: "POST",
        url: uploadApi,
        params: { filename: path },
        headers: {
          "Content-Type": file.type,
          Authorization: `Bearer ${sirvState.access_token}`,
        },
        data: fileBuffer,
      });
      const encodedUrl = path
        .split("/")
        .map((part) => encodeURIComponent(part))
        .join("/");
      return {
        path: `https://${sirvUser}.sirv.com${encodedUrl}`,
        type: file.type,
      };
    } catch (error) {
      if (!this.isCancel(error)) {
        throw new Error(
          error.response ? error.response.data.message : unknownError
        );
      }
    }
  };
  delete = async (filepath) => {
    try {
      // Check if the token has expired
      if (Math.floor(Date.now() / 1000) >= sirvState.tokenExpirationTimestamp) {
        this.isConnecting = true;
        await this.connect(); // Wait for connection to complete
      }
      while (this.isConnecting) {
        await delay(300);
      }
      filepath = filepath.replace(" ", "%20");
      filepath = filepath.replace("/", "%2F");
      // eslint-disable-next-line no-unused-vars
      const response = await axios({
        method: "POST",
        url: deleteApi,
        params: { filename: filepath },
        headers: {
          Authorization: `Bearer ${sirvState.access_token}`,
        },
      });
      return {
        message: "Success",
      };
    } catch (error) {
      if (!this.isCancel(error)) {
        throw new Error(
          error.response ? error.response.data.message : unknownError
        );
      }
    }
  };
}
