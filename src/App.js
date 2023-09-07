import { BusinessLogicProvider } from "./libs/business-logic/src/provider";
// Notification library
import { Toaster } from "react-hot-toast";
// Global style
import "./App.scss";
import Routes from "./Routes";

function App() {
  return (
    <BusinessLogicProvider>
      <div className="App">
        <div className="app__notification">
          <Toaster />
        </div>
        <Routes />
      </div>
    </BusinessLogicProvider>
  );
}

export default App;
