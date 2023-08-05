import { Services } from "../../service";
import {
  bookingSchema,
  getHotHotelSchema,
  getRoomsSchema,
  getSpecificRoomSchema,
  hotelDetailSchema,
  searchSchema,
} from "./schema";

export class HotelService extends Services {
  abortController;

  searchUrl = "/hotel/search";
  getHotelDetailUrl = "/hotel/single";
  getRoomsUrl = this.url + `/room`;
  getSpecificRoomUrl = `/room/single`;
  getHotHotelUrl = `/hotel/recommend`;
  checkRoomAvailableUrl = `/hotel/booking`;

  search = async (keys) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "POST",
        url: this.searchUrl,
        schema: searchSchema,
        data: keys,
        signal: this.abortController.signal,
        transformResponse: (res) => res,
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error 1");
        throw error;
      }
    }
  };
  getHotelDetail = async (hotelID) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "GET",
        url: this.getHotelDetailUrl,
        schema: hotelDetailSchema,
        params: {
          id: hotelID,
        },
        signal: this.abortController.signal,
        transformResponse: (res) => res,
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error 2");
        throw error;
      }
    }
  };
  getRooms = async (hotelID) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "GET",
        url: this.getRoomsUrl,
        schema: getRoomsSchema,
        params: {
          hotelId: hotelID,
        },
        signal: this.abortController.signal,
        transformResponse: (res) => res,
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error 3");
        throw error;
      }
    }
  };
  getSpecificRoom = async (hotelID, roomID) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "GET",
        url: this.getSpecificRoomUrl,
        schema: getSpecificRoomSchema,
        params: {
          hotelId: hotelID,
          id: roomID,
        },
        signal: this.abortController.signal,
        transformResponse: (res) => res,
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error 4");
        throw error;
      }
    }
  };
  getHotHotel = async () => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "GET",
        url: this.getHotHotelUrl,
        schema: getHotHotelSchema,
        signal: this.abortController.signal,
        transformResponse: (res) => res,
        isProduction: true,
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error 5");
        throw error;
      }
    }
  };
  checkRoomAvailable = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "POST",
        url: this.checkRoomAvailableUrl,
        schema: bookingSchema,
        data: params,
        signal: this.abortController.signal,
        transformResponse: (res) => res,
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error 6");
        throw error;
      }
    }
  };
}
