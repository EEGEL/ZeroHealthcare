import "./footer.css"
import footerImage from "../../assets/footer logo.png"
import ellipse4 from "../../assets/Ellipse 4.png"
import ellipse5 from "../../assets/ellipse5.png"

const Footer = () => {
    return (
        <>
            <div className="footer-container">

                <div className="footer-logo">
                    <img src={footerImage} alt="footer-logo" />
                    <p>We aew a medicial clinic,<br />helping you for a better life.</p>
                </div>

                <div className="footer-medic">
                    <ul className="footer-lists">
                        <li>Medic</li>
                        <li>Home</li>
                        <li>Medical Care</li>
                        <li>Medical Health</li>
                        <li>Medical Test</li>
                        <li>Medical Lab</li>
                    </ul>
                </div>

                <div className="footer-about">
                    <ul className="footer-lists">
                        <li>About</li>
                        <li>Medic</li>
                        <li>Vision & Mission</li>
                        <li>Careers</li>
                        <li>Support</li>
                        <li>FAQ</li>
                    </ul>
                </div>

                <div className="footer-social-media">
                    <ul className="footer-lists">
                        <li>Social Media</li>
                        <li>Twitter / X</li>
                        <li>Facebook</li>
                        <li>Instagram</li>
                    </ul>
                </div>

                <div className="footer-contact">
                    <ul className="footer-lists">
                        <li>Contact</li>
                        <li>Saket, New Delhi</li>
                        <li>+91 7839 36 8724</li>
                        <li>zerohealthcare@test.com</li>
                    </ul>
                </div>

                <img className="footer-ellipse1" src={ellipse4} alt="ellipse4" />
                <img className="footer-ellipse2" src={ellipse5} alt="ellipse5" />

            </div>

            <div className="footer-bottom">
                <p>&copy; ZeroHealthcare 2028</p>
                <p>Legal Policies</p>
                <p>Sitemap</p>
                <p>Cookies</p>
            </div>

        </>


    )
}

export default Footer