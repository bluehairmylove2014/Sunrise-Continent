import React, { useRef, useState } from 'react';

const Gallery = ({list}) => {
    const gallery_item_ref = useRef([]);
    const [curItemID, setCurItemID] = useState(0);
    const showDetail = (e) => {
        // This function unactive last gallery item and
        // active the target item

        // Get next gallery item id and remove last active item
        const nextGalleryItemID = e.target.getAttribute('data-id');
        gallery_item_ref.current[curItemID].classList.remove('active');

        // Add class 'active' to target
        if(!e.target.classList.contains('active')) {
            e.target.classList.add('active');
        }
        // Set new current item id
        setCurItemID(nextGalleryItemID);
    }
    const gallery_item = list.map((item, i) => {
        return (
            <div 
                data-id={i}
                className={`home-promised-land__gallery-item ${i === 0 && 'active'}`}
                ref={el => gallery_item_ref.current[i] = el}
                onClick={e => showDetail(e)}
            >
                <img src={item.ImgUrl} alt="hot-countries" />

                <div className="gallery-item__introduction">
                    <h2>{item.Name}</h2>
                    <p>{item.Description}</p>
                    <button>View More<i className="fi fi-rr-caret-right"></i></button>
                </div>
            </div>
        )
    })
    return (
        <div className="home-promised-land__gallery">
            {gallery_item}
        </div>
    );
}

export default Gallery;
