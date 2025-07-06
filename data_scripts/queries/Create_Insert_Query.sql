CREATE DATABASE ZeroHealthcare
use ZeroHealthcare

CREATE TABLE HOSPITAL (
    hospital_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255)
);

INSERT INTO HOSPITAL (hospital_id, name, address)
VALUES 
('HSP001', 'Richard Hospital', '48764 Howard Forge Apt. 421, Vanessaside, PA 19763'),
('HSP002', 'Collins Hospital', '8156 Carr Ford Suite 784, Port Samanthatown, VA 52775'),
('HSP003', 'Hall Hospital', '89206 Emily Ford, Lake Larry, WI 65887'),
('HSP004', 'Keller Hospital', '9573 Russell Via Apt. 961, Kevinport, DE 10894'),
('HSP005', 'Moore Hospital', '04247 Burns Vista, Port Lisa, TX 27057'),
('HSP006', 'Johnson Hospital', '3489 Alan Neck Apt. 324, North Jasmine, MA 10161'),
('HSP007', 'Price Hospital', '97995 Kenneth Lock, Waltermouth, OR 03151'),
('HSP008', 'Roberts Hospital', '7535 Wheeler Skyway Apt. 758, East Steven, KS 20634'),
('HSP009', 'Ross Hospital', '16427 Henry Vista, Port Christopher, NJ 24091'),
('HSP010', 'Bryant Hospital', '8493 Neal Camp, South Laurieport, NY 70980');


CREATE TABLE DEPARTMENT (
    dept_id VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(50),
    head_of_department VARCHAR(100),
    hospital_id VARCHAR(10),
    FOREIGN KEY (hospital_id) REFERENCES HOSPITAL(hospital_id)
);

INSERT INTO DEPARTMENT (dept_id, dept_name, head_of_department, hospital_id)
VALUES 
('DPT001', 'Cardiology', 'Christopher Moreno', 'HSP006'),
('DPT002', 'Neurology', 'Thomas Wade', 'HSP005'),
('DPT003', 'Orthopedics', 'Nathan Byrd', 'HSP007'),
('DPT004', 'Pediatrics', 'Stacey Glover', 'HSP009'),
('DPT005', 'Radiology', 'Matthew Vargas', 'HSP001'),
('DPT006', 'General Medicine', 'Barbara Velez', 'HSP003'),
('DPT007', 'Surgery', 'Jennifer Hill', 'HSP002'),
('DPT008', 'ENT', 'Dylan Watts', 'HSP004'),
('DPT009', 'Dermatology', 'Christopher Glenn', 'HSP010'),
('DPT010', 'Psychiatry', 'Christine Todd', 'HSP008');


CREATE TABLE EMPLOYEE (
    emp_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(50),
    hospital_id VARCHAR(10),
    dept_id VARCHAR(10),
    FOREIGN KEY (hospital_id) REFERENCES HOSPITAL(hospital_id),
    FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id)
);

INSERT INTO EMPLOYEE (emp_id, name, role, hospital_id, dept_id)
VALUES
('EMP001', 'James Miller', 'Nurse', 'HSP001', 'DPT001'),
('EMP002', 'Laura Smith', 'Doctor', 'HSP002', 'DPT002'),
('EMP003', 'Michael Johnson', 'Technician', 'HSP003', 'DPT003'),
('EMP004', 'Emily Davis', 'Doctor', 'HSP004', 'DPT004'),
('EMP005', 'David Wilson', 'Receptionist', 'HSP005', 'DPT005'),
('EMP006', 'Sophia Taylor', 'Doctor', 'HSP006', 'DPT006'),
('EMP007', 'Daniel Martinez', 'Cleaner', 'HSP007', 'DPT007'),
('EMP008', 'Olivia Anderson', 'Doctor', 'HSP008', 'DPT008'),
('EMP009', 'Matthew Thomas', 'Technician', 'HSP009', 'DPT009'),
('EMP010', 'Ava Moore', 'Doctor', 'HSP010', 'DPT010');

CREATE TABLE DOCTOR (
    doctor_id VARCHAR(10) PRIMARY KEY,
    emp_id VARCHAR(10),
    specialization VARCHAR(100),
    experience_years INT,
    FOREIGN KEY (emp_id) REFERENCES EMPLOYEE(emp_id)
);

INSERT INTO DOCTOR (doctor_id, emp_id, specialization, experience_years)
VALUES
('DOC001', 'EMP002', 'Cardiologist', 10),
('DOC002', 'EMP004', 'Neurologist', 8),
('DOC003', 'EMP006', 'Orthopedic', 12),
('DOC004', 'EMP008', 'Pediatrician', 6),
('DOC005', 'EMP010', 'Cardiologist', 9);


