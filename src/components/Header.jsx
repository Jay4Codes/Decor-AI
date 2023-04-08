import React from "react";
import { Link } from "react-router-dom";
import "./Header.css";

const Header = () => {
  return (
    <div>
      <nav className="navbar navbar-expand-lg  main-nav " id="navbar">
        <div className="container">
          <Link className="navbar-brand" to="/">
            <img src="images/logo.png" alt="" className="img-fluid" />
          </Link>
          <div className="collapse navbar-collapse" id="navbarsExample09">
            <ul className="navbar-nav ml-auto">
              <li className="nav-item  active">
                <Link className="nav-link" to="/">
                  Home
                </Link>
              </li>
              <li className="nav-item  active">
                <Link className="nav-link" to="/about">
                  About
                </Link>
              </li>
              <li className="nav-item  active">
                <Link className="nav-link" to="/roomgpt">
                  RoomGPT
                </Link>
              </li>
              <li className="nav-item  active">
                <Link className="nav-link" to="/contact">
                  Contact
                </Link>
              </li>
              <li>
                <div id="google_translate_element"></div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  );
};

export default Header;
