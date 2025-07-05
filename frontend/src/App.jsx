import React, { useState } from "react";
import "./App.css";
import Navbar from "./Component/Navbar/Navbar";
import Banner from "./Component/Banner/Banner";
import Services from "./Component/Services/Services";
import Doctors from "./Component/Doctors/Doctors";
import Partners from "./Component/Partners/Partners";
import Facilities from "./Component/Facilities/Facilities";
import Testimonials from "./Component/Testimonials/Testimonials";
import Footer from "./Component/Footer/Footer";
import AuthModal from "./Component/AuthModal/AuthModal";
import { Route, Routes } from "react-router-dom";
import AppointmentPage from "./Component/Appointment/Appointment";
import HospitalPage from "./Component/Hospital/Hospital";

const App = () => {
  const [modalType, setModalType] = useState(null); // 'login' | 'signup' | null

  return (
    <>
    <Routes>
      <Route path="/" element={
      <>
        <Navbar
        onLoginClick={() => setModalType("login")}
        onSignupClick={() => setModalType("signup")}
      />
      {modalType && (
        <AuthModal type={modalType} onClose={() => setModalType(null)} />
      )}
      <Banner />
      <Services />
      <Doctors />
      <Partners />
      <Facilities />
      <Testimonials />
      <Footer />
      </>
       }/>
       <Route path="/appointment" element={<AppointmentPage/>}/>
       <Route path="/hospital" element={<HospitalPage />} />
    </Routes>
    </>
  );
};

export default App;
