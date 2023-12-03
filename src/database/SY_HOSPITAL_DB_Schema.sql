CREATE SCHEMA IF NOT EXISTS SY_HOSPITAL_DB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE SY_HOSPITAL_DB;

-- Building Table: 병원 건물 정보(BId, Name)
CREATE TABLE Building (
  ID INT NOT NULL AUTO_INCREMENT,
  Bid INT NULL,
  Bname VARCHAR(20) NULL,
  PRIMARY KEY (ID)
);

-- Room Table: 입원실 정보(Rid, Rname, Capacity, Bid )
CREATE TABLE Room (
  ID INT NOT NULL AUTO_INCREMENT,
  Rid VARCHAR(45) NULL,
  Rname VARCHAR(45) NULL,
  Capacity INT NULL,
  Bid INT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (Bid) REFERENCES Building(ID)
); 

-- MedicalSpecialty Table: 전문 부서 정보(DepartmentId, Name, PhoneNumber)
CREATE TABLE MedicalSpecialty (
  DepartmentId INT NOT NULL,
  Name VARCHAR(30) NULL,
  PhoneNumber INT NULL,
  PRIMARY KEY (DepartmentId)
);

-- Doctor Table: 의사 정보(PK-DoctorId, FK-DepartmentId)
CREATE TABLE Doctor (
    DoctorId VARCHAR(30) NOT NULL,
    DepartmentId INT NOT NULL,
    Name VARCHAR(30) NULL,
    Address VARCHAR(45) NULL,
    PhoneNumber INT NULL,
    Password VARCHAR(45) NULL,
    PRIMARY KEY (DoctorId),
    FOREIGN KEY (DepartmentId) REFERENCES MedicalSpecialty(DepartmentId)
);

-- Patient Table: 환자 정보(PK-PatientId, FK-DoctorId/NurseId)
CREATE TABLE Patient (
  PatientId VARCHAR(30) NOT NULL,
  DoctorId VARCHAR(30) NULL,
  NurseId VARCHAR(30) NULL,
  Name VARCHAR(45) NULL,
  SocialSecurityNum INT NULL,
  Gender CHAR(1) NULL,
  Address VARCHAR(45) NULL,
  BloodType CHAR(2) NULL,
  Height FLOAT NULL,
  Weight FLOAT NULL,
  PhoneNumber INT NULL,
  Password VARCHAR(45) NULL,
  PRIMARY KEY (PatientId),
  FOREIGN KEY (DoctorId) REFERENCES Doctor(DoctorId),
  FOREIGN KEY (NurseId) REFERENCES Nurse(NurseId)
);

-- Examination Table: 검사 정보(PK-ID, FK-DoctorId/PatientId )
CREATE TABLE Examination (
  ID INT NOT NULL  AUTO_INCREMENT,
  ExaminDate DATETIME NULL,
  Details VARCHAR(45) NULL,
  DoctorId INT NULL,
  PatientId INT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (DoctorId) REFERENCES Doctor(DoctorId),
  FOREIGN KEY (PatientId) REFERENCES Patient(PatientId)
);

-- Reservation Table: 예약 정보(PK-ReserveNum, FK-DepartmentId/PatientId)
CREATE TABLE Reservation (
  ReserveNum INT NOT NULL,
  ReseveDate DATETIME NULL,
  DepartmentId INT NULL,
  PatientId VARCHAR(30) NULL,
  PRIMARY KEY (ReserveNum),
  FOREIGN KEY (DepartmentId) REFERENCES MedicalSpecialty(DepartmentId),
  FOREIGN KEY (PatientId) REFERENCES Patient(PatientId)
);

-- Nurse Table: 간호자 정보(PK-NurseId, FK-DepartmentId)
CREATE TABLE Nurse (
  NurseId VARCHAR(30) NULL,
  DepartmentId INT NULL,
  Name VARCHAR(45) NULL,
  Address VARCHAR(45) NULL,
  PhoneNumber VARCHAR(45) NULL,
  Password VARCHAR(45) NULL,
  PRIMARY KEY (NurseId),
  FOREIGN KEY (DepartmentId) REFERENCES MedicalSpecialty(DepartmentId)
); 

CREATE TABLE Treatment (
  ID INT NOT NULL,
  PatientId VARCHAR(30) NOT NULL,
  mgrNurseId VARCHAR(30) NOT NULL,
  TreatTime DATETIME,
  Details VARCHAR(45) NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
  FOREIGN KEY (mgrNurseId) REFERENCES Nurse(NurseId)
);

CREATE TABLE Inpatient (
  PatientId VARCHAR(30) NOT NULL,
  Rid INT NULL,
  ReserveNum INT NULL,
  DischargeDate DATETIME NULL,
  PRIMARY KEY (PatientId),
  FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
  FOREIGN KEY (Rid) REFERENCES Room(Rid),
  FOREIGN KEY (ReserveNum) REFERENCES Reservation(ReserveNum)
);
