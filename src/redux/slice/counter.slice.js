import { createSlice } from '@reduxjs/toolkit';


export const counterSlice = createSlice({
    name: 'counter',
    initialState: 0,
    reducers: {
        increment: (state, action) => state + action.payload.amount,
        decrement: (state, action) => state - action.payload.amount,
    }
})

export const { increment, decrement } = counterSlice.actions;
export default counterSlice.reducer;