import { axiosMockAdapterInstance } from "../../config/axios";
import { AuthService } from "../../lib";
import userData from "../data/user.json";

axiosMockAdapterInstance.onGet(new AuthService().getUserUrl).reply((config) => {
  return [200, userData];
});
