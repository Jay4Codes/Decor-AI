import "./App.css";
import Header from "./components/Header";
import Footer from "./components/Footer";
import ScrollToTop from "./components/ScrollToTop";
import Home from "./pages/Home";
import About from "./pages/About";
import Contact from "./pages/Contact";
import RoomGPT from "./pages/RoomGPT";
import Calculate from "./pages/Calculate";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import alanBtn from "@alan-ai/alan-sdk-web";
import { useEffect } from "react";

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
        <Header />
        <ScrollToTop />
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/about" element={<About />} />
          <Route path="/roomGPT" element={<RoomGPT />} />
          <Route path="calculate" element={<Calculate />} />
          <Route path="/contact" element={<Contact />} />
        </Routes>
        <Footer />
      </Router>
    </div>
  );
}

export default App;
