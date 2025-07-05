import { useNavigate } from "react-router-dom";
import "./banner.css";
import ellipse from "../../assets/ellipse.png";
import doctor from "../../assets/banner-doctor.png";

const Banner = () => {
  const navigate = useNavigate();

  const handleAppointmentClick = () => {
    navigate("/appointment");
  };

  const handleLearnMoreClick = () => {
  const servicesSection = document.getElementById("services");
  servicesSection?.scrollIntoView({ behavior: "smooth" });
};


  return (
    <div className="banner-container">
      <div className="banner-content">
        <div className="banner-heading">
          <h2>
            Every good thing
            <br />
            starts with good
            <br />
            health
          </h2>
        </div>

        <div className="banner-subheading">
          <p>
            We are here to serve people with patient centered-care to deliver
            outstanding healthcare for better lives.
          </p>
        </div>

        <div className="banner-buttons">
          <button className="banner-appointment-button" onClick={handleAppointmentClick}>
            Request appointment
          </button>
          <button className="banner-learn-button" onClick={handleLearnMoreClick}>Learn More</button>
        </div>
      </div>

      <div className="banner-graphic">
        <img src={ellipse} alt="ellipse" />
        <img src={doctor} alt="doctor" />
      </div>
    </div>
  );
};

export default Banner;
