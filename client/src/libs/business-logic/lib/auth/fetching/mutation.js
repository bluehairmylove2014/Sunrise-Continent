import { AuthService, HotelService, SocialService } from "../../../../services";
import { useMutation } from "@tanstack/react-query";
import { mutationConfig } from "../../../configs";

// Initialize the AuthService
const authService = new AuthService();
const socialService = new SocialService();
const hotelService = new HotelService();

/**
 * Use this mutation to login
 */
export const useLoginMutation = () => {
  return useMutation(authService.login, {
    retry: mutationConfig.retryTimes
  });
};

/**
 * Use this mutation to register
 */
export const useRegisterMutation = () => {
  return useMutation(authService.register, {
    retry: mutationConfig.retryTimes
  });
};

/**
 * Use this mutation to refresh token
 */
export const useRefreshTokenMutation = () => {
  return useMutation(authService.refreshToken, {
    retry: mutationConfig.retryTimes
  });
};

/**
 * Use this mutation to refresh token
 */
export const useUpdateAccountMutation = () => {
  return useMutation(socialService.updateAccount, {
    retry: mutationConfig.retryTimes
  });
};


export const useSearchHotelMutation = () => {
  return useMutation(hotelService.search, {
    retry: mutationConfig.retryTimes
  });
};
