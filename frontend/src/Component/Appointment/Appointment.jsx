import "./appointment.css";

const AppointmentPage = () => {
  return (
    <div className="appointment-container">
      <div className="appointment-content">
        <h2>Book an Appointment</h2>
        <p>Fill in your details and we’ll confirm your appointment shortly.</p>

        <form className="appointment-form">
          <div className="form-row">
            <div className="form-group">
              <label>Full Name</label>
              <input type="text" placeholder="Enter your full name" required />
            </div>

            <div className="form-group">
              <label>Email Address</label>
              <input type="email" placeholder="Enter your email" required />
            </div>
          </div>

          <div className="form-row">
            <div className="form-group">
              <label>Phone Number</label>
              <input type="tel" placeholder="Enter your phone number" required />
            </div>

            <div className="form-group">
              <label>Preferred Date</label>
              <input type="date" required />
            </div>
          </div>

          <div className="form-group">
            <label>Department</label>
            <select required>
              <option value="">Select a department</option>
              <option value="cardiology">Cardiology</option>
              <option value="orthopedics">Orthopedics</option>
              <option value="dermatology">Dermatology</option>
              <option value="general">General Medicine</option>
            </select>
          </div>

          <div className="form-group">
            <label>Message (Optional)</label>
            <textarea placeholder="Describe your symptoms or concerns" />
          </div>

          <button type="submit" className="submit-btn">Submit Appointment</button>
        </form>
      </div>
    </div>
  );
};

export default AppointmentPage;
