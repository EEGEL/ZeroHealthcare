import React, { useEffect, useState } from "react";
import "./hospital.css";

const HospitalPage = () => {
  const [searchTerm, setSearchTerm] = useState("");
  const [hospitals, setHospitals] = useState([]);

  useEffect(() => {
    fetch("http://localhost:8000/api/hospitals")
      .then((res) => res.json())
      .then((data) => setHospitals(data))
      .catch((err) => console.error("Error fetching hospitals:", err));
  }, []);

  const filteredHospitals = hospitals.filter((hospital) =>
    hospital.name.toLowerCase().includes(searchTerm.toLowerCase())
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
            <div key={hospital.id} className="hospital-card">
              <h3>{hospital.name}</h3>
              <p>{hospital.location}</p>
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
