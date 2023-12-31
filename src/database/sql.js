import mysql from "mysql2";

require("dotenv").config();

const pool = mysql.createPool({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "gging00100!",
  database: "sy_hospital_db",
});

const promisePool = pool.promise();

// select query
export const selectSql = {
  // 로그인 (Manager, Doctor, Nurse, Patient)
  getManager: async () => {
    const sql = `select * from manager`;
    const [result] = await promisePool.query(sql);
    return result;
  },
  getDoctor: async () => {
    const sql = `SELECT * FROM DoctorView;`;
    const [result] = await promisePool.query(sql);
    return result;
  },
  getNurse: async () => {
    const sql = `SELECT * FROM NurseView;`;
    const [result] = await promisePool.query(sql);
    return result;
  },
  getPatient: async () => {
    const sql = `select * from patient`;
    const [result] = await promisePool.query(sql);
    return result;
  },
  // 의사 -> 자신의 examination 조회, Patient 조회
  getExamination: async (data) => {
    const sql = `SELECT * FROM ExaminationView WHERE DoctorId = ?`;
    const [result] = await promisePool.query(sql, [data.DoctorId]);
    return result;
  },
  getPatientForDoctor: async (data) => {
    const sql = `select * from patient
        where DoctorId = "${data.DoctorId}"`;
    const [result] = await promisePool.query(sql);
    return result;
  },

  // 간호사 -> 자신의 treatment 조회, Patient 조회
  getTreatment: async (data) => {
    const sql = `SELECT * FROM TreatmentView WHERE NurseId = ?`;
    const [result] = await promisePool.query(sql, [data.NurseId]);
    return result;
  },
  getPatientForNurse: async (data) => {
    const sql = `select * from Patient
        where NurseId = "${data.NurseId}"`;
    const [result] = await promisePool.query(sql);
    return result;
  },

  // 환자 -> 예약 조회
  getReservation: async (data) => {
    const sql = `SELECT * FROM ReservationView WHERE PatientId ="${data.PatientId}" ORDER BY ReserveDate`;
    const [result] = await promisePool.query(sql);
    return result;
  },

  // 조건에 맞는 환자 검색
  getPatientByRequest: async (data) => {
    let sql = `SELECT * FROM Patient WHERE ${data.col} = ?`;
    const [result] = await promisePool.query(sql, [data.value]);
    return result;
  },
};

// insert query
export const insertSql = {
  // 관리자 -> doctor, nurse 등록
  setDoctor: async (data) => {
    const sql = `insert into doctor values (
            "${data.DoctorId}", ${data.DepartmentId}, "${data.Name}", 
            "${data.Address}", "${data.PhoneNumber}", "${data.Password}"
        )`;
    console.log(data);
    await promisePool.query(sql);
  },
  setNurse: async (data) => {
    const sql = `insert into Nurse values (
            "${data.NurseId}", ${data.DepartmentId}, "${data.Name}", 
            "${data.Address}", "${data.PhoneNumber}", "${data.Password}"
        )`;
    console.log(data);
    await promisePool.query(sql);
  },
  // 의사 -> examination 등록
  setExamination: async (data) => {
    const sql = `insert into examination(ExamDate, Details, DoctorId, PatientId) 
        values ("${data.ExamDate}", "${data.Details}", "${data.DoctorId}", "${data.PatientId}"
        )`;
    console.log(data);
    await promisePool.query(sql);
  },
  // 간호사 -> treatment 등록
  setTreatment: async (data) => {
    const sql = `insert into treatment(PatientId, NurseId, TreatTime, Details) 
        values (
            "${data.PatientId}", "${data.NurseId}", 
            "${data.TreatTime}", "${data.Details}"
        )`;
    console.log(data);
    await promisePool.query(sql);
  },
  // 환자 -> reservation 등록
  setReservation: async (data) => {
    const sql = `insert into reservation(ReserveDate, DepartmentId, PatientId) values (
             "${data.ReserveDate}", "${data.DepartmentId}", "${data.PatientId}"
        )`;
    console.log(data);
    await promisePool.query(sql);
  },
};

// update query
export const updateSql = {
  //관리자 -> doctor, nurse 정보 수정
  updateDoctor: async (data) => {
    console.log(data);
    const sql = `
            UPDATE Doctor
            SET DoctorId = "${data.DoctorId}", DepartmentId = ${data.DepartmentId},
            Name = "${data.Name}", Address = "${data.Address}", PhoneNumber = "${data.PhoneNumber}"
            WHERE DoctorId = "${data.DoctorId}"`;
    console.log(sql);
    await promisePool.query(sql);
  },
  updateNurse: async (data) => {
    console.log(data);
    const sql = `
            UPDATE Nurse
            SET NurseId = "${data.NurseId}", DepartmentId = ${data.DepartmentId},
            Name = "${data.Name}", Address = "${data.Address}", PhoneNumber = "${data.PhoneNumber}"
            WHERE NurseId = "${data.NurseId}"`;
    console.log(sql);
    await promisePool.query(sql);
  },
  // 의사 -> examination 정보 수정
  updateExamination: async (data) => {
    console.log(data);
    const sql = `
            UPDATE Examination
            SET ExaminationId = ${data.ExaminationId}, ExamDate= "${data.ExamDate}", 
            Details = "${data.Details}", DoctorId = "${data.DoctorId}",
            PatientId = "${data.PatientId}"
            WHERE ExaminationId = ${data.ExaminationId}`;
    console.log(sql);
    await promisePool.query(sql);
  },
  // 간호사 -> treatment 정보 수정
  updateTreatment: async (data) => {
    console.log(data);
    const sql = `
            UPDATE treatment
            SET TreatmentId = ${data.TreatmentId}, PatientId = "${data.PatientId}",
            NurseId = "${data.NurseId}", 
            TreatTime = "${data.TreatTime}", Details = "${data.Details}"
            WHERE TreatmentId = ${data.TreatmentId}`;
    console.log(sql);
    await promisePool.query(sql);
  },
  // 환자 -> Reservation 정보 수정
  updateReservation: async (data) => {
    const sql = `
    UPDATE reservation
    SET ReserveDate = "${data.ReserveDate}",
     DepartmentId = "${data.DepartmentId}", 
     PatientId = "${data.PatientId}"
     WHERE ReserveNum = ${data.ReserveNum}`;
    console.log(data);
    await promisePool.query(sql);
  },
};

// delete query
export const deleteSql = {
  deleteDoctor: async (data) => {
    console.log(data);
    const sql = `
        DELETE FROM Doctor WHERE DoctorId = "${data.DoctorId}"
        `;
    await promisePool.query(sql);
  },
  deleteNurse: async (data) => {
    console.log(data);
    const sql = `
        DELETE FROM Nurse WHERE NurseId = "${data.NurseId}"
        `;
    await promisePool.query(sql);
  },
  deleteExamination: async (data) => {
    console.log(data);
    const sql = `
        delete from Examination where ExaminationId = ${data.ExaminationId}
        `;
    await promisePool.query(sql);
  },
  deleteTreatment: async (data) => {
    console.log(data);
    const sql = `
        delete from Treatment where TreatmentId = ${data.TreatmentId}
        `;
    await promisePool.query(sql);
  },
  deleteReservation: async (data) => {
    console.log(data);
    const sql = `
        delete from Reservation where ReserveNum = ${data.ReserveNum}
        `;
    await promisePool.query(sql);
  },
};
