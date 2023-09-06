import { useAccessToken } from "../../../auth/process/hooks/useAccessToken";
import { useGetYearlyRevenueQuery } from "../../fetching/query";

export const useGetYearlyRevenue = () => {
  const { getToken } = useAccessToken();
  const token = getToken();
  const { data } = useGetYearlyRevenueQuery({ token });
  return data;
};