CREATE TABLE LOG_IN (
    login_id VARCHAR(10) PRIMARY KEY,
    emp_id VARCHAR(10),
    username VARCHAR(50) UNIQUE,
    password VARCHAR(100),
    FOREIGN KEY (emp_id) REFERENCES EMPLOYEE(emp_id)
);

INSERT INTO LOG_IN (login_id, emp_id, username, password)
VALUES
('LOG001', 'EMP001', 'user1', 'P@ssw0rd1!'),
('LOG002', 'EMP002', 'user2', 'P@ssw0rd2!'),
('LOG003', 'EMP003', 'user3', 'P@ssw0rd3!'),
('LOG004', 'EMP004', 'user4', 'P@ssw0rd4!'),
('LOG005', 'EMP005', 'user5', 'P@ssw0rd5!'),
('LOG006', 'EMP006', 'user6', 'P@ssw0rd6!'),
('LOG007', 'EMP007', 'user7', 'P@ssw0rd7!'),
('LOG008', 'EMP008', 'user8', 'P@ssw0rd8!'),
('LOG009', 'EMP009', 'user9', 'P@ssw0rd9!'),
('LOG010', 'EMP010', 'user10', 'P@ssw0rd10!');

CREATE TABLE PHARMACY (
    pharmacy_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100),
    hospital_id VARCHAR(10),
    FOREIGN KEY (hospital_id) REFERENCES HOSPITAL(hospital_id)
);

INSERT INTO PHARMACY (pharmacy_id, name, hospital_id)
VALUES
('PHM001', 'Lifeline Pharmacy', 'HSP001'),
('PHM002', 'CureWell Drugs', 'HSP002'),
('PHM003', 'HealthPlus', 'HSP003'),
('PHM004', 'WellMed Pharmacy', 'HSP004'),
('PHM005', 'MediZone', 'HSP005'),
('PHM006', 'SureCure', 'HSP006'),
('PHM007', 'PharmaCare', 'HSP007'),
('PHM008', 'Wellness Drugs', 'HSP008'),
('PHM009', 'MediExpress', 'HSP009'),
('PHM010', 'QuickMeds', 'HSP010');


CREATE TABLE MEDICINE (
    medicine_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100),
    manufacturer VARCHAR(100)
);

INSERT INTO MEDICINE (medicine_id, name, manufacturer)
VALUES
('MED001', 'Paracetamol', 'GlaxoSmithKline'),
('MED002', 'Amoxicillin', 'Pfizer'),
('MED003', 'Cetrizine', 'Sun Pharma'),
('MED004', 'Ibuprofen', 'Dr. Reddy'),
('MED005', 'Metformin', 'Cipla'),
('MED006', 'Aspirin', 'Zydus'),
('MED007', 'Omeprazole', 'Abbott'),
('MED008', 'Azithromycin', 'Mankind'),
('MED009', 'Atorvastatin', 'Torrent'),
('MED010', 'Losartan', 'Lupin');


CREATE TABLE MEDICINE_STOCK (
    stock_id VARCHAR(10) PRIMARY KEY,
    pharmacy_id VARCHAR(10),
    medicine_id VARCHAR(10),
    quantity INT,
    expiry_date DATE,
    FOREIGN KEY (pharmacy_id) REFERENCES PHARMACY(pharmacy_id),
    FOREIGN KEY (medicine_id) REFERENCES MEDICINE(medicine_id)
);

INSERT INTO MEDICINE_STOCK (stock_id, pharmacy_id, medicine_id, quantity, expiry_date)
VALUES
('STK001', 'PHM001', 'MED001', 200, '2026-05-01'),
('STK002', 'PHM002', 'MED002', 150, '2025-12-01'),
('STK003', 'PHM003', 'MED003', 100, '2026-03-15'),
('STK004', 'PHM004', 'MED004', 300, '2025-11-10'),
('STK005', 'PHM005', 'MED005', 120, '2026-07-20'),
('STK006', 'PHM006', 'MED006', 180, '2025-08-15'),
('STK007', 'PHM007', 'MED007', 250, '2026-01-01'),
('STK008', 'PHM008', 'MED008', 80, '2025-09-30'),
('STK009', 'PHM009', 'MED009', 170, '2026-06-10'),
('STK010', 'PHM010', 'MED010', 140, '2025-10-05');


