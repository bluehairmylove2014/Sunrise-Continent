export interface IProduct {
  id: string;
  name: string;
  imageSrc: string;
  price: number;
  description: string;
  imageAlt: string;
  href?: string;
  color?: string;
  measures?: string;
  wishlist?: boolean;
}
