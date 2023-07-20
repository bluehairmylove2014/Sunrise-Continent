export interface ICategory {
  id: string;
  name: string;
  href?: string;
  children: ICategory[];
}
