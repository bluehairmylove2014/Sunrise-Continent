import {
  Routes, Route
} from 'react-router-dom';
import { Suspense, lazy, useEffect, useState } from 'react';

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
const LoginPage = lazy(() => import('./pages/Login/Login'));

function App() {
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const timer = setTimeout(() => {
      setIsLoading(false);
    }, 2000);

    return () => clearTimeout(timer);
  }, []);
  return (
    <Provider store={redux_store}>
      <div className="App">
        <Suspense fallback={<PageLoader />}>
          {isLoading ? (
            <PageLoader />
          ) : (
            <Routes>
              <Route exact path='/' element={
                <>
                  <Header></Header>
                  <HomePage></HomePage>
                  <Footer></Footer>
                </>
              } />
              <Route exact path='/login' element={
                <>
                  <Header></Header>
                  <LoginPage></LoginPage>
                  <Footer></Footer>
                </>
              } />
            </Routes>
          )}
        </Suspense>
      </div>
    </Provider>
  );
}

export default App;
