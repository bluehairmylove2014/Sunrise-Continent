import { useAccessToken } from "../../../auth/process/hooks/useAccessToken";
import { useGetWeeklyRevenueQuery } from "../../fetching/query";

export const useGetWeeklyRevenue = () => {
  const { getToken } = useAccessToken();
  const token = getToken();
  const { data } = useGetWeeklyRevenueQuery({ token });
  return data;
};
