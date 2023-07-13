import { axios } from "../../config/axios";
import { Services } from "../../service";


export class HotelService extends Services {
    API_URL = "";
    url = this.API_URL + "/hotel";
    abortController;

    searchUrl = this.url + "/search";

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
}

