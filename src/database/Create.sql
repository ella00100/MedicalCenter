CREATE SCHEMA IF NOT EXISTS SY_HOSPITAL_DB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE SY_HOSPITAL_DB;

-- Building Table: 병원 건물 정보(BuildingId, Name)
CREATE TABLE Building (
  BuildingId INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(40) NULL,
  PRIMARY KEY (BuildingId)
);

-- Room Table: 입원실 정보(RoomId, Name, Capacity, BuildingId)
CREATE TABLE Room (
  RoomId INT NOT NULL AUTO_INCREMENT,
  BuildingId INT NOT NULL,
  Name VARCHAR(45) NULL,
  Capacity INT NULL,
  PRIMARY KEY (RoomId),
  FOREIGN KEY (BuildingId) REFERENCES Building(BuildingId) 
  ON UPDATE CASCADE ON DELETE CASCADE
);

-- MedicalSpecialty Table: 전문 부서 정보(DepartmentId, Name, PhoneNumber)
CREATE TABLE MedicalSpecialty (
  DepartmentId INT NOT NULL AUTO_INCREMENT,
  RoomId INT NULL,
  Name VARCHAR(30) NOT NULL,
  PhoneNumber VARCHAR(45) NULL,
  PRIMARY KEY (DepartmentId),
  FOREIGN KEY(RoomId) REFERENCES Room(RoomId)
  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Manager (
  ManagerId VARCHAR(30) NOT NULL,
  DepartmentId INT NOT NULL,
  Name VARCHAR(30) NULL,
  Address VARCHAR(45) NULL,
  PhoneNumber VARCHAR(45) NULL,
  Password VARCHAR(45) NOT NULL,
  PRIMARY KEY(ManagerId),
  FOREIGN KEY (DepartmentId) REFERENCES MedicalSpecialty(DepartmentId)
  ON UPDATE CASCADE ON DELETE CASCADE
);

-- Doctor Table: 의사 정보(DoctorId, DepartmentId)
CREATE TABLE Doctor (
    DoctorId VARCHAR(30) NOT NULL,
    DepartmentId INT NOT NULL,
    Name VARCHAR(30) NOT NULL,
    Address VARCHAR(45) NULL,
    PhoneNumber VARCHAR(45) NULL,
    Password VARCHAR(45) NOT NULL,
    PRIMARY KEY (DoctorId),
    FOREIGN KEY (DepartmentId) REFERENCES MedicalSpecialty(DepartmentId)
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- Nurse Table: 간호사 정보(NurseId, DepartmentId)
CREATE TABLE Nurse (
  NurseId VARCHAR(30) NOT NULL,
  DepartmentId INT NOT NULL,
  Name VARCHAR(45) NOT NULL,
  Address VARCHAR(45) NULL,
  PhoneNumber VARCHAR(45) NULL,
  Password VARCHAR(45) NOT NULL,
  PRIMARY KEY (NurseId),
  FOREIGN KEY (DepartmentId) REFERENCES MedicalSpecialty(DepartmentId)
  ON UPDATE CASCADE ON DELETE CASCADE
);

-- Patient Table: 환자 정보(PatientId, DoctorId, NurseId)
CREATE TABLE Patient (
  PatientId VARCHAR(30) NOT NULL,
  DoctorId VARCHAR(30) NULL,
  NurseId VARCHAR(30) NULL,
  Name VARCHAR(45) NOT NULL,
  SocialSecurityNum INT NULL,
  Gender CHAR(1) NULL,
  Address VARCHAR(45) NULL,
  BloodType CHAR(3) NOT NULL,
  Height FLOAT NULL,
  Weight FLOAT NULL,
  PhoneNumber VARCHAR(45) NULL,
  Password VARCHAR(45) NOT NULL,
  PRIMARY KEY (PatientId),
  FOREIGN KEY (DoctorId) REFERENCES Doctor(DoctorId)
  ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (NurseId) REFERENCES Nurse(NurseId)
  ON UPDATE CASCADE ON DELETE CASCADE
);

-- Examination Table: 검사 정보(ExaminationId, DoctorId, PatientId)
CREATE TABLE Examination (
  ExaminationId INT NOT NULL AUTO_INCREMENT,
  ExamDate DATETIME NOT NULL,
  Details VARCHAR(45) NULL,
  DoctorId VARCHAR(30) NOT NULL,
  PatientId VARCHAR(30) NOT NULL,
  PRIMARY KEY (ExaminationId),
  FOREIGN KEY (DoctorId) REFERENCES Doctor(DoctorId) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (PatientId) REFERENCES Patient(PatientId) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Reservation Table: 예약 정보(ReserveNum, DepartmentId, PatientId)
CREATE TABLE Reservation (
  ReserveNum INT NOT NULL AUTO_INCREMENT,
  ReserveDate DATETIME NOT NULL,
  DepartmentId INT NOT NULL,
  PatientId VARCHAR(30) NOT NULL,
  PRIMARY KEY (ReserveNum),
  FOREIGN KEY (DepartmentId) REFERENCES MedicalSpecialty(DepartmentId) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (PatientId) REFERENCES Patient(PatientId)ON UPDATE CASCADE ON DELETE CASCADE
);

-- Treatment Table: 치료 정보(TreatmentId, PatientId, NurseId)
CREATE TABLE Treatment (
  TreatmentId INT NOT NULL AUTO_INCREMENT,
  PatientId VARCHAR(30) NOT NULL,
  NurseId VARCHAR(30) NOT NULL,
  TreatTime DATETIME NOT NULL,
  Details VARCHAR(45) NULL,
  PRIMARY KEY (TreatmentId),
  FOREIGN KEY (PatientId) REFERENCES Patient(PatientId) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (NurseId) REFERENCES Nurse(NurseId) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Inpatient Table: 입원 정보(InpatientId, RoomId, AdmissionDate, DischargeDate, PatientId)
CREATE TABLE Inpatient (
  InpatientId INT NOT NULL AUTO_INCREMENT,
  RoomId INT NOT NULL,
  AdmissionDate DATETIME NULL,
  DischargeDate DATETIME NULL,
  PatientId VARCHAR(30) NOT NULL,
  PRIMARY KEY (InpatientId),
  FOREIGN KEY (RoomId) REFERENCES Room(RoomId) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (PatientId) REFERENCES Patient(PatientId) ON UPDATE CASCADE ON DELETE CASCADE
);
