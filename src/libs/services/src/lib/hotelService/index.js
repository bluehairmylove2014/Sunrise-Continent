import { Services } from "../../service";
import {
  bookingSchema,
  createHotelSchema,
  createRoomSchema,
  deleteRoomSchema,
  editHotelSchema,
  editRoomSchema,
  getHotHotelSchema,
  getPictureSchema,
  getReviewSchema,
  getRoomsSchema,
  getSpecificRoomSchema,
  getWeeklyRevenueSchema,
  getYearlyRevenueSchema,
  hotelDetailSchema,
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
  createHotelUrl = `/hotel`;
  editHotelUrl = `/hotel`;
  createRoomUrl = `/room`;
  editRoomUrl = `/room`;
  deleteRoomUrl = `/room`;
  getYearlyRevenueUrl = `/hotel/yearly-revenue`;
  getWeeklyRevenueUrl = `/hotel/weekly-revenue`;

  search = async (keys) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "GET",
        url: this.searchUrl,
        schema: searchSchema,
        params: keys,
        signal: this.abortController.signal,
        transformResponse: (res) => res,
        // isProduction: true,
      });
      return response;
    } catch (error) {
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
        console.error("Catch error 6");
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
  createHotel = async ({ data, token }) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "POST",
        url: this.createHotelUrl,
        schema: createHotelSchema,
        data,
        headers: { Authorization: `Bearer ${token}` },
        signal: this.abortController.signal,
        transformResponse: (res) => res.message,
        isProduction: true,
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error createHotel");
        throw error;
      }
    }
  };
  editHotel = async ({ data, token }) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "PUT",
        url: this.editHotelUrl,
        schema: editHotelSchema,
        data,
        headers: { Authorization: `Bearer ${token}` },
        signal: this.abortController.signal,
        transformResponse: (res) => res.message,
        isProduction: true,
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error edit hotel");
        throw error;
      }
    }
  };
  createRoom = async ({ data, token }) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "POST",
        url: this.createRoomUrl,
        schema: createRoomSchema,
        data,
        headers: { Authorization: `Bearer ${token}` },
        signal: this.abortController.signal,
        transformResponse: (res) => res.message,
        isProduction: true,
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error create room");
        throw error;
      }
    }
  };
  editRoom = async ({ data, token }) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "PUT",
        url: this.editRoomUrl,
        schema: editRoomSchema,
        data,
        headers: { Authorization: `Bearer ${token}` },
        signal: this.abortController.signal,
        transformResponse: (res) => res.message,
        isProduction: true,
      });
      return response;
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error edit room");
        throw error;
      }
    }
  };
  deleteRoom = async ({ data, token }) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "DELETE",
        url: this.deleteRoomUrl,
        schema: deleteRoomSchema,
        params: data,
        headers: {
          Authorization: `Bearer ${token}`,
        },
        signal: this.abortController.signal,
        transformResponse: (res) => res.message,
        isProduction: true,
      });
      return response;
    } catch (error) {
      console.log(error);
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error delete room");
        throw error;
      }
    }
  };
  getYearlyRevenue = async ({ token }) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "GET",
        url: this.getYearlyRevenueUrl,
        schema: getYearlyRevenueSchema,
        headers: {
          Authorization: `Bearer ${token}`,
        },
        signal: this.abortController.signal,
        transformResponse: (res) => res,
        isProduction: true,
      });
      return response;
    } catch (error) {
      console.log(error);
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error getYearlyRevenue");
        throw error;
      }
    }
  };
  getWeeklyRevenue = async ({ token }) => {
    this.abortController = new AbortController();
    try {
      const response = await this.fetchApi({
        method: "GET",
        url: this.getWeeklyRevenueUrl,
        schema: getWeeklyRevenueSchema,
        headers: {
          Authorization: `Bearer ${token}`,
        },
        signal: this.abortController.signal,
        transformResponse: (res) => res,
        isProduction: true,
      });
      return response;
    } catch (error) {
      console.log(error);
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error getWeeklyRevenue");
        throw error;
      }
    }
  };
}
