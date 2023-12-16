START TRANSACTION;

INSERT INTO Building (Name) VALUES
('Main Hospital'),
('Medical Center'),
('Surgery Wing'),
('Emergency Wing'),
('Rehabilitation Center');
COMMIT;

INSERT INTO Room (Name, Capacity, BuildingId) VALUES
('101', 2, 1),
('201', 4, 1),
('102', 1, 2),
('103', 3, 2),
('301', 5, 3);
COMMIT;

INSERT INTO MedicalSpecialty (RoomId, Name, PhoneNumber) VALUES
(1, 'Internal Medicine', '010-7711-1189'),
(2, 'Surgery', '010-2667-0022'),
(3, 'Orthopedics', '010-0182-3324'),
(4, 'Dermatology', '010-4374-0104'),
(5, 'Ophthalmology', '010-6655-1523');
COMMIT;

INSERT INTO Manager (ManagerId, DepartmentId, Name, Address, PhoneNumber, Password) VALUES
('M1', 1, 'Mgr. Kim', 'Incheon', '010-1234-5678', 'pd1'),
('M2', 2, 'Mgr. Park', 'Seoul', '010-8755-4321', 'pd2'),
('M3', 3, 'Mgr. Lee', 'Gyeongi', '010-2791-2278', 'pd3'),
('M4', 4, 'Mgr. Jung', 'Seoul', '010-3453-4884', 'pd4'),
('M5', 5, 'Mgr. Choi', 'Incheon', '010-7425-6996', 'pd5');
COMMIT;

INSERT INTO Doctor (DoctorId, DepartmentId, Name, Address, PhoneNumber, Password) VALUES
('D1', 1, 'Dr. Lee', 'Incheon', '010-7825-6999', 'pd1'),
('D2', 1, 'Dr. Kim', 'Gyeongi', '010-0152-2862', 'pd2'),
('D3', 2, 'Dr. Park', 'Gyeongi', '010-3333-7833', 'pd3'),
('D4', 3, 'Dr. Jung', 'Seoul', '010-7755-4445', 'pd4'),
('D5', 3, 'Dr. Choi', 'Incheon', '010-5002-7775', 'pd5'),
('D6', 4, 'Dr. Jung', 'Gyeongnam', '010-6900-5587', 'pd6'),
('D7', 5, 'Dr. Man', 'Seoul', '010-5456-5999', 'pd7');
COMMIT;

INSERT INTO Nurse (NurseId, DepartmentId, Name, Address, PhoneNumber, Password) VALUES
('N1', 1, 'Nurs. Lee', 'Seoul', '010-1789-5554', 'pd1'),
('N2', 1, 'Nurs. Man', 'Incheon', '010-1789-5554', 'pd2'),
('N3', 2, 'Nurs. Kim', 'Gyeongi', '010-3214-7865', 'pd3'),
('N4', 3, 'Nurs. Park', 'Seoul', '010-7412-3330', 'pd4'),
('N5', 4, 'Nurs. Jung', 'Incheon', '010-4679-4446', 'pd5'),
('N6', 5, 'Nurs. Choi', 'Seoul', '010-1235-4475', 'pd6'),
('N7', 5, 'Nurs. Wang', 'Seoul', '010-4557-7895', 'pd7');
COMMIT;

