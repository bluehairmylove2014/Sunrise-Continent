import { IUser } from "./user";

export interface IReview {
  content: string;
  score: number;
  date: Date;
  userId: IUser["id"];
}
