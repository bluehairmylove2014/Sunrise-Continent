import { axiosMockAdapterInstance } from "../../config/axios";
import { IAccount } from "../../entities";
import { AuthService, AuthenticationResponse, RegisterParams } from "../../lib";
import accountsData from "../data/accounts.json";

const accounts: Array<IAccount> = accountsData;

axiosMockAdapterInstance
  .onPost(new AuthService().registerUrl)
  .reply((config) => {
    const data = JSON.parse(config.data) as RegisterParams;

    const emailExists = accounts.some(
      (account) => account.email === data.email
    );
    if (emailExists) {
      return [
        /**
         * 409 Conflict: Mã lỗi này thường được
         * sử dụng khi có xung đột hoặc xung đột
         * dữ liệu xảy ra. Trong trường hợp này,
         * email đã tồn tại và không thể tạo tài khoản
         * mới với email đó.
         */
        409,
        {
          message: "Email is exist"
        } as AuthenticationResponse
      ];
    } else {
      accounts.push({
        id: accounts.length + 1 + "",
        email: data.email,
        firstName: data.firstName,
        lastName: data.lastName,
        password: data.password
      });
      return [
        200,
        {
          message: "Register success",
          token: "This is new access token :>"
        } as AuthenticationResponse
      ];
    }
  });