INSERT INTO Patient (PatientId, DoctorId, NurseId, Name, SocialSecurityNum, Gender, Address, BloodType, Height, Weight, PhoneNumber, Password) VALUES
('P1', 'D1', 'N1', 'Kim SeoYoung', 901231, 'M', 'Incheon', 'A+', 175.5, 70.2, '010-1231-1111', 'pd1'),
('P2', 'D1', 'N2', 'Yun MinSik', 900112, 'F', 'Gyeongi', 'B-', 160.0, 55.5, '010-2152-5123', 'pd2'),
('P3', 'D2', 'N3', 'Park JinMan', 930321, 'M', 'Seoul', 'O+', 180.0, 80.0, '010-3151-3512', 'pd3'),
('P4', 'D3', 'N4', 'Jung YuJin', 950512, 'F', 'Seoul', 'AB+', 165.5, 58.7, '010-4513-4523', 'pd4'),
('P5', 'D4', 'N5', 'Choi JungYeon', 980630, 'M', 'Incheon', 'A-', 172.3, 68.8, '010-5325-5235', 'pd5'),
('P6', 'D1', 'N1', 'Choi JinSik', 980631, 'M', 'Seoul', 'A-', 152.8, 43.8, '010-1324-1325', 'pd6'),
('P7', 'D3', 'N3', 'Jung GilDong', 950523, 'F', 'Seoul', 'AB+', 165.5, 58.7, '010-4152-7654', 'pd7'),
('P8', 'D1', 'N1', 'Lee GyeongA', 900432, 'F', 'Gyeongi', 'B-', 160.0, 55.5, '010-2352-1522', 'pd8'),
('P9', 'D4', 'N4', 'Choi SungMin', 980612, 'M', 'Incheon', 'A-', 172.3, 68.8, '010-5351-5523', 'pd9'),
('P10', 'D5', 'N4', 'Jung PanSuk', 950578, 'F', 'Gyeongi', 'AB+', 165.5, 58.7, '010-2354-5214', 'pd10');
COMMIT;

INSERT INTO Examination (ExamDate, Details, DoctorId, PatientId) VALUES
('2023-12-05 12:00:00', 'X-ray Scan', 'D1', 'P1'),
('2023-12-06 10:38:00', 'MRI Scan', 'D1', 'P1'),
('2023-12-06 18:00:00', 'Blood Pressure Measurement', 'D1', 'P2'),
('2023-12-07 10:49:00', 'X-ray Scan', 'D1', 'P4'),
('2023-12-08 13:10:00', 'Ultrasound Scan', 'D1', 'P1'),
('2023-12-08 14:30:00', 'Blood Sugar Measurement', 'D2', 'P2'),
('2023-12-08 09:45:00', 'Ultrasound Scan', 'D3', 'P3'),
('2023-12-08 11:15:00', 'X-ray Scan', 'D4', 'P4'),
('2023-12-08 13:20:00', 'MRI Scan', 'D5', 'P5');
COMMIT;

INSERT INTO Reservation (ReserveDate, DepartmentId, PatientId) VALUES
('2023-12-12 10:00:00', 1, 'P1'),
('2023-12-13 14:30:00', 2, 'P2'),
('2023-12-15 09:45:00', 3, 'P3'),
('2023-12-16 11:15:00', 4, 'P4'),
('2023-12-17 13:20:00', 5, 'P5'),
('2023-12-18 09:45:00', 1, 'P1'),
('2023-12-30 14:10:00', 1, 'P1');
COMMIT;

INSERT INTO Treatment (PatientId, NurseId, TreatTime, Details) VALUES
('P1', 'N1', '2023-12-05 10:30:00', 'Wound dressing'),
('P2', 'N1', '2023-12-05 10:30:00', 'Administering medication'),
('P3', 'N1', '2023-12-06 10:30:00', 'Wound dressing'),
('P1', 'N1', '2023-12-07 10:30:00', 'injection'),
('P2', 'N2', '2023-12-08 15:00:00', 'Administering medication'),
('P3', 'N3', '2023-12-08 10:00:00', 'Physical therapy'),
('P4', 'N4', '2023-12-08 11:30:00', 'Injection'),
('P5', 'N5', '2023-12-08 13:45:00', 'Monitoring vital signs');
COMMIT;

INSERT INTO Inpatient (RoomId, AdmissionDate, DischargeDate, PatientId) VALUES
(1, '2023-06-01 12:00:00', '2023-06-05 14:00:00', 'P1'),
(2, '2023-06-02 16:00:00', '2023-06-06 09:00:00', 'P2'),
(3, '2023-06-03 11:00:00', '2023-06-07 10:30:00', 'P3'),
(4, '2023-06-04 13:00:00', '2023-06-08 12:15:00', 'P4'),
(5, '2023-06-05 14:30:00', '2023-06-09 13:45:00', 'P5');
COMMIT;