import { axios } from "../../config/axios";
import { Services } from "../../service";


export class HotelService extends Services {
    API_URL = "";
    url = this.API_URL + "/hotel";
    abortController;

    searchUrl = this.url + "/search";
    getHotelDetailUrl = this.url + "/api/hotel";
    getRoomsUrl = `/api/rooms`;
    getSpecificRoomUrl = `/api/room`;

    search = async (keys) => {
        this.abortController = new AbortController();
        try {
            const response = await axios.post(
                this.searchUrl,
                keys,
                {
                    signal: this.abortController.signal
                }
            );
            return response.data;
            
        } catch (error) {
            if (!this.isCancel(error)) {
                // Handle other errors
                console.error("Catch error");
                throw error;
            }
        }
    };
    getHotelDetail = async (hotelID) => {
        this.abortController = new AbortController();
        try {
            const response = await axios.get(
                this.getHotelDetailUrl + `?id=${hotelID}`,
                {
                    signal: this.abortController.signal
                }
            );
            return response.data;
            
        } catch (error) {
            if (!this.isCancel(error)) {
                // Handle other errors
                console.error("Catch error");
                throw error;
            }
        }
    };
    getRooms = async (hotelID) => {
        this.abortController = new AbortController();
        try {
            const response = await axios.get(
                this.getRoomsUrl + `?hotelID=${hotelID}`,
                {
                    signal: this.abortController.signal
                }
            );
            return response.data;
            
        } catch (error) {
            if (!this.isCancel(error)) {
                // Handle other errors
                console.error("Catch error");
                throw error;
            }
        }
    };
    getSpecificRoom = async (hotelID, roomID) => {
        this.abortController = new AbortController();
        try {
            console.log(this.getSpecificRoomUrl + `?hotelId=${hotelID}&id=${roomID}`)
            const response = await axios.get(
                this.getSpecificRoomUrl + `?hotelId=${hotelID}&id=${roomID}`,
                {
                    signal: this.abortController.signal
                }
            );
            return response.data;
            
        } catch (error) {
            if (!this.isCancel(error)) {
                // Handle other errors
                console.error("Catch error");
                throw error;
            }
        }
    };
}

