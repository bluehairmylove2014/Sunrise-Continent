import React from "react";
import report1Icon from "../../../assets/images/icons/income.svg";
import report2Icon from "../../../assets/images/icons/booking.svg";
import report3Icon from "../../../assets/images/icons/tag.svg";
import "./TotalReport.scss";
import { convertNumberToCurrency } from "../../../utils/helpers/MoneyConverter";
import { totalReportValueType } from "../../../constants/Variables.constants";

const reportBoxIcon = [report1Icon, report2Icon, report3Icon];

const TotalReport = ({ title, subtitle, reports }) => {
  return (
    <div className="total-report">
      <h3>{title}</h3>
      <p>{subtitle}</p>

      <div className="reports">
        {Array.isArray(reports) ? (
          reports.map((rp, index) => (
            <div className="report-box" key={rp.id}>
              <img src={reportBoxIcon[index]} alt={rp.title} />
              <strong>
                {rp.type === totalReportValueType.money
                  ? convertNumberToCurrency("vietnamdong", rp.value)
                  : rp.value}
              </strong>
              <h6>{rp.title}</h6>
              <small>{rp.subtitle}</small>
            </div>
          ))
        ) : (
          <></>
        )}
      </div>
    </div>
  );
};

export default TotalReport;
