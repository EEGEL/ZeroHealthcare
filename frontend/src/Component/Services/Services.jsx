import Service from "../Service/Service"
import "./services.css"

const Services = () => {
  return (
    <div className="services-container" id="services">
        <h3>Our Services</h3>

        <div className="services-wrapper">
            <Service/>
        </div>
    </div>
  )
}

export default Services