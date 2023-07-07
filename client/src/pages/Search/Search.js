import React, { useState } from 'react';
import '../../styles/scss/_search.scss';
import TravelImg from '../../assets/images/graphics/travel.png';
import Filterboard from './Filterboard';
// import HotelResult from './HotelResult';
import BannerInput from '../../components/common/BannerInput';
import { useForm } from 'react-hook-form';
import { BANNER_INPUT } from '../../constants/Variables.constants';
import { useLocation } from 'react-router-dom';
import { 
    parseSearchParams,
    stringifySearchParams
} from '../../utils/helpers/params';

const Search = () => {
    const [criteria, setCriteria] = useState(parseSearchParams(useLocation().search));
    const defaultValues = Object.keys(BANNER_INPUT).reduce((values, key) => {
        const inputName = BANNER_INPUT[key].INPUT_NAME;
        if(Array.isArray(inputName)) {
            inputName.forEach(n => {
                values[n] = criteria[n];
            });
            return values;
        }
        else {
            values[BANNER_INPUT[key].INPUT_NAME] = criteria[BANNER_INPUT[key].INPUT_NAME];
            return values;
        }
    }, {});
    const criteriaBoardForm = useForm({
        defaultValues
    });

    const onResearch = (data) => {
        setCriteria(data);
        window.history.pushState(null, null, `/search${stringifySearchParams(data)}`);
    };

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
            <form className="search__criteria-board" onSubmit={criteriaBoardForm.handleSubmit(onResearch)}>
                <BannerInput
                    name={BANNER_INPUT.LOCATION.INPUT_NAME}
                    type={BANNER_INPUT.LOCATION.TYPE}
                    form={criteriaBoardForm}
                />
                <BannerInput
                    name={BANNER_INPUT.DATE_TIME_DOUBLE.INPUT_NAME}
                    type={BANNER_INPUT.DATE_TIME_DOUBLE.TYPE}
                    form={criteriaBoardForm}
                />
                <BannerInput
                    name={BANNER_INPUT.PEOPLE_AND_ROOM.INPUT_NAME}
                    title={BANNER_INPUT.PEOPLE_AND_ROOM.TITLE}
                    description={BANNER_INPUT.PEOPLE_AND_ROOM.DESCRIPTION}
                    type={BANNER_INPUT.PEOPLE_AND_ROOM.TYPE} 
                    min={BANNER_INPUT.PEOPLE_AND_ROOM.MIN_VALUE}
                    form={criteriaBoardForm}
                />
                <button type='submit' className='search__submit-btn'>
                    Tìm kiếm
                </button>
            </form>
            <Filterboard />
            {/* <HotelResult /> */}
        </main>
    );
}

export default Search;

