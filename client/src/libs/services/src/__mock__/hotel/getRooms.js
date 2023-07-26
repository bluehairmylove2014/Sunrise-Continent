import { axiosMockAdapterInstance } from "../../config/axios";
import { HotelService } from "../../lib";
import roomsData from "../data/rooms.json";

axiosMockAdapterInstance
    .onGet(new RegExp(`${new HotelService().getRoomsUrl}\\?hotelID=\\d+`))
    .reply((config) => {
        return [
            200,
            roomsData
        ];
    });
