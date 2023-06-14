import { configureStore } from '@reduxjs/toolkit';
import rootReducer from './slice';

export default configureStore({
    reducer: rootReducer
})