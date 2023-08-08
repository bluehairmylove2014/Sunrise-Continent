import Footer from "./Footer";
import Header from "./Header";

export const UserPageLayout = ({ children }) => {
  return (
    <>
      <Header />
      {children}
      <Footer />
    </>
  );
};
