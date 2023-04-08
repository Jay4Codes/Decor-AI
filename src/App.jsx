import "./App.css";
import { useEffect } from "react";
import alanBtn from "@alan-ai/alan-sdk-web";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Replicate from "./pages/Replicate";

function App() {
  useEffect(() => {
    alanBtn({
      key: "e8491958f7c710cc96f0ed66da3e63572e956eca572e1d8b807a3e2338fdd0dc/stage",
      onCommand: (commandData) => {
        if (commandData.command === "go:back") {
          // Call the client code that will react to the received command
        }
      },
    });
  }, []);

  return (
    <div className="App">
      <Router>
        <Routes>
          <Route path="/replicate" element={<Replicate />} />
        </Routes>
      </Router>
    </div>
  );
}

export default App;
