import { gptApiKey } from "../../../../business-logic/src/configs";
import { getAxiosNormalInstance } from "../../config/axios";
import { Services } from "../../service";

export class GptService extends Services {
  abortController;
  chatUrl = "https://api.openai.com/v1/chat/completions";
  normalAxios = getAxiosNormalInstance();

  chat = async (message) => {
    this.abortController = new AbortController();
    try {
    //   const response = await this.normalAxios.post(
    //     this.chatUrl,
    //     {
    //       model: "gpt-3.5-turbo",
    //       messages: [{ role: "user", content: "Say hello to Duong Minh!" }],
    //       temperature: 0.7,
    //     },
    //     {
    //       headers: {
    //         Authorization: `Bearer ${gptApiKey}`,
    //         "Content-Type": "application/json",
    //       },
    //       signal: this.abortController.signal,
    //     }
    //   );
    //   console.log(response);
      return ["Đà Lạt", "Khách sạn"];
    } catch (error) {
      if (!this.isCancel(error)) {
        // Handle other errors
        console.error("Catch error");
        throw error;
      }
    }
  };
}
