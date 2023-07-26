import React from 'react';
import { BED_TYPES } from '../../constants/filter.constants';

const Rooms = ({rooms_data}) => {
    let room = null;
    if(Array.isArray(rooms_data)) {
        room = rooms_data.map(rd => {
            return (
                <div className='room__wrapper'>
                    <h5>{ rd.name + " " + BED_TYPES[rd.bedType].LABEL}</h5>
                </div>
            )
        })
    }
    return (
        <>{room}</>
    );
}

export default Rooms;
