import React, { useEffect, useState } from "react";
import TotalReport from "../../components/common/TotalReport/TotalReport";
import "../../styles/pages/dashboard.scss";
import {
  chartType,
  totalReportValueType,
} from "../../constants/Variables.constants";
import TopUser from "../../components/common/TopUser/TopUser";
import RevenueChart from "../../components/common/RevenueChart/RevenueChart";
import { useGetUser } from "../../libs/business-logic/src/lib/auth/process/hooks";
import CalculateLoader from "../../components/common/Loader/CalculateLoader";
import { useGetWeeklyRevenue } from "../../libs/business-logic/src/lib/hotel/process/hooks";
import { useGetYearlyRevenue } from "../../libs/business-logic/src/lib/hotel/process/hooks";

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
function calculatePercentageChange(total, last) {
  if (last === 0) {
    // Trường hợp last là 0, không thể tính phần trăm, trả về giá trị mặc định
    return { percent: "0%", isGreaterThan: false };
  }

  const percentChange = ((total - last) / last) * 100;
  const isGreaterThan = total > last;
  const formattedPercentChange = `${Math.abs(percentChange.toFixed(2))}%`;

  return { percent: formattedPercentChange, isGreaterThan };
}

const Dashboard = () => {
  const partnerDetail = useGetUser();
  const [totalReports, setTotalReports] = useState(undefined);
  const [topUser, setTopUser] = useState(undefined);
  const [weekRevenueData, setWeekRevenueData] = useState(undefined);
  const [monthRevenueData, setMonthRevenueData] = useState(undefined);
  // eslint-disable-next-line no-unused-vars
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
  // eslint-disable-next-line no-unused-vars
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
    if (partnerDetail) {
      let totalWeeklyRevenue = 0;
      let totalWeeklyOrder = 0;
      let totalWeeklyReview = 0;
      let totalWeeklyRevenueLastPercent = {
        percent: "0%",
        isGreaterThan: false,
      };
      let totalWeeklyOrderLastPercent = {
        percent: "0%",
        isGreaterThan: false,
      };
      let totalWeeklyReviewLastPercent = {
        percent: "0%",
        isGreaterThan: false,
      };

      if (weeklyRevenue) {
        totalWeeklyRevenue = weeklyRevenue.totalRevenue;
        totalWeeklyOrder = weeklyRevenue.totalOrder;
        totalWeeklyReview = weeklyRevenue.totalReview;
        totalWeeklyRevenueLastPercent = calculatePercentageChange(
          totalWeeklyRevenue,
          weeklyRevenue.lastRevenue
        );
        totalWeeklyOrderLastPercent = calculatePercentageChange(
          totalWeeklyOrder,
          weeklyRevenue.lastOrder
        );
        totalWeeklyReviewLastPercent = calculatePercentageChange(
          totalWeeklyReview,
          weeklyRevenue.lastReview
        );
      }
      setTotalReports({
        title: "Thống kê tuần",
        subtitle: "Tổng quan doanh thu",
        reports: [
          {
            id: 1,
            title: "Tổng doanh thu",
            subtitle: `${
              totalWeeklyRevenueLastPercent.isGreaterThan ? "Tăng" : "Giảm"
            } ${totalWeeklyRevenueLastPercent.percent} so với tuần trước`,
            value: totalWeeklyRevenue,
            type: totalReportValueType.money,
          },
          {
            id: 2,
            title: "Tổng đơn",
            subtitle: `${
              totalWeeklyOrderLastPercent.isGreaterThan ? "Tăng" : "Giảm"
            } ${totalWeeklyOrderLastPercent.percent} so với tuần trước`,
            value: totalWeeklyOrder,
            type: totalReportValueType.normal,
          },
          {
            id: 3,
            title: "Review tích cực",
            subtitle: `${
              totalWeeklyReviewLastPercent.isGreaterThan ? "Tăng" : "Giảm"
            } ${totalWeeklyReviewLastPercent.percent} so với tuần trước`,
            value: totalWeeklyReview,
            type: totalReportValueType.normal,
          },
        ],
      });
      weeklyRevenue &&
        setTopUser(
          weeklyRevenue.accounts.map((account) => ({
            id: account.accountId,
            name: account.fullName,
            image: account.image,
            rank: account.rank,
            value: account.totalSpent,
          }))
        );
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
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [partnerDetail, weeklyRevenue, yearlyRevenue]);

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
