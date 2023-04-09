import React from "react";
import { Link } from "react-router-dom";
import "./Header.css";
import logo from "../assets/images/logo_hori.png";

const Header = () => {
  return (
    <nav className="navbar navbar-expand-lg  main-nav " id="navbar">
      <div className="container">
        <Link className="navbar-brand" to="/">
          <img src={logo} alt="logo" className="img-fluid" />
        </Link>
        <div className="collapse navbar-collapse" id="navbarsExample09" style={{ marginLeft: "480px" }}>
          <ul className="navbar-nav ml-auto">
            <li className="nav-item  active">
              <Link className="nav-link" to="/">
                Home
              </Link>
            </li>
            <li className="nav-item  active">
              <Link className="nav-link" to="/roomgpt">
                RoomGPT
              </Link>
            </li>
            <li className="nav-item  active">
              <Link className="nav-link" to="/calculate">
                Calculate
              </Link>
            </li>
            <li className="nav-item  active">
              <Link className="nav-link" to="/about">
                About
              </Link>
            </li>
            <li className="nav-item  active">
              <Link className="nav-link" to="/contact">
                Contact
              </Link>
            </li>
            <li>
              <div
                id="google_translate_element"
                style={{ position: "relative", top: "16px", left: "20px" }}
              ></div>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  );
};

export default Header;
