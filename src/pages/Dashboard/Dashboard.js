/* eslint-disable no-unused-vars */
import React, { useEffect, useState } from "react";
import TotalReport from "../../components/common/TotalReport/TotalReport";
import "../../styles/pages/dashboard.scss";
import {
  chartType,
  totalReportValueType,
} from "../../constants/Variables.constants";
import TopUser from "../../components/common/TopUser/TopUser";
import RevenueChart from "../../components/common/RevenueChart/RevenueChart";
import { useGetWeeklyRevenue } from "./../../libs/business-logic/src/lib/hotel/process/hooks/useGetWeeklyRevenue";
import { useGetYearlyRevenue } from "./../../libs/business-logic/src/lib/hotel/process/hooks/useGetYearlyRevenue";
import CalculateLoader from "./../../components/common/Loader/CalculateLoader";

function convertYearlyData(rawData) {
  const monthsData = [
    "Tháng 1",
    "Tháng 2",
    "Tháng 3",
    "Tháng 4",
    "Tháng 5",
    "Tháng 6",
    "Tháng 7",
    "Tháng 8",
    "Tháng 9",
    "Tháng 10",
    "Tháng 11",
    "Tháng 12",
  ];

  const convertedData = rawData.map((item, index) => ({
    name: monthsData[index],
    uv: item.thisYear,
    pv: item.lastYear,
    amt: 240000,
  }));

  return convertedData;
}
function convertWeeklyData(rawData) {
  const dayData = [
    {
      dayInWeek: 1,
      name: "Thứ 2",
    },
    {
      dayInWeek: 2,
      name: "Thứ 3",
    },
    {
      dayInWeek: 3,
      name: "Thứ 4",
    },
    {
      dayInWeek: 4,
      name: "Thứ 5",
    },
    {
      dayInWeek: 5,
      name: "Thứ 6",
    },
    {
      dayInWeek: 6,
      name: "Thứ 7",
    },
    {
      dayInWeek: 7,
      name: "Chủ Nhật",
    },
  ];

  const convertedData = rawData.map((item) => {
    const matchingDay = dayData.find((day) => day.dayInWeek === item.dayInWeek);
    return {
      name: matchingDay ? matchingDay.name : "Unknown",
      uv: item.thisWeek,
      pv: item.lastWeek,
      amt: 240000,
    };
  });

  return convertedData;
}

