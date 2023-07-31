import { axiosMockAdapterInstance } from "../../config/axios";
import { SocialService } from "../../lib";

axiosMockAdapterInstance
  .onPost(new SocialService().updateAccountUrl)
  .reply((config) => {
    return [
      200,
      {
        message: "Login success",
        token: "This is new login access token :>",
      },
    ];
  });