CREATE TABLE MEDICINE_SALES (
    sale_id VARCHAR(10) PRIMARY KEY,
    stock_id VARCHAR(10),
    patient_name VARCHAR(100),
    sale_date DATE,
    quantity INT,
    FOREIGN KEY (stock_id) REFERENCES MEDICINE_STOCK(stock_id)
);

INSERT INTO MEDICINE_SALES (sale_id, stock_id, patient_name, sale_date, quantity)
VALUES
('SAL001', 'STK001', 'Rahul Verma', '2025-06-01', 10),
('SAL002', 'STK002', 'Anjali Mehra', '2025-06-02', 5),
('SAL003', 'STK003', 'Karan Bhatia', '2025-06-03', 15),
('SAL004', 'STK004', 'Pooja Sharma', '2025-06-04', 20),
('SAL005', 'STK005', 'Neha Joshi', '2025-06-05', 12),
('SAL006', 'STK006', 'Ramesh Gupta', '2025-06-06', 8),
('SAL007', 'STK007', 'Sneha Rathi', '2025-06-07', 25),
('SAL008', 'STK008', 'Vikas Desai', '2025-06-08', 9),
('SAL009', 'STK009', 'Manish Patil', '2025-06-09', 18),
('SAL010', 'STK010', 'Deepa Nair', '2025-06-10', 6);


CREATE TABLE LAB_SERVICES (
    service_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100),
    hospital_id VARCHAR(10),
    price DECIMAL(10, 2),
    FOREIGN KEY (hospital_id) REFERENCES HOSPITAL(hospital_id)
);

INSERT INTO LAB_SERVICES (service_id, name, hospital_id, price)
VALUES
('LAB001', 'Blood Test', 'HSP001', 300.00),
('LAB002', 'X-Ray', 'HSP002', 500.00),
('LAB003', 'MRI', 'HSP003', 2500.00),
('LAB004', 'CT Scan', 'HSP004', 3500.00),
('LAB005', 'ECG', 'HSP005', 800.00),
('LAB006', 'Ultrasound', 'HSP006', 1200.00),
('LAB007', 'Thyroid Panel', 'HSP007', 1000.00),
('LAB008', 'CBC', 'HSP008', 450.00),
('LAB009', 'Liver Function Test', 'HSP009', 750.00),
('LAB010', 'Kidney Function Test', 'HSP010', 950.00);


CREATE TABLE PATIENT_HOSPITALIZATION_SUMMARY (
    summary_id VARCHAR(10) PRIMARY KEY,
    patient_name VARCHAR(100),
    hospital_id VARCHAR(10),
    admission_date DATE,
    discharge_date DATE,
    diagnosis VARCHAR(255),
    FOREIGN KEY (hospital_id) REFERENCES HOSPITAL(hospital_id)
);

INSERT INTO PATIENT_HOSPITALIZATION_SUMMARY (summary_id, patient_name, hospital_id, admission_date, discharge_date, diagnosis)
VALUES
('SUM001', 'Karan Kapoor', 'HSP001', '2025-05-01', '2025-05-07', 'Appendicitis'),
('SUM002', 'Ritika Das', 'HSP002', '2025-05-02', '2025-05-06', 'Fracture'),
('SUM003', 'Neeraj Taneja', 'HSP003', '2025-05-03', '2025-05-09', 'Migraine'),
('SUM004', 'Rohit Khanna', 'HSP004', '2025-05-04', '2025-05-08', 'Diabetes'),
('SUM005', 'Priya Menon', 'HSP005', '2025-05-05', '2025-05-10', 'Pneumonia'),
('SUM006', 'Deepak Tyagi', 'HSP006', '2025-05-06', '2025-05-11', 'Typhoid'),
('SUM007', 'Sneha Kaur', 'HSP007', '2025-05-07', '2025-05-13', 'Malaria'),
('SUM008', 'Akshay Rao', 'HSP008', '2025-05-08', '2025-05-14', 'Arthritis'),
('SUM009', 'Meera Reddy', 'HSP009', '2025-05-09', '2025-05-12', 'Kidney Stone'),
('SUM010', 'Rajeev Chawla', 'HSP010', '2025-05-10', '2025-05-15', 'Hypertension');


CREATE TABLE TEST_BOOKING (
    booking_id VARCHAR(10) PRIMARY KEY,
    patient_name VARCHAR(100),
    service_id VARCHAR(10),
    booking_date DATE,
    FOREIGN KEY (service_id) REFERENCES LAB_SERVICES(service_id)
);

