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
import { BANNER_INPUT_TYPE } from '../../constants/Variables.constants';

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
                    type={BANNER_INPUT_TYPE.LOCATION} 
                    control = {criteriaBoardForm.control}
                    defaultValue = {"London"}
                />
                <BannerInput
                    type={BANNER_INPUT_TYPE.DATE_TIME_DOUBLE} 
                    control = {criteriaBoardForm.control}
                    defaultValue = {"London"}
                />
                <BannerInput
                    type={BANNER_INPUT_TYPE.PEOPLE_AND_ROOM} 
                    control = {criteriaBoardForm.control}
                    defaultValue = {"London"}
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
