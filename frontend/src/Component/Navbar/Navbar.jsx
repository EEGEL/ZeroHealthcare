import "./navbar.css";
import logo from "../../assets/footer logo.png";
import { useState } from "react";
import { useContext } from "react";
import { ThemeContext } from "../ThemeContext/ThemeContext";
import { useNavigate } from "react-router-dom";

const Navbar = ({ onLoginClick, onSignupClick }) => {
  const [menuOpen, setMenuOpen] = useState(false);

  const toggleMenu = () => setMenuOpen(!menuOpen);

  const { theme, toggleTheme } = useContext(ThemeContext);

  const navigate = useNavigate();


  return (
    <nav className="navbar-container">
      <div className="logo">
        <img src={logo} alt="logo" />
      </div>
      <div className="hamburger" onClick={toggleMenu}>
        <span className={menuOpen ? "line open" : "line"}></span>
        <span className={menuOpen ? "line open" : "line"}></span>
        <span className={menuOpen ? "line open" : "line"}></span>
      </div>
      <div className={`nav-items ${menuOpen ? "active" : ""}`}>
        <h3 onClick={() => navigate("/hospital")}>
          Hospitals
        </h3>
        <div className="nav-dropdown">
          <h3>Medicine</h3>
          <div className="dropdown-menu">
            <a href="#">Max Hospital</a>
            <a href="#">Fortis Hospital</a>
            <a href="#">Vedanta Hospital</a>
          </div>
        </div>
        <div className="nav-dropdown">
          <h3>Medical Test</h3>
          <div className="dropdown-menu">
            <a href="#">Blood Test</a>
            <a href="#">X-Ray</a>
            <a href="#">MRI</a>
          </div>
        </div>
        <div className="nav-dropdown">
          <h3>Doctors</h3>
          <div className="dropdown-menu">
            <a href="#">Pathology</a>
            <a href="#">Biochemistry</a>
            <a href="#">Microbiology</a>
          </div>
        </div>
        <h3>Contact</h3>
      </div>
      <div className="side-nav-items">
        <button className="nav-login-btn" type="button" onClick={onLoginClick}>
          Login
        </button>
        <button
          className="nav-signup-btn"
          type="button"
          onClick={onSignupClick}
        >
          Sign Up
        </button>
        {/* <img src={search} alt="search" /> */}
        <div className="theme-switch">
          <input
            type="checkbox"
            id="theme-toggle"
            checked={theme === "dark"}
            onChange={toggleTheme}
          />
          <label htmlFor="theme-toggle">
            <span className="toggle-thumb"></span>
            <span className="icon">{theme === "dark" ? "🌙" : "☀️"}</span>
          </label>
        </div>
      </div>
    </nav>
  );
};

export default Navbar;
