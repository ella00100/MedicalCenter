-- Manager는 Doctor와 Nurse 정보를 조회
CREATE VIEW DoctorView AS
SELECT D.DoctorId, D.DepartmentId, M.Name AS Department, D.Name, D.Address, D.PhoneNumber, D.Password 
FROM Doctor D 
JOIN MedicalSpecialty M ON D.DepartmentId = M.DepartmentId;

CREATE VIEW NurseView AS
SELECT N.NurseId, N.DepartmentId, M.Name AS Department, N.Name, N.Address, N.PhoneNumber, N.Password
FROM Nurse N 
JOIN MedicalSpecialty M ON N.DepartmentId = M.DepartmentId;

-- Doctor는 자신의 Examination 정보를 조회
CREATE VIEW ExaminationView AS
SELECT E.ExaminationId, E.DoctorId, E.PatientId, P.Name AS PatientName, DATE_FORMAT(E.ExamDate, '%Y-%m-%d %T') as ExamDate, E.Details 
FROM Examination E 
JOIN Patient P ON E.PatientId = P.PatientId;

-- Nurse는 자신의 Treatment 정보를 조회
CREATE VIEW TreatmentView AS
SELECT T.TreatmentId, T.PatientId, P.Name AS PatientName, T.NurseId, DATE_FORMAT(T.TreatTime, '%Y-%m-%d %T') as TreatTime, T.Details 
FROM treatment T
JOIN Patient P ON T.PatientId = P.PatientId;

-- Patient는 자신의 Reservation 정보를 조회
CREATE VIEW ReservationView AS
SELECT R.PatientId, R.DepartmentId, M.Name AS DepartmentName, R.ReserveNum, DATE_FORMAT(R.ReserveDate, '%Y-%m-%d %T') AS ReserveDate
FROM Reservation R 
JOIN MedicalSpecialty M ON R.DepartmentId = M.DepartmentId;