const Dashboard = () => {
  const [totalReports, setTotalReports] = useState(undefined);
  const [topUser, setTopUser] = useState(undefined);
  const [weekRevenueData, setWeekRevenueData] = useState(undefined);
  const [monthRevenueData, setMonthRevenueData] = useState(undefined);
  const [weekRevenueOptions, setWeekRevenueOptions] = useState({
    title: "Tổng doanh thu tuần",
    firstColumn: {
      key: "Tuần này",
      color: "#4A6CFF",
    },
    secondColumn: {
      key: "Tuần trước",
      color: "#82ca9d",
    },
  });
  const [monthRevenueOptions, setMonthRevenueOptions] = useState({
    title: "Tổng doanh thu theo năm",
    firstColumn: {
      key: "Năm ngoái",
      color: "#e27a03",
    },
    secondColumn: {
      key: "Năm nay",
      color: "#db0000",
    },
  });
  const weeklyRevenue = useGetWeeklyRevenue();
  const yearlyRevenue = useGetYearlyRevenue();

  useEffect(() => {
    setTotalReports({
      title: "Thống kê tuần",
      subtitle: "Tổng quan doanh thu",
      reports: [
        {
          id: 1,
          title: "Tổng doanh thu",
          subtitle: "+ 8% so với tuần trước",
          value:
            weeklyRevenue && weeklyRevenue.totalRevenue
              ? weeklyRevenue.totalRevenue
              : 0,
          type: totalReportValueType.money,
        },
        {
          id: 2,
          title: "Tổng số đối tác",
          subtitle: "",
          value:
            weeklyRevenue && weeklyRevenue.totalOrder
              ? weeklyRevenue.totalOrder
              : 0,
          type: totalReportValueType.normal,
        },
        {
          id: 3,
          title: "Tổng số người dùng",
          subtitle: "",
          value:
            weeklyRevenue && weeklyRevenue.totalReview
              ? weeklyRevenue.totalReview
              : 0,
          type: totalReportValueType.normal,
        },
      ],
    });
    setTopUser([
      {
        id: 1,
        name: "Khách sạn Hương Biển",
        image:
          "https://rialloer.sirv.com/Sunrise-Continent/Users/IMG_0615-min%20(1).jpg",
        rank: "Top1Partner",
        value: "1090000",
      },
      {
        id: 2,
        name: "Làng Nghỉ Mát Sông Xanh",
        image: "https://rialloer.sirv.com/Sunrise-Continent/Users/avt_1.png",
        rank: "Top2Partner",
        value: "890000",
      },
      {
        id: 3,
        name: "Biệt Thự Sao Mai",
        image: "https://rialloer.sirv.com/Sunrise-Continent/Users/focalos.png",
        rank: "Top3Partner",
        value: "720000",
      },
      {
        id: 4,
        name: "Khách sạn Ngọc Lâu",
        image:
          "https://rialloer.sirv.com/Sunrise-Continent/Users/Untitled-UaAu9kQf7-transformed.jpeg",
        value: "690000",
      },
      {
        id: 5,
        name: "Khu Nghỉ Dưỡng Hoa Đào",
        image: "https://rialloer.sirv.com/Sunrise-Continent/Users/avt_5.png",
        value: "640000",
      },
      {
        id: 6,
        name: "Resort Mây Tre",
        image: "https://rialloer.sirv.com/Sunrise-Continent/Users/avt_10.png",
        value: "520000",
      },
      {
        id: 7,
        name: "Khách sạn Ánh Dương",
        image: "https://rialloer.sirv.com/Sunrise-Continent/Users/avt_9.png",
        value: "400000",
      },
    ]);
    if (weeklyRevenue && weeklyRevenue.revenue) {
      const rawWeekRevenueData = convertWeeklyData(weeklyRevenue.revenue);
      rawWeekRevenueData.forEach((dataPoint) => {
        dataPoint[weekRevenueOptions.firstColumn.key] = dataPoint.uv;
        delete dataPoint.uv;
        dataPoint[weekRevenueOptions.secondColumn.key] = dataPoint.pv;
        delete dataPoint.pv;
      });
      setWeekRevenueData(rawWeekRevenueData);
    }
    if (Array.isArray(yearlyRevenue)) {
      const rawMonthRevenueData = convertYearlyData(yearlyRevenue);
      rawMonthRevenueData.forEach((dataPoint) => {
        dataPoint[monthRevenueOptions.firstColumn.key] = dataPoint.uv;
        delete dataPoint.uv;
        dataPoint[monthRevenueOptions.secondColumn.key] = dataPoint.pv;
        delete dataPoint.pv;
      });
      setMonthRevenueData(rawMonthRevenueData);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [weeklyRevenue, yearlyRevenue]);

  return (
    <div className="dashboard">
      {totalReports === undefined ||
      topUser === undefined ||
      weekRevenueData === undefined ||
      monthRevenueData === undefined ? (
        <div className="empty">
          <CalculateLoader />
        </div>
      ) : (
        <>
          <div className="dashboard__total-report">
            {totalReports ? (
              <TotalReport
                title={totalReports.title}
                subtitle={totalReports.subtitle}
                reports={totalReports.reports}
              />
            ) : (
              <div className="empty">
                <p>Chưa có dữ liệu</p>
              </div>
            )}
          </div>
          <div className="dashboard__user-rank">
            {topUser ? (
              <TopUser topUserList={topUser} />
            ) : (
              <div className="empty">
                <p>Chưa có dữ liệu</p>
              </div>
            )}
          </div>
          <div className="dashboard__total-revenue">
            <RevenueChart
              data={weekRevenueData}
              options={weekRevenueOptions}
              type={chartType.barChart}
            />
          </div>
          <div></div>
          <div className="dashboard__income">
            <RevenueChart
              data={monthRevenueData}
              options={monthRevenueOptions}
              type={chartType.lineChart}
              style={{ height: "500px" }}
            />
          </div>
        </>
      )}
    </div>
  );
};

export default Dashboard;