INSERT INTO TEST_BOOKING (booking_id, patient_name, service_id, booking_date) 
VALUES 
('TBK001', 'Ravi Kumar', 'LAB001', '2025-06-01'),
('TBK002', 'Aarti Mishra', 'LAB002', '2025-06-02'),
('TBK003', 'Nikhil Jain', 'LAB003', '2025-06-03'),
('TBK004', 'Sana Shaikh', 'LAB004', '2025-06-04'),
('TBK005', 'Suresh Mehta', 'LAB005', '2025-06-05'),
('TBK006', 'Anita Raj', 'LAB006', '2025-06-06'),
('TBK007', 'Harish Patel', 'LAB007', '2025-06-07'),
('TBK008', 'Divya Sinha', 'LAB008', '2025-06-08'),
('TBK009', 'Kapil Verma', 'LAB009', '2025-06-09'),
('TBK010', 'Megha Sharma', 'LAB010', '2025-06-10');


CREATE TABLE TEST_REPORTS (
    report_id VARCHAR(10) PRIMARY KEY,
    booking_id VARCHAR(10),
    report_details TEXT,
    report_date DATE,
    FOREIGN KEY (booking_id) REFERENCES TEST_BOOKING(booking_id)
);

INSERT INTO TEST_REPORTS (report_id, booking_id, report_details, report_date)
VALUES
('RPT001', 'TBK001', 'Normal', '2025-06-02'),
('RPT002', 'TBK002', 'Fracture Detected', '2025-06-03'),
('RPT003', 'TBK003', 'MRI Normal', '2025-06-04'),
('RPT004', 'TBK004', 'Mild swelling observed', '2025-06-05'),
('RPT005', 'TBK005', 'Normal', '2025-06-06'),
('RPT006', 'TBK006', 'Cyst Found', '2025-06-07'),
('RPT007', 'TBK007', 'Thyroid Elevated', '2025-06-08'),
('RPT008', 'TBK008', 'Slight anemia', '2025-06-09'),
('RPT009', 'TBK009', 'Normal', '2025-06-10'),
('RPT010', 'TBK010', 'Kidney issue suspected', '2025-06-11');


CREATE TABLE ADMIT_PATIENT (
    admit_id VARCHAR(10) PRIMARY KEY,
    summary_id VARCHAR(10),
    room_no VARCHAR(10),
    FOREIGN KEY (summary_id) REFERENCES PATIENT_HOSPITALIZATION_SUMMARY(summary_id)
);

INSERT INTO ADMIT_PATIENT (admit_id, summary_id, room_no)
VALUES
('ADM001', 'SUM001', '101A'),
('ADM002', 'SUM002', '102B'),
('ADM003', 'SUM003', '103A'),
('ADM004', 'SUM004', '104B'),
('ADM005', 'SUM005', '105A'),
('ADM006', 'SUM006', '106B'),
('ADM007', 'SUM007', '107A'),
('ADM008', 'SUM008', '108B'),
('ADM009', 'SUM009', '109A'),
('ADM010', 'SUM010', '110B');


CREATE TABLE APPOINTMENT (
    appointment_id VARCHAR(10) PRIMARY KEY,
    patient_name VARCHAR(100),
    doctor_id VARCHAR(10),
    appointment_date DATE,
    reason VARCHAR(255),
    FOREIGN KEY (doctor_id) REFERENCES DOCTOR(doctor_id)
);

INSERT INTO APPOINTMENT (appointment_id, patient_name, doctor_id, appointment_date, reason)
VALUES
('APT001', 'Rekha Jaiswal', 'DOC001', '2025-06-01', 'General Checkup'),
('APT002', 'Raman Sethi', 'DOC002', '2025-06-02', 'Headache'),
('APT003', 'Neha Agarwal', 'DOC003', '2025-06-03', 'Knee Pain'),
('APT004', 'Kavita Yadav', 'DOC004', '2025-06-04', 'Child Fever'),
('APT005', 'Amit Dubey', 'DOC005', '2025-06-05', 'Chest Pain'),
('APT006', 'Farhan Khan', 'DOC001', '2025-06-06', 'Routine Checkup'),
('APT007', 'Sneha Saxena', 'DOC002', '2025-06-07', 'Back Pain'),
('APT008', 'Ravi Malhotra', 'DOC003', '2025-06-08', 'Orthopedic Review'),
('APT009', 'Manoj Tiwari', 'DOC004', '2025-06-09', 'Child Cough'),
('APT010', 'Sunita Rawat', 'DOC005', '2025-06-10', 'Diabetes Follow-up');
