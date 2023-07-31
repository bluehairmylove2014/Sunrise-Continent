import { useState, useEffect } from 'react';
import '../../styles/scss/home.scss';

// Swipeable on mobile
import { useSwipeable } from 'react-swipeable';

const Banners = ({data_banner}) => {
    const [activeIndex, setActiveIndex] = useState(0);

    const banners = data_banner.map((banner, i) => {
        return (
            <img
                className={`home-banner__img ${i === activeIndex ? 'active' : ''}`}
                src={banner.src}
                alt="hotel banner"
                key={banner.id}
            />
        )
    })
    const indicators = data_banner.map((_, i) => (
        <button
            key={i}
            className={`home-banner__indicator ${i === activeIndex ? 'active' : ''}`}
            onClick={() => setActiveIndex(i)}
        ></button>
    ));

    useEffect(() => {
        const interval = setInterval(() => {
            setActiveIndex((prevIndex) => (prevIndex + 1) % data_banner.length);
        }, 5000);
        return () => clearInterval(interval);
    }, [data_banner]);

    // Methods
    const handlePrev = () => {
        setActiveIndex((prevIndex) => (prevIndex - 1 + data_banner.length) % data_banner.length);
    };
    
    const handleNext = () => {
        setActiveIndex((prevIndex) => (prevIndex + 1) % data_banner.length);
    };

    const swipeHandlers = useSwipeable({
        onSwipedLeft: handlePrev,
        onSwipedRight: handleNext,
    });

    return (
        // <div className="home-banner__slider">
        //     <div className="home-banner__slides">
        //         {banners}
        //     </div>
        // </div>
        <div className="home-banner__slider" {...swipeHandlers}>
            <div className="home-banner__slides">
                {banners}
            </div>
            <button className="home-banner__prev" onClick={handlePrev}>Prev</button>
            <button className="home-banner__next" onClick={handleNext}>Next</button>
            <div className="home-banner__indicators">
                {indicators}
            </div>
        </div>
    )
}

export default Banners;
