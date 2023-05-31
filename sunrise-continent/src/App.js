import {
  Routes, Route
} from 'react-router-dom';
import { Suspense, lazy } from 'react';

// Global style
import './App.scss';

// Component
import Header from './components/layouts/Header';
import Footer from './components/layouts/Footer';
import PageLoader from './components/common/PageLoader';

// Code spliting, lazy loading component
const HomePage = lazy(() => import('./pages/Home/Home'));
const LoginPage = lazy(() => import('./pages/Login/Login'));

function App() {
  return (
    <div className="App">
      <Suspense fallback={<PageLoader></PageLoader>}>
        <Routes>
          <Route exact path='/' element={
            <>
              <Header></Header>
              <HomePage></HomePage>
              <Footer></Footer>
            </>
          }/>
          <Route exact path='/login' element={
            <>
              <Header></Header>
              <LoginPage></LoginPage>
              <Footer></Footer>
            </>
          }/>
        </Routes>
      </Suspense>
    </div>
  );
}

export default App;
