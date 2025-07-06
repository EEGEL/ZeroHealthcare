import React, { useEffect, useState } from "react";
import "./hospital.css";

const HospitalPage = () => {
  const [searchTerm, setSearchTerm] = useState("");
  const [hospitals, setHospitals] = useState([]);

  useEffect(() => {
    fetch("http://127.0.0.1:5000/hospitals")
      .then((res) => res.json())
      .then((data) => {
      console.log("Fetched hospitals:", data);
      setHospitals(data);
    })
      .catch((err) => console.error("Error fetching hospitals:", err));
  }, []);

const filteredHospitals = hospitals.filter(
  (hospital) =>
    hospital?.hospital_id?.toLowerCase().includes(searchTerm.toLowerCase()) ||
    hospital?.city?.toLowerCase().includes(searchTerm.toLowerCase())
);


  return (
    <div className="hospital-page-container">
      <h2>Find a Hospital</h2>
      <input
        type="text"
        placeholder="Search by hospital name..."
        value={searchTerm}
        onChange={(e) => setSearchTerm(e.target.value)}
        className="hospital-search-input"
      />

      <div className="hospital-list">
        {filteredHospitals.length > 0 ? (
          filteredHospitals.map((hospital) => (
            <div key={hospital.hospital_id} className="hospital-card">
              <h3>{hospital.hospital_name}</h3>
              <p>{hospital.city}</p>
              <p>{hospital.contact_num}</p>
              <p>{hospital.hospital_id}</p>
              <p>{hospital.location}</p>
              <p>{hospital.pincode}</p>
              <p>{hospital.state}</p>
              <button className="view-more-btn">View Details</button>
            </div>
          ))
        ) : (
          <p>No hospitals found.</p>
        )}
      </div>
    </div>
  );
};

export default HospitalPage;
