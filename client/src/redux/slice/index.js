import counter from "./counter.slice";
import { combineReducers } from "redux";

const allReducers = combineReducers ({
    counter
})

export default allReducers;