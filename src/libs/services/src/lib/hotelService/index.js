import { Services } from "../../service";
import {
  bookingSchema,
  getHotHotelSchema,
  getPictureSchema,
  getReviewSchema,
  getRoomsSchema,
  getSpecificRoomSchema,
  hotelDetailSchema,
  reviewSchema,
  searchSchema,
} from "./schema";

export class HotelService extends Services {
  abortController;

  searchUrl = "/hotel/search";
  getHotelDetailUrl = "/hotel/single";
  getRoomsUrl = `/room`;
  getSpecificRoomUrl = `/room/single`;
  getHotHotelUrl = `/hotel/recommend`;
  checkRoomAvailableUrl = `/room/available`;
  getPictureUrl = `/hotel/picture`;
  getReviewUrl = `/hotel/review`;
  reviewUrl = `/hotel/review`;

  search = async (keys) => {
    this.abortController = new AbortController();
    try {
      console.log("SEND: ", keys);
      const response = await this.fetchApi({
        method: "GET",
        url: this.searchUrl,
        schema: searchSchema,
        params: keys,
        signal: this.abortController.signal,
        transformResponse: (res) => res,
        isProduction: true,
      });
      return response;
    } catch (error) {
      console.log("error: ", error);
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error 1 ", error);
        throw error;
      }
    }
  };
  getHotelDetail = async (hotelID) => {
    this.abortController = new AbortController();
    try {
      if (!hotelID) return null;
      else {
        const response = await this.fetchApi({
          method: "GET",
          url: this.getHotelDetailUrl,
          schema: hotelDetailSchema,
          params: {
            id: hotelID,
          },
          signal: this.abortController.signal,
          transformResponse: (res) => res,
          isProduction: true,
        });
        return response;
      }
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error 2 ", error);
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
        isProduction: true,
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error 3 ", error);
        throw error;
      }
    }
  };
  getSpecificRoom = async (hotelID, roomID) => {
    this.abortController = new AbortController();
    try {
      if (!hotelID || !roomID) return null;
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
        isProduction: true,
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error 4 ", error);
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
        console.error("Catch error 5: ", error);
        throw error;
      }
    }
  };
  checkRoomAvailable = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "GET",
        url: this.checkRoomAvailableUrl,
        schema: bookingSchema,
        params,
        signal: this.abortController.signal,
        transformResponse: (res) => res,
        isProduction: true,
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error 6: ", error);
        throw error;
      }
    }
  };
  getPictures = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "GET",
        url: this.getPictureUrl,
        schema: getPictureSchema,
        params,
        signal: this.abortController.signal,
        transformResponse: (res) => res,
        isProduction: true, // Do not have mock api now
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error 7");
        throw error;
      }
    }
  };
  getReview = async (params) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "GET",
        url: this.getReviewUrl,
        schema: getReviewSchema,
        params,
        signal: this.abortController.signal,
        transformResponse: (res) => res,
        isProduction: true, // Do not have mock api now
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error review");
        throw error;
      }
    }
  };
  reviewHotel = async ({ data, token }) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "POST",
        url: this.reviewUrl,
        schema: reviewSchema,
        data,
        signal: this.abortController.signal,
        headers: {
          Authorization: `Bearer ${token}`,
        },
        transformResponse: (res) => res.message,
        isProduction: true, // Do not have mock api now
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error review");
        throw error;
      }
    }
  };
}
