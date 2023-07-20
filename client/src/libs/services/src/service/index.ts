import { axios, AxiosInstance, isCancel } from "../config/axios";

interface IServices {
  readonly url: string;
  abortController?: AbortController;
  cancelRequest(): void;
  isCancel(error: unknown): boolean;
  axios: AxiosInstance;
}

export abstract class Services implements IServices {
  abstract readonly url: string;
  abstract abortController?: AbortController;
  axios: AxiosInstance;

  constructor() {
    this.axios = axios;
  }

  isCancel(error: unknown): boolean {
    return isCancel(error);
  }

  cancelRequest(): void {
    if (this.abortController) {
      this.abortController.abort();
    }
  }
}
