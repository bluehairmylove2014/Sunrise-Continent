import { axiosMockAdapterInstance } from "../config/axios";
import { AuthService } from "../lib";
import accountsData from "./data/accounts.json";

var accounts = accountsData;

axiosMockAdapterInstance.onPost(new AuthService().loginUrl).reply(function(config) {
  var data = JSON.parse(config.data);
  var isValidLogin = accounts.some(function(account) {
    return account.email === data.email && account.password === data.password;
  });
  if (isValidLogin) {
    return [
      200,
      {
        message: "Login success",
        token: "This is new login access token :>"
      }
    ];
  } else {
    return [
      401,
      {
        message: "Wrong email or password"
      }
    ];
  }
});
