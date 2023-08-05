import { axios, isCancel } from "../config/axios";

export class Services {
  url;
  abortController;
  axios;

  constructor() {
    this.axios = axios;
  }

  isCancel(error) {
    return isCancel(error);
  }

  cancelRequest() {
    if (this.abortController) {
      this.abortController.abort();
    }
  }

  async fetchApi({
    method,
    url,
    schema,
    params,
    data,
    headers = {},
    signal,
    transformResponse,
  }) {
    const response = await this.axios({
      method,
      url,
      data,
      params,
      headers,
      signal,
    });
    const dataResponse = schema.parse(response.data);
    return transformResponse ? transformResponse(dataResponse) : dataResponse;
  }
}
