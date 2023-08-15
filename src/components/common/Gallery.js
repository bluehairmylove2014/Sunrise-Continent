import React, { useState } from "react";
import "../../styles/common/gallery.scss";
import emptyBoxIcon from "../../assets/images/graphics/empty-box.png";

const Gallery = ({ data, isOpen, openCallback }) => {
  const [selectedPicture, setSelectedPicture] = useState(null);

  return (
    <div className={`common-component__gallery ${isOpen ? "active" : ""}`}>
      <div className="gallery__overlay"></div>
      <div className="gallery__box">
        <div className="gallery__box-container">
          <div className="box__title">
            <h5>Thư viện</h5>
            <button onClick={() => openCallback(!isOpen)}>x</button>
          </div>
          <div className={`box__content`}>
            {data && Array.isArray(data) ? (
              data.map((pd) => {
                return (
                  <button
                    className="content__picture"
                    key={`room` + pd.roomTypeId + `picture` + pd.id}
                    onClick={() => setSelectedPicture(pd)}
                  >
                    <img src={pd.pictureLink || pd.link} alt={pd.id} />
                  </button>
                );
              })
            ) : (
              <div className="empty">
                <img src={emptyBoxIcon} alt="empty" />
                <p>Không có hình ảnh nào cả</p>
              </div>
            )}
          </div>
          <div
            className={`box__full-size-picture-container ${
              selectedPicture ? "active" : ""
            }`}
          >
            <div className="full-size-picture">
              <button onClick={() => setSelectedPicture(null)}>x</button>
              <img
                src={
                  selectedPicture &&
                  (selectedPicture.pictureLink || selectedPicture.link)
                }
                alt={selectedPicture && selectedPicture.id}
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Gallery;
