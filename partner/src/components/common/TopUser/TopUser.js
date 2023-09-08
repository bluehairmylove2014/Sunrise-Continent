import React from "react";
import { convertNumberToCurrency } from "../../../utils/helpers/MoneyConverter";
import "./TopUser.scss";
import { RankList } from "../../../constants/Rank";

const TopUser = ({ topUserList }) => {
  return (
    <div className="top-user__wrapper">
      <h3>Bảng xếp hạng</h3>
      <div className="top-user-list">
        {Array.isArray(topUserList) ? (
          topUserList.map((tuser, index) => (
            <div className="top-user" key={index}>
              <div className={`rank top${index + 1}`}>{index + 1}</div>
              <div className="user">
                <img src={tuser.image} alt={tuser.name} />
                <div className="user__info">
                  <span>{tuser.name}</span>
                  <span>
                    <img src={RankList[tuser.rank].image} alt="tuser.rank" />
                    {tuser.rank}
                  </span>
                </div>
              </div>
              <strong className="money">
                {convertNumberToCurrency("vietnamdong", tuser.value)}
              </strong>
            </div>
          ))
        ) : (
          <></>
        )}
      </div>
    </div>
  );
};

export default TopUser;
