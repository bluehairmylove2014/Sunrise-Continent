import React from "react";
import TotalReport from "../../components/common/TotalReport/TotalReport";
import "../../styles/pages/dashboard.scss";
import {
  chartType,
  totalReportValueType,
} from "../../constants/Variables.constants";
import TopUser from "../../components/common/TopUser/TopUser";
import RevenueChart from "../../components/common/RevenueChart/RevenueChart";

const Dashboard = () => {
  const totalReports = {
    title: "Thống kê tuần",
    subtitle: "Tổng quan doanh thu",
    reports: [
      {
        id: 1,
        title: "Tổng doanh thu",
        subtitle: "+ 8% so với tuần trước",
        value: 400000,
        type: totalReportValueType.money,
      },
      {
        id: 2,
        title: "Tổng đơn",
        subtitle: "+ 5% so với tuần trước",
        value: 102,
        type: totalReportValueType.normal,
      },
      {
        id: 3,
        title: "Review tích cực",
        subtitle: "+ 1,2% so với tuần trước",
        value: 40,
        type: totalReportValueType.normal,
      },
    ],
  };
  const topUser = [
    {
      id: 1,
      name: "Phúc Đạt",
      image:
        "https://rialloer.sirv.com/Sunrise-Continent/Users/IMG_0615-min%20(1).jpg",
      rank: "Diamond",
      value: "1090000",
    },
    {
      id: 2,
      name: "Dương Minh",
      image: "https://rialloer.sirv.com/Sunrise-Continent/Users/avt_1.png",
      rank: "Gold",
      value: "890000",
    },
    {
      id: 3,
      name: "Ba Phương",
      image: "https://rialloer.sirv.com/Sunrise-Continent/Users/focalos.png",
      rank: "Vip",
      value: "720000",
    },
    {
      id: 4,
      name: "Raiden Shogun",
      image:
        "https://rialloer.sirv.com/Sunrise-Continent/Users/Untitled-UaAu9kQf7-transformed.jpeg",
      rank: "Diamond",
      value: "690000",
    },
    {
      id: 5,
      name: "Kuki Shinobu",
      image: "https://rialloer.sirv.com/Sunrise-Continent/Users/avt_5.png",
      rank: "Gold",
      value: "640000",
    },
    {
      id: 6,
      name: "Tomato Banana",
      image: "https://rialloer.sirv.com/Sunrise-Continent/Users/avt_10.png",
      rank: "Vip",
      value: "520000",
    },
    {
      id: 7,
      name: "Zest Mikey",
      image: "https://rialloer.sirv.com/Sunrise-Continent/Users/avt_9.png",
      rank: "Gold",
      value: "400000",
    },
  ];
  const weekRevenueOptions = {
    title: "Tổng doanh thu tuần",
    firstColumn: {
      key: "Tuần này",
      color: "#4A6CFF",
    },
    secondColumn: {
      key: "Tuần trước",
      color: "#82ca9d",
    },
  };
  const weekRevenueData = [
    {
      name: "Thứ 2",
      uv: 400000,
      pv: 240000,
      amt: 240000,
    },
    {
      name: "Thứ 3",
      uv: 300000,
      pv: 139800,
      amt: 221000,
    },
    {
      name: "Thứ 4",
      uv: 200000,
      pv: 980000,
      amt: 229000,
    },
    {
      name: "Thứ 5",
      uv: 278000,
      pv: 390800,
      amt: 200000,
    },
    {
      name: "Thứ 6",
      uv: 189000,
      pv: 480000,
      amt: 218100,
    },
    {
      name: "Thứ 7",
      uv: 239000,
      pv: 380000,
      amt: 250000,
    },
    {
      name: "Chủ Nhật",
      uv: 349000,
      pv: 430000,
      amt: 210000,
    },
  ];

  const monthRevenueOptions = {
    title: "Tổng doanh thu theo năm",
    firstColumn: {
      key: "Năm ngoái",
      color: "#e27a03",
    },
    secondColumn: {
      key: "Năm nay",
      color: "#db0000",
    },
  };
  const monthRevenueData = [
    {
      name: "Tháng 1",
      uv: 400000,
      pv: 240000,
      amt: 240000,
    },
    {
      name: "Tháng 2",
      uv: 300000,
      pv: 139800,
      amt: 221000,
    },
    {
      name: "Tháng 3",
      uv: 200000,
      pv: 980000,
      amt: 229000,
    },
    {
      name: "Tháng 4",
      uv: 278000,
      pv: 390800,
      amt: 200000,
    },
    {
      name: "Tháng 5",
      uv: 189000,
      pv: 480000,
      amt: 218100,
    },
    {
      name: "Tháng 6",
      uv: 239000,
      pv: 380000,
      amt: 250000,
    },
    {
      name: "Tháng 7",
      uv: 349000,
      pv: 430000,
      amt: 210000,
    },
    {
      name: "Tháng 8",
      uv: 400000,
      pv: 240000,
      amt: 240000,
    },
    {
      name: "Tháng 9",
      uv: 300000,
      pv: 139800,
      amt: 221000,
    },
    {
      name: "Tháng 10",
      uv: 200000,
      pv: 980000,
      amt: 229000,
    },
    {
      name: "Tháng 11",
      uv: 278000,
      pv: 390800,
      amt: 200000,
    },
    {
      name: "Tháng 12",
      uv: 189000,
      pv: 480000,
      amt: 218100,
    },
  ];

  weekRevenueData.forEach((dataPoint) => {
    dataPoint[weekRevenueOptions.firstColumn.key] = dataPoint.uv;
    delete dataPoint.uv;
    dataPoint[weekRevenueOptions.secondColumn.key] = dataPoint.pv;
    delete dataPoint.pv;
  });
  monthRevenueData.forEach((dataPoint) => {
    dataPoint[monthRevenueOptions.firstColumn.key] = dataPoint.uv;
    delete dataPoint.uv;
    dataPoint[monthRevenueOptions.secondColumn.key] = dataPoint.pv;
    delete dataPoint.pv;
  });

  return (
    <div className="dashboard">
      <div className="dashboard__total-report">
        <TotalReport
          title={totalReports.title}
          subtitle={totalReports.subtitle}
          reports={totalReports.reports}
        />
      </div>
      <div className="dashboard__user-rank">
        <TopUser topUserList={topUser} />
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
    </div>
  );
};

export default Dashboard;
