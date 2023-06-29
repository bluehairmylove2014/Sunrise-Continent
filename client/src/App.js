import {
  Routes, Route, useNavigate
} from 'react-router-dom';
import { Suspense, lazy, useEffect, useState } from 'react';

// React-query
import { QueryClient, QueryClientProvider } from "react-query";

// Axios mock adapter
import AxiosMockAdapter from "axios-mock-adapter";
import axios from "axios";

// Notification library
import { Toaster } from 'react-hot-toast';

// Constant
import { PAGES } from './constants/Link.constants';

// Global style
import './App.scss';

// Component
import Header from './components/layouts/Header';
import Footer from './components/layouts/Footer';
import PageLoader from './components/common/PageLoader';

// Redux
import { Provider } from 'react-redux';
import redux_store from './redux/store';

// Code spliting, lazy loading component
const HomePage = lazy(() => import('./pages/Home/Home'));
const AuthenticationPage = lazy(() => import('./pages/Authentication/Authentication'));

// Tạo mock cho axios
const mock = new AxiosMockAdapter(axios);
mock.onGet("/api/v1/users").reply(200, [
  { id: 1, name: "John Doe" },
  { id: 2, name: "Jane Smith" },
]);
mock.onPost("http://localhost:2014/api/v1/auth/login").reply(() => {
  // Simulate a 2-second delay before returning the response
  return new Promise(resolve => {
    setTimeout(() => {
      resolve([200, { token: 'NguyenBaPhuong', status_code: 200 }]);
    }, 2000);
  });
});
mock.onPost("http://localhost:2014/api/v1/auth/register").reply(() => {
  // Simulate a 2-second delay before returning the response
  return new Promise(resolve => {
    setTimeout(() => {
      resolve([200, { token: 'NguyenBaPhuong', status_code: 200 }]);
    }, 2000);
  });
});

// Tạo instance cho QueryClient
const queryClient = new QueryClient();

function App() {
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const timer = setTimeout(() => {
      setIsLoading(false);
    }, 1000);

    // Dọn dẹp khi component unmount
    return () => {
      clearTimeout(timer)
    };
  }, []);

  return (
    <Provider store={redux_store}>
      <QueryClientProvider client={queryClient}>
        <div className="App">
          <div className='app__notification'><Toaster /></div>
          <Suspense fallback={<PageLoader />}>
            {isLoading ? (<PageLoader />) : (
              <Routes>
                <Route exact path={PAGES.HOME} element={
                  <>
                    <Header></Header>
                    <HomePage></HomePage>
                    <Footer></Footer>
                  </>
                } />
                <Route exact path={PAGES.LOGIN} element={<AuthenticationPage/>} />
                <Route exact path={PAGES.REGISTER} element={<AuthenticationPage/>} />
              </Routes>
            )}
          </Suspense>
        </div>
      </QueryClientProvider>
    </Provider>
  );
}

export default App;
