INSERT INTO Building (Name) VALUES
('Main Hospital'),
('Medical Center'),
('Surgery Wing'),
('Emergency Wing'),
('Rehabilitation Center');

-- Inserting data into Room table
INSERT INTO Room (Name, Capacity, BuildingId) VALUES
('101', 2, 1),
('201', 4, 1),
('102', 1, 2),
('103', 3, 2),
('301', 5, 3);

-- Inserting data into MedicalSpecialty table
INSERT INTO MedicalSpecialty (RoomId, Name, PhoneNumber) VALUES
(1, 'Internal Medicine', '010-1111-1111'),
(2, 'Surgery', '010-2222-2222'),
(3, 'Orthopedics', '010-3333-3333'),
(4, 'Dermatology', '010-4444-4444'),
(5, 'Ophthalmology', '010-5555-5555');

-- Inserting data into Manager table
INSERT INTO Manager (ManagerId, DepartmentId, Name, Address, PhoneNumber, Password) VALUES
('M1', 1, 'Mgr. Kim', 'Seoul', '010-1234-5678', 'pd1'),
('M2', 2, 'Mgr. Park', 'Seoul', '010-8765-4321', 'pd2'),
('M3', 3, 'Mgr. Lee', 'Seoul', '010-1111-2222', 'pd3'),
('M4', 4, 'Mgr. Jung', 'Seoul', '010-3333-4444', 'pd4'),
('M5', 5, 'Mgr. Choi', 'Seoul', '010-5555-6666', 'pd5');

-- Inserting data into Doctor table
INSERT INTO Doctor (DoctorId, DepartmentId, Name, Address, PhoneNumber, Password) VALUES
('D1', 1, 'Dr. Lee', 'Seoul', '010-1111-1111', 'pd1'),
('D2', 2, 'Dr. Kim', 'Seoul', '010-2222-2222', 'pd2'),
('D3', 3, 'Dr. Park', 'Seoul', '010-3333-3333', 'pd3'),
('D4', 4, 'Dr. Jung', 'Seoul', '010-4444-4444', 'pd4'),
('D5', 5, 'Dr. Choi', 'Seoul', '010-5555-5555', 'pd5');

-- Inserting data into Nurse table
INSERT INTO Nurse (NurseId, DepartmentId, Name, Address, PhoneNumber, Password) VALUES
('N1', 1, 'Nurse Lee', 'Seoul', '010-1111-1111', 'pd1'),
('N2', 2, 'Nurse Kim', 'Seoul', '010-2222-2222', 'pd2'),
('N3', 3, 'Nurse Park', 'Seoul', '010-3333-3333', 'pd3'),
('N4', 4, 'Nurse Jung', 'Seoul', '010-4444-4444', 'pd4'),
('N5', 5, 'Nurse Choi', 'Seoul', '010-5555-5555', 'pd5');

-- Inserting data into Patient table
INSERT INTO Patient (PatientId, DoctorId, NurseId, Name, SocialSecurityNum, Gender, Address, BloodType, Height, Weight, PhoneNumber, Password) VALUES
('P1', 'D1', 'N1', 'Kim Patient', 901231, 'M', 'Seoul', 'A+', 175.5, 70.2, '010-1111-1111', 'pd1'),
('P2', 'D2', 'N2', 'Lee Patient', 900112, 'F', 'Seoul', 'B-', 160.0, 55.5, '010-2222-2222', 'pd2'),
('P3', 'D3', 'N3', 'Park Patient', 930321, 'M', 'Seoul', 'O+', 180.0, 80.0, '010-3333-3333', 'pd3'),
('P4', 'D4', 'N4', 'Jung Patient', 950512, 'F', 'Seoul', 'AB+', 165.5, 58.7, '010-4444-4444', 'pd4'),
('P5', 'D5', 'N5', 'Choi Patient', 980630, 'M', 'Seoul', 'A-', 172.3, 68.8, '010-5555-5555', 'pd5');

-- Inserting data into Examination table
INSERT INTO Examination (ExamDate, Details, DoctorId, PatientId) VALUES
('2023-01-15 10:00:00', 'Blood Pressure Measurement', 'D1', 'P1'),
('2023-02-20 14:30:00', 'Blood Sugar Measurement', 'D2', 'P2'),
('2023-03-10 09:45:00', 'Ultrasound Scan', 'D3', 'P3'),
('2023-04-05 11:15:00', 'X-ray Scan', 'D4', 'P4'),
('2023-05-12 13:20:00', 'MRI Scan', 'D5', 'P5');

-- Inserting data into Reservation table
INSERT INTO Reservation (ReserveDate, DepartmentId, PatientId) VALUES
('2023-06-01 10:00:00', 1, 'P1'),
('2023-06-02 14:30:00', 2, 'P2'),
('2023-06-03 09:45:00', 3, 'P3'),
('2023-06-04 11:15:00', 4, 'P4'),
('2023-06-05 13:20:00', 5, 'P5');

-- Inserting data into Treatment table
INSERT INTO Treatment (PatientId, NurseId, TreatTime, Details) VALUES
('P1', 'N1', '2023-06-01 10:30:00', 'Wound dressing'),
('P2', 'N2', '2023-06-02 15:00:00', 'Administering medication'),
('P3', 'N3', '2023-06-03 10:00:00', 'Physical therapy'),
('P4', 'N4', '2023-06-04 11:30:00', 'Injection'),
('P5', 'N5', '2023-06-05 13:45:00', 'Monitoring vital signs');

-- Inserting data into Inpatient table
INSERT INTO Inpatient (RoomId, AdmissionDate, DischargeDate, PatientId) VALUES
(1, '2023-06-01 12:00:00', '2023-06-05 14:00:00', 'P1'),
(2, '2023-06-02 16:00:00', '2023-06-06 09:00:00', 'P2'),
(3, '2023-06-03 11:00:00', '2023-06-07 10:30:00', 'P3'),
(4, '2023-06-04 13:00:00', '2023-06-08 12:15:00', 'P4'),
(5, '2023-06-05 14:30:00', '2023-06-09 13:45:00', 'P5');
