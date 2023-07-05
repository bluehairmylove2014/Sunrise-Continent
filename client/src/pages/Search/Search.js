import React from 'react';
import '../../styles/scss/_search.scss';

// Image
import TravelImg from '../../assets/images/graphics/travel.png';

// Component
// import Filterboard from './Filterboard';
// import HotelResult from './HotelResult';
import BannerInput from '../../components/common/BannerInput';

// React-hook-form
import { useForm } from 'react-hook-form';

// Constants
import { BANNER_INPUT_TYPE, BANNER_INPUT_MIN, BANNER_INPUT_NAME, BANNER_INPUT_TITLE, BANNER_INPUT_DESCRIPTION } from '../../constants/Variables.constants';

const Search = () => {
    const criteriaBoardForm = useForm();
    return (
        <main className='search'>
            <div className="search__banner">
                <img src={TravelImg} alt="travel" />
                <h5>Bạn muốn du lịch tới Vương Quốc Anh?</h5>
                <small>Hãy đọc tất cả các yêu cầu thủ tục nhập cảnh trước khi đặt chỗ nhé.</small>
                <button>
                    Tìm hiểu thêm
                </button>
            </div>
            <form className="search__criteria-board">
                <BannerInput
                    name={BANNER_INPUT_NAME.LOCATION}
                    type={BANNER_INPUT_TYPE.LOCATION} 
                    control = {criteriaBoardForm.control}
                    defaultValue = {"London"}
                />
                <BannerInput
                    name={BANNER_INPUT_NAME.DATE_TIME}
                    type={BANNER_INPUT_TYPE.DATE_TIME_DOUBLE} 
                    control = {criteriaBoardForm.control}
                    watcher = {criteriaBoardForm.watch}
                    defaultValue = {["2023-07-03T14:31", "2023-07-15T14:31"]}
                />
                <BannerInput
                    name={BANNER_INPUT_NAME.PEOPLE_AND_ROOM}
                    title={BANNER_INPUT_TITLE.PEOPLE_AND_ROOM}
                    description={BANNER_INPUT_DESCRIPTION.PEOPLE_AND_ROOM}
                    type={BANNER_INPUT_TYPE.PEOPLE_AND_ROOM} 
                    control = {criteriaBoardForm.control}
                    watcher = {criteriaBoardForm.watch}
                    defaultValue = {BANNER_INPUT_MIN.PEOPLE_AND_ROOM}
                    min={BANNER_INPUT_MIN.PEOPLE_AND_ROOM}
                />
                <button type='submit' className='search__submit-btn'>
                    Tìm kiếm
                </button>
            </form>
            {/* <Filterboard />
            <HotelResult /> */}
        </main>
    );
}

export default Search;
