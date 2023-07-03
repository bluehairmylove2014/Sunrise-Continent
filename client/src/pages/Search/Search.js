import React from 'react';
import '../../styles/scss/_search.scss';

// Image
import TravelImg from '../../assets/images/graphics/travel.png';

// Component
import Filterboard from './Filterboard';
import HotelResult from './HotelResult';

// React-hook-form
import { useForm, Controller } from 'react-hook-form';

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
            <div className="search__criteria-board">
                <div className="search-cb__location">
                    <button>
                        <i className="fi fi-rs-search"></i>
                    </button>
                    <Controller
                        name='location'
                        control={criteriaBoardForm.control}
                        defaultValue={"Lodon"}
                        rules={{
                            require: true
                        }}
                        render={({ field }) => (
                          <input
                            {...field}
                          />
                        )}
                    />
                </div>
                <div className="search-cb__time">
                    <button>
                        <i className="fi fi-rs-search"></i>
                    </button>
                    <Controller
                        name='start_date'
                        control={criteriaBoardForm.control}
                        defaultValue={""}
                        rules={{
                            require: true
                        }}
                        render={({ field }) => (
                            <>
                                <label>
                                </label>
                                <input
                                    {...field}
                                    type='datetime-local'
                                />
                            </>
                        )}
                    />
                </div>
            </div>
            {/* <Filterboard />
            <HotelResult /> */}
        </main>
    );
}

export default Search;
