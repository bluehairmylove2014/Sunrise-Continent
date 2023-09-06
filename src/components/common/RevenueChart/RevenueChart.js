import React from "react";
import "./RevenueChart.scss";
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
  LineChart,
  Line,
} from "recharts";
import { convertNumberToCurrency } from "../../../utils/helpers/MoneyConverter";
import { chartType } from "../../../constants/Variables.constants";

const barSize = 20;
const fontSize = 13;

const shortformatCurrency = (value) =>
  convertNumberToCurrency("vietnamdong", value, true);
const formatCurrency = (value) => convertNumberToCurrency("vietnamdong", value);

const RevenueChart = ({ data, options, type, style }) => {
  const renderBarChart = () => {
    return (
      <ResponsiveContainer width="100%" height="100%">
        <BarChart
          width="100%"
          height="100%"
          data={data}
          margin={{
            top: 5,
            right: 30,
            left: 20,
            bottom: 5,
          }}
        >
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="name" tick={{ fontSize }} />
          <YAxis tick={{ fontSize }} tickFormatter={shortformatCurrency} />
          <Tooltip contentStyle={{ fontSize }} formatter={formatCurrency} />
          <Legend wrapperStyle={{ fontSize }} />
          <Bar
            barSize={barSize}
            dataKey={options.firstColumn.key}
            fill={options.firstColumn.color}
          />
          <Bar
            barSize={barSize}
            dataKey={options.secondColumn.key}
            fill={options.secondColumn.color}
          />
        </BarChart>
      </ResponsiveContainer>
    );
  };
  const renderLineChart = () => {
    return (
      <ResponsiveContainer width="100%" height="100%">
        <LineChart
          width="100%"
          height="100%"
          data={data}
          margin={{
            top: 5,
            right: 30,
            left: 20,
            bottom: 5,
          }}
        >
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="name" tick={{ fontSize }} />
          <YAxis tick={{ fontSize }} tickFormatter={shortformatCurrency} />
          <Tooltip contentStyle={{ fontSize }} formatter={formatCurrency} />
          <Legend wrapperStyle={{ fontSize }} />
          <Line
            type="monotone"
            dataKey={options.firstColumn.key}
            stroke={options.firstColumn.color}
            activeDot={{ r: 8 }}
            strokeWidth={3}
          />
          <Line
            type="monotone"
            dataKey={options.secondColumn.key}
            stroke={options.secondColumn.color}
            strokeWidth={3}
          />
        </LineChart>
      </ResponsiveContainer>
    );
  };
  return (
    <div className="revenue-chart" style={style}>
      <h3>{options.title}</h3>
      <div className="chart-wrapper">
        {type === chartType.barChart ? (
          renderBarChart()
        ) : type === chartType.lineChart ? (
          renderLineChart()
        ) : (
          <></>
        )}
      </div>
    </div>
  );
};

export default RevenueChart;
