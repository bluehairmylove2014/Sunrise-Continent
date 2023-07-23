import { axiosMockAdapterInstance } from "../../config/axios";
import { HotelService } from "../../lib";
import roomsData from "../data/rooms.json";


axiosMockAdapterInstance
    .onGet(new RegExp(`${new HotelService().getSpecificRoomUrl}\\?hotelID=\\d+\\&id=\\d+`, 'i'))
    .reply((config) => {
        return [
            200,
            roomsData[0]
        ];
    });
