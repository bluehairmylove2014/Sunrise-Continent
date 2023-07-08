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
    const searchBoardForm = useForm();

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
            <Filterboard form={searchBoardForm}/>
            <div className="search__results">
                <div className="results__title-container">
                    <h3 className='results__title'>
                        Kết quả cho&nbsp;
                        <span>
                            {criteria[BANNER_INPUT.LOCATION.INPUT_NAME]}
                        </span>
                        <span>
                            {Object.keys(criteria).length > 1 && ` và +${Object.keys(criteria).length} tuỳ chọn khác`}
                        </span>
                    </h3>
                    <small>Hiển thị 0 - 20 trong {Number(4102014).toLocaleString('en')} kết quả</small>
                </div>
                <hr />
                <div className="results__subtitle-container">
                    <div className="result__subtitle">
                        <p>Thời gian được tính theo giờ địa phương</p>
                        <p>Đã bao gồm thuế và phí</p>
                    </div>
                    <div className="results__sort-container">
                        <button>
                            <span>Sắp xếp theo</span>
                            <i className="fi fi-ts-angle-small-down"></i>
                        </button>
                    </div>
                </div>
            </div>
            {/* <HotelResult /> */}
        </main>
    );
}

export default Search;
